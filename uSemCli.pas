unit uSemCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Buttons, ExtCtrls;

type
  TSemCli = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbNotas: TLabel;
    btPassar: TBitBtn;
    Bevel1: TBevel;
    Label3: TLabel;
    Label4: TLabel;
    btApaga: TSpeedButton;
    Bevel2: TBevel;
    cbCli: TComboBox;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btPassarClick(Sender: TObject);
    procedure btApagaClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  SemCli: TSemCli;

implementation

{$R *.dfm}

uses uBanco, uDM5, uNotas, uDM2, uRastreio, uPrinc;

{ TSemCli }

procedure Mostrar_Notas();
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_SemCli;
  Bco.Destroy;
  SemCli.lbNotas.Caption :=  IntToStr( DM5.cdsSemC.RecordCount );

end;


procedure TSemCli.Entrar;


begin
  Mostrar_Notas;

  SemCli.cbCli.Clear;
  DM2.DBCb_Preenche(SemCli.cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  cbCli.ItemIndex := 0;

end;

procedure TSemCli.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.Mostrar_Nota_id(DM5.cdsSemCID.Value);
  NotasP.Show;
end;

procedure TSemCli.btPassarClick(Sender: TObject);

var    i, idC : Integer;
       Bco : TBco;
begin
  if (cbCli.ItemIndex > 0) then
  begin
  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

          Bco := TBco.Create;
          Bco.Notas_AlteraCli(DM5.cdsSemCID.Value , idC);
          Bco.Notas_Unica_AltCli(DM5.cdsSemCNUMNF.Value, 0, idC);
          Bco.Destroy;


      end;
      Mostrar_Notas;
  end;
end;

procedure TSemCli.btApagaClick(Sender: TObject);
var    i, idC, idU : Integer;
       Bco : TBco;
       Rast : TRastreio;
begin
    if MessageDlg('Tem certeza que deseja APAGAR as notas selecionadas?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

  idU := StrToInt( Princ.LbUserID.Caption );;
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
          Bco := TBco.Create;
          Bco.Notas_Apagar(DM5.cdsSemCID.Value);
          //Bco.Notas_Unica_AltStatus(DM5.cdsSEMNUMNF.Value, DM1.cdsSEMLIGCLI.Value, 11);
          Bco.Destroy;
          Rast := TRastreio.Create;
          Rast.set_ocorID(DM5.cdsSEMCID.Value, idU, evrApagarSemCli );
          Rast.Destroy;
      end;
      Mostrar_Notas;
  end;
end;

procedure TSemCli.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM5.cdsSemC.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

end.
