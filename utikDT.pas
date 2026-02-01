unit utikDT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  Buttons, ComCtrls, StdCtrls, ExtCtrls, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppBands, ppCache, ppClass, ppProd, ppReport, ppCtrls, ppPrnabl, ppVar,
  ppModule, raCodMod, jpeg, ppParameter;

type
  TtikDT = class(TForm)
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btPesq: TSpeedButton;
    btImprime: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    relTik: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    raCodeModule1: TraCodeModule;
    ppSystemVariable1: TppSystemVariable;
    ppDBText7: TppDBText;
    procedure FormActivate(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tikDT: TtikDT;

implementation

{$R *.dfm}

uses uDM4, uBanco, uDM2, uNotas;

procedure TtikDT.FormActivate(Sender: TObject);
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
    cbCli.ItemIndex := 1;
  end;
  dat1.DateTime := Now - 7;
  dat2.DateTime := Now;

end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with tikDT do
   begin
     doc := 'Notas - Ticket ';
     { carrega o arquivo }
     relTik.Template.FileName := dirR+'\Rels\RelTik.rtm';
     relTik.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     relTik.DeviceType := 'Screen';
     relTik.ShowAutoSearchDialog  := False;
     relTik.ShowCancelDialog := False;
     relTik.ShowPrintDialog := False;
     relTik.PrinterSetup.DocumentName := doc;

     ppLabel10.Caption := cbCli.Items[cbCli.ItemIndex];
     ppLabel12.Caption := FormatDateTime('dd/MM/yyyy', dat1.DateTime);
     ppLabel13.Caption := FormatDateTime('dd/MM/yyyy', dat2.DateTime);;

     { imprime a ordem de serviço }
     relTik.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TtikDT.btPesqClick(Sender: TObject);

var Bco : TBco;
    idC : integer;


begin
  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'Nome');
  Bco := Tbco.Create;
  Bco.Pesq_TicketDatas(idC,dat1.DateTime, dat2.DateTime);
  Bco.Destroy;
  StatusBar1.Panels[0].Text := 'Notas: '+IntTostr(DM4.cdsTKpq.RecordCount); 
end;



procedure TtikDT.btImprimeClick(Sender: TObject);
begin
  Imprime;
end;

procedure TtikDT.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 7;
end;

procedure TtikDT.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM4.cdsTKpqID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
