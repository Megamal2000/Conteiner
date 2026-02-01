unit uCtePad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvExMask, JvToolEdit, JvExStdCtrls, JvEdit, JvValidateEdit,
  Buttons, StdCtrls, Mask, ComCtrls, ExtCtrls, uBanco;

type
  TCTePad = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbTransp: TComboBox;
    Label2: TLabel;
    lbULT: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    StatusBar1: TStatusBar;
    TabSheet3: TTabSheet;
    Label3: TLabel;
    edRazaoS: TEdit;
    Label4: TLabel;
    edFantasia: TEdit;
    Label5: TLabel;
    edTels: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    edCNPJ: TMaskEdit;
    edIE: TEdit;
    edRNTRC: TEdit;
    Label8: TLabel;
    btSalva1: TBitBtn;
    Label12: TLabel;
    edCEP: TEdit;
    procCEP: TSpeedButton;
    edEnder: TEdit;
    Label9: TLabel;
    Label19: TLabel;
    edNum: TJvValidateEdit;
    Label21: TLabel;
    edComp: TEdit;
    Label10: TLabel;
    edBairro: TEdit;
    Label11: TLabel;
    edCidade: TEdit;
    Label13: TLabel;
    cbUF: TComboBox;
    Label14: TLabel;
    cbICMS: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    edXML: TJvDirectoryEdit;
    edPDF: TJvDirectoryEdit;
    Label17: TLabel;
    edPredom: TEdit;
    Label18: TLabel;
    cbUnid: TComboBox;
    Label20: TLabel;
    edMedida: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbAmb: TComboBox;
    Label22: TLabel;
    Label34: TLabel;
    edCmun: TJvValidateEdit;
    btCodM: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edMot: TEdit;
    EdVeic: TEdit;
    edPLaca: TEdit;
    procedure btSalva1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure cbTranspChange(Sender: TObject);
    procedure procCEPClick(Sender: TObject);
    procedure btCodMClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CTePad: TCTePad;
  Bco : TBco;
  idTransp : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM4, uLib, uIBGE;

procedure Limpar();

begin
  with CtePad do
  begin
    edRazaoS.Text := '';
    edFantasia.Text := '';
    edTels.Text := '(__) _____-_____';
    edCNPJ.Text := '__.___.___/____-__';
    edIE.Text := '';
    edRNTRC.Text := '';

    edCEP.Text := '';
    edEnder.Text := '';
    edNum.Value := 0;
    edComp.Text := '';
    edBairro.Text := '';
    edCidade.Text := '';
    cbUF.ItemIndex := 23;

    cbICMS.ItemIndex := 0;
    edXML.Text := '';
    edPDF.Text := '';
    edPredom.Text := '';
    cbUnid.ItemIndex := 3;
    edMedida.Text := '';
    cbAmb.ItemIndex := 0;
  end;
end;

procedure Mostrar();

var usa : TMarco;
    imp : Integer;

begin
  if (idTransp>0) then
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_Mostra(idTransp);
    Bco.Destroy;

  with CtePad do
  begin
    edRazaoS.Text   := DM4.cdsCtePRAZAOS.Value;
    edFantasia.Text := DM4.cdsCtePFANTASIA.Value;
    edTels.Text     := DM4.cdsCtePTELS.Value;
    edCNPJ.Text     := DM4.cdsCtePCNPJ.Value;
    edIE.Text       := DM4.cdsCtePIE.Value;
    edRNTRC.Text    := DM4.cdsCtePRNTRC.Value;

    edCEP.Text      := DM4.cdsCtePeCEP.Value;
    edEnder.Text    := DM4.cdsCtePeENDER.Value;
    edNum.Value     := DM4.cdsCtePeNUMERO.Value;
    edComp.Text     := DM4.cdsCtePeCOMPLEMENTO.Value;
    edBairro.Text   := DM4.cdsCtePeBAIRRO.Value;
    edCidade.Text   := DM4.cdsCtePeCIDADE.Value;
    usa := TMarco.Create;
    usa.Combo_Pos(cbUF, DM4.cdsCtePeESTADO.Value);
    usa.Destroy;
    if (DM4.cdsCtePeCodMUN.Value<> null) then
      edCMun.Value := DM4.cdsCtePeCodMUN.AsInteger;


    edXML.Text      := DM4.cdsCtePPASTAXML.Value;
    edPDF.Text      := DM4.cdsCtePPASTAPDF.Value;
    edPredom.Text   := DM4.cdsCtePPREDOM.Value;
    usa := TMarco.Create;
    usa.Combo_Pos(cbUnid, DM4.cdsCtePMEDIDAUNID.Value);
    usa.Destroy;
    edMedida.Text   := DM4.cdsCtePMEDIDATIPO.Value;

    cbAmb.ItemIndex := DM4.cdsCtePAMBIENTE.Value;

    imp := 0;
    if (DM4.cdsCtePIMPOSTO.Value <> Null) then
    begin
      Case DM4.cdsCtePIMPOSTO.Value of
        0  : imp := 0;
        20 : imp := 1;
        40 : imp := 2;
        41 : imp := 3;
        51 : imp := 4;
        60 : imp := 5;
        90 : imp := 6;
        99 : imp := 8;
      end;
    end;
    cbICMS.ItemIndex := imp;

    // Motorista Padrão
    edMot.Text  := DM4.cdsCTePPMOTNOME.Value;
    edVeic.Text := DM4.cdsCTePPMOTVEICULO.Value;
    edPlaca.Text:= DM4.cdsCTePPMOTPLACA.Value;

  end;

  end;

end;

procedure TCTePad.btSalva1Click(Sender: TObject);

var s1rs, s2fa, s3te, s4cn, s5ie, s6rn : String;

begin
  // Entrada
  s1rs := edRazaoS.Text;
  s2fa := edFantasia.Text;
  s3te := edTels.Text;
  s4cn := edCNPJ.Text;
  s5ie := edIE.Text;
  s6rn := edRNTRC.Text;

  if (idTransp>0) then
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_EmitAlterar(idTransp, s1rs, s2fa, s3te, s4cn, s5ie, s6rn);
    Bco.Destroy;
  end;
end;

procedure TCTePad.BitBtn1Click(Sender: TObject);

var r1ce, r2en, r3co, r4ba, r5ci, r6uf, r7mu : String;
    num : Integer;

begin
  r1ce := edCEP.Text;
  r2en := edEnder.Text;
  r3co := edComp.Text;
  r4ba := edBairro.Text;
  r5ci := edCidade.Text;
  r6uf := cbUF.Items[cbuf.itemindex];
  r7mu := IntToStr(edCmun.Value);

  num  := edNum.Value;

  if (idTransp>0) then
  if (DM4.cdsCtePe.RecordCount >0) then
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_EnderAlterar(idTransp, idTransp, num, r1ce, r2en, r3co, r4ba, r5ci, r6uf, r7mu);
    Bco.Destroy;
  end
  else
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_EnderInserir( idTransp, num, r1ce, r2en, r3co, r4ba, r5ci, r6uf, r7mu);
    Bco.Destroy;
  end;

end;

procedure TCTePad.BitBtn2Click(Sender: TObject);

var t1xm, t2pd, t3pr, t4co, t5me, motN, motV, motP : String;
    Imposto, Ambiente : Integer;

begin
  t1xm := edXML.Text;
  t2pd := edPDF.Text;
  t3pr := edPredom.Text;
  t4co := cbUnid.Items[cbUnid.Itemindex];
  t5me := edMedida.Text;

  // Motorista Padrão
  motN := edMot.Text;
  motV := edVeic.Text;
  motP := edPlaca.Text;

  Imposto := StrToInt(copy(cbICMS.Items[cbICMS.Itemindex],1,2));
  Ambiente := cbAmb.ItemIndex;

  if (idTransp>0) then
  begin
    Bco := TBco.Create;
    Bco.CTe_Padrao_EmitAlterar2(idTransp, t1xm, t2pd, t3pr, t4co, t5me, motN, motV, motP, Ambiente, Imposto);
    Bco.Destroy;
  end;


end;

procedure TCTePad.Entrar;

var usa : Tmarco;

begin
  // UFs
  if not (cbUF.Items.Count > 0) then
  begin
    usa := TMarco.Create;
    cbUF.Clear;
    usa.Combo_Preenche(cbUF, 'mluf.mzi');
    usa.Destroy;
  end;

  // Transportadoras
  cbTransp.Clear;
  DM2.DBCb_Preenche(cbTransp, 'TB_TRANSP', 'RAZAOS', '');
  cbTransp.ItemIndex := 0;
  Limpar;
  idTransp := 1;
  Mostrar;

end;

procedure TCTePad.cbTranspChange(Sender: TObject);

begin
  idTransp := DM2.DBCp_leid(cbTransp.Items[cbTransp.Itemindex], 'TB_TRANSP', 'RAZAOS');
  Mostrar;
end;

procedure Pesquisa_CEP;

var bco : Tbco;
    usa : TMarco;

begin
  bco := TBco.Create;
  bco.CEP_Procura(CtePad.edCEP.Text);
  usa := TMarco.Create;

  if (DM1.cdsCEP.RecordCount > 0) then
  begin
    with CtePad do
    begin
      edEnder.Text     := DM1.cdsCEPTIPO.Value + ' '+ DM1.cdsCEPLOGRADOURO.Value;
      edBairro.Text    := DM1.cdsCEPBAIRRO.Value;
      edCidade.Text    := DM1.cdsCEPLOCALIDADE.Value;
      usa.Combo_Pos(cbUF, DM1.cdsCEPUF.Value);
      if (edNum.Value = 0) then edNum.SetFocus
        else cbUF.SetFocus;
    end;
  end
  else
  CtePad.edEnder.SetFocus;

  bco.Destroy;

end;

procedure TCTePad.procCEPClick(Sender: TObject);
begin
  Pesquisa_CEP;
end;

procedure TCTePad.btCodMClick(Sender: TObject);

var cid, uf : String;

begin
  cid := edCidade.Text;
  uf  := cbUF.Items[cbUF.ItemIndex];

  IBGE.set_cid(cid);
  IBGE.set_uf(uf);
  IBGE.set_saida(2);
  IBGE.PesquisaFORA;
end;

end.
