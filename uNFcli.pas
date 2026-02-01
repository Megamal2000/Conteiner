unit uNFcli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, ExtCtrls, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppDesignLayer, ppParameter;

type
  TNFcli = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Label3: TLabel;
    cbOrigem: TComboBox;
    btpesq: TBitBtn;
    btImp: TBitBtn;
    ppReport1: TppReport;
    ppDBPipeline1: TppDBPipeline;
    btExcel: TBitBtn;
    procedure btpesqClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btImpClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  NFcli: TNFcli;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM4, uNotas, uLib;

procedure TNFcli.Entrar;
begin
  cbCli.Clear;
  cbCli.Items.Append('<Todos>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  cbCli.ItemIndex    := 0;
  cbOrigem.ItemIndex := 0;

  dt1.DateTime := Now - 7;
  dt2.DateTime := Now;
end;

procedure TNFcli.btpesqClick(Sender: TObject);

var idC, Orig : integer;
    Bco : TBco;
    contaNotas,freteNotas : Double;
    contaSEM : integer;

begin
  DM4.cdsPesq.IndexName := '';
  idC := 0;
  if (cbCli.ItemIndex > 0) then
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

  Bco := TBco.Create;
  Bco.Notas_Pesquisa(idC, cbOrigem.itemIndex, dt1.DateTime, dt2.DateTime);
  contaNotas := Bco.Notas_PQcontaNF(1, idC, cbOrigem.itemIndex, dt1.DateTime, dt2.DateTime);
  freteNotas := Bco.Notas_PQcontaNF(2, idC, cbOrigem.itemIndex, dt1.DateTime, dt2.DateTime);
  contaSEM   := Bco.Notas_PQcontaSEM(idC, cbOrigem.itemIndex, dt1.DateTime, dt2.DateTime);
  StatusBar1.Panels[1].Text := 'Notas Mostradas: '+FormatFloat('#,##0', contaNotas)+ ' // Frete Total: '+FormatFloat('#,##0.00', freteNotas);
  StatusBar1.Panels[0].Text := 'Notas sem Romaneio no período: '+FormatFloat('#,##0', contaSEM);

  Bco.Destroy;
end;

procedure TNFcli.JvDBGrid1TitleClick(Column: TColumn);

var SIndexName : String;
    Options:TIndexOptions;

begin
  // Marca a Coluna e Ordena
  if DM4.cdsPesq.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
    JvDBGrid1.SortMarker := smDown;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
    JvDBGrid1.SortMarker := smUp;
  end;

  if (DM4.cdsPesq.IndexDefs.IndexOf(sIndexName) < 0) then
    DM4.cdsPesq.AddIndex(sIndexName, Column.FieldName, Options);

  DM4.cdsPesq.IndexName := sIndexName;
end;

procedure TNFcli.JvDBGrid1DblClick(Sender: TObject);
begin
//  ShowMessage('idNF '+DM4.cdsPesqIDNF.AsString);
  NotasP.Entrar;
  NotasP.set_idNota(DM4.cdsPesqIDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TNFcli.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 30;
end;

procedure TNFcli.btExcelClick(Sender: TObject);
var usa:TMarco;
begin
  // Exporta para Excel
  usa := TMarco.Create;
  usa.Exporta_Excel(',1,11,',DM4.cdsPesq);
  usa.Destroy;
end;

procedure TNFcli.btImpClick(Sender: TObject);

var
    i : Integer;

begin
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

      end;

end;

end.
