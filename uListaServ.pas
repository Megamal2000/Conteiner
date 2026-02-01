unit uListaServ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppCtrls, ppVar, jpeg, ppPrnabl, ppBands, ppCache,
  ppDesignLayer, ppParameter;

type
  TListaServ = class(TForm)
    Panel1: TPanel;
    Cliente: TLabel;
    Datas: TLabel;
    cbCli: TComboBox;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btPesq: TBitBtn;
    btImp: TBitBtn;
    RelExtra: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  ListaServ: TListaServ;

implementation

{$R *.dfm}

uses uDM2,uDM4, uBanco, uRoman;

procedure TListaServ.Entrar;

var idCli : Integer;

begin
  cbCli.Clear;
  cbCli.Items.Append('<Todos>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  idCli := DM2.get_cliNum;

  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli),'Nome');

  ListaServ.dat1.DateTime := Now - 7;
  ListaServ.dat2.DateTime := Now;
end;

procedure TListaServ.btPesqClick(Sender: TObject);

var Bco : TBco;
    idCli : Integer;

begin
  if (cbCli.ItemIndex = 0) then idCli := 0
    else
      idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

  Bco := TBco.Create;
  Bco.Romaneio_ListaServ(idCli, dat1.DateTime, dat2.DateTime);
  Bco.Destroy;
end;

procedure TListaServ.JvDBGrid1DblClick(Sender: TObject);
begin
  Roman.set_idRoma(DM4.cdsServNUM.Value);
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure Imprimir_Lista();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ListaServ do
   begin
     doc := 'Lista de Extras';
     { carrega o arquivo }
     RelExtra.Template.FileName := dirR+'\Rels\RelExtra.rtm';
     RelExtra.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelExtra.DeviceType := 'Screen';
     RelExtra.ShowAutoSearchDialog  := False;
     RelExtra.ShowCancelDialog := False;
     RelExtra.ShowPrintDialog := False;
     RelExtra.PrinterSetup.DocumentName := doc;


     ppLabel8.Caption:= FormatDateTime('dd/MM/yyyy', ListaServ.dat1.DateTime)+' até '+FormatDateTime('dd/MM/yyyy', ListaServ.dat2.DateTime);
     ppLabel1.Caption:= ListaServ.cbCli.Items[cbCli.ItemIndex];

     { imprime a ordem de serviço }
     RelExtra.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TListaServ.btImpClick(Sender: TObject);
begin
  Imprimir_Lista;
end;

end.
