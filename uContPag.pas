unit uContPag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, ComCtrls, StdCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, ExtCtrls, ppDB, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ppCtrls, jpeg, ppPrnabl, ppBands, ppCache,
  ppDesignLayer, ppParameter;

type
  TContPag = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lbMes: TLabel;
    lbkma: TLabel;
    lbKmb: TLabel;
    lbKmc: TLabel;
    lbHrc: TLabel;
    lbHrb: TLabel;
    lbHra: TLabel;
    lbTot: TLabel;
    Label6: TLabel;
    Bevel1: TBevel;
    btCalc: TBitBtn;
    btSalvar: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    btPesq: TSpeedButton;
    cbMot: TComboBox;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    JvDataSource1: TJvDataSource;
    btImp: TBitBtn;
    RelMot: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine2: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLine10: TppLine;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    procedure FormActivate(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContPag: TContPag;

implementation

{$R *.dfm}

uses uDM2, uDM3, uBanco;

procedure TContPag.FormActivate(Sender: TObject);
begin
  if (FormatDateTime('dd/MM/yyyy', dat1.DateTime)  = '01/01/2010') then
  begin
    dat1.DateTime := Now;
    dat2.DateTime := dat1.DateTime + 30;
  end;
  if (cbMot.Items.Count= 0) then
    DM2.DBCb_Preenche(cbMot, 'TB_FUNCS', 'NOME', 'TIPO = 1 and ATIVO=1');

end;

procedure TContPag.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 30;
end;

procedure TContPag.btPesqClick(Sender: TObject);

var idMot : Integer;
    dt1, dt2 : TDateTime;
    Bco : TBco;

begin
  // Entradas
  idMot := DM2.DBCp_leid(cbMot.Items[cbMot.ItemIndex], 'TB_FUNCS','NOME');
  dt1   := dat1.Date;
  dt2   := dat2.Date;
  ShowMessage(' Id '+IntToStr(idMot)+' ' +cbMot.Items[cbMot.ItemIndex]+' dias '+FormatDateTime('dd/MM/yy', dt1)+' '+FormatDateTime('dd/MM/yy', dt2));
  Bco := TBco.Create;
///  Bco.Credito2_Existe(idCli, dt1, dt2);
  Bco.FreteContratoDia_MostraM(idMot, dt1, dt2);
  Bco.Destroy;

end;

procedure TContPag.btCalcClick(Sender: TObject);
var akm, ahora, bkm, bhora,
    ckm, chora, cMes, Total : Double;
    Bco : TBco;
    idMot: Integer;

begin
  // Inicia os Totais
  Total := 0;
  cMes  := 0;
  ckm   := 0;
  chora := 0;


  // Parte 1 - recupera Valores do Cliente -------------------
  Bco := TBco.Create;
  Bco.PagContrato_Mostra;
  Bco.Destroy;

  bkm   := DM3.cdsPGContVAVULSO_KM.AsFloat;
  bhora := DM3.cdsPGContVAVULSO_HORA.AsFloat;

  cMes:= DM3.cdsPGContVMENSAL.AsFloat;

  // Parte 2 - Soma os valores da Tabela ---------------------
  akm   := 0;    ckm   := 0;
  ahora := 0;    chora := 0;
  DM3.cdsFT5b.First;
  while not DM3.cdsFT5b.Eof do
  begin
    akm   := akm   + DM3.cdsFT5bKMEXTRA.AsFloat;
    ahora := ahora + DM3.cdsFT5bHREXTRA.AsFloat;

    ckm   := ckm   + DM3.cdsFT5bVKMPAGO.AsFloat;
    chora := chora + DM3.cdsFT5bVHRPAGO.AsFloat;

    DM3.cdsFT5b.Next;
  end;
  DM3.cdsFT5b.First;

  // Parte 3 - Totaliza ----------------------------------------

  Total := cMes + ckm + cHora;

  // Saída .................................
  lbMes.Caption := FormatFloat('#,##0.00', cMes);

  lbkma.Caption := FormatFloat('#,##0', akm);
  lbkmb.Caption := FormatFloat('#,##0.00', bkm);
  lbkmc.Caption := FormatFloat('#,##0.00', ckm);

  lbhra.Caption := FormatFloat('#,##0.00', ahora);
  lbhrb.Caption := FormatFloat('#,##0.00', bhora);
  lbhrc.Caption := FormatFloat('#,##0.00', chora);

  lbTot.Caption := FormatFloat('#,##0.00', Total);

end;
procedure Imprimir_Motorista();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ContPag do
   begin
     doc := 'Relatório de Pagamento de Contratos';
     { carrega o arquivo }
     RelMot.Template.FileName := dirR+'\Rels\RelCont4.rtm';
     RelMot.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelMot.DeviceType := 'Screen';
     RelMot.ShowAutoSearchDialog  := False;
     RelMot.ShowCancelDialog := False;
     RelMot.ShowPrintDialog := False;
     RelMot.PrinterSetup.DocumentName := doc;

     ppLabel4.Caption:= cbMot.Items[cbMot.ItemIndex];
     ppLabel6.Caption:= DM3.cdsCred2DT1.AsString;
     ppLabel7.Caption:= DM3.cdsCred2DT2.AsString;

     ppLabel11.Caption:= lbMes.caption;
     ppLabel12.Caption:= lbKmc.caption;
     ppLabel13.Caption:= lbHrC.caption;

     ppLabel16.Caption:= lbKma.caption;
     ppLabel17.Caption:= lbHra.caption;

     ppLabel15.Caption:= lbTot.caption;

     { imprime a ordem de serviço }
     RelMot.PrintReport;

     {Fecha os arquivos}
   end;

end;


procedure TContPag.btImpClick(Sender: TObject);
begin
  Imprimir_Motorista;
end;

end.
