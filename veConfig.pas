unit veConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Data.DB,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Buttons,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TeConfig = class(TForm)
    ActionList1: TActionList;
    actPastas: TAction;
    actValores: TAction;
    actPower: TAction;
    Action1: TAction;
    imlIcons: TImageList;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    Label4: TLabel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    PageControl1: TPageControl;
    tsGeral: TTabSheet;
    tsCobra: TTabSheet;
    cbCli: TComboBox;
    dsCob: TJvDataSource;
    cob_Panel1: TPanel;
    cob_lbCli: TLabel;
    Label2: TLabel;
    cob_lbCriado: TLabel;
    Label5: TLabel;
    cob_dtValido: TDateTimePicker;
    cob_ckbValido: TCheckBox;
    GroupBox1: TGroupBox;
    cobA_tipo0: TRadioButton;
    cobA_tipo1: TRadioButton;
    cobA_vPorc: TJvValidateEdit;
    cobA_vValor: TJvValidateEdit;
    cobA_vArea: TJvValidateEdit;
    cobA_vExced: TJvValidateEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    cobA_vMin: TJvValidateEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    cobM_tipo0: TRadioButton;
    cobM_tipo1: TRadioButton;
    cobM_vPorc: TJvValidateEdit;
    cobM_vEnt: TJvValidateEdit;
    cobM_vDev: TJvValidateEdit;
    cobM_vSai: TJvValidateEdit;
    cobM_vMin: TJvValidateEdit;
    cobM_ctEnt: TGroupBox;
    cobM_rbEnt0: TRadioButton;
    cobM_rbEnt1: TRadioButton;
    cobM_ctDev: TGroupBox;
    cobM_rbDev0: TRadioButton;
    cobM_rbDev1: TRadioButton;
    cobM_ctSai: TGroupBox;
    cobM_rbSai0: TRadioButton;
    cobM_rbSai1: TRadioButton;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Bevel3: TBevel;
    Label20: TLabel;
    cobP_tipo0: TRadioButton;
    cobP_tipo1: TRadioButton;
    cobP_vPorc: TJvValidateEdit;
    cobP_vValor: TJvValidateEdit;
    cobP_vMin: TJvValidateEdit;
    cobP_ctValor: TGroupBox;
    cobP_rbValor0: TRadioButton;
    cobP_rbValor1: TRadioButton;
    GroupBox8: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Bevel4: TBevel;
    Label21: TLabel;
    cobE_tipo0: TRadioButton;
    cobE_tipo1: TRadioButton;
    cobE_vPorc: TJvValidateEdit;
    cobE_vValor: TJvValidateEdit;
    cobE_vMin: TJvValidateEdit;
    cobE_ctValor: TGroupBox;
    cobE_rbValor0: TRadioButton;
    cobE_rbValor1: TRadioButton;
    GroupBox10: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    cobS_vDia: TJvValidateEdit;
    cobS_vTaxa: TJvValidateEdit;
    cobS_vMin: TJvValidateEdit;
    cob_Panel2: TPanel;
    Panel3: TPanel;
    cob_ckValidos: TCheckBox;
    cob_edPesq: TSearchBox;
    cob_DBGrid: TJvDBGrid;
    cob_btNovo: TBitBtn;
    cob_btNovoSel: TBitBtn;
    cob_btAlterar: TBitBtn;
    pbtVoltar: TSpeedButton;
    pbtSalvarU: TSpeedButton;
    tsLocal: TTabSheet;
    PanelLocal: TPanel;
    Nome: TLabel;
    loc_edNome: TEdit;
    Label3: TLabel;
    Label1: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Image1: TImage;
    Label27: TLabel;
    loc_vArm: TJvValidateEdit;
    loc_vRuas: TJvValidateEdit;
    loc_vModulos: TJvValidateEdit;
    loc_vNiveis: TJvValidateEdit;
    Label28: TLabel;
    loc_cbQuarto: TComboBox;
    loc_btSalvar: TBitBtn;
    procedure imgMenuClick(Sender: TObject);
    procedure actPastasExecute(Sender: TObject);
    procedure actValoresExecute(Sender: TObject);
    procedure cob_btNovoClick(Sender: TObject);
    procedure cob_btNovoSelClick(Sender: TObject);
    procedure cob_btAlterarClick(Sender: TObject);
    procedure pbtVoltarClick(Sender: TObject);
    procedure pbtSalvarUClick(Sender: TObject);
    procedure cob_edPesqKeyPress(Sender: TObject; var Key: Char);
    procedure cob_edPesqInvokeSearch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  eConfig: TeConfig;
  idCob, idCliCob:Integer;

implementation

{$R *.dfm}



uses veBanco, veDM, Global;

// Rotinas  de Suporte

procedure Cob_Edita(b:boolean);
begin
  eConfig.cob_Panel1.Visible := b;
  eConfig.cob_Panel2.Visible := not b;
end;

procedure cob_Salvar();
  var Bce : TBce;
      aTipo, mTipo : String;
      pTipo, eTipo, Vale, eC, pC :Smallint;
      mCde, MCds, Mcdd : Smallint;

begin
  Bce := TBce.Create;
  with eConfig do
  begin

      Vale := 1;
      if not cob_ckbValido.Checked then Vale := 0;

      aTipo := 'P';
      if cobA_tipo1.Checked then aTipo := 'A';
      mTipo := 'P';
      if cobM_tipo1.Checked then mTipo := 'D';
      pTipo := 0;
      if cobP_tipo1.Checked then pTipo := 1;
      pC := 0;
      if cobP_rbValor1.Checked then pC := 1;
      eTipo := 0;
      if cobE_tipo1.Checked then eTipo := 1;
      eC := 0;
      if cobE_rbValor1.Checked then eC := 1;
      mCde := 0;
      if cobM_rbEnt1.Checked then mCde := 1;
      mCdd := 0;
      if cobM_rbDev1.Checked then mCdd := 1;
      mCds := 0;
      if cobM_rbSai1.Checked then mCds := 1;

    if idCob = 0 then
    begin
      Bce.Cobra_Insere(idCliCob, Vale,  cob_dtValido.Date,
                       aTipo,cobA_vPorc.Value, cobA_vValor.Value,cobA_vArea.Value, cobA_vExced.Value, CobA_vMin.Value,
                       cobS_vDia.Value, cobS_vTaxa.Value, cobS_vMin.Value,
                       mTipo, 'E',mCde, mCds,mCdd, cobM_vEnt.Value, cobM_vSai.Value, cobM_vDev.Value, cobM_vPorc.Value, cobM_vMin.Value,
                       pTipo, pC, cobP_vPorc.Value, cobP_vValor.Value, cobP_vMin.Value,
                       eTipo, eC, cobE_vPorc.Value, cobE_vValor.Value, cobE_vMin.Value
                         );
    end
    else
    begin
      Bce.Cobra_Altera(idCob, Vale, cob_dtValido.Date,
                       aTipo,cobA_vPorc.Value, cobA_vValor.Value,cobA_vArea.Value, cobA_vExced.Value, CobA_vMin.Value,
                       cobS_vDia.Value, cobS_vTaxa.Value, cobS_vMin.Value,
                       mTipo, 'E',mCde, mCds,mCdd, cobM_vEnt.Value, cobM_vSai.Value, cobM_vDev.Value, cobM_vPorc.Value, cobM_vMin.Value,
                       pTipo, pC, cobP_vPorc.Value, cobP_vValor.Value, cobP_vMin.Value,
                       eTipo, eC, cobE_vPorc.Value, cobE_vValor.Value, cobE_vMin.Value
                         );

    end;
  end;
  Bce.Cobra_Mostra;
  Bce.Cobra_Mostra2;
  Bce.Destroy;
end;

procedure cob_Pesq();
  var Bce : tBce;
      at : Smallint;
begin

  with eConfig do
  begin

    Bce := TBce.Create;
    Bce.Cobra_fPesq(cob_edPesq.Text, cob_dtValido.Checked);
    Bce.Destroy;
  end;
end;

function Pega_id():Integer;
  var i : Integer;
      Bce : TBce;
begin
  i := 0;
  Bce := TBce.Create;
  i := Bce.fCli_Id(eConfig.cbCli.Items[eConfig.cbCli.itemIndex]);
  Bce.Destroy;

  Result := i;
end;

function aNomeCli(idC0:Integer):String;
 var Bce : TBce;
     s : String;
begin
  Bce := TBce.Create;
  s := Bce.Cli_Nome(idC0);
  Bce.Destroy;

  result := s;
end;

procedure aLimpar(idC1:Integer);

begin

  with eConfig do
  begin
    // Geral
    idCliCob := idC1;
    cob_lbCli.Caption := aNomeCli(idC1);
    cob_lbCriado.Caption := FormatDateTime('dd/MM/yyyy', Now);
    cob_dtValido.Date := Now + 370;
    cob_ckbValido.Checked := true;
    // Armazenagem
    cobA_tipo0.Checked := true;
    cobA_vPorc.Value := 0;
    cobA_vValor.Value := 0;
    cobA_vArea.Value := 0;
    cobA_vExced.Value := 0;
    cobA_vMin.Value := 0;
    // Movimentação
    cobM_tipo0.Checked := true;
    cobM_vPorc.Value := 0;
    cobM_vEnt.Value := 0;
    cobM_vDev.Value := 0;
    cobM_vSai.Value := 0;
    cobM_vMin.Value := 0;
    cobM_rbEnt0.Checked := true;
    cobM_rbDev0.Checked := true;
    cobM_rbSai0.Checked := true;
    // Packing
    cobP_tipo0.Checked := true;
    cobP_vPorc.Value := 0;
    cobP_vValor.Value := 0;
    cobP_vMin.Value := 0;
    cobP_rbValor0.Checked := true;
    // Expedição
    cobE_tipo0.Checked := true;
    cobE_vPorc.Value := 0;
    cobE_vValor.Value := 0;
    cobE_vMin.Value := 0;
    cobE_rbValor0.Checked := true;
    // Seguro
    cobS_vDia.Value := 0;
    cobS_vTaxa.Value := 0;
    cobS_vMin.Value := 0;
  end;
end;

procedure aPreenche(idC2:Integer);

begin

  with eConfig do
  begin
    // Geral
    idCliCob := idC2;
    cob_lbCli.Caption := aNomeCli(idC2);
    cob_lbCriado.Caption := FormatDateTime('dd/MM/yyyy', eDM.cdsCobDTCRADO.AsDateTime);
    cob_dtValido.DateTime := eDM.cdsCobDTVALIDO.AsDateTime;
    cob_ckbValido.Checked := (eDM.cdsCobBVALIDO.Value = 1);
    // Armazenagem
    cobA_tipo0.Checked := (eDM.cdsCobARM_TIPO.Value = 'P');
    cobA_tipo1.Checked := (eDM.cdsCobARM_TIPO.Value = 'A');
    cobA_vPorc.Value := eDM.cdsCobARM_PORC.AsFloat;
    cobA_vValor.Value := eDM.cdsCobARM_AFIXO.AsFloat;
    cobA_vArea.Value := eDM.cdsCobARM_ALIMITE.AsFloat;
    cobA_vExced.Value := eDM.cdsCobARM_AEXCEDE.AsFloat;
    cobA_vMin.Value := eDM.cdsCobARM_MINIMO.AsFloat;
    // Movimentação
    cobM_tipo0.Checked := (eDM.cdsCobMOV_TIPO.Value = 'P');
    cobM_tipo1.Checked := (eDM.cdsCobMOV_TIPO.Value = 'D');
    cobM_vPorc.Value := eDM.cdsCobMOV_PORC.AsFloat;
    cobM_vEnt.Value := eDM.cdsCobMOV_DE_VALOR.AsFloat;
    cobM_vDev.Value := eDM.cdsCobMOV_DD_VALOR.AsFloat;
    cobM_vSai.Value := eDM.cdsCobMOV_DS_VALOR.AsFloat;
    cobM_vMin.Value := eDM.cdsCobMOV_MINIMO.AsFloat;
    cobM_rbEnt0.Checked := (eDM.cdsCobMOV_DE_CONTAR.Value = 0);
    cobM_rbEnt1.Checked := (eDM.cdsCobMOV_DE_CONTAR.Value = 1);
    cobM_rbDev0.Checked := (eDM.cdsCobMOV_DD_CONTAR.Value = 0);
    cobM_rbDev1.Checked := (eDM.cdsCobMOV_DD_CONTAR.Value = 1);
    cobM_rbSai0.Checked := (eDM.cdsCobMOV_DS_CONTAR.Value = 0);
    cobM_rbSai1.Checked := (eDM.cdsCobMOV_DS_CONTAR.Value = 1);
    // Packing
    cobP_tipo0.Checked := (eDM.cdsCobPACK_TIPO.Value = 0);
    cobP_tipo1.Checked := (eDM.cdsCobPACK_TIPO.Value = 1);
    cobP_vPorc.Value := eDM.cdsCobPACK_PORC.AsFloat;
    cobP_vValor.Value := eDM.cdsCobPACK_VALOR.AsFloat;
    cobP_vMin.Value := eDM.cdsCobPACK_MINIMO.AsFloat;
    cobP_rbValor0.Checked := (eDM.cdsCobPACK_CONTAR.Value = 0);
    cobP_rbValor1.Checked := (eDM.cdsCobPACK_CONTAR.Value = 1);
    // Expedição
    cobE_tipo0.Checked := (eDM.cdsCobEXPED_TIPO.Value = 0);
    cobE_tipo1.Checked := (eDM.cdsCobEXPED_TIPO.Value = 1);
    cobE_vPorc.Value := eDM.cdsCobEXPED_PORC.AsFloat;
    cobE_vValor.Value := eDM.cdsCobEXPED_VALOR.AsFloat;
    cobE_vMin.Value := eDM.cdsCobEXPED_MINIMO.AsFloat;
    cobE_rbValor0.Checked := (eDM.cdsCobEXPED_CONTAR.Value = 0);
    cobE_rbValor1.Checked := (eDM.cdsCobEXPED_CONTAR.Value = 1);
    // Seguro
    cobS_vDia.Value := eDM.cdsCobSEG_DIA.AsInteger;
    cobS_vTaxa.Value := eDM.cdsCobSEG_TAXA.AsFloat;
    cobS_vMin.Value := eDM.cdsCobSEG_MINIMO.AsFloat;
  end;
end;

procedure TeConfig.actPastasExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TeConfig.actValoresExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
end;

procedure TeConfig.cob_btAlterarClick(Sender: TObject);
 var Bce : TBce;
     id : Integer;
begin
  id := eDM.cdsCob2LIGCLI.Value;
  Bce := TBce.Create;
  Bce.Cobra_fMostraID(eDM.cdsCob2ID.Value);
  Bce.Destroy;
  aPreenche(id);
  idCliCob := id;
  idCob := eDM.cdsCob2ID.Value;
  Cob_Edita(true);
end;

procedure TeConfig.cob_btNovoClick(Sender: TObject);
var id : Integer;
begin
  id := Pega_id;
  aLimpar(id);
  idCliCob := id;

  idCob := 0;
  Cob_Edita(true);
end;

procedure TeConfig.cob_btNovoSelClick(Sender: TObject);
 var Bce : TBce;
     id : Integer;
begin
  id := Pega_id;
  //aLimpar(id);
  Bce := TBce.Create;
  Bce.Cobra_fMostraID(eDM.cdsCob2ID.Value);
  Bce.Destroy;
  aPreenche(id);
  idCliCob := id;
  idCob := 0;
  Cob_Edita(true);
end;

procedure TeConfig.cob_edPesqInvokeSearch(Sender: TObject);
begin
  if Length(cob_edPesq.Text)>0 then cob_Pesq;
end;

procedure TeConfig.cob_edPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  if Length(cob_edPesq.Text)>0 then cob_Pesq;
end;

procedure TeConfig.Entrar;
 var Bce : TBce;
begin
  cbCli.Clear;
  Bce := TBce.Create;
  Bce.Cli_CB_fPreenche(cbCli);
  Bce.Cli_CB_fID(cbCli, eCli);
  Bce.Cobra_Mostra;
  Bce.Cobra_Mostra2;
  Bce.Cobra_fPesq(cbCli.Items[cbCli.ItemIndex], cob_ckValidos.Checked);
  Bce.Destroy;

  Cob_Edita(false);
end;

procedure TeConfig.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TeConfig.pbtSalvarUClick(Sender: TObject);
  var Bce : tBce;

begin
  cob_Salvar;
  Bce := TBce.Create;
  Bce.Cobra_Mostra();
  Bce.Destroy;
  Cob_Edita(false);
end;

procedure TeConfig.pbtVoltarClick(Sender: TObject);
begin
  Cob_Edita(false);

end;

end.
