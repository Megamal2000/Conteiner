unit uPagLista;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, DB, JvDataSource,
  ComCtrls, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  Menus, Buttons, ppDB, ppBands, ppCache, ppClass, ppProd, ppReport,
  ppComm, ppRelatv, ppDBPipe, ppStrtch, ppCTMain, ppPrnabl, ppCtrls,
  ppRegion, ppSubRpt, ppModule, raCodMod, ppParameter, ppVar, ppDesignLayer;

type
  TPagLista = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbCli: TLabel;
    lbINI: TLabel;
    lbFim: TLabel;
    lbDesc: TLabel;
    StatusBar1: TStatusBar;
    JvDataSource1: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    lbMot: TLabel;
    Label5: TLabel;
    edValorM: TJvValidateEdit;
    btValorM: TSpeedButton;
    PopupMenu1: TPopupMenu;
    AlterarValorMotorista1: TMenuItem;
    AnotarPagamento1: TMenuItem;
    ppDBPipeline1: TppDBPipeline;
    relPag2: TppReport;
    ppDBPipeline2: TppDBPipeline;
    JvDataSource2: TJvDataSource;
    btImp: TBitBtn;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppShape1: TppShape;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText10: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText11: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppFooterBand1: TppFooterBand;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel14: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    btAlterar: TBitBtn;
    Panel3: TPanel;
    lbServ: TLabel;
    lbCred: TLabel;
    lbVale: TLabel;
    lbSist: TLabel;
    lbMotor: TLabel;
    lbPago: TLabel;
    procedure AlterarValorMotorista1Click(Sender: TObject);
    procedure btValorMClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
    procedure edValorMKeyPress(Sender: TObject; var Key: Char);
    procedure AnotarPagamento1Click(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar(idPag : integer);
  end;

var
  PagLista: TPagLista;
  idPagam : Integer;
  idItem : Integer;
  tot_Serv, tot_Cred, tot_Vale,
  tot_Sist, tot_Motor, tot_Pago:Double;
implementation

{$R *.dfm}

uses uDM4, uDM1, uBanco, uPagPago, uDM2, uPrinc, uPagR1;

{ TPagLista }


procedure Totaliza;

var Bco : TBco;

begin
  tot_Serv := 0;
  tot_Cred := 0;
  tot_Vale := 0;
  tot_Sist := 0;
  tot_Motor:= 0;
  tot_Pago := 0;

  // Totaliza
  DM4.cdsPagI.First;
  while not DM4.cdsPagI.Eof do
  begin
    tot_Serv := tot_Serv + DM4.cdsPagIVSERVICO.AsFloat;
    tot_Cred := tot_Cred + DM4.cdsPagIVCREDITOS.AsFloat;
    tot_Vale := tot_Vale + DM4.cdsPagIVVALES.AsFloat;
    tot_Sist := tot_Sist + DM4.cdsPagIVCALCF.AsFloat;
    tot_Motor:= tot_Motor+ DM4.cdsPagIVCALCM.AsFloat;
    tot_Pago := tot_Pago + DM4.cdsPagIVPAGO.AsFloat;

    DM4.cdsPagI.Next;
  end;

  // Mostra
  PagLista.lbServ.Caption := FormatFloat('#,##0.00', tot_Serv);
  PagLista.lbCred.Caption := FormatFloat('#,##0.00', tot_Cred);
  PagLista.lbVale.Caption := FormatFloat('#,##0.00', tot_Vale);
  PagLista.lbSist.Caption := FormatFloat('#,##0.00', tot_Sist);
  PagLista.lbMotor.Caption:= FormatFloat('#,##0.00', tot_Motor);
  PagLista.lbPago.Caption := FormatFloat('#,##0.00', tot_Pago);



  Bco := TBco.Create;
  Bco.PagGrupo_GrupoTotais(idPagam, tot_Sist, tot_Pago);
  Bco.Destroy;

end;

procedure TPagLista.Entrar(idPag : integer);

var Bco : Tbco;
    idU : Integer;

begin
  idPagam := idPag;
  idU     := StrToInt(Princ.LbUserID.Caption);

  Bco := TBco.Create;
  Bco.PagGrupo_ItensLista(idPag);
  Bco.PagGrupo_GrupoMostraID(idPag);
  Bco.Usuarios_MostraId(idU);
  Bco.Destroy;

  if (DM4.cdsPagG.RecordCount > 0) then Totaliza;


  // preenche
  lbINI.Caption := FormatDateTime('dd/MMM/yyyy', DM4.cdsPagGDTINICIO.Value);
  lbFim.Caption := FormatDateTime('dd/MMM/yyyy', DM4.cdsPagGDTFIM.Value);
  lbDesc.Caption:= DM4.cdsPagGDESCRICAO.Value;
  lbcLI.Caption := DM4.cdsPagGANO.AsString;

  // Visualiza os menus
  AlterarValorMotorista1.Visible := False;
  AnotarPagamento1.Visible := False;

  if (DM2.cdsUserNIVEL.Value >=3 ) then AlterarValorMotorista1.Visible := true;
  if (DM2.cdsUserNIVEL.Value >=3 ) then AnotarPagamento1.Visible := true;

  // Finalizar
  StatusBar1.Panels[0].Text := 'Motoristas '+IntToStr(DM4.cdsPagI.RecordCount);
  StatusBar1.Panels[1].Text := 'Clique em [ Alterar ] para calcular salário / vales/ crédito';

end;

procedure TPagLista.AlterarValorMotorista1Click(Sender: TObject);
begin
  if (DM4.cdsPagI.RecordCount > 0) then
  begin
    lbMot.Caption := DM4.cdsPagINOME.Value;
    edValorM.Value := Dm4.cdsPagIVCALCM.AsFloat;
    idItem := DM4.cdsPagIID.Value;
    Panel2.Visible := true;
    edValorM.SetFocus;
  end;
end;

procedure Valor_Motorista();

var Bco : TBco;

begin
  with PagLista do
  begin
    Bco := Tbco.Create;
    Bco.PagGrupo_ItensGravaVM(idItem, edValorM.Value);
    Bco.Destroy;
    Panel2.Visible := false;
    Entrar(idpagam);
  end;
end;

procedure TPagLista.btValorMClick(Sender: TObject);

begin
  Valor_Motorista;
end;

procedure Imprimir_relPag2();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with PagLista do
   begin
     doc := 'Lista de Pagamentos';
     { carrega o arquivo }
     RelPag2.Template.FileName := dirR+'\Rels\RelPag2.rtm';
     RelPag2.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelPag2.DeviceType := 'Screen';
     RelPag2.ShowAutoSearchDialog  := False;
     RelPag2.ShowCancelDialog := False;
     RelPag2.ShowPrintDialog := False;
     RelPag2.PrinterSetup.DocumentName := doc;

     ppLabel15.Caption:= lbDesc.Caption;
     ppLabel17.Caption:= lbINI.Caption;
     ppLabel18.Caption:= lbFim.Caption;
    { ppLabel16.Caption:= FormatFloat('#,##0.00', vVales);
     ppLabel17.Caption:= FormatFloat('#,##0.00', vTot);
     ppLabel18.Caption:= FormatFloat('#,##0.00', vCred);
     }
     { imprime a ordem de serviço }
     RelPag2.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TPagLista.btImpClick(Sender: TObject);
begin
  Imprimir_relPag2;
end;

procedure TPagLista.edValorMKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Valor_Motorista;
end;

procedure TPagLista.AnotarPagamento1Click(Sender: TObject);
begin
  PagPago.cbModo.ItemIndex := 1;
  if (DM4.cdsPagIMODO.Value = 'transfere') then PagPago.cbModo.ItemIndex := 1;
  if (DM4.cdsPagIMODO.Value = 'deposito')  then PagPago.cbModo.ItemIndex := 2;
  if (DM4.cdsPagIMODO.Value = 'dinheiro')  then PagPago.cbModo.ItemIndex := 3;
  if (DM4.cdsPagIMODO.Value = 'cheque')    then PagPago.cbModo.ItemIndex := 4;

  PagPago.lbMot.Caption := DM4.cdsPagINOME.Value;
  PagPago.set_idMot(DM4.cdsPagIIDF.Value);
  PagPago.set_idPagD(DM4.cdsPagIID.Value);
  PagPago.Show;
  //PagLista.Hide;
end;

procedure TPagLista.btAlterarClick(Sender: TObject);
begin
  PagR1.set_idLista(idPagam);
  PagR1.dat1.DateTime := DM4.cdsPagGDTINICIO.Value;
  PagR1.dat2.DateTime := DM4.cdsPagGDTFIM.Value;
  PagR1.Atualizar1.Click;
  PagR1.Show;
end;

end.
