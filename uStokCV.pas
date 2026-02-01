unit uStokCV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Buttons;

type
  TStokCV = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tba: TTabSheet;
    tbM: TTabSheet;
    tbs: TTabSheet;
    StatusBar1: TStatusBar;
    btSalvar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    rbArm1: TRadioButton;
    Agr1: TGroupBox;
    Label4: TLabel;
    aTaxa: TJvValidateEdit;
    aMin: TJvValidateEdit;
    Label5: TLabel;
    rbArm2: TRadioButton;
    Agr2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    aVlr: TJvValidateEdit;
    aArea: TJvValidateEdit;
    Label8: TLabel;
    aExc: TJvValidateEdit;
    rbMov1: TRadioButton;
    Mgr1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    mTaxa: TJvValidateEdit;
    mMinE: TJvValidateEdit;
    mMinS: TJvValidateEdit;
    Label11: TLabel;
    rbMov2: TRadioButton;
    Mgr2: TGroupBox;
    Label12: TLabel;
    mDivEn: TJvValidateEdit;
    rbDivEn: TRadioButton;
    rbDivEi: TRadioButton;
    Mgr3: TGroupBox;
    Label13: TLabel;
    mDivEd: TJvValidateEdit;
    rbDivEn1: TRadioButton;
    rbDivEi1: TRadioButton;
    Mgr4: TGroupBox;
    Label14: TLabel;
    mDivS: TJvValidateEdit;
    rbDivSn: TRadioButton;
    rbDivSi: TRadioButton;
    GroupBox7: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    sTaxa: TJvValidateEdit;
    sMin: TJvValidateEdit;
    Label17: TLabel;
    dtSeg: TDateTimePicker;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ComboBox1: TComboBox;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    dti: TDateTimePicker;
    dtf: TDateTimePicker;
    Emin: TJvValidateEdit;
    Label23: TLabel;
    procedure rbArm1Click(Sender: TObject);
    procedure rbArm2Click(Sender: TObject);
    procedure rbMov1Click(Sender: TObject);
    procedure rbMov2Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
    procedure set_idCont(i : Integer);
    procedure Entrar;
  end;

var
  StokCV: TStokCV;
  idCli, idCont : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM4;

{ TStokCV }

procedure TStokCV.set_idCli(i: Integer);

begin
  idCli := i;
end;

procedure Armaz();

begin
  with StokCV do
  begin
    if (rbArm1.Checked) then
    begin
      Agr1.Font.Color := clBlack;
      Agr2.Font.Color := clGray;

      Agr1.Enabled := true;
      Agr2.Enabled := false;
    end
    else
    begin
      Agr1.Font.Color := clGray;
      Agr2.Font.Color := clBlack;

      Agr1.Enabled := false;
      Agr2.Enabled := true;
    end;
  end;
end;



procedure Movim();

begin
  with StokCV do
  begin
    if (rbMov1.Checked) then
    begin
      Mgr1.Font.Color := clBlack;
      Mgr2.Font.Color := clGray;
      Mgr3.Font.Color := clGray;
      Mgr4.Font.Color := clGray;

      Mgr1.Enabled  := true;
      Mgr2.Enabled  := false;
      Mgr3.Enabled  := false;
      Mgr4.Enabled  := false;
    end
    else
    begin
      Mgr1.Font.Color := clGray;
      Mgr2.Font.Color := clBlack;
      Mgr3.Font.Color := clBlack;
      Mgr4.Font.Color := clBlack;

      Mgr1.Enabled := false;
      Mgr2.Enabled := true;
      Mgr3.Enabled := true;
      Mgr4.Enabled := true;
    end;
  end;
end;

procedure TStokCV.rbArm1Click(Sender: TObject);
begin
  Armaz;
end;

procedure TStokCV.rbArm2Click(Sender: TObject);
begin
  Armaz;
end;

procedure TStokCV.rbMov1Click(Sender: TObject);
begin
  Movim;
end;

procedure TStokCV.rbMov2Click(Sender: TObject);
begin
  Movim;
end;

procedure Preenche();
begin
  Armaz;
  Movim;

  with StokCV do
  begin
    // Geral
    dti.DateTime := DM4.cdsStokDDTINICIO.AsDateTime;
    dtf.DateTime := DM4.cdsStokDDTFIM.AsDateTime;
    Emin.Value   := DM4.cdsStokDESPECIAL_MINIMO.AsFloat;

    //Armazenagem
    rbArm1.Checked := true;
    if (DM4.cdsStokDARM_FLG.Value = 1) then rbArm2.Checked := true;

    aTaxa.Value  := DM4.cdsStokDARM_FATURAPORC.AsFloat;
    aMin.Value   := DM4.cdsStokDARM_FATURAMIN.AsFloat;
    aVlr.Value   := DM4.cdsStokDARM_AREAVALOR.AsFloat;
    aArea.Value  := DM4.cdsStokDARM_AREALIMITE.AsFloat;
    aExc.Value   := DM4.cdsStokDARM_AREAEXCEDE.AsFloat;

    //Movimentacao
    rbMov1.Checked := True;
    if (DM4.cdsStokDMOV_FLG.Value = 1) then rbMov2.Checked := true;

    mTaxa.Value  := DM4.cdsStokDMOV_FATURAPORC.AsFloat;
    mMinE.Value  := DM4.cdsStokDMOV_FATURAMIN_ENT.AsFloat;
    mMinS.Value  := DM4.cdsStokDMOV_FATURAMIN_SAI.AsFloat;

    mDivEn.Value := DM4.cdsStokDMOV_DIVERSO_ENTNORMAIL_VLR.AsFloat;
    rbDivEn.Checked := True;
    if (DM4.cdsStokDMOV_DIVERSO_ENTDEVOL_FLG.value=1) then rbDivEi.Checked := True;

    mDivEd.Value := DM4.cdsStokDMOV_DIVERSO_ENTDEVOL_VLR.AsFloat;
    rbDivEn1.Checked := True;
    if (DM4.cdsStokDMOV_DIVERSO_ENTNORMAIL_FLG.Value=1) then rbDivEi1.Checked := True;

    mDivS.Value := DM4.cdsStokDMOV_DIVERSO_SAIDA_VLR.AsFloat;
    rbDivSn.Checked := True;
    if (DM4.cdsStokDMOV_DIVERSO_SAIDA_FLAG.Value=1) then rbDivSi.Checked := True;

    // Seguro
    sTaxa.Value := DM4.cdsStokDSEG_TAXA.AsFloat;
    sMin.Value  := DM4.cdsStokDSEG_MINIMO.AsFloat;
    dtSeg.DateTime := DM4.cdsStokDSEG_DIA.AsDateTime ;



  end;

end;


procedure TStokCV.Entrar;

begin

  rbDivEn.Checked  := true;
  rbDivEn1.Checked := true;
  rbDivSn.Checked  := true;
  rbArm1.Checked   := true;
  rbMov1.Checked   := true;

  Preenche;

end;

procedure TStokCV.btSalvarClick(Sender: TObject);

var bco : TBco;
    flg_Arm, flg_mov, flg_En, flg_Ed, flg_S : Smallint;

begin
  // padrao
  flg_Arm := 0;
  flg_mov := 0;
  flg_En  := 0;
  flg_Ed  := 0;
  flg_S   := 0;

  // verifica escolhas
  if (rbArm2.Checked)   then flg_arm := 1;
  if (rbMov2.Checked)   then flg_mov := 1;
  if (rbDivEi.Checked)  then flg_En  := 1;
  if (rbDivEi1.Checked) then flg_Ed  := 1;
  if (rbDivSi.Checked)  then flg_S   := 1;

  // Grava as informações
  Bco := TBco.Create;
  // *************************** Inserir USER e espec *********
  Bco.Stok_Contrato_Altera(idCont,1, dti.DateTime, dtf.DateTime, dtSeg.DateTime,
    aTaxa.Value, aMin.Value, aVlr.Value, aExc.Value, aArea.Value,
    mTaxa.Value,mMinE.Value, mMinS.Value, mDivEn.Value, mDivEd.Value,
    mDivS.Value, sTaxa.Value, sMin.Value, Emin.Value ,flg_En, flg_Ed, flg_Arm,
    flg_Mov, flg_S );

  Bco.Destroy;
end;

procedure TStokCV.set_idCont(i: Integer);
begin
  idCont := i;
end;

end.
