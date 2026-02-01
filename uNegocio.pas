unit uNegocio;

interface

uses
  uDM1, uDM3, uDM4, uDM5, uBanco, Math, System.SysUtils;

type
  TNeg = class(TObject)

  private
     Frete_NF, Frete_Total : double;
     Frete_Ent, Frete_Peso, Frete_PesoAdic,
     Frete_Saida, Frete_Taxa, Frete_Combinado, Frete_Fixo : double;
     AdValor, Pedagio, Gris : double;
     SubTotal, SubTotal2 : double;
     GrauD, Aliq, ICMS, Ponto, Devol, Reent, Emissao, Outros : Double;
     conhec_outros, conhec_total, conhec_base, conhec_aliq, conhec_sec: Double;
     ultCli : Integer;

  protected

  public
    {Calculos FRETES}
    procedure Calcula_Frete_NF(tipo : smallint);
    procedure Calcula_Frete_Entrega(idCli, loc : integer);
    procedure Calcula_Frete_Peso(idCli : Integer; peso : double; loc:smallint; CEP:String);
    procedure Calcula_Frete_Saida(idCli, faixa, loc, qtNF : Integer);
    procedure Calcula_Frete_Taxa(idCli, loc:integer; ValorNF:Double);
    procedure Calcula_Frete_Combinado(qtNotas : Integer; vFrete : Double);
    procedure Calcula_Frete_Fixo(vTOTFrete, vNota, Peso : Double);

    { Adicionais }
    procedure Adicional_Calculos(idCli:Integer;serv : smallint);
    procedure Adicional_AlteraValor(idNF, idCli, Local, Pts: Integer; serv : smallint; vNotas, vPeso:Double);
    procedure Adicional_Simulador(idCli, Local, Pts: Integer; serv : smallint; vNotas, vPeso:Double);
    procedure Adicional_AdValor(ValorNotas : double);
    procedure Adicional_Pedagio(tipo:Smallint; PesoT : Double);
    procedure Adicional_Gris(ValorNotas : double);
    procedure Adicional_GrauD();
    procedure Adicional_ICMS();
    procedure Adicional_Ponto(Pontos:Integer);
    procedure Adicional_Outras(tipoOcorr : Integer);
    procedure Adicional_Minimo(numOcorr : Integer);
    procedure Adicional_Emissao();
    procedure Adicional_Banco(idCli, serv, Local : Integer);

    { set e get }
    function get_freteNF():double;
    function get_freteTot():double;

    function get_frete_combinado():double;
    function get_frete_fixo():double;


    function get_01AdValor():double;
    function get_02Pedagio():double;
    function get_03Gris():double;
    function get_03SubTotal():double;
    function get_04GrauD():double;
    function get_05ICMS():double;
    function get_06Ponto():double;
    function get_SubTotal2():double;
    function get_07emissao():double;
    function get_08devolucao():double;
    function get_09reentrega():double;
    function get_10outros():double;

    function get_11base():double;
    function get_12aliq():double;

    {-------------------------}
    {Conhecimento - 22/02/2012}
    function get_A_fretePeso():double;
    function get_B_freteValor():double;
    function get_C_secCAT():double;
    function get_D_despacho():double;
    function get_E_pedagio():double;
    function get_F_outros():double;
    function get_G_total():double;
    function get_H_base():double;
    function get_I_aliq():double;
    function get_J_ICMS():double;
    function get_K_fretePesoAdic():Double;

    procedure Zerar_tudo();


  published

end;


implementation

uses DB;

var Bco : TBco;

{ TNeg }

procedure TNeg.Zerar_tudo();
begin
  //with Tneg do
  begin
    Frete_NF := 0;
    Frete_Total := 0;
    Frete_Ent := 0; Frete_Peso := 0; Frete_PesoAdic  := 0;
    Frete_Saida := 0; Frete_Taxa := 0; Frete_Combinado := 0;
    AdValor := 0; Pedagio := 0; Gris := 0;
    SubTotal := 0; SubTotal2 := 0;
    GrauD := 0; Aliq := 0; ICMS := 0; Ponto := 0; Devol := 0; Reent := 0; Emissao := 0; Outros := 0;
    conhec_outros := 0; conhec_total := 0; conhec_base := 0; conhec_aliq := 0; conhec_sec := 0;

  end;

end;

{Calculos}
procedure TNeg.Adicional_Calculos(idCli: Integer; serv : smallint);

begin
  // Zera aas variaveis
  GrauD     := 0;
  Devol     := 0;
  Reent     := 0;
  Outros    := 0;

  Bco := TBco.Create;
  Bco.Notas_Alt_MostraNF(DM3.cdsRelNNUMNF.Value);
  Bco.Frete_CadAdic_Procura(idCli, serv, DM3.cdsRelNTIPOLOCAL.Value);
  Bco.Destroy;

  // Aplica Alternativos
  if (DM4.cdsNFalt.RecordCount > 0) then
  begin
    GrauD     := DM4.cdsNFaltATDE.AsFloat;
    Devol     := DM4.cdsNFaltADEVOL.AsFloat;
    Reent     := DM4.cdsNFaltAREENT.AsFloat;
    Outros    := DM4.cdsNFaltAOUTROS.AsFloat;
  end;

  Adicional_AdValor(DM3.cdsRelNVALOR.AsFloat);  // 01
  Adicional_Pedagio(1, DM3.cdsRelNPESO.AsFloat);  // 02
  Adicional_Gris(DM3.cdsRelNVALOR.AsFloat);     // 03

  SubTotal := Frete_NF + AdValor + pedagio + Gris;

  if (GrauD = 0) then Adicional_GrauD;          // 04
  Adicional_Emissao;                            // 05
  Adicional_Ponto(DM3.cdsRelNPonto.Value);      // 06
  Adicional_Outras(DM3.cdsRelNUSO.Value);

  SubTotal2 := SubTotal + GrauD + Ponto + Devol + Reent + Emissao;

  Adicional_ICMS;                               // 07
  Adicional_Minimo(DM3.cdsRelNNOCORR.Value);    // 08

end;


procedure TNeg.Adicional_Simulador(idCli, Local, Pts: Integer; serv : smallint; vNotas, vPeso:Double);

begin
  Bco := TBco.Create;
  Bco.Frete_CadAdic_Procura(idCli, serv, Local);
  Bco.Destroy;


  Adicional_AdValor(vNotas);    // 01
  Adicional_Pedagio(1, vPeso);  // 02
  Adicional_Gris(vNotas);       // 03

  SubTotal := Frete_NF + AdValor + pedagio + Gris;

  Adicional_GrauD;              // 04
  Adicional_Emissao;            // 05
  Adicional_Ponto(Pts);         // 06
  Adicional_Outras(1);          // 07

  SubTotal2 := SubTotal + GrauD + Ponto + Devol + Reent + Emissao;

  Adicional_ICMS;               // 08
  Adicional_Minimo(1);          // 09  Totaliza
end;

procedure TNeg.Adicional_AlteraValor(idNF, idCli, Local, Pts: Integer; serv : smallint; vNotas, vPeso:Double);

begin
  // Zera aas variaveis
  GrauD     := 0;
  Devol     := 0;
  Reent     := 0;
  Outros    := 0;

  Bco := TBco.Create;
  Bco.Notas_Alt_MostraNF(idNF);
  Bco.Frete_CadAdic_Procura(idCli, serv, Local);
  Bco.Destroy;

  // Aplica Alternativos
  if (DM4.cdsNFalt.RecordCount > 0) then
  begin
    GrauD     := DM4.cdsNFaltATDE.AsFloat;
    Devol     := DM4.cdsNFaltADEVOL.AsFloat;
    Reent     := DM4.cdsNFaltAREENT.AsFloat;
    Outros    := DM4.cdsNFaltAOUTROS.AsFloat;
  end;

  Adicional_AdValor(vNotas);    // 01
  Adicional_Pedagio(1, vPeso);  // 02
  Adicional_Gris(vNotas);       // 03

  SubTotal := Frete_NF + AdValor + pedagio + Gris;

  if (GrauD=0)then Adicional_GrauD; // 04
  Adicional_Emissao;            // 05
  Adicional_Ponto(Pts);         // 06
  Adicional_Outras(1);          // 07

  SubTotal2 := SubTotal + GrauD + Ponto + Devol + Reent + Emissao;

  Adicional_ICMS;               // 08
  Adicional_Minimo(1);          // 09  Totaliza
end;



procedure TNeg.Adicional_Banco(idCli, serv, Local: Integer);
  var BCo : TBco;
begin
  Bco := TBco.Create;
  Bco.Frete_CadAdic_Procura(idCli, serv, Local);
  Bco.Destroy;
end;

// 01
procedure TNeg.Adicional_AdValor(ValorNotas : double);
begin
  AdValor := 0;

  if (ValorNotas > DM1.cdsFAdADVAL_MIN.AsFloat) then
  begin
    AdValor := ValorNotas * DM1.cdsFAdADVAL.AsFloat/100;
  end;
end;

// 02
procedure TNeg.Adicional_Pedagio(tipo:Smallint; PesoT : Double);

var iPeso, vrInt : integer;
begin
  Pedagio := 0;
  iPeso := Trunc(PesoT);
  // Valor Inteiro do Peso
  if (Tipo = 1) then
  begin
    vrInt := iPeso div 100;
    if (iPeso mod 100 > 0) then vrInt := vrInt + 1;
    Pedagio := DM1.cdsFAdPEDAGIO.AsFloat * vrInt;
  end
  else
    Pedagio := DM1.cdsFAdPEDAGIO.AsFloat;

end;

// 03
procedure TNeg.Adicional_Gris(ValorNotas : double);

var vrTemp : double;

begin
 if (ValorNotas > DM1.cdsFAdGRIS_SUP.Value) then
      begin
        vrTemp := ValorNotas * DM1.cdsFAdGRIS.AsFloat /100;
        if vrTemp < DM1.cdsFAdGRIS_Min.AsFloat then Gris := DM1.cdsFAdGRIS_Min.AsFloat
        else Gris := vrTemp;
      end;
end;

// 04
procedure TNeg.Adicional_GrauD;

begin
    if (DM1.cdsFAdDIF_TAXA.Value <>0) then
    begin
      GrauD := SubTotal * DM1.cdsFAdDIF_TAXA.AsFloat /100;
      if GrauD < DM1.cdsFAdDIF_MIN.AsFloat then GrauD :=  DM1.cdsFAdDIF_Min.AsFloat;
      if GrauD > DM1.cdsFAdDIF_MAX.AsFloat then GrauD :=  DM1.cdsFAdDIF_Max.AsFloat;
    end;
end;

// 05
procedure TNeg.Adicional_Emissao;
begin
  Emissao := DM1.cdsFAdEMISSAO.AsFloat;
end;

// 06
procedure TNeg.Adicional_Ponto(Pontos:Integer);
begin
  Ponto := 0;
  Ponto := Pontos * DM1.cdsFAdPONTO.AsFloat;
end;

// 07
procedure TNeg.Adicional_Outras(tipoOcorr : Integer);
begin
    // Devoluçoes
   if (tipoOcorr = 3) then
      Devol := SubTotal2 * DM1.cdsFAdDEVOLUCAO.AsFloat / 100;
    //Devol := SubTotal2 * DM.QFreteCDevolucao.Value / 100;

    // Reentregas
    if (tipoOcorr = 2) then
      Reent := 0;

//    Reent := SubTotal2 * DM1.cdsFAd / 100;

    // 11 - Total

{    if (DM.TListaOpcReent.Value) then
    begin
      Total := vrReent;
      if Total < vMinimo/2 then Total := vMinimo/2;
    end
    else
    begin
      Total := SubTotal2 + vrDevol + vrReent + DM.QFreteCEmissao.Value ;
      if Total < vMinimo then Total := vMinimo;
    end;
}
end;

procedure TNeg.Adicional_ICMS;

var base : double;

begin
  // Verifica  Aliquota
  if SubTotal2 > DM1.cdsFAdICMS_LIMITE.Value then
     Aliq := DM1.cdsFAdICMS_MENOR.AsFloat
  else
     Aliq := DM1.cdsFAdICMS_MAIOR.AsFloat;

  // Calcula o ICMS
  base := SubTotal2 * 100 /(100 - Aliq);
  ICMS := base - SubTotal2;
  ICMS := RoundTo(ICMS, -2);

end;


// 08
procedure TNeg.Adicional_Minimo(numOcorr : Integer);

var min : double;

begin
  Frete_Total := SubTotal2 + ICMS;

  min := 0;
  min := DM1.cdsFAdFRETE_MIN.AsFloat;

  if (Frete_TOTAL < min) then Frete_Total := min;
  // Alteração de 18.11.2011
  // Frete = 0 para Falta de Tempo
  if (numOcorr = 20) or (numOcorr = 23) or (numOcorr = 58) then
    Frete_Total := 0;

end;



procedure TNeg.Calcula_Frete_Entrega(idCli, loc: integer);
begin
  Bco := TBco.Create;
  Bco.FreteEntrega_Mostra(idCli);
  Bco.Destroy;

  if (loc = 0) then Frete_Ent := DM3.cdsFT3CAP_VALOR.AsFloat;
  if (loc = 1) then Frete_Ent := DM3.cdsFT3GSP_VALOR.AsFloat;
  if (loc = 2) then Frete_Ent := DM3.cdsFT3INT_VALOR.AsFloat;
  if (loc = 3) then Frete_Ent := DM3.cdsFT3INT2_VALOR.AsFloat;
  if (loc = 4) then Frete_Ent := DM3.cdsFT3OEST_VALOR.AsFloat;
  if (loc = 5) then Frete_Ent := DM3.cdsFT3OUT_VALOR.AsFloat;
end;

procedure TNeg.Calcula_Frete_Fixo(vTOTFrete, vNota, Peso: Double);
  var vBase, vICMS, vFreteV, dTxICMS:double;
begin
  Zerar_tudo();

  vBase := 0;
  vICMS := 0;
  vFretev := 0;
  dTxICMS := 12;
  vBase := vTOTFrete;
  vICMS := vTOTfrete * dTxICMS / 100;
  Aliq := dTxICMS;

  Adicional_AdValor(vNota);
  Adicional_Gris(vNota);
  Adicional_Pedagio(0,peso);
  Adicional_GrauD;
  Adicional_Emissao;

  vFreteV := vTOTFrete - vICMS - (AdValor + Gris + Pedagio + GrauD + Emissao + Outros);
  // Ajusta valores
  Frete_fixo := vFreteV;
  Frete_Total:= vTOTfrete;
  conhec_base := vTOTfrete;
  ICMS := vICMS;

end;

procedure TNeg.Calcula_Frete_NF(tipo : smallint);
begin
  if (tipo = 1) then Frete_NF := Frete_Peso + Frete_PesoAdic;
  if (tipo = 2) then Frete_NF := Frete_Taxa;
  if (tipo = 3) then Frete_NF := Frete_Ent;
  if (tipo = 4) then Frete_NF := Frete_Saida;
  if (tipo = 5) then Frete_NF := 0;  // Contrato (valor já estabelecido)
  if (tipo = 7) then Frete_NF := Frete_Combinado;
  if (tipo = 8) then Frete_NF := Frete_Fixo;

end;

function CEP_num(sCEP:String):Integer;
  var s,s1 : String;
      i, resp : integer;
begin
  resp := 0;
  if sCEP.Length>0 then
  begin
    s := copy(sCEP, 1, 5);
    s1 := '';
    for I := 1 to 5 do if s[i] in ['0'..'9'] then s1 := s1 + s[i];
    if s1.Length>0 then resp := StrToInt(s1);
  end;

  result := resp;
end;

function Procura_AreaRisco(sCEP:String):boolean;
var achei : boolean;
    nCEP : Integer;

begin
   achei := false;
   nCep := CEP_num(sCEP);

   if (DM5.cdsPr2.RecordCount>0) then
    begin
      DM5.cdsPr2.First;
      while (not DM5.cdsPr2.Eof) and (not achei) do
      begin
        if (nCEP >= DM5.cdsPr2CEPI.Value) and (nCEP <= DM5.cdsPr2CEPF.Value) then
        begin
          achei := true;
          Bco.Prazo2Copia_Nota(DM5.cdsPrCepID.Value, DM5.cdsPr2PRAZO.Value);
        end;
        DM5.cdsPr2.Next;
      end;
    end;
    Result := achei;
end;

procedure TNeg.Calcula_Frete_Peso(idCli: Integer; peso: double; loc:smallint; CEP:String);
begin
  Frete_Peso := 0;
  if (loc = 0) or (loc=1) then
  begin
    Bco := TBco.Create;
    if (ultCli <> idCli) then Bco.PrazosFaixa_Mostrar_Cli(idCli);
    if (Procura_AreaRisco(CEP)) then
    if (Bco.Frete_CadAdic_Procura(idCli, 1, loc)) then
    begin
      if (DM1.cdsFAdVRISCO.AsFLoat>0) then Frete_Peso := DM1.cdsFAdVRISCO.AsFLoat;
      if (DM1.cdsFAdVRISCOAD.AsFLoat>0) then Frete_Peso := Frete_Peso + DM1.cdsFAdVRISCOAD.AsFLoat;

    end;

    Bco.Destroy;

    ultCli := idCli;
  end;

  if (Frete_Peso = 0) then
  begin
    Bco := TBco.Create;
    Bco.FretePeso_Mostra(idCli);
    Bco.FretePesoExc_Mostra(idCli);
    Bco.Destroy;

    Frete_Peso := 0;
    DM3.cdsFT1.First;
    while not DM3.cdsFT1.Eof do
    begin
      if (peso > DM3.cdsFT1INICIO.Value) and (peso <= DM3.cdsFT1FIM.Value) then
      begin
        if (loc = 0) then Frete_Peso := DM3.cdsFT1VCAP.AsFloat;
        if (loc = 1) then Frete_Peso := DM3.cdsFT1VGSP.AsFloat;
        if (loc = 2) then Frete_Peso := DM3.cdsFT1VINT.AsFloat;
        if (loc = 3) then Frete_Peso := DM3.cdsFT1VINT2.AsFloat;
        if (loc = 4) then Frete_Peso := DM3.cdsFT1VOEST.AsFloat;
        if (loc = 5) then Frete_Peso := DM3.cdsFT1VOUT.AsFloat;
      end;
      DM3.cdsFT1.Next;
    end;

    if (Frete_Peso = 0) then
    begin
      if (loc = 0) then
        begin
           Frete_Peso := DM3.cdsFT1VCAP.AsFloat;
           Frete_PesoAdic := (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aECAP.AsFloat;
        end;
      if (loc = 1) then
        begin
          Frete_Peso := DM3.cdsFT1VGSP.AsFloat;
          Frete_PesoAdic :=  (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aeGSP.AsFloat;
        end;
      if (loc = 2) then
        begin
          Frete_Peso := DM3.cdsFT1VINT.AsFloat;
          Frete_PesoAdic :=  (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aeINT.AsFloat;
        end;
      if (loc = 3) then
        begin
          Frete_Peso := DM3.cdsFT1VINT2.AsFloat;
          Frete_PesoAdic :=  (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aeINT2.AsFloat;
        end;
      if (loc = 4) then
        begin
          Frete_Peso := DM3.cdsFT1VOEST.AsFloat;
          Frete_PesoAdic :=  (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aeOEST.AsFloat;
        end;
      if (loc = 5) then
        begin
          Frete_Peso := DM3.cdsFT1VOUT.AsFloat;
          Frete_PesoAdic :=  (peso - DM3.cdsFT1FIM.AsFloat)* DM3.cdsFT1aeOUT.AsFloat;
        end;
    end
    else Frete_PesoAdic := 0;
  end;
end;

procedure TNeg.Calcula_Frete_Saida(idCli, faixa, loc, qtNF: Integer);

begin
  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, faixa);
  Bco.Destroy;

  if (qtNF = 0) then qtNF := 1;

  if (loc = 0) then Frete_Saida := DM3.cdsFT4COB_SP.AsFloat   / qtNF;
  if (loc = 1) then Frete_Saida := DM3.cdsFT4COB_GSP.AsFloat  / qtNF;
  if (loc = 2) then Frete_Saida := DM3.cdsFT4COB_INT.AsFloat  / qtNF;
  if (loc = 3) then Frete_Saida := DM3.cdsFT4COB_INT2.AsFloat / qtNF;
  if (loc = 4) then Frete_Saida := DM3.cdsFT4COB_OEST.AsFloat / qtNF;
  if (loc = 5) then Frete_Saida := DM3.cdsFT4COB_OUT.AsFloat  / qtNF;

end;

procedure TNeg.Calcula_Frete_Taxa(idCli, loc: integer; ValorNF: Double);
begin
  Bco := TBco.Create;
  Bco.FreteTaxa_Mostra(idCli);
  Bco.Destroy;

  Frete_Taxa := 0;

  if (loc = 0) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2CAP_PORC.AsFloat /100;
    if (DM3.cdsFT2CAP_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2CAP_MINIMO.AsFloat;
  end;

  if (loc = 1) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2GSP_PORC.AsFloat /100;
    if (DM3.cdsFT2GSP_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2GSP_MINIMO.AsFloat;
  end;

  if (loc = 2) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2INT_PORC.AsFloat /100;
    if (DM3.cdsFT2INT_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2INT_MINIMO.AsFloat;
  end;

  if (loc = 3) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2INT2_PORC.AsFloat /100;
    if (DM3.cdsFT2INT2_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2INT2_MINIMO.AsFloat;
  end;

  if (loc = 4) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2OEST_PORC.AsFloat /100;
    if (DM3.cdsFT2OEST_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2OEST_MINIMO.AsFloat;
  end;

  if (loc = 5) then
  begin
    Frete_Taxa  := ValorNF * DM3.cdsFT2OUT_PORC.AsFloat /100;
    if (DM3.cdsFT2OUT_MINIMO.AsFloat > Frete_Taxa) then Frete_Taxa := DM3.cdsFT2OUT_MINIMO.AsFloat;
  end;

end;

procedure TNeg.Calcula_Frete_Combinado(qtNotas: Integer; vFrete : Double);
begin
  Zerar_tudo();
  Frete_Combinado := vFrete;
  Adicional_ICMS;
end;

{set e get}

function TNeg.get_freteNF: double;
begin
  get_freteNF := Frete_NF;
end;

function TNeg.get_freteTot: double;
begin
  get_freteTot := Frete_Total;
end;

function TNeg.get_frete_combinado: double;
begin
  result := Frete_Combinado;
end;


function TNeg.get_frete_fixo: double;
begin
  result := Frete_Fixo;
end;

function TNeg.get_01AdValor: double;
begin
  get_01AdValor := AdValor;
end;

function TNeg.get_02Pedagio: double;
begin
  get_02Pedagio := Pedagio;
end;

function TNeg.get_03Gris: double;
begin
  get_03Gris := Gris;
end;

function TNeg.get_03SubTotal: double;
begin
  get_03SubTotal := SubTotal;
end;

function TNeg.get_04GrauD: double;
begin
  get_04GrauD := GrauD;
end;

function TNeg.get_05ICMS: double;
begin
  get_05ICMS := ICMS;
end;

function TNeg.get_06Ponto: double;
begin
  get_06Ponto := Ponto;
end;


function TNeg.get_SubTotal2: double;
begin
  get_SubTotal2 := SubTotal2;
end;

function TNeg.get_07emissao: double;
begin
  get_07emissao := Emissao;
end;

function TNeg.get_08devolucao: double;
begin
  get_08devolucao := Devol;
end;

function TNeg.get_09reentrega: double;
begin
  get_09reentrega := Reent;
end;

function TNeg.get_10outros: double;
begin
  get_10Outros := Outros;
end;

function TNeg.get_11base: double;
begin
  result := conhec_base;
end;

function TNeg.get_12aliq: double;
begin
  result := Aliq;
end;

{
  =======================================
    CONHECIMENTO
  =======================================
}
function TNeg.get_A_fretePeso: double;
begin
  // EDI = 12 VALOR DO FRETE PESO
  get_A_fretePeso := Frete_Peso;
end;

function TNeg.get_B_freteValor: double;
begin
  // EDI = 13 FRETE VALOR
  get_B_freteValor := Gris + AdValor;
end;

function TNeg.get_C_secCAT: double;
begin
  // EDI = 14 VALOR SET CAT
  // coleta + tx de entrega???
  conhec_sec := 0;
  get_C_secCAT := conhec_sec;
end;

function TNeg.get_D_despacho: double;
begin
  // EDI = 16 VALOR DO DESPACHO
  get_D_despacho := Emissao;
end;

function TNeg.get_E_pedagio: double;
begin
  // EDI = 17 VALOR DO PEDAGIO
  get_E_pedagio := GrauD +Ponto + Devol;
end;

function TNeg.get_F_outros: double;
begin

  conhec_outros := 0;
  get_F_outros := conhec_outros;
end;

function TNeg.get_G_total: double;
begin
  // EDI = 8 VALOR TOTAL DO FRETE
  conhec_total := Frete_Peso + Frete_Fixo +Gris + AdValor + Emissao +
     GrauD +Ponto + Devol + conhec_sec + conhec_outros +Frete_PesoAdic + Pedagio;
  get_G_total := conhec_total;
end;

function TNeg.get_H_base: double;
begin
  // EDI = 9 BASE DE CALCULO
  conhec_total := Frete_Peso + Gris + AdValor + Emissao +
     GrauD +Ponto + Devol + conhec_sec + conhec_outros +Frete_PesoAdic + Pedagio;
  conhec_aliq := Aliq;
  conhec_base := conhec_total * 100 / (100 - conhec_aliq);
  get_H_base := conhec_base;
end;

function TNeg.get_I_aliq: double;
begin
  // EDI = 10 TX DO ICMS
  conhec_aliq := Aliq;
  get_I_aliq := conhec_aliq;
end;

function TNeg.get_J_ICMS: double;
begin
  // EDI = VALOR DO ICMS
  get_J_ICMS := conhec_base - conhec_total;
end;

function TNeg.get_K_fretePesoAdic: Double;
begin
  get_K_fretePesoAdic := Frete_PesoAdic;
end;








end.
