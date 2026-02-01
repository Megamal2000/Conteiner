unit uDiasUteis;

interface

uses SysUtils;

const MAX_DIAS = 60;

type
  TUteis = record
    dia : TDate;
    num : Integer;
  end;

  TDutil = class(TObject)


  private
    DIA_BASE : TDate;
    diasUt : Array[0..MAX_DIAS] of TUteis;
    DataI, DataF : TDate;
    diasInuteis : Array[0..9] of TDate;
    sabadoUtil, domingoUtil : Boolean;
    erro : Smallint;
  protected

  public
    // procedimentos Principais
    function set_Datas(dataInicial, dataFinal : TDate):Integer;
    procedure Montar_Sequencia();
    // Configurações Opcionais
    procedure Inserir_DiaInutil(diai:TDate);
    procedure Incluir_Sabado(diaUtil:boolean);
    procedure Incluir_Domingo(diaUtil:boolean);
    function VerificaInutil(dt : TDate): Boolean;

    // Cálculos após procedimentos principais
    function Calcular_EntreDatas(dt1, dt2: TDate):Integer;
    function Calcular_ProxDiaUtil(dtInicio:TDate; IntervaloDias:Integer):TDate;


  end;
implementation


{ TDutil }

function TDutil.Calcular_EntreDatas(dt1, dt2: TDate): Integer;
  var resp, n1, n2, i : Integer;

begin
  resp := 0;
  if erro = 0 then
  begin
    n1 :=0; n2 :=0;
    resp := -1;
    i := 0;
    while (i<=MAX_DIAS) and (diasUt[i].num<>-2) do
    begin
      if FormatDateTime('dd/MM/yy',dt1) = FormatDateTime('dd/MM/yy',diasUt[i].dia) then n1 :=  diasUt[i].num;
      if FormatDateTime('dd/MM/yy',dt2) = FormatDateTime('dd/MM/yy',diasUt[i].dia) then n2 :=  diasUt[i].num;
      Inc(i);
    end;

    resp := n2 - n1;
  end;

  result := resp;
end;

function TDutil.Calcular_ProxDiaUtil(dtInicio: TDate;
  IntervaloDias: Integer): TDate;
  var dtResp : TDateTime;
      I, n1 : Integer;
begin
  dtResp := Now;
  if erro = 0 then
  begin
    i := 0;  n1 := 0;
    while (i<=MAX_DIAS) and (diasUt[i].num<>-2) do
    begin
      if FormatDateTime('dd/MM/yy',dtInicio) = FormatDateTime('dd/MM/yy',diasUt[i].dia) then n1 :=  diasUt[i].num;
      Inc(i);
    end;

    dtResp := dtInicio + n1;
  end;

  result := dtResp;
end;

procedure TDutil.Incluir_Domingo(diaUtil: boolean);
begin
  domingoUtil := diaUtil;
end;

procedure TDutil.Incluir_Sabado(diaUtil: boolean);
begin
  sabadoUtil := diaUtil;
end;

procedure TDutil.Inserir_DiaInutil(diai: TDate);
  var i : integer;
begin
  for I := 0 to 9 do if diasInuteis[i] = DIA_BASE  then diasInuteis[i] := diai;
end;

function TDutil.VerificaInutil(dt : TDate): Boolean;
   var resp : boolean;
       i : Integer;
begin

    resp := false;
    if ( diasInuteis[0] <> DIA_BASE ) then
    begin
      i := 0;
      while (i<=9) and (diasInuteis[i] <> DIA_BASE) and  (not resp) do
      begin
        if (Trunc(diasInuteis[i]) = Trunc(dt)) then resp := true;
        i := i + 1;
      end;
    end;

    Result := resp;
end;

procedure TDutil.Montar_Sequencia;
  var i, Contador : Integer;
begin

  if (erro = 0) then
  begin
    // Faz lista de 52 dias uteis
    Contador := 0;
    i := 0;
    while (DataI <= DataF) and (i<MAX_DIAS) do
    begin

      diasUt[i].dia :=  DataI;
      diasUt[i].num :=  Contador;

      // verifica s evai utilizar o próximo dia (depois de sexta e sábado)
      if (  ((DayOfWeek(DataI) <> 6) or sabadoUtil) and ((DayOfWeek(DataI) <> 7) or DomingoUtil) and (not (verificaInutil(DataI))) ) then
        Inc(Contador);

      Inc(i);
      DataI := DataI + 1;
    end;

    // configura o final como -2
    if i < MAX_DIAS then
    begin
      diasUt[i].dia :=  DataI;
      diasUt[i].num :=  -2;
    end;
  end;
end;

function TDutil.set_Datas(dataInicial, dataFinal: TDate): Integer;
  var resp,i : Integer;
begin
  DIA_BASE := EncodeDate(2007,07,07);
  sabadoUtil := false;
  domingoUtil := false;

  DataI := dataInicial;
  DataF := dataFinal+20;


  for I := 0 to 9 do diasInuteis[i] := DIA_BASE;
  for I := 0 to MAX_DIAS do
  begin
    diasUt[i].dia := DIA_BASE;
    diasUt[i].num := -2;
  end;

  resp := 0;
  erro := 0;
  if dataFinal<dataInicial then erro := 1; // erro nas datas
  if Trunc(dataFinal-dataInicial)>MAX_DIAS then erro := 2; // excedeu o número de dias

  resp := erro;
  result := resp;
end;

end.
