unit veImportaAvanti;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvMemoryDataset, JvDataSource,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.DBXMySQL,
  Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient;

type
  TeImportaAvanti = class(TForm)
    btMostrar: TBitBtn;
    Label1: TLabel;
    dt: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    cdsPed: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    TabSel: TSmallintField;
    TabPedNumero: TIntegerField;
    TabPedData: TDateField;
    TabDestNome: TStringField;
    TabValor: TFloatField;
    JvDBGrid2: TJvDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    DataSetProvider2: TDataSetProvider;
    cdsProd: TClientDataSet;
    JvDataSource2: TJvDataSource;
    FDQuery2: TFDQuery;
    btImp: TBitBtn;
    procedure btMostrarClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  eImportaAvanti: TeImportaAvanti;

implementation

{$R *.dfm}

uses veBanco, veDM;

procedure Itens(nPed:Integer);
begin
  with eImportaAvanti do
  begin
    cdsProd.Active := false;
    FDQuery2.Active := false;
    FDQuery2.ParamByName('LigPed').Value := nPed;
    FDQuery2.Active := true;
    cdsProd.Active := True;
  end;

end;

function VerificaPed(nPed : integer): Integer;
  var resp : Integer;
begin
  resp := 0;
  if eDM.cdsNFdt.RecordCount>0 then
  begin
    eDM.cdsNFdt.First;
    while not eDM.cdsNFdt.EOf do
    begin
      if eDM.cdsNFdtNUMPED.Value = nPed then resp := 1;
      eDM.cdsNFdt.Next;
    end;
  end;

  result := resp;
end;

function VerificaItens(nPed : integer): Integer;
  var resp : Integer;
      sCod : String;
      Bce : TBce;
begin
  Itens(nPed);

  Bce := TBce.Create;

  resp := 0;
  with eImportaAvanti do
  if cdsProd.RecordCount>0 then
  begin
    cdsProd.First;
    while not eDM.cdsNFdt.EOf do
    begin
      sCod := cdsProd.FieldByName('CodigoProduto').AsString;
      Bce.Prod_fPesqCodeCli(sCod);
      if eDM.cdsPPesq.RecordCount=0 then resp := cdsProd.FieldByName('CodigoProduto').Value;
      cdsProd.Next;
    end;

  end
  else resp := 1;


  Bce.Destroy;

  result := resp;
end;
procedure TeImportaAvanti.btImpClick(Sender: TObject);
  var i, c : Integer;
begin
  Memo1.Clear;
  Memo1.Lines.Append('Importando '+JvDBGrid1.SelectedRows.Count.ToString+' pedidos... ' );

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        // ======= ITEM SELECIONADO ====================
        if VerificaPed(TabPedNumero.Value) = 1 then
          Memo1.Lines.Append('   >>> Pedido: '+TabPedNumero.Value.ToString+ ' ERRO: Pedido já existe ' )
          else
            begin
              c := VerificaItens(TabPedNumero.Value);
              if c > 0 then
                Memo1.Lines.Append('   >>> Pedido: '+TabPedNumero.Value.ToString+ ' ERRO: Produto sem cadastro. Código Produto no Cliente: '+ c.ToString)
              else
                Memo1.Lines.Append('   >>> Pedido: '+TabPedNumero.Value.ToString+ ' IMPORTADO ');
            end;
      end;


end;

procedure TeImportaAvanti.btMostrarClick(Sender: TObject);
  var Bce : TBce;
begin
  Memo1.Clear;
  Memo1.Lines.Append('Mostrando '+IntToStr(tab.RecordCount)+' pedidos' );

  Bce := TBce.Create;
  Bce.NF_mostraDT(dt.Date);
  Bce.Destroy;


  cdsPed.Active := false;
  FDQuery1.Active := false;
  FDQuery1.ParamByName('dia').Value := FormatDateTime('yyyy-MM-dd',dt.Date);
  FDQuery1.Active := true;
  cdsPed.Active := True;

  Tab.Active := False;
  Tab.EmptyTable;
  Tab.Active := True;

  cdsPed.First;
  while not cdsPed.Eof do
  begin
    Tab.Insert;
    TabSel.Value := 0;
    TabPedNumero.Value := cdsPed.FieldByName('Codigo').Value;
    TabPedData.Value := cdsPed.FieldByName('Data').AsDateTime;
    TabDestNome.Value := cdsPed.FieldByName('RazaoCliente').Value;
    TabValor.Value := cdsPed.FieldByName('TotalPedido').Value;

    Tab.Post;

    cdsPed.Next;
  end;
end;



procedure TeImportaAvanti.JvDBGrid1CellClick(Column: TColumn);
begin
  Itens(TabPedNumero.Value);
  Memo1.Lines.Append('Mostrando '+cdsProd.RecordCount.ToString+' itens no pedido '+TabPedNumero.Value.ToString );

end;

end.
