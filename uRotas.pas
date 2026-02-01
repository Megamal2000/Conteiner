unit uRotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, DB, JvDataSource, Buttons, ppDB, ppCtrls,
  ppBands, ppModule, raCodMod, ppReport, ppStrtch, ppSubRpt, ppVar,
  ppPrnabl, ppClass, ppCache, ppParameter, ppDBPipe, ppComm, ppRelatv,
  ppProd, ppDesignLayer;

type
  TRotas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    btNovo1: TSpeedButton;
    lbMens: TLabel;
    edRota: TEdit;
    btSalvar1: TSpeedButton;
    lbObs: TLabel;
    btApagar1: TSpeedButton;
    Label2: TLabel;
    JvDataSource1: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    btNovo2: TSpeedButton;
    lbMens2: TLabel;
    btSalvar2: TSpeedButton;
    lbObs2: TLabel;
    btApagar2: TSpeedButton;
    Label6: TLabel;
    JvDBGrid2: TJvDBGrid;
    vCEP1: TJvValidateEdit;
    vCEP2: TJvValidateEdit;
    lbRota: TLabel;
    JvDataSource2: TJvDataSource;
    btImprimir: TBitBtn;
    RelRotas: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppDBPipeline2: TppDBPipeline;
    ppParameterList1: TppParameterList;
    JvDataSource3: TJvDataSource;
    ppHeaderBand3: TppHeaderBand;
    ppLabel13: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel14: TppLabel;
    ppLine5: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText8: TppDBText;
    ppLine6: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppLabel17: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure btNovo1Click(Sender: TObject);
    procedure btSalvar1Click(Sender: TObject);
    procedure btApagar1Click(Sender: TObject);
    procedure edRotaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btNovo2Click(Sender: TObject);
    procedure btSalvar2Click(Sender: TObject);
    procedure btApagar2Click(Sender: TObject);
    procedure vCEP1KeyPress(Sender: TObject; var Key: Char);
    procedure vCEP2KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure ppDBPipeline2MasterRecordPositionChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Rotas: TRotas;
  idRota, idCEP: Integer;
implementation

{$R *.dfm}

uses uBanco, uDM5;

procedure Limpar2();
begin
  with Rotas do
  begin
    lbRota.Caption    := '';
    lbMens2.Caption   := 'Adicionar novos CEPs';
    vCEP1.Value       := 0;
    vCEP2.Value       := 0;
    lbObs2.Visible    := false;
    btApagar2.Visible := false;
    idCEP := 0;
  end;
end;

procedure Limpar1();
begin
  with Rotas do
  begin
    lbMens.Caption    := 'Adicionar NOVA Rota';
    edRota.Text       := '';
    lbObs.Visible     := false;
    btApagar1.Visible := false;
    idRota := 0;
  end;
  Limpar2;
end;

procedure MostrarRotas();

var Bco : TBco;
begin
  with Rotas do
  begin
    Bco := TBco.Create;
    Bco.Rotas_Mostra;
    DM5.cdsRota.First;
    //BCo.Rotas_CEPs_Mostra;
    DM5.cdsRCEP2.Active := true;
    Bco.Destroy;
  end;
end;

procedure MostrarCEPs();

var Bco : TBco;
begin
  with Rotas do
  begin
    Bco := TBco.Create;
    BCo.Rotas_CEPs_MostraRot(idRota);
    Bco.Destroy;
  end;
end;


procedure SalvarRotas();

var Bco : TBco;
begin
  with Rotas do
  begin
    Bco := TBco.Create;
    if (idRota>0) then
      Bco.Rotas_Altera(idRota, edRota.Text)
    else
      Bco.Rotas_Insere(edRota.Text);
    Bco.Destroy;
  end;
  Limpar1;
  MostrarRotas;
end;

procedure SalvarCEPs();

var Bco : TBco;
begin
  with Rotas do
  begin
    Bco := TBco.Create;
    if (idCEP>0) then
      Bco.Rotas_CEPs_Altera(idCEP, vCEP1.Value, vCEP2.Value)
    else
      if (idRota>0) then
        Bco.Rotas_CEPs_Insere(idRota, vCEP1.Value, vCEP2.Value);
    Bco.Destroy;
  end;
  Limpar2;
  MostrarCEPs;
  Rotas.vCEP1.SetFocus;
end;

procedure EditarRotas();

begin
  with Rotas do
  begin
    lbMens.Caption := 'Altere a Rota';
    edRota.Text := DM5.cdsRotaROTA.Value;
    idRota := DM5.cdsRotaID.Value;
    lbRota.Caption := DM5.cdsRotaROTA.Value;
  end;
end;

procedure EditarCEPs();

begin
  with Rotas do
  begin

    lbMens2.Caption := 'Altere os CEPs';
    vCEP1.Value  := DM5.cdsRCEPCEPINIC.Value;
    vCEP2.Value  := DM5.cdsRCEPCEPFIM.Value;
    idCEP := DM5.cdsRCEPID.Value;
  end;
end;

///***********************************************
/// ROTAS

procedure TRotas.btNovo1Click(Sender: TObject);
begin
  Limpar1;
  edRota.SetFocus;
end;

procedure TRotas.btSalvar1Click(Sender: TObject);
begin
  if (Length(edRota.Text)>2) then SalvarRotas;
end;

procedure TRotas.btApagar1Click(Sender: TObject);

var Bco : TBco;
begin
  if MessageDlg('Tem certeza que deseja Apagar essa Rota?'+#13+DM5.cdsRotaROTA.value,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.Rotas_Apaga(idRota);
    Bco.Destroy;
    Limpar1;
    MostrarRotas;
  end;
end;

procedure TRotas.edRotaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  if (Length(edRota.Text)>2) then SalvarRotas;
end;


procedure TRotas.JvDBGrid1DblClick(Sender: TObject);
begin
  Limpar1;
  EditarRotas;
  MostrarCEPs();
  edRota.SetFocus;

  if (DM5.cdsRCEP.RecordCount > 0) then
    lbObs.Caption := ' .: '+IntToStr(DM5.cdsRCEP.RecordCount)+' faixas de CEPs'
  else
  begin
    lbObs.Caption := ' .: <SEM CEPs cadastrados> ';
    btApagar1.Visible := true;
  end;
 lbObs.Visible := True;

end;

procedure TRotas.JvDBGrid1CellClick(Column: TColumn);
begin
 lbRota.Caption := DM5.cdsRotaROTA.Value;
 idRota := DM5.cdsRotaID.value;
 MostrarCEPs();
 DM5.cdsRCEP2.Refresh;
end;

///***********************************************
/// CEPS




procedure TRotas.btNovo2Click(Sender: TObject);
begin
  Limpar2;
  vCEP1.SetFocus;
end;

procedure TRotas.btSalvar2Click(Sender: TObject);
begin
  if (vCEP1.Value >0) and (vCEP2.Value > 0) then SalvarCEPs;
end;

procedure TRotas.btApagar2Click(Sender: TObject);
var Bco : TBco;
begin
  if MessageDlg('Tem certeza que deseja Apagar esses CEPs?'+#13+DM5.cdsRCEPCEPINIC.AsString + ' - '+DM5.cdsRCEPCEPFIM.AsString,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.Rotas_CEPs_Apaga(idCEP);
    Bco.Destroy;
    MostrarCEPs;
  end;
end;

procedure TRotas.vCEP1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then vCEP2.SetFocus;
end;

procedure TRotas.vCEP2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  if (vCEP1.Value >0) and (vCEP2.Value > 0) then SalvarCEPs;
end;

procedure TRotas.JvDBGrid2DblClick(Sender: TObject);
begin
  Limpar2;
  EditarCEPs;
  idCEP := DM5.cdsRCEPID.Value;
  vCEP1.SetFocus;
  lbObs2.Visible := true;
  btApagar2.Visible := true;
end;

procedure TRotas.Entrar;
begin
  Limpar1;
  MostrarRotas;
end;

procedure Imprimir_RotasComp();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with Rotas do
   begin
     doc := 'Lista de Rotas Completa';
     { carrega o arquivo }
     RelRotas.Template.FileName := dirR+'\Rels\RelRotasComp.rtm';
     RelRotas.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelRotas.DeviceType := 'Screen';
     RelRotas.ShowAutoSearchDialog  := False;
     RelRotas.ShowCancelDialog := False;
     RelRotas.ShowPrintDialog := False;
     RelRotas.PrinterSetup.DocumentName := doc;

     // Complementos
     //ppLabel4.Caption:= FormatDateTime('dd/MM/yyyy', dat1.DateTime);

     { imprime a ordem de serviço }
     RelRotas.PrintReport;

     {Fecha os arquivos}
   end;

end;


procedure TRotas.btImprimirClick(Sender: TObject);
begin
  Imprimir_RotasComp;
end;

procedure TRotas.ppDBPipeline2MasterRecordPositionChange(Sender: TObject);

//var Bco:TBco;
begin
//  BCo := TBco.Create;
//  Bco.Rotas_CEPs_MostraRot(DM5.cdsRotaID.Value);
//  bco.Destroy;
end;

end.
