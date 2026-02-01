unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask,  Buttons, JvExMask, JvToolEdit, DateUtils,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TConfig = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btSalvar: TBitBtn;
    pasta1: TJvDirectoryEdit;
    pasta2: TJvDirectoryEdit;
    pasta3: TJvDirectoryEdit;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    btAno: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    tbPags: TTabSheet;
    Label7: TLabel;
    SalAjud: TJvValidateEdit;
    btPags: TBitBtn;
    Label8: TLabel;
    dataPesq: TDateTimePicker;
    btSalvarDT: TSpeedButton;
    TabSheet3: TTabSheet;
    Label9: TLabel;
    edSMSlogin: TEdit;
    Label10: TLabel;
    edSMSSenha: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    edSMSret1: TEdit;
    edSMSret2: TEdit;
    btSalvaSMS: TBitBtn;
    Label13: TLabel;
    edREL: TEdit;
    Memo1: TMemo;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edURL: TEdit;
    dirBip: TJvDirectoryEdit;
    Label17: TLabel;
    btSailvaBip: TSpeedButton;
    Label18: TLabel;
    cbAmb: TComboBox;
    btSalvaAmb: TSpeedButton;
    btSAC: TBitBtn;
    Label19: TLabel;
    lbNumCham: TLabel;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btAnoClick(Sender: TObject);
    procedure btPagsClick(Sender: TObject);
    procedure btSalvarDTClick(Sender: TObject);
    procedure btSalvaSMSClick(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure btSailvaBipClick(Sender: TObject);
    procedure btSalvaAmbClick(Sender: TObject);
    procedure btSACClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Config: TConfig;

implementation

{$R *.dfm}

uses uLib, uBanco, uDM2, uEnviaRest, uTemp;

procedure TConfig.FormActivate(Sender: TObject);

var usa : TMarco;
    Bco : Tbco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  pasta1.Directory := usa.get_progs;
  pasta2.Directory := usa.get_listas;
  pasta3.Directory := usa.get_rels;

  usa.Destroy;

  Bco := Tbco.Create;
  SalAjud.value     := Bco.Transp_SalAjud_Mostra();
  dataPesq.DateTime := Bco.Config_DTP_MostraDT();
  Bco.Config_SMS_Mostra;
  Bco.Destroy;

  // Preenche SMS
  edSMSlogin.Text    := DM2.cdsTMP.Fields[3].Value;
  edSMSsenha.Text    := DM2.cdsTMP.Fields[4].Value;
  edSMSret1.Text     := DM2.cdsTMP.Fields[5].Value;
  edSMSret2.Text     := DM2.cdsTMP.Fields[6].Value;
  edREL.Text         := DM2.cdsTMP.Fields[7].Value;

  Memo1.Clear;
  Memo1.Lines.Append(Trim(DM2.cdsTMP.Fields[8].Value));
  Label14.Caption := IntToStr(length(DM2.cdsTMP.Fields[8].Value));
  edURL.Text         := DM2.cdsTMP.Fields[9].Value;

  dirbip.Directory   := DM2.cdsTMP.Fields[10].Value;

  cbAmb.ItemIndex := 1;
  if DM2.cdsTMP.Fields[11].Value = 1 then cbAmb.ItemIndex:=0;

  lbNumCham.Caption := DM2.cdsTMP.Fields[14].AsString;


end;

procedure TConfig.btSalvaAmbClick(Sender: TObject);
var Bco : Tbco;
    amb : Smallint;

begin
    amb:= cbAmb.ItemIndex+1;
    Bco := Tbco.Create;
    Bco.Config_AMB_Altera(amb);
    Bco.Destroy;
end;

procedure TConfig.btSalvarClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;

  usa.set_progs(pasta1.Directory);
  usa.set_listas(pasta2.Directory);
  usa.set_rels(pasta3.Directory);

  usa.Grava_INI(4);
  usa.Destroy;
end;

procedure TConfig.btSACClick(Sender: TObject);
begin
  EnviaRest.Entrar('SAC',7 );
  EnviaRest.ShowModal;

end;

procedure TConfig.BitBtn1Click(Sender: TObject);
begin
  //EnviaRest.Entrar('Dados da Nota',8 );
  //EnviaRest.ShowModal;
  Temp.Show;
  Config.Hide;

end;

procedure TConfig.btAnoClick(Sender: TObject);

var Bco : Tbco;

begin
  if (MonthOf(Now)=1) then
  begin
    Bco := Tbco.Create;
    Bco.Romaneio_AnoNovo;
    Bco.Destroy;

    ShowMessage('Nova Numeração do Romaneio INICIADA !');
  end
  else ShowMessage('Esta operação só pode ser efetuada em Janeiro');
end;

procedure TConfig.btPagsClick(Sender: TObject);

var Bco : Tbco;

begin
    Bco := Tbco.Create;
    Bco.Transp_SalAjud_Altera(SalAjud.Value);
    Bco.Destroy;
end;

procedure TConfig.btSalvarDTClick(Sender: TObject);

var Bco : Tbco;

begin
    Bco := Tbco.Create;
    Bco.Config_DTP_Altera(dataPesq.DateTime);
    Bco.Destroy;
end;

procedure TConfig.btSalvaSMSClick(Sender: TObject);
var Bco : Tbco;

begin
    Bco := Tbco.Create;
    Bco.Config_SMS_Altera(edSMSLogin.Text, edSMSSenha.Text, edSMSret1.Text, edSMSret2.Text, edREL.Text, Trim(Memo1.Lines.GetText), Trim(edURL.Text));
    Bco.Destroy;
end;


procedure TConfig.Memo1Change(Sender: TObject);
begin
  Label14.Caption := IntToStr(length(Memo1.Lines.GetText));
end;

procedure TConfig.btSailvaBipClick(Sender: TObject);
var Bco : Tbco;

begin
    Bco := Tbco.Create;
    Bco.Config_BIP_Altera(dirBip.Directory);
    Bco.Destroy;
end;

end.
