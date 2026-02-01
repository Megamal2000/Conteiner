unit uSACnotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppComm,
  ppRelatv, ppProd, ppReport, System.ImageList, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TSACnotas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbReent: TLabel;
    Label2: TLabel;
    lbDevol: TLabel;
    lbTotal: TLabel;
    btImprimir: TBitBtn;
    btAtual: TBitBtn;
    dtRoma: TDateTimePicker;
    btReent: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    RelSAC: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    procedure btAtualClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  SACnotas: TSACnotas;

implementation

{$R *.dfm}

uses uDM5, uBanco, uNotas;

procedure Atualiza(dt:TDateTime);
  var Bco : TBco;
  tot_reent, tot_devol, total, i : Integer;
begin
  Bco := TBco.Create;
  Bco.Notas_SAC(dt);
  Bco.Destroy;
  tot_reent := 0;
  tot_devol := 0;

  total := DM5.cdsSAC.RecordCount;
  DM5.cdsSAC.First;
  if total > 0  then
  for i := 1 to total do
  begin

    if (DM5.cdsSACtipotxt.Value = 'Reentrega') then tot_reent := tot_reent + 1
      else tot_devol := tot_devol + 1;
    DM5.cdsSAC.Next;
  end;

  SACnotas.lbReent.Caption := IntToStr(tot_reent);
  SACnotas.lbDevol.Caption := IntToStr(tot_devol);
  SACnotas.lbTotal.Caption := IntToStr(total);
end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with SACnotas do
   begin
     doc := 'Lista para SAC';
     { carrega o arquivo }
     RelSAC.Template.FileName := dirR+'\Rels\relSAC.rtm';
     RelSAC.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelSAC.DeviceType := 'Screen';
     RelSAC.ShowAutoSearchDialog  := False;
     RelSAC.ShowCancelDialog := False;
     RelSAC.ShowPrintDialog := False;
     RelSAC.PrinterSetup.DocumentName := doc;

//     ppLabel17.Caption:= FormatDateTime('dd/MM/yyyy', DM1.cdsRomaDTROMA.Value);

     { imprime a ordem de serviço }
     RelSAC.PrintReport;

     {Fecha os arquivos}
   end;
end;

procedure TSACnotas.btAtualClick(Sender: TObject);
begin
  Atualiza(dtRoma.DateTime);
end;

procedure TSACnotas.btImprimirClick(Sender: TObject);
begin
  Imprime;
end;

procedure TSACnotas.Entrar;
begin
  dtRoma.DateTime := Now - 1;
end;

procedure TSACnotas.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.Mostrar_Nota_id(DM5.cdsSACIDNF.Value);
  NotasP.Show;
end;

end.
