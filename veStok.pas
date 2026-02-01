unit veStok;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.WinXCtrls, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.ExtCtrls, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB,
  ppDesignLayer, ppParameter, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport;

type
  TeStok = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    edPesq: TSearchBox;
    Label2: TLabel;
    cbTipoQt: TComboBox;
    btMostrar: TBitBtn;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    JvDataSource3: TJvDataSource;
    btPDF: TBitBtn;
    RelEstoque: TppReport;
    pipEstoque: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppDBCalc2: TppDBCalc;
    procedure btMostrarClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure edPesqChange(Sender: TObject);
    procedure edPesqKeyPress(Sender: TObject; var Key: Char);
    procedure edPesqClick(Sender: TObject);
    procedure btPDFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  eStok: TeStok;

implementation

{$R *.dfm}

uses veDM, veBanco, uLib;

procedure LimparDBh();
begin
 eDM.cdsStokh.Open;
 eDM.cdsStokh.EmptyDataSet;
 eDM.cdsStokh.Close;
end;

procedure LimparDBs();
begin
 eDM.cdsStoks.Open;
 eDM.cdsStoks.EmptyDataSet;
 eDM.cdsStoks.Close;
end;

procedure TeStok.btMostrarClick(Sender: TObject);
  var id, t, tip : Integer;
begin
  edPesq.Visible := false;
  Bce := TBce.Create;
  id :=  Bce.Cli_RecebeID(cbCli.Items[cbCli.itemindex]);
  Bce.Destroy;
  t := cbTipoQt.itemindex;
  if t=0 then tip := 1;
  if t=1 then tip := 0;
  if t=2 then tip := 2;
  if t=3 then tip := 3;

  // Mostrar Produtos
  Bce := TBce.Create;
  Bce.Prod_MostrarEstoque(id, tip);
  Bce.Prod_Pesquisado(id);
  Bce.Destroy;

  LimparDBs;
  LimparDBh;
  if eDM.cdsStok.RecordCount > 0 then edPesq.Visible := true;
end;

procedure Pesquisar();
  var prim : String;
      sAlvo: String;
      idP  : Integer;
begin

  if (length(eStok.edPesq.Text)>1) then
  with eStok do
  begin
    sAlvo := edPesq.Text;
    prim := copy(sAlvo,1,1);

    if (prim='#') or (prim='@') then
    begin
      sAlvo := copy(sAlvo,2, length(sAlvo)-1);
      eDM.cdsProdS.Filtered := false;
      eDM.cdsProdS.First;
      if (prim='#') then eDM.cdsProdS.Locate('CODTRANSP',StrToInt(sAlvo), [loCaseInsensitive, loPartialKey] );
      if (prim='@') then eDM.cdsProdS.Locate('CODCLI',StrToInt(sAlvo), [loCaseInsensitive, loPartialKey] );
      eDM.cdsStok.Locate('id',eDM.cdsProdSLIGPROD.Value, [loCaseInsensitive, loPartialKey] );
      Bce := TBce.Create;
      Bce.Prod_MostrarEstoqueSub(eDM.cdsStokID.Value);
      Bce.Destroy;
      LimparDBh;

    end
    else
    begin
      eDM.cdsStok.Locate('NomeLongo',sAlvo, [loCaseInsensitive, loPartialKey] );
    end;

  end;
end;



procedure TeStok.edPesqChange(Sender: TObject);
begin


    if length(edPesq.Text) > 3 then Pesquisar;
      // eDM.cdsStok.Locate('NOMELONGO',edPesq.Text, [loCaseInsensitive, loPartialKey] );
end;

procedure TeStok.edPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TeStok.edPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Pesquisar;
end;

procedure TeStok.Entrar;
begin
  Bce := TBce.Create;
  Bce.Cli_PreencheCB(cbCli);
  Bce.Cli_PadraoCB(cbCli);
  Bce.Destroy;
  cbTipoQt.ItemIndex := 0;
  edPesq.Visible := false;
end;

procedure Mostrar_Hist();
begin
  if eDM.cdsStoks.RecordCount > 0 then
  begin
    Bce := TBce.Create;
    Bce.Prod_MostrarEstoqueHist(eDM.cdsStoksID.Value);
    Bce.Destroy;
  end;

end;

procedure TeStok.JvDBGrid1CellClick(Column: TColumn);
begin
  if eDM.cdsStok.RecordCount > 0 then
  begin
    Bce := TBce.Create;
    Bce.Prod_MostrarEstoqueSub(eDM.cdsStokID.Value);
    Bce.Destroy;
    LimparDBh;
    if eDM.cdsStoks.RecordCount = 1 then Mostrar_Hist;

  end;
end;


procedure TeStok.JvDBGrid2CellClick(Column: TColumn);
begin
  if eDM.cdsStoks.RecordCount > 0 then
  begin
    Bce := TBce.Create;
    Bce.Prod_MostrarEstoqueHist(eDM.cdsStoksID.Value);
    Bce.Destroy;
  end;
end;

procedure Imprimir_Estoque();

var doc : String;
    dirR, dirPdf : String;
    cli : String;


begin


   GetDir(0, dirR);

   dirPdf := dirR+'\f30_pdf';
   if (not DirectoryExists(dirPdf)) then
     CreateDir(dirPdf);


   with eStok do
   begin
     cli := cbCli.items[cbCli.ItemIndex];
     doc := 'Estoque ' + cli + ' '+  FormatDateTime('dd MM HH mm ss', Now );
     { carrega o arquivo }
     RelEstoque.Template.FileName := dirR+'\Rels\estoquePosicao.rtm';
     RelEstoque.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelEstoque.DeviceType := 'PDF';
     RelEstoque.ShowAutoSearchDialog  := False;
     RelEstoque.ShowCancelDialog := False;
     RelEstoque.ShowPrintDialog := False;
     RelEstoque.PrinterSetup.DocumentName := doc;
     RelEstoque.TextFileName := dirPdf +'\'+doc+'.pdf';

     // Complementos
     ppLabel1.Caption:= 'F30 Log';
     ppLabel3.Caption:= cli;

     { imprime a ordem de serviço }
     RelEstoque.PrintReport;

     ShowMessage('Arquivo salvo como '+#13 +doc+ ' na pasta: '+#13 + dirpdf);

     {Fecha os arquivos}
   end;

end;

procedure TeStok.btPDFClick(Sender: TObject);
  var usa : TMarco;
begin
  //Imprimir_Estoque;
  // Exporta para Excel
  usa := TMarco.Create;
  usa.Exporta_Excel(',4,5,',eDM.cdsStok);
  usa.Destroy;
end;

end.
