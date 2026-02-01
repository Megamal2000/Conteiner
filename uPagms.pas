unit uPagms;

interface

uses
  uDM1, uDM2, uDM3, uDM4, uBanco;

type
  TPag = class(TObject)

  private
    TotalPag : Double;
    Bco : TBco;

  protected

  public
    {Calculos Pagamentos}
    procedure CalculaEntregas(Local, Entregas, nAjud:Integer);   // 01
    //procedure CalcularEntregasPeso(apartir;
    procedure CalculaKm(qKM:Integer;vKM:Double);      // 02
    procedure CalculaSaida(numR, faixa, loc, nAjud: Integer);   // 03
    procedure CalculaContrato();
    procedure CalculaPersonalizado(Local, Entregas, idF, nAjud, numR : Integer);                          // 04
    procedure CalculaSaidaP(idM, pesot, loc, nAjud: Integer);
    procedure CalculaTratado(numR:Integer);
    function CalculaPesoExc(numR, Limite:Integer):Double;
    { set e get }
    function get_Total():double;

  published

end;


implementation

{ TPag }

procedure TPag.CalculaContrato;
begin

end;

procedure TPag.CalculaEntregas(Local, Entregas, nAjud:Integer);

var tot, vM, vA, vE : double;

begin
  Bco := TBco.Create;
  Bco.PagNotas_Mostra;
  Bco.Destroy;

  vE := 0;
// ############## SP ##################################
  if (Local = 0) then
  begin
    if (Entregas <= DM3.cdsPGnotaSP_NT1.Value) then
    begin
      vM := DM3.cdsPGnotaSP_MOT1.AsFloat;
      vA := DM3.cdsPGnotaSP_AJUD1.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaSP_NT1.Value) and (Entregas <= DM3.cdsPGnotaSP_NT2.Value) then
    begin
      vM := DM3.cdsPGnotaSP_MOT2.AsFloat;
      vA := DM3.cdsPGnotaSP_AJUD2.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaSP_NT2.Value) then
    begin
      vE := (Entregas - DM3.cdsPGnotaSP_NT2.AsFloat)*DM3.cdsPGnotaSP_EXTRA.AsFloat;
      vM := DM3.cdsPGnotaSP_MOT3.AsFloat;
      vA := DM3.cdsPGnotaSP_AJUD3.AsFloat;

    end;
  end;

// ############## GSP ##################################
  if (Local = 1) then
  begin
    if (Entregas <= DM3.cdsPGnotaGSP_NT1.Value) then
    begin
      vM := DM3.cdsPGnotaGSP_MOT1.AsFloat;
      vA := DM3.cdsPGnotaGSP_AJUD1.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaGSP_NT1.Value) and (Entregas <= DM3.cdsPGnotaGSP_NT2.Value) then
    begin
      vM := DM3.cdsPGnotaGSP_MOT2.AsFloat;
      vA := DM3.cdsPGnotaGSP_AJUD2.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaGSP_NT2.Value) then
    begin
      vE := (Entregas - DM3.cdsPGnotaGSP_NT2.AsFloat)*DM3.cdsPGnotaGSP_EXTRA.AsFloat;

      vM := DM3.cdsPGnotaGSP_MOT3.AsFloat;
      vA := DM3.cdsPGnotaGSP_AJUD3.AsFloat;
    end;
  end;

// ############## INT ##################################
  if (Local = 2) then
  begin
    if (Entregas <= DM3.cdsPGnotaINT_NT1.Value) then
    begin
      vM := DM3.cdsPGnotaINT_MOT1.AsFloat;
      vA := DM3.cdsPGnotaINT_AJUD1.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaINT_NT1.Value) and (Entregas <= DM3.cdsPGnotaINT_NT2.Value) then
    begin
      vM := DM3.cdsPGnotaINT_MOT2.AsFloat;
      vA := DM3.cdsPGnotaINT_AJUD2.AsFloat;
    end;

    if (Entregas > DM3.cdsPGnotaINT_NT2.Value) then
    begin
      vE := (Entregas - DM3.cdsPGnotaINT_NT2.Value)*DM3.cdsPGnotaINT_EXTRA.AsFloat;
      vM := DM3.cdsPGnotaINT_MOT3.AsFloat;
      vA := DM3.cdsPGnotaINT_AJUD3.AsFloat;
    end;
  end;

// ############## TOTAL ##################################
   tot := vM + vA*nAjud + vE;

   TotalPag := tot;
end;

procedure TPag.CalculaKm(qKM:Integer;vKM:Double);
begin
  TotalPag := qKM * vKM;
end;


procedure TPag.CalculaPersonalizado(Local, Entregas, idF, nAjud, numR: Integer);

var tot, vM, vA, vE : double;
    achei : boolean;

begin
  Bco := TBco.Create;
  Bco.PagFaixa_Mostrar(idF, Local);
  Bco.PagFaixaMais_Mostrar(idF, Local);
  Bco.Destroy;

  vE := 0;  vM := 0; vA := 0;
// ############## Procura na Faixa ##################################
  achei := false;
  DM3.cdsPag1.First;
  while not achei and not DM3.cdsPag1.Eof do
  begin
    if (Entregas > DM3.cdsPag1INICIO.Value) and (Entregas <= DM3.cdsPag1FIM.Value) then
    begin
      achei := true;
      vM := DM3.cdsPag1VALORMOT.AsFloat;
      vA := DM3.cdsPag1VALORAJUD.AsFloat;
    end;
    DM3.cdsPag1.Next;
  end;

  // Acima de
  if (Entregas > DM3.cdsPag2ACIMADE.Value) then
  begin

    if (DM3.cdsPag2USAPESO.Value = 1 ) then
    begin
      vM := DM3.cdsPag1VALORMOT.AsFloat;
      vA := DM3.cdsPag1VALORAJUD.AsFloat;
      vE := CalculaPesoExc(numR, DM3.cdsPag2ACIMADE.Value);

    end
    else
    begin
      vE := (Entregas - DM3.cdsPag2ACIMADE.Value)*DM3.cdsPag2NOTA_EXTRA.AsFloat;
      vM := DM3.cdsPag1VALORMOT.AsFloat;
      vA := DM3.cdsPag1VALORAJUD.AsFloat;
    // ############## TOTAL ##################################


       if (DM3.cdsPag2VMINIMO.Value > tot) then tot := DM3.cdsPag2VMINIMO.AsFloat;
    end;
   end;
   tot := vM + vA*nAjud + vE;
   TotalPag := tot;
end;


Function TPag.CalculaPesoExc(numR, Limite: Integer):Double;
begin
  Bco := TBco.Create;
  result := Bco.Pagamento_CalcPesoExc(numR, Limite);
  Bco.Destroy;
end;

procedure TPag.CalculaSaida(numR, faixa, loc, nAjud: Integer);

var tot : Double;
    idCli, vA : Integer;

begin
  Bco := TBco.Create;
  Bco.Romaneio_NotasCli(numR);
  idCli := DM2.cdsTMP.Fields[2].Value;

  Bco.FreteSaida_Mostra(idCli, faixa);
  Bco.Destroy;

  vA := 20;

  if (loc = 0) then tot := DM3.cdsFT4PAG_SP.AsFloat ;
  if (loc = 1) then tot := DM3.cdsFT4PAG_GSP.AsFloat;
  if (loc = 2) then tot := DM3.cdsFT4PAG_INT.AsFloat;
  if (loc = 3) then tot := DM3.cdsFT4PAG_OUT.AsFloat;

  tot := tot + vA*nAjud;

  TotalPag := tot;
end;

procedure TPag.CalculaSaidaP(idM, pesot, loc, nAjud: Integer);

var tot, vM, vA, vE : double;
    achei : boolean;

begin

  Bco := TBco.Create;
  Bco.Pag2Faixa_Mostrar(idM, loc);
  Bco.Pag2FaixaMais_Mostrar(idM, loc);
  Bco.Destroy;

  vE := 0;  vM := 0; vA := 0;
// ############## Procura na Faixa ##################################
  achei := false;
  DM4.cdsPG3.First;
  while not achei and not DM4.cdsPG3.Eof do
  begin
    if (pesot > DM4.cdsPG3INICIO.Value) and (pesot <= DM4.cdsPG3FIM.Value) then
    begin
      achei := true;
      vM := DM4.cdsPG3VPAG.AsFloat;
      vA := 0;
    end;
    DM4.cdsPG3.Next;
  end;


  // Acima de
  if (pesot > DM4.cdsPG4MINIMO.Value) then
  begin
    vE := (pesot - DM4.cdsPG4MINIMO.AsFloat)*DM4.cdsPG4MINIMO.AsFloat;
    vM := DM4.cdsPG4MINIMO.AsFloat;
    vA := 0;
  end;

  // ############## TOTAL ##################################
   tot := vM + vA*nAjud + vE;

   TotalPag := tot;

end;


procedure TPag.CalculaTratado(numR: Integer);

var tot : Double;

begin
  Bco := TBco.Create;
  Bco.Romaneio_MostraNum(numR);
  Bco.Destroy;

  tot := DM1.cdsRomaVCOMBINA.AsFloat;

  TotalPag := tot;
end;

function TPag.get_Total: double;


begin
  if (TotalPag < 0) then TotalPag := 0;
  get_Total := TotalPag;
end;

end.
