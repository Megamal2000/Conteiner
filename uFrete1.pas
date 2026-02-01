unit uFrete1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls,
  Buttons, ComCtrls;

type
  TFrete1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btSalvar: TBitBtn;
    Label22: TLabel;
    lbCli: TLabel;
    lbTipo: TLabel;
    btConfigurar: TBitBtn;
    PageControl1: TPageControl;
    tsSP: TTabSheet;
    tsGSP: TTabSheet;
    tsINT: TTabSheet;
    GroupBox13: TGroupBox;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    tINTicmsMaior: TJvValidateEdit;
    tINTicmsMenor: TJvValidateEdit;
    vINTicmsLimite: TJvValidateEdit;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    GroupBox14: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    tINTgris: TJvValidateEdit;
    vINTgrisMin: TJvValidateEdit;
    vINTgrisSup: TJvValidateEdit;
    GroupBox15: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    tINTDific: TJvValidateEdit;
    vINTDificMin: TJvValidateEdit;
    vINTDificMax: TJvValidateEdit;
    GroupBox9: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    vINTemissao: TJvValidateEdit;
    tINTdevolve: TJvValidateEdit;
    tINTreent: TJvValidateEdit;
    GroupBox10: TGroupBox;
    Label30: TLabel;
    Label49: TLabel;
    tINTadValor: TJvValidateEdit;
    vINTadValor: TJvValidateEdit;
    GroupBox16: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label50: TLabel;
    vINTponto: TJvValidateEdit;
    vINTpedagio: TJvValidateEdit;
    vINTFTminimo: TJvValidateEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    tGSPadValor: TJvValidateEdit;
    vGSPadValor: TJvValidateEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    tGSPgris: TJvValidateEdit;
    vGSPgrisMin: TJvValidateEdit;
    vGSPgrisSup: TJvValidateEdit;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    tGSPDific: TJvValidateEdit;
    vGSPDificMin: TJvValidateEdit;
    vGSPDificMax: TJvValidateEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    tGSPicmsMaior: TJvValidateEdit;
    tGSPicmsMenor: TJvValidateEdit;
    vGSPicmsLimite: TJvValidateEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    vGSPponto: TJvValidateEdit;
    vGSPpedagio: TJvValidateEdit;
    vGSPFTminimo: TJvValidateEdit;
    GroupBox6: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    vGSPemissao: TJvValidateEdit;
    tGSPdevolve: TJvValidateEdit;
    tGSPreent: TJvValidateEdit;
    GroupBox7: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    tSPadValor: TJvValidateEdit;
    vSPadValor: TJvValidateEdit;
    GroupBox8: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    tSPGris: TJvValidateEdit;
    vSPgrisMin: TJvValidateEdit;
    vSPgrisSup: TJvValidateEdit;
    GroupBox11: TGroupBox;
    Label24: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    tSPDific: TJvValidateEdit;
    vSPDificMin: TJvValidateEdit;
    vSPDificMax: TJvValidateEdit;
    GroupBox12: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    tSPicmsMaior: TJvValidateEdit;
    tSPicmsMenor: TJvValidateEdit;
    vSPicmsLimite: TJvValidateEdit;
    GroupBox17: TGroupBox;
    Label36: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    vSPponto: TJvValidateEdit;
    vSPpedagio: TJvValidateEdit;
    vSPFTminimo: TJvValidateEdit;
    GroupBox18: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    vSPemissao: TJvValidateEdit;
    tSPdevolve: TJvValidateEdit;
    tSPreent: TJvValidateEdit;
    tsINT2: TTabSheet;
    tsOEST: TTabSheet;
    tsOUT: TTabSheet;
    Label56: TLabel;
    GroupBox19: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    tINT2adValor: TJvValidateEdit;
    vINT2adValor: TJvValidateEdit;
    GroupBox20: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    tINT2gris: TJvValidateEdit;
    vINT2grisMin: TJvValidateEdit;
    vINT2grisSup: TJvValidateEdit;
    GroupBox21: TGroupBox;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    tINT2Dific: TJvValidateEdit;
    vINT2DificMin: TJvValidateEdit;
    vINT2DificMax: TJvValidateEdit;
    GroupBox22: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    vINT2emissao: TJvValidateEdit;
    tINT2devolve: TJvValidateEdit;
    tINT2reent: TJvValidateEdit;
    GroupBox23: TGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    vINT2ponto: TJvValidateEdit;
    vINT2pedagio: TJvValidateEdit;
    vINT2FTminimo: TJvValidateEdit;
    GroupBox24: TGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    tINT2icmsMaior: TJvValidateEdit;
    tINT2icmsMenor: TJvValidateEdit;
    vINT2icmsLimite: TJvValidateEdit;
    Label74: TLabel;
    GroupBox25: TGroupBox;
    Label75: TLabel;
    Label76: TLabel;
    tOESTadValor: TJvValidateEdit;
    vOESTadValor: TJvValidateEdit;
    GroupBox26: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    tOESTgris: TJvValidateEdit;
    vOESTgrisMin: TJvValidateEdit;
    vOESTgrisSup: TJvValidateEdit;
    GroupBox27: TGroupBox;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    tOESTDific: TJvValidateEdit;
    vOESTDificMin: TJvValidateEdit;
    vOESTDificMax: TJvValidateEdit;
    GroupBox28: TGroupBox;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    vOESTemissao: TJvValidateEdit;
    tOESTdevolve: TJvValidateEdit;
    tOESTreent: TJvValidateEdit;
    GroupBox29: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    vOESTponto: TJvValidateEdit;
    vOESTpedagio: TJvValidateEdit;
    vOESTFTminimo: TJvValidateEdit;
    GroupBox30: TGroupBox;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    tOESTicmsMaior: TJvValidateEdit;
    tOESTicmsMenor: TJvValidateEdit;
    vOESTicmsLimite: TJvValidateEdit;
    Label92: TLabel;
    GroupBox31: TGroupBox;
    Label93: TLabel;
    Label94: TLabel;
    tOUTadValor: TJvValidateEdit;
    vOUTadValor: TJvValidateEdit;
    GroupBox32: TGroupBox;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    tOUTgris: TJvValidateEdit;
    vOUTgrisMin: TJvValidateEdit;
    vOUTgrisSup: TJvValidateEdit;
    GroupBox33: TGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    tOUTDific: TJvValidateEdit;
    vOUTDificMin: TJvValidateEdit;
    vOUTDificMax: TJvValidateEdit;
    GroupBox34: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    vOUTemissao: TJvValidateEdit;
    tOUTdevolve: TJvValidateEdit;
    tOUTreent: TJvValidateEdit;
    GroupBox35: TGroupBox;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    vOUTponto: TJvValidateEdit;
    vOUTpedagio: TJvValidateEdit;
    vOUTFTminimo: TJvValidateEdit;
    GroupBox36: TGroupBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    tOUTicmsMaior: TJvValidateEdit;
    tOUTicmsMenor: TJvValidateEdit;
    vOUTicmsLimite: TJvValidateEdit;
    Label110: TLabel;
    vSPrisco: TJvValidateEdit;
    Label111: TLabel;
    vGSPrisco: TJvValidateEdit;
    Label112: TLabel;
    Label113: TLabel;
    vSPriscoAD: TJvValidateEdit;
    vGSPriscoAD: TJvValidateEdit;
    Label114: TLabel;
    Label115: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btConfigurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_tipo(i : Smallint);
    procedure set_idCli(i : integer);
  end;

var
  Frete1: TFrete1;
  idCli : integer;
  tipo  : Smallint;

implementation

{$R *.dfm}

uses uDM1, uBanco, uFTPeso, uFTEnt, uFTSaida, uFTcont, uFTtaxa;

procedure Preencher();

var Bco : TBco;

begin

  with Frete1 do
  begin
    Bco := TBco.Create;
    // Capital
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 0)) then
    begin
      tSPadValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vSPadValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tSPGris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vSPgrisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vSPgrisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tSPDific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vSPDificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vSPDificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tSPicmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tSPicmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vSPicmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vSPponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vSPpedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vSPFTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vSPemissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tSPdevolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tSPreent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

      vSPrisco.Value      := DM1.cdsFAdVRISCO.AsFloat;
      vSPriscoAD.Value    := DM1.cdsFAdVRISCOAD.AsFloat;


    end;

    // Grande SP
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 1)) then
    begin
      tGSPadValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vGSPadValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tGSPGris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vGSPgrisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vGSPgrisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tGSPDific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vGSPDificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vGSPDificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tGSPicmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tGSPicmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vGSPicmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vGSPponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vGSPpedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vGSPFTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vGSPemissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tGSPdevolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tGSPreent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

      vGSPrisco.Value      := DM1.cdsFAdVRISCO.AsFloat;
      vGSPriscoAD.Value    := DM1.cdsFAdVRISCOAD.AsFloat;

    end;

    // Interior
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 2)) then
    begin
      tINTadValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vINTadValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tINTGris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vINTgrisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vINTgrisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tINTDific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vINTDificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vINTDificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tINTicmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tINTicmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vINTicmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vINTponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vINTpedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vINTFTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vINTemissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tINTdevolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tINTreent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

    end;

    // Interior 2 _______________________
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 3)) then
    begin
      tINT2adValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vINT2adValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tINT2Gris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vINT2grisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vINT2grisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tINT2Dific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vINT2DificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vINT2DificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tINT2icmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tINT2icmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vINT2icmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vINT2ponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vINT2pedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vINT2FTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vINT2emissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tINT2devolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tINT2reent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

    end;

    // Outros Estados _______________________
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 4)) then
    begin
      tOESTadValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vOESTadValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tOESTGris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vOESTgrisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vOESTgrisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tOESTDific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vOESTDificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vOESTDificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tOESTicmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tOESTicmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vOESTicmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vOESTponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vOESTpedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vOESTFTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vOESTemissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tOESTdevolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tOESTreent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

    end;

    // Outros _______________________
    if (Bco.Frete_CadAdic_Procura(idCli, tipo, 5)) then
    begin
      tOUTadValor.Value    := DM1.cdsFAdADVAL.AsFloat;
      vOUTadValor.Value    := DM1.cdsFAdADVAL_MIN.AsFloat;

      tOUTGris.Value       := DM1.cdsFAdGRIS.AsFloat;
      vOUTgrisMin.Value    := DM1.cdsFAdGRIS_MIN.AsFloat;
      vOUTgrisSup.Value    := DM1.cdsFAdGRIS_SUP.AsFloat;

      tOUTDific.Value     := DM1.cdsFAdDIF_TAXA.AsFloat;
      vOUTDificMin.Value  := DM1.cdsFAdDIF_MIN.AsFloat;
      vOUTDificMax.Value  := DM1.cdsFAdDIF_MAX.AsFloat;

      tOUTicmsMaior.Value  := DM1.cdsFAdICMS_MAIOR.AsFloat;
      tOUTicmsMenor.Value  := DM1.cdsFAdICMS_MENOR.AsFloat;
      vOUTicmsLimite.Value := DM1.cdsFAdICMS_LIMITE.AsFloat;

      vOUTponto.Value      := DM1.cdsFAdPONTO.AsFloat;
      vOUTpedagio.Value    := DM1.cdsFAdPEDAGIO.AsFloat;
      vOUTFTminimo.Value   := DM1.cdsFAdFRETE_MIN.AsFloat;

      vOUTemissao.Value    := DM1.cdsFAdEMISSAO.AsFloat;
      tOUTdevolve.Value    := DM1.cdsFAdDEVOLUCAO.AsFloat;
      tOUTreent.Value      := DM1.cdsFAdREENTREGA.AsFloat;

    end;


    Bco.Destroy;
  end;
end;


procedure Entrar();
begin
  if (tipo = 1) then Frete1.lbTipo.Caption := 'Frete Peso';
  if (tipo = 2) then Frete1.lbTipo.Caption := 'Taxa %';
  if (tipo = 3) then Frete1.lbTipo.Caption := 'Entregas';
  if (tipo = 4) then Frete1.lbTipo.Caption := 'Saída';
  if (tipo = 5) then Frete1.lbTipo.Caption := 'Contrato';
end;

procedure Limpar();

var i : Integer;

begin
  with Frete1 do
  for i := 0 to (ComponentCount-1) do
    if Components[i] is TJvValidateEdit then
      TJvValidateEdit(Components[i]).Value := 0;
end;


procedure TFrete1.set_idCli(i: integer);
begin
  idCli := i;
end;

procedure TFrete1.set_tipo(i: Smallint);
begin
  tipo := i;
end;

procedure TFrete1.FormActivate(Sender: TObject);
begin
  Limpar;
  Entrar;
  Preencher;
end;

procedure TFrete1.btSalvarClick(Sender: TObject);

var Bco : TBco;
begin
  Bco := TBco.Create;
  // Capital
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 0)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 0, tSPadValor.Value , vSPadValor.Value,
    tSPGris.Value, vSPgrisMin.Value, vSPgrisSup.Value, tSPDific.Value, vSPDificMin.Value, vSPDificMax.Value,
    tSPicmsMaior.Value, tSPicmsMenor.Value, vSPicmsLimite.Value, vSPponto.Value,
    vSPpedagio.Value, vSPFTminimo.Value, vSPemissao.Value, tSPdevolve.Value, tSPreent.Value, vSPrisco.Value,
    vSPriscoAD.Value)
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 0, tSPadValor.Value , vSPadValor.Value,
    tSPGris.Value, vSPgrisMin.Value, vSPgrisSup.Value, tSPDific.Value, vSPDificMin.Value, vSPDificMax.Value,
    tSPicmsMaior.Value, tSPicmsMenor.Value, vSPicmsLimite.Value, vSPponto.Value,
    vSPpedagio.Value, vSPFTminimo.Value, vSPemissao.Value, tSPdevolve.Value, tSPreent.Value, vSPrisco.Value,
    vSPriscoAD.Value );

  // Grande SP
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 1)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 1, tGSPadValor.Value , vGSPadValor.Value,
    tGSPGris.Value, vGSPgrisMin.Value, vGSPgrisSup.Value, tGSPDific.Value, vGSPDificMin.Value, vGSPDificMax.Value,
    tGSPicmsMaior.Value, tGSPicmsMenor.Value, vGSPicmsLimite.Value, vGSPponto.Value,
    vGSPpedagio.Value, vGSPFTminimo.Value, vGSPemissao.Value, tGSPdevolve.Value, tGSPreent.Value, vGSPrisco.Value,
    vGSPriscoAD.Value )
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 1, tGSPadValor.Value , vGSPadValor.Value,
    tGSPGris.Value, vGSPgrisMin.Value, vGSPgrisSup.Value, tGSPDific.Value, vGSPDificMin.Value, vGSPDificMax.Value,
    tGSPicmsMaior.Value, tGSPicmsMenor.Value, vGSPicmsLimite.Value, vGSPponto.Value,
    vGSPpedagio.Value, vGSPFTminimo.Value, vGSPemissao.Value, tGSPdevolve.Value, tGSPreent.Value, vGSPrisco.Value,
    vGSPriscoAD.Value );

  // Interior
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 2)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 2, tINTadValor.Value , vINTadValor.Value,
    tINTGris.Value, vINTgrisMin.Value, vINTgrisSup.Value, tINTDific.Value, vINTDificMin.Value, vINTDificMax.Value,
    tINTicmsMaior.Value, tINTicmsMenor.Value, vINTicmsLimite.Value, vINTponto.Value,
    vINTpedagio.Value, vINTFTminimo.Value, vINTemissao.Value, tINTdevolve.Value, tINTreent.Value, 0, 0 )
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 2, tINTadValor.Value , vINTadValor.Value,
    tINTGris.Value, vINTgrisMin.Value, vINTgrisSup.Value, tINTDific.Value, vINTDificMin.Value, vINTDificMax.Value,
    tINTicmsMaior.Value, tINTicmsMenor.Value, vINTicmsLimite.Value, vINTponto.Value,
    vINTpedagio.Value, vINTFTminimo.Value, vINTemissao.Value, tINTdevolve.Value, tINTreent.Value, 0, 0 );

  // Interior 2
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 3)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 3, tINT2adValor.Value , vINT2adValor.Value,
    tINT2Gris.Value, vINT2grisMin.Value, vINT2grisSup.Value, tINT2Dific.Value, vINT2DificMin.Value, vINT2DificMax.Value,
    tINT2icmsMaior.Value, tINT2icmsMenor.Value, vINT2icmsLimite.Value, vINT2ponto.Value,
    vINT2pedagio.Value, vINT2FTminimo.Value, vINT2emissao.Value, tINT2devolve.Value, tINT2reent.Value, 0, 0)
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 3, tINT2adValor.Value , vINT2adValor.Value,
    tINT2Gris.Value, vINT2grisMin.Value, vINT2grisSup.Value, tINT2Dific.Value, vINT2DificMin.Value, vINT2DificMax.Value,
    tINT2icmsMaior.Value, tINT2icmsMenor.Value, vINT2icmsLimite.Value, vINT2ponto.Value,
    vINT2pedagio.Value, vINT2FTminimo.Value, vINT2emissao.Value, tINT2devolve.Value, tINT2reent.Value, 0, 0 );

  // Outros Estados
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 4)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 4, tOESTadValor.Value , vOESTadValor.Value,
    tOESTGris.Value, vOESTgrisMin.Value, vOESTgrisSup.Value, tOESTDific.Value, vOESTDificMin.Value, vOESTDificMax.Value,
    tOESTicmsMaior.Value, tOESTicmsMenor.Value, vOESTicmsLimite.Value, vOESTponto.Value,
    vOESTpedagio.Value, vOESTFTminimo.Value, vOESTemissao.Value, tOESTdevolve.Value, tOESTreent.Value, 0, 0)
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 4, tOESTadValor.Value , vOESTadValor.Value,
    tOESTGris.Value, vOESTgrisMin.Value, vOESTgrisSup.Value, tOESTDific.Value, vOESTDificMin.Value, vOESTDificMax.Value,
    tOESTicmsMaior.Value, tOESTicmsMenor.Value, vOESTicmsLimite.Value, vOESTponto.Value,
    vOESTpedagio.Value, vOESTFTminimo.Value, vOESTemissao.Value, tOESTdevolve.Value, tOESTreent.Value, 0, 0 );

  // Outros
  if (Bco.Frete_CadAdic_Procura(idCli, tipo, 5)) then
    Bco.Frete_CadAdic_Altera(idCli, tipo, 5, tOUTadValor.Value , vOUTadValor.Value,
    tOUTGris.Value, vOUTgrisMin.Value, vOUTgrisSup.Value, tOUTDific.Value, vOUTDificMin.Value, vOUTDificMax.Value,
    tOUTicmsMaior.Value, tOUTicmsMenor.Value, vOUTicmsLimite.Value, vOUTponto.Value,
    vOUTpedagio.Value, vOUTFTminimo.Value, vOUTemissao.Value, tOUTdevolve.Value, tOUTreent.Value, 0, 0)
  else
    Bco.Frete_CadAdic_Insere(idCli, tipo, 5, tOUTadValor.Value , vOUTadValor.Value,
    tOUTGris.Value, vOUTgrisMin.Value, vOUTgrisSup.Value, tOUTDific.Value, vOUTDificMin.Value, vOUTDificMax.Value,
    tOUTicmsMaior.Value, tOUTicmsMenor.Value, vOUTicmsLimite.Value, vOUTponto.Value,
    vOUTpedagio.Value, vOUTFTminimo.Value, vOUTemissao.Value, tOUTdevolve.Value, tOUTreent.Value, 0, 0 );

  Bco.Destroy;

end;

procedure TFrete1.btConfigurarClick(Sender: TObject);
begin
  if (tipo = 1) then
  begin
    FTPeso.lbCli.Caption := lbCli.Caption;
    FTPeso.set_idCli(idCli);
    FTPeso.Show;
  end;

  if (tipo = 2) then
  begin
    FTtaxa.lbCli.Caption := lbCli.Caption;
    FTtaxa.set_idCli(idCli);
    FTtaxa.Show;
  end;

  if (tipo = 3) then
  begin
    FTEnt.lbCli.Caption := lbCli.Caption;
    FTEnt.set_idCli(idCli);
    FTEnt.Show;
  end;

  if (tipo = 4) then
  begin
    FTSaida.lbCli.Caption := lbCli.Caption;
    FTSaida.set_idCli(idCli);
    FTSaida.Show;
  end;

  if (tipo = 5) then
  begin
    FTcont.lbCli.Caption := lbCli.Caption;
    FTcont.set_idCli(idCli);
    FTcont.Show;
  end;
end;

end.
