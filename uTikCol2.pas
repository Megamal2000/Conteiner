unit uTikCol2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ppParameter, daDataModule, ppModule, raCodMod, ppBands,
  ppClass, ppCtrls, ppVar, jpeg, ppPrnabl, ppCache, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, JvDataSource, StdCtrls, Buttons,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls, ComCtrls;

type
  TTikCol2 = class(TForm)
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label4: TLabel;
    lbNum: TLabel;
    btImprime: TBitBtn;
    btRec: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    edRel: TEdit;
    edNF: TEdit;
    btUlt: TBitBtn;
    btCinco: TBitBtn;
    JvDataSource1: TJvDataSource;
    ppDBPipeline1: TppDBPipeline;
    relCol: TppReport;
    ppParameterList1: TppParameterList;
    PopupMenu1: TPopupMenu;
    Recebidopor1: TMenuItem;
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
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    daDataModule1: TdaDataModule;
    RetyiardoRelatrio1: TMenuItem;
    ColetaIncompleta1: TMenuItem;
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
    procedure RetyiardoRelatrio1Click(Sender: TObject);
    procedure ColetaIncompleta1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TikCol2: TTikCol2;
    iCor,iNum :Integer;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco, uDM3, uNotas;

procedure Ultimos(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaCol_MostraUlt(num);
  Bco.Destroy;
end;

procedure NumRel(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaCol_MostraNum(num);
  Bco.Destroy;
  TikCol2.StatusBar1.Panels[0].Text := 'Total de Notas '+IntToStr(DM4.cdsCol2.RecordCount);
end;

procedure NumNota(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaCol_MostraNota(num);
  Bco.Destroy;
end;




procedure TTikCol2.FormActivate(Sender: TObject);
begin
  Ultimos(3);
  edRel.Text := '';
  edNF.Text  := '';
end;

procedure TTikCol2.btUltClick(Sender: TObject);
begin
    Ultimos(1);
end;

procedure TTikCol2.btCincoClick(Sender: TObject);
begin
    Ultimos(5);
end;

procedure TTikCol2.edRelKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    NumRel(StrToInt(edRel.Text));
    edRel.Text := '';
  end;
end;

procedure TTikCol2.SpeedButton1Click(Sender: TObject);
begin
    NumRel(StrToInt(edRel.Text));
    edRel.Text := '';
end;

procedure TTikCol2.edNFKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    NumNota(StrToInt(edNF.Text));
    edNF.Text := '';
  end;
end;

procedure TTikCol2.SpeedButton2Click(Sender: TObject);
begin
    NumNota(StrToInt(edNF.Text));
    edNF.Text := '';
end;

procedure TTikCol2.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (iNum <> DM4.cdsCol2NUMCOL.Value) then
  begin
    iNum := DM4.cdsCol2NUMCOL.Value;
    if (iCor = clWhite) then iCor := clMoneyGreen else iCor := clWhite;

  end;
  if not (gdSelected in State) then
  begin
    JvDBGrid1.Canvas.Brush.Color := iCor;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TTikCol2.JvDBGrid1CellClick(Column: TColumn);
begin
  if (DM4.cdsCol2IDNF.Value <> null) then
    lbNum.Caption := DM4.cdsCol2NUMCOL.AsString;
end;

procedure recebido_por();

var nome : String;
    Bco : TBco;

begin
  nome := InputBox('Recebido por','Nome do Funcionário', '' );
  if (nome <> '') then
  begin
    Bco := TBco.Create;
    Bco.VoltaCol_Receber(DM4.cdsCol2NUMCOL.Value, nome);
    Bco.Destroy;
    NumRel(DM4.cdsCol2NUMCOL.Value);
  end;
end;


procedure TTikCol2.Recebidopor1Click(Sender: TObject);
begin
  recebido_por;
end;

procedure TTikCol2.btRecClick(Sender: TObject);
begin
  recebido_por;
end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with tikCol2 do
   begin
     doc := 'Coletas - recibo ';
     { carrega o arquivo }
     relCol.Template.FileName := dirR+'\Rels\RecCol.rtm';
     relCol.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     relCol.DeviceType := 'Screen';
     relCol.ShowAutoSearchDialog  := False;
     relCol.ShowCancelDialog := False;
     relCol.ShowPrintDialog := False;
     relCol.PrinterSetup.DocumentName := doc;

     ppLabel8.Caption := IntToStr(DM4.cdsCol2.RecordCount);

     { imprime a ordem de serviço }
     relCol.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TTikCol2.btImprimeClick(Sender: TObject);
begin
  NumRel(DM4.cdsCol2NUMCOL.Value);
  imprime;
end;

procedure TTikCol2.RetyiardoRelatrio1Click(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.VoltaCol_AdicionaItem(0, DM4.cdsCol2IDNF.Value);
  Bco.NotasVolta_Marca(DM4.cdscol2IDNF.Value, 8);
  Bco.Destroy;

end;

procedure TTikCol2.ColetaIncompleta1Click(Sender: TObject);


begin
  DM2.Altera_Status('TB_NOTAF', 'STATUS_DEV', DM4.cdscol2IDNF.Value, 12);

end;

procedure TTikCol2.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM4.cdsCol2IDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
