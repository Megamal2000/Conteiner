unit uRel1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Menus;

type
  TRelGer = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    Label3: TLabel;
    dt2: TDateTimePicker;
    DataSource1: TDataSource;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    btPesq: TBitBtn;
    btEsq: TSpeedButton;
    lbPag: TLabel;
    PopupMenu1: TPopupMenu;
    GerarRelatrio1: TMenuItem;
    cbCli: TComboBox;
    btGerar: TBitBtn;
    cbIncluir: TCheckBox;
    lbQt: TLabel;
    procedure btEsqClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure GerarRelatrio1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCob(i : Integer);
  end;

var
  RelGer : TRelGer;
  PagAtual, Max, nRels, idCob : Integer;

implementation

{$R *.dfm}

uses uDM3, uDM2, uBanco, uRoman, uCob1, uAguarde;

procedure TRelGer.btEsqClick(Sender: TObject);

var idC : integer;

begin
  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');

  Cob1.set_idCli(idC);
  Cob1.Show;
end;

procedure TRelGer.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 15;
end;

procedure Atualiza_Pesq();

var Bco : TBco;
    idC, incluirTodos : Integer;
    qtNotas : Integer;

begin
  with RelGer do
  begin
    incluirTodos := 0;
    if cbIncluir.Checked then incluirTodos := 1;

    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');

    Bco := TBco.Create;
    Bco.Relatorio_Datas(idC, incluirTodos, dt1.DateTime, dt2.DateTime);
    Bco.Destroy;

    qtNotas := 0;
    while not DM3.cdsRelG.eof  do
    begin
      qtNotas := qtNotas + DM3.cdsRelGNOTAS.Value;
      DM3.cdsRelG.Next;
    end;


    LbQt.Caption := qtNotas.ToString;
  end;
end;


procedure TRelGer.btPesqClick(Sender: TObject);

begin
  if (cbCli.ItemIndex >= 0) then
  begin
    Atualiza_Pesq;
  end
  else ShowMessage('Selecione um Cliente');
end;

procedure TRelGer.JvDBGrid1DblClick(Sender: TObject);
begin
  //Roman.vNum.Value := DM3.cdsRelGROMANEIO.AsInteger;
  Roman.set_idRoma(DM3.cdsRelGNUM.AsInteger);
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure Gerar();

var Bco : TBco;
    i : Integer;

begin

  with RelGer do
  if (idCob > 0) then
  begin
  if JvDBGrid1.SelectedRows.Count>0 then
  begin

    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
    begin

      with JvDBGrid1.DataSource.DataSet do
        for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
        begin
          GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
          Bco := TBco.Create;
          Bco.Relatorio_Gerar(DM3.cdsRelGNUM.Value, DM3.cdsRelGIDCLI.Value, idCob);
          Bco.Destroy;

        end;
        Atualiza_Pesq;

    end;

  end;
  end
  else ShowMessage('Escolha um número de Cobrança');

end;


procedure TRelGer.GerarRelatrio1Click(Sender: TObject);

begin
  Gerar;
end;

procedure TRelGer.FormActivate(Sender: TObject);
begin
  if (cbCli.Items.Count = 0) then
  begin
    dt1.DateTime := Now - 2;
    dt2.DateTime := Now - 1;
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  end;    
end;

procedure TRelGer.set_idCob(i: Integer);
begin
  idCob := i;
end;

procedure TRelGer.btGerarClick(Sender: TObject);
begin
  Gerar;
end;

end.
