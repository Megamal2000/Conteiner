unit uCteClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DB;

type
  TCteClass = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btproc: TSpeedButton;
    Label3: TLabel;
    lbNT: TLabel;
    cbCli: TComboBox;
    dt: TDateTimePicker;
    btAlterar: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Label4: TLabel;
    cbTransp: TComboBox;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    SpeedButton1: TSpeedButton;
    procedure btprocClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CteClass: TCteClass;
    idClie : integer;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco;

procedure TCteClass.Entrar;
begin
  dt.DateTime := Now;

  cbCli.Clear;
  cbCli.Items.Append('<Nenhum>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 and Cteemite=1  ');

  cbCli.ItemIndex := 0;

  cbTransp.Clear;
  DM2.DBCb_Preenche(cbTransp, 'TB_Transp', 'Fantasia','');

  cbTransp.ItemIndex := 1;
end;

procedure Mostra_Lista();

var Bco : Tbco;

begin
  bco := TBco.Create;
  Bco.Cte_Transp(3, idClie, CteClass.dt.DateTime);
  bco.Conhec_MostraTransp(idClie, CteClass.dt.DateTime, 0 );
  bco.Destroy;
end;

procedure TCteClass.btprocClick(Sender: TObject);

begin
  idClie := 0;
  if (cbCli.ItemIndex > 0) then
  begin
    idClie := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
    Mostra_Lista();
    lbNT.Caption := IntToStr(DM4.cdsTr.RecordCount);
  end
  else ShowMessage('Selecione um Cliente');
end;

procedure TCteClass.btAlterarClick(Sender: TObject);

var Bco : TBco;
    i, nTransp : Integer;

begin
  nTransp := DM2.DBCp_leid(cbTransp.Items[cbTransp.ItemIndex], 'TB_TRANSP', 'Fantasia');

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
          GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

          Bco := TBco.Create;
          Bco.Conhec_MarcaTransp(DM4.cdsTrID.Value, nTransp);
          Bco.Destroy;
      end;
  Mostra_Lista;
end;

procedure TCteClass.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DM4.cdsTrLIGTRANSP.Value = 1) then
  begin
    JvDBGrid1.Canvas.Font.Color := clRed;
  end
  else
  begin
    JvDBGrid1.Canvas.Font.Color := clBlue;
  end;

    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);

end;

procedure TCteClass.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM4.cdsTr.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TCteClass.SpeedButton1Click(Sender: TObject);
begin
  JvDBGrid1.SelectAll;
end;

end.
