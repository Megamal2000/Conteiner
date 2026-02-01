unit uContImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ExtCtrls, StdCtrls, Buttons, Mask, JvExMask, JvSpin, DateUtils, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, jpeg,
  ppPrnabl, ppBands, ppCache, ppParameter, ppDesignLayer;

type
  TContImp = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    vAno: TJvSpinEdit;
    Label2: TLabel;
    btPesq: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbMes: TLabel;
    lbkma: TLabel;
    lbKmb: TLabel;
    lbKmc: TLabel;
    lbHrc: TLabel;
    lbHrb: TLabel;
    lbHra: TLabel;
    lbSegb: TLabel;
    lbSegc: TLabel;
    lbTot: TLabel;
    Label7: TLabel;
    Bevel1: TBevel;
    btImp1: TBitBtn;
    btImp2: TBitBtn;
    btImp3: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Panel4: TPanel;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    ppDBPipeline1: TppDBPipeline;
    RelCt1: TppReport;
    ppDBPipeline2: TppDBPipeline;
    ppDBPipeline3: TppDBPipeline;
    RelCt2: TppReport;
    RelCt3: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    DataSource1: TDataSource;
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
    ppLine2: TppLine;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLine3: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppLine7: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppImage2: TppImage;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLine8: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
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
    ppLine9: TppLine;
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
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppParameterList2: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine11: TppLine;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    DataSource2: TDataSource;
    ppDBText11: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText12: TppDBText;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppLabel55: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLabel56: TppLabel;
    ppDBCalc9: TppDBCalc;
    ppLabel57: TppLabel;
    ppDBCalc10: TppDBCalc;
    Label8: TLabel;
    lbDesc: TLabel;
    ppLabel58: TppLabel;
    ppLine16: TppLine;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText19: TppDBText;
    ppDBCalc11: TppDBCalc;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine17: TppLine;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppLabel61: TppLabel;
    procedure FormActivate(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btImp1Click(Sender: TObject);
    procedure btImp2Click(Sender: TObject);
    procedure btImp3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ContImp: TContImp;
    // Vriaveis relat
    km : Integer;
    KmC, HoraC, SegNotas,  Hora,
    vCalc, vMensal, vKm, vHora, vSeg, vDesp : Double;
    dt1, dt2 : TDateTime;

implementation

{$R *.dfm}

uses uDM2, uDm3, uBanco;


procedure Mostra();

var Bco : TBco;
    idCli : integer;

begin
  idCli := DM2.DBCp_leid(ContImp.cbCli.Items[ContImp.cbCli.ItemIndex], 'TB_CLIENTE','NOME');

  Bco := TBco.Create;
  Bco.Credito2_MostraAno(idCli, ContImp.vAno.AsInteger);
  Bco.FreteContrato_Mostra(idCli);
  Bco.Destroy;
end;


procedure TContImp.FormActivate(Sender: TObject);
begin
  if (vAno.Value = 0) then vAno.Value := YearOf(Now);
  if (cbCli.Items.Count= 0) then
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  Mostra;
end;

procedure TContImp.btPesqClick(Sender: TObject);

begin
  Mostra;
end;

procedure TContImp.JvDBGrid1CellClick(Column: TColumn);

var Bco : TBco;

begin
  if (DM3.cdsCred2.RecordCount > 0) then
  begin
    // Monta Grid
    Bco := TBco.Create;
    Bco.Credito2_MostraItens(DM3.cdsCred2ID.Value);
    Bco.FreteContratoDia_Notas2(DM3.cdsCred2ID.Value);
    Bco.Destroy;

    // Recupera Valores
    vMensal    := DM3.cdsCred2VMENSAL.AsFloat;

    km         := DM3.cdsCred2KM.AsInteger;
    KmC        := DM3.cdsCred2KMC.AsFloat;
    vKm        := DM3.cdsCred2VKM.AsFloat;

    Hora       := DM3.cdsCred2HORA.AsFloat;
    HoraC      := DM3.cdsCred2HORAC.AsFloat;
    vHora      := DM3.cdsCred2VHORA.AsFloat;

    SegNotas   := DM3.cdsCred2SEGNOTAS.AsFloat;
    vSeg       := DM3.cdsCred2VSEG.AsFloat;
    vDesp      := DM3.cdsCred2VDESPESAS.AsFloat;
    vCalc      := DM3.cdsCred2VCALC.AsFloat;

    // Monta Quadro
    lbMes.Caption := FormatFloat('#,##0.00', vMensal);
    lbkma.Caption := IntToStr(Km);
    lbKmb.Caption := FormatFloat('#,##0.00', KmC);
    lbKmc.Caption := FormatFloat('#,##0.00', vKM);
    lbHra.Caption := FormatFloat('#,##0.00', Hora);
    lbHrb.Caption := FormatFloat('#,##0.00', HoraC);
    lbHrc.Caption := FormatFloat('#,##0.00', vHora);
    lbSegb.Caption := FormatFloat('#,##0.00', SegNotas);
    lbSegc.Caption := FormatFloat('#,##0.00', vSeg);
    lbDesc.Caption := FormatFloat('#,##0.00', vDesp);
    lbTot.Caption := FormatFloat('#,##0.00', vCalc);

  end;
end;

procedure Imprimir_capa();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ContImp do
   begin
     doc := 'Relatório de Cobrança de Contratos';
     { carrega o arquivo }
     RelCt1.Template.FileName := dirR+'\Rels\RelCont1.rtm';
     RelCt1.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelCt1.DeviceType := 'Screen';
     RelCt1.ShowAutoSearchDialog  := False;
     RelCt1.ShowCancelDialog := False;
     RelCt1.ShowPrintDialog := False;
     RelCt1.PrinterSetup.DocumentName := doc;

     ppLabel4.Caption:= cbCli.Items[cbCli.ItemIndex];
     ppLabel6.Caption:= DM3.cdsCred2DT1.AsString;
     ppLabel7.Caption:= DM3.cdsCred2DT2.AsString;
     ppLabel9.Caption:= lbMes.caption;
     ppLabel11.Caption:= lbKmc.caption;
     ppLabel13.Caption:= lbHrC.caption;
     ppLabel15.Caption:= lbSegC.caption;
     ppLabel17.Caption:= lbTot.caption;
     ppLabel59.Caption:= lbDesc.Caption;


     ppLabel18.Caption:= lbKma.caption+ ' x '+lbKmb.caption;
     ppLabel19.Caption:= lbHra.caption+ ' x '+lbHrb.caption;
     ppLabel20.Caption:= 'Notas Fiscais: '+lbSegb.caption;

     ppLabel61.Caption := '';
     if (DM3.cdsFT5TIPOCOB.Value = 1) then
       ppLabel61.Caption := IntToStr(DM3.cdsFT5b.Recordcount) + ' dias x ' + DM3.cdsFT5VMENSAL.AsString;

     { imprime a ordem de serviço }
     RelCt1.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure Imprimir_dias();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ContImp do
   begin
     doc := 'Relatório de Cobrança de Contratos';
     { carrega o arquivo }
     RelCt2.Template.FileName := dirR+'\Rels\RelCont2.rtm';
     RelCt2.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelCt2.DeviceType := 'Screen';
     RelCt2.ShowAutoSearchDialog  := False;
     RelCt2.ShowCancelDialog := False;
     RelCt2.ShowPrintDialog := False;
     RelCt2.PrinterSetup.DocumentName := doc;

     ppLabel24.Caption:= cbCli.Items[cbCli.ItemIndex];
     ppLabel26.Caption:= DM3.cdsCred2DT1.AsString;
     ppLabel27.Caption:= DM3.cdsCred2DT2.AsString;


     { imprime a ordem de serviço }
     RelCt2.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure Imprimir_detalhes();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ContImp do
   begin
     doc := 'Relatório de Cobrança de Contratos';
     { carrega o arquivo }
     RelCt3.Template.FileName := dirR+'\Rels\RelCont3.rtm';
     RelCt3.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelCt3.DeviceType := 'Screen';
     RelCt3.ShowAutoSearchDialog  := False;
     RelCt3.ShowCancelDialog := False;
     RelCt3.ShowPrintDialog := False;
     RelCt3.PrinterSetup.DocumentName := doc;

     ppLabel41.Caption:= cbCli.Items[cbCli.ItemIndex];
     ppLabel43.Caption:= DM3.cdsCred2DT1.AsString;
     ppLabel44.Caption:= DM3.cdsCred2DT2.AsString;


     { imprime a ordem de serviço }
     RelCt3.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TContImp.btImp1Click(Sender: TObject);
begin
  Imprimir_Capa;
end;

procedure TContImp.btImp2Click(Sender: TObject);
begin
  Imprimir_dias;
end;

procedure TContImp.btImp3Click(Sender: TObject);
begin
  Imprimir_detalhes;
end;

end.
