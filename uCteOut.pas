unit uCteOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvExStdCtrls, JvEdit,
  JvValidateEdit;

type
  TCteOut = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbNF: TLabel;
    lbCli: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Bevel2: TBevel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel3: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Bevel4: TBevel;
    Label16: TLabel;
    Bevel5: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    lbTot1: TLabel;
    Label29: TLabel;
    JvValidateEdit1: TJvValidateEdit;
    JvValidateEdit2: TJvValidateEdit;
    JvValidateEdit3: TJvValidateEdit;
    JvValidateEdit4: TJvValidateEdit;
    JvValidateEdit5: TJvValidateEdit;
    JvValidateEdit6: TJvValidateEdit;
    JvValidateEdit7: TJvValidateEdit;
    JvValidateEdit8: TJvValidateEdit;
    JvValidateEdit9: TJvValidateEdit;
    JvValidateEdit10: TJvValidateEdit;
    JvValidateEdit11: TJvValidateEdit;
    JvValidateEdit12: TJvValidateEdit;
    Label30: TLabel;
    Label31: TLabel;
    JvValidateEdit13: TJvValidateEdit;
    Label32: TLabel;
    btSalvar: TBitBtn;
    lbTot2: TLabel;
    LbPonto: TLabel;
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idNF(i : Integer);
  end;

var
  CteOut: TCteOut;
  idCli, idNF: Integer;
  AltSIM : Boolean;
  vlr : Array[1..13] of Double;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDM4, DB, uNegocio;


procedure Zera_Calculados();

Var i : Integer;
begin
  with CteOut do
  for i := 0 to ComponentCount -1 do
  if Components[i] is TLabel then
    if TLabel(Components[i]).tag = 1 then
      TLabel(Components[i]).Caption := '0';

end;

procedure Zera_Alterados();

Var i : Integer;

begin
  with CteOut do
  for i := 0 to ComponentCount -1 do
  if Components[i] is TJvValidateEdit then
    if TJvValidateEdit(Components[i]).tag = 2 then
      TJvValidateEdit(Components[i]).Value := 0;
end;


procedure Coloridos();

Var i : Integer;

begin
  AltSIM := False;
  with CteOut do
  for i := 0 to ComponentCount -1 do
  if Components[i] is TJvValidateEdit then
    if TJvValidateEdit(Components[i]).Value > 0 then
    begin
      TJvValidateEdit(Components[i]).Font.Color := clRed;
      AltSIM := True;
    end;
end;

procedure Preenche();

begin
  with CteOut do
  begin
    JvValidateEdit1.Value  := DM4.cdsNFaltAFRETEPESO.AsFloat;
    JvValidateEdit2.Value  := DM4.cdsNFaltAADIC.AsFloat;
    JvValidateEdit3.Value  := DM4.cdsNFaltAADVALOR.AsFloat;
    JvValidateEdit4.Value  := DM4.cdsNFaltAGRIS.AsFloat;
    JvValidateEdit5.Value  := DM4.cdsNFaltAPEDAGIO.AsFloat;
    JvValidateEdit6.Value  := DM4.cdsNFaltAEMISSAO.AsFloat;
    JvValidateEdit7.Value  := DM4.cdsNFaltATDE.AsFloat;
    JvValidateEdit8.Value  := DM4.cdsNFaltAVPONTOS.AsFloat;
    JvValidateEdit9.Value  := DM4.cdsNFaltAREENT.AsFloat;
    JvValidateEdit10.Value := DM4.cdsNFaltADEVOL.AsFloat;
    JvValidateEdit11.Value := DM4.cdsNFaltAOUTROS.AsFloat;
    JvValidateEdit12.Value := DM4.cdsNFaltATXICMS.AsFloat;
    JvValidateEdit13.Value := DM4.cdsNFaltAQTPONTOS.AsFloat;
  end;
end;


procedure TCteOut.set_idNF(i: Integer);

var Bco : TBco;
    tipoLocal, faixa, qtNF, serv : Integer;
    Neg : TNeg;

begin
  idNF := i;

  Bco := TBco.Create;
  Bco.Notas_MostraId(idNF);
  Bco.Notas_Alt_MostraNF(idNF);
  Bco.Destroy;

  lbNF.Caption := DM1.cdsNotasNUMNF.AsString;

  // Preenche os valores alternativos
  Zera_Calculados;
  Zera_Alterados;
  if (DM4.cdsNFalt.RecordCount > 0) then
  begin
    Preenche();
    Coloridos();
  end;

  // Valores Utilizados (Entrada)
  idCli     := DM1.cdsNotasLIGCLI.Value;
  tipoLocal := DM1.cdsNotasTIPOLOCAL.Value;
  faixa     := 1;
  qtNF      := 1;

  // Calcula
  Neg := TNeg.Create;

  {
  Case DM1.cdsNotasTIPO_COB.Value of
  1 : Neg.Calcula_Frete_Peso(idCli, DM1.cdsNotasPESO.Value, tipoLocal);
  2 : Neg.Calcula_Frete_Taxa(idCli,tipoLocal,DM1.cdsNotasVALOR.AsFloat);
  3 : Neg.Calcula_Frete_Entrega(idCli, tipoLocal);
  4 : Neg.Calcula_Frete_Saida(idCli,faixa,tipoLocal,qtNF);
  end;
  }

  serv := 1; // peso
  Neg.Calcula_Frete_Peso(idCli, DM1.cdsNotasPESO.AsFloat, tipoLocal, DM1.cdsNotasCEP.Value);

  Neg.Calcula_Frete_NF(serv);
  Neg.Adicional_AlteraValor(idNF, DM1.cdsNotasLIGCLI.Value, tipoLocal, DM1.cdsNotasPONTO.Value,serv,DM1.cdsNotasVALOR.AsFloat, DM1.cdsRomaRPESO.AsFloat);

  // Passa os Valores (Saída)
  //Label17.Caption := FormatFloat('#,##0.00', Neg.get_freteNF);
  //Label18.Caption := FormatFloat('#,##0.00', Neg.get_B_freteValor);
  Label17.Caption := FormatFloat('#,##0.00', Neg.get_A_fretePeso);
  Label18.Caption := FormatFloat('#,##0.00', Neg.get_K_fretePesoAdic);

  Label19.Caption := FormatFloat('#,##0.00', Neg.get_01AdValor);
  Label20.Caption := FormatFloat('#,##0.00', Neg.get_03Gris);
  Label21.Caption := FormatFloat('#,##0.00', Neg.get_02Pedagio);
  Label22.Caption := FormatFloat('#,##0.00', Neg.get_07emissao);
  Label23.Caption := FormatFloat('#,##0.00', Neg.get_04GrauD);
  Label24.Caption := FormatFloat('#,##0.00', Neg.get_06Ponto  );
  Label25.Caption := FormatFloat('#,##0.00', Neg.get_09reentrega);
  Label26.Caption := FormatFloat('#,##0.00', Neg.get_08devolucao);
  Label27.Caption := FormatFloat('#,##0.00', Neg.get_10outros);
  LbTot1.Caption  := FormatFloat('#,##0.00', Neg.get_SubTotal2);
  Label29.Caption := FormatFloat('#,##0.00', Neg.get_05ICMS);
  LbTot2.Caption  := FormatFloat('#,##0.00', Neg.get_freteTot);
  LbPonto.Caption := DM1.cdsNotasPONTO.AsString;

  Neg.Destroy;
end;

procedure Valores();

Var i, j : Integer;

begin
  j := 0;
  with CteOut do
  for i := 0 to ComponentCount -1 do
  if Components[i] is TJvValidateEdit then
    if TJvValidateEdit(Components[i]).tag = 2 then
    begin
      j := j + 1;
      vlr[j] := TJvValidateEdit(Components[i]).Value;
    end;
end;

procedure TCteOut.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Valores();

  Bco := TBco.Create;
  Bco.Notas_Alt_MostraNF(idNF);

  // Salva no Altera
  if (DM4.cdsNFalt.RecordCount > 0) then
  begin
    Bco.Notas_Alt_Altera(idNF, vlr[1],vlr[2],vlr[3],vlr[4],vlr[5],vlr[6],
    vlr[7],vlr[13],vlr[8],vlr[9],vlr[10],vlr[11],vlr[12]);
  end
  else
  begin
    Bco.Notas_Alt_Insere(idNF, vlr[1],vlr[2],vlr[3],vlr[4],vlr[5],vlr[6],
    vlr[7],vlr[13],vlr[8],vlr[9],vlr[10],vlr[11],vlr[12]);
  end;

  Bco.Destroy;
  set_idNF(idNF);
end;

end.
