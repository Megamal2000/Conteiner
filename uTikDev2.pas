unit uTikDev2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Buttons, StdCtrls, Menus, ppModule, daDataModule,
  ppCtrls, ppVar, jpeg, ppPrnabl, ppClass, ppDB, ppBands, ppCache,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, raCodMod, ppParameter,
  ppDesignLayer;

type
  TTikDev2 = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    edRel: TEdit;
    Label3: TLabel;
    edNF: TEdit;
    btUlt: TBitBtn;
    btCinco: TBitBtn;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    lbNum: TLabel;
    btImprime: TBitBtn;
    PopupMenu1: TPopupMenu;
    Recebidopor1: TMenuItem;
    btRec: TBitBtn;
    relDev: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppParameterList1: TppParameterList;
    RetirardoRelatrio1: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    Visto: TppLabel;
    ppLine4: TppLine;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    RecebidoporUM1: TMenuItem;
    N1: TMenuItem;
    ppDBText6: TppDBText;
    procedure FormActivate(Sender: TObject);
    procedure btUltClick(Sender: TObject);
    procedure btCincoClick(Sender: TObject);
    procedure edRelKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edNFKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure Recebidopor1Click(Sender: TObject);
    procedure btRecClick(Sender: TObject);
    procedure btImprimeClick(Sender: TObject);
    procedure RetirardoRelatrio1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TikDev2: TTikDev2;
  iCor,iNum :Integer;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM3, uNotas;

procedure Ultimos(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaDev_MostraUlt(num);
  Bco.Destroy;
end;

procedure NumRel(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaDev_MostraNum(num);
  Bco.Destroy;
  TikDev2.StatusBar1.Panels[0].Text := 'Total de Notas '+IntToStr(DM3.cdsDev2.RecordCount);

end;

procedure NumNota(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaDev_MostraNota(num);
  Bco.Destroy;
end;



procedure TTikDev2.FormActivate(Sender: TObject);

begin
  Ultimos(3);
  edRel.Text := '';
  edNF.Text  := '';
end;

procedure TTikDev2.btUltClick(Sender: TObject);
begin
    Ultimos(1);
end;

procedure TTikDev2.btCincoClick(Sender: TObject);
begin
  Ultimos(5);
end;

procedure TTikDev2.edRelKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    NumRel(StrToInt(edRel.Text));
    edRel.Text := '';
  end;
end;

procedure TTikDev2.SpeedButton1Click(Sender: TObject);
begin
    NumRel(StrToInt(edRel.Text));
    edRel.Text := '';

end;

procedure TTikDev2.edNFKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    NumNota(StrToInt(edNF.Text));
    edNF.Text := '';
  end;

end;

procedure TTikDev2.SpeedButton2Click(Sender: TObject);
begin
    NumNota(StrToInt(edNF.Text));
    edNF.Text := '';

end;

procedure TTikDev2.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if (iNum <> DM3.cdsDev2NUMDEV.Value) then
  begin
    iNum := DM3.cdsDev2NUMDEV.Value;
    if (iCor = clWhite) then iCor := clMoneyGreen else iCor := clWhite;

  end;
  if not (gdSelected in State) then
  begin
    JvDBGrid1.Canvas.Brush.Color := iCor;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;  
end;

procedure TTikDev2.JvDBGrid1CellClick(Column: TColumn);
begin
  if (DM3.cdsDev2IDNF.Value <> null) then
     lbNum.Caption := DM3.cdsDev2NUMDEV.AsString;
end;

procedure recebido_por();

var nome : String;
    Bco : TBco;

begin
  nome := InputBox('Recebido por','Nome do Funcionário', '' );
  if (nome <> '') then
  begin
    Bco := TBco.Create;
    Bco.VoltaDev_Receber(DM3.cdsDev2NUMDEV.Value, nome);
    Bco.Destroy;
    NumRel(DM3.cdsDev2NUMDEV.Value);
  end;
end;

procedure TTikDev2.Recebidopor1Click(Sender: TObject);
begin
  recebido_por;
end;

procedure TTikDev2.btRecClick(Sender: TObject);
begin
  recebido_por;
end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with tikDev2 do
   begin
     doc := 'Devoluções - recibo ';
     { carrega o arquivo }
     relDev.Template.FileName := dirR+'\Rels\RecDev.rtm';
     relDev.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     relDev.DeviceType := 'Screen';
     relDev.ShowAutoSearchDialog  := False;
     relDev.ShowCancelDialog := False;
     relDev.ShowPrintDialog := False;
     relDev.PrinterSetup.DocumentName := doc;

     ppLabel8.Caption := IntToStr(DM3.cdsDev2.RecordCount);

     { imprime a ordem de serviço }
     relDev.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TTikDev2.btImprimeClick(Sender: TObject);
begin
  Numrel(DM3.cdsDev2NUMDEV.Value);
  Imprime;
end;

procedure TTikDev2.RetirardoRelatrio1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaDev_AdicionaItem(0, DM3.cdsDev2IDNF.Value);
  Bco.NotasVolta_Marca(DM3.cdsDev2IDNF.Value, 2);
  Bco.Destroy;


end;

procedure TTikDev2.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM3.cdsDev2IDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
