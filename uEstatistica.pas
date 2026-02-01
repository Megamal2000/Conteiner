unit uEstatistica;

interface

uses
  uBanco, DateUtils, SysUtils, uDM2, uDM4;

type
  TEstat = class(TObject)

  private
    // variáveis

  protected

  public
    // Comandos
    procedure Notas_Certas();
    procedure Notas_Erradas();
    procedure Inicio();
    procedure Nivel_Entregas();
    procedure Nivel_Analise();

    procedure set_dt1(dt : TDateTime);
    procedure set_dt2(dt : TDateTime);
    procedure set_idCli(i : Integer);

    function get_nfCOM():Integer;
    function get_nfEntregues():Integer;
    function get_nfNEntregues():Integer;
    function get_nfReentregas():Integer;
    function get_nfDevC():Integer;
    function get_nfDevT():Integer;

    function get_err1():Integer;
    function get_err2():Integer;
    function get_err3():Integer;

    function get_dia(i : Integer):Integer;
    function get_Tot():Integer;



  published
end;

implementation

var
  r_NotasCOM, r_Entregues, r_NaoEntregues, r_Reentregas, r_DevolC, r_DevolT : Integer;
  e_NotasSEMroma, e_NotasSEMcli, e_NotasSEMbaixa, Total, TotalG : Integer;

  d_dataInicio, d_dataFim : TDateTime;

  f_Entregue, f_Reentrega, f_Ninguem, f_Transp, f_Cliente : String;

  g_semDTe, g_idCli : Integer;
  g_dia : Array[0..15] of Integer;
  g_Tot : Integer;
{ TEstat }


function TEstat.get_dia(i : Integer): Integer;
begin
  get_dia := g_dia[i];
end;

function TEstat.get_err1: Integer;
begin
  get_err1 := e_NotasSEMroma;
end;

function TEstat.get_err2: Integer;
begin
  get_err2 := e_NotasSEMcli;
end;

function TEstat.get_err3: Integer;
begin
  get_err3 := e_NotasSEMbaixa;
end;

function TEstat.get_nfCOM: Integer;
begin
  get_nfCOM := r_NotasCOM;
end;

function TEstat.get_nfDevC: Integer;
begin
  get_nfDevC := r_DevolC;
end;

function TEstat.get_nfDevT: Integer;
begin
  get_nfDevT := r_DevolT;
end;

function TEstat.get_nfEntregues: Integer;
begin
  get_nfEntregues := r_Entregues;
end;

function TEstat.get_nfNEntregues: Integer;
begin
  get_nfNEntregues := r_NaoEntregues;
end;

function TEstat.get_nfReentregas: Integer;
begin
  get_nfReentregas := r_Reentregas;
end;

function TEstat.get_Tot: Integer;
begin
  get_Tot := g_tot;
end;

procedure TEstat.Inicio;

var i : Integer;

begin
  f_Entregue  := '1';
  f_Cliente   := ',3,4,7,8,9,16,30,77,79,39,52,59,';
  f_Ninguem   := ',14,15,';
  f_Transp    := ',13,81,20,';

  r_NotasCOM     := 0;
  r_Entregues    := 0;
  r_NaoEntregues := 0;
  r_Reentregas   := 0;
  r_DevolC       := 0;
  r_DevolT       := 0;

  e_NotasSEMroma := 0;
  e_NotasSEMcli  := 0;
  e_NotasSEMbaixa:= 0;
  Total          := 0;
  TotalG         := 0;

  g_semDTe       := 0;
  g_idCli        := 0;
  for i := 0 to 16 do g_dia[i] := 0;
  g_tot := 0;

end;

procedure TEstat.Nivel_Analise;
begin
  DM4.cdsED.First;
  while not DM4.cdsED.Eof do
  begin
    g_tot := g_tot + 1;
    if (DM4.cdsEDDIAS.Value <= 0) then g_dia[0] := g_dia[0] + 1
    else if (DM4.cdsEDDIAS.Value = 1) then g_dia[1] := g_dia[1] + 1
    else if (DM4.cdsEDDIAS.Value = 2) then g_dia[2] := g_dia[2] + 1
    else if (DM4.cdsEDDIAS.Value = 3) then
    begin
      if (DM4.cdsEDDIA1.Value = 5) then  g_dia[1] := g_dia[1] + 1
        else g_dia[3] := g_dia[3] + 1;
    end
    else
    if (DM4.cdsEDDIAS.Value = 4) then
    begin
      if (DM4.cdsEDDIA1.Value = 4) or (DM4.cdsEDDIA1.Value = 5) then  g_dia[2] := g_dia[2] + 1
        else g_dia[4] := g_dia[4] + 1;
    end
    else if (DM4.cdsEDDIAS.Value >= 5) and (DM4.cdsEDDIAS.Value <= 9) then g_dia[DM4.cdsEDDIAS.Value - 2] := g_dia[DM4.cdsEDDIAS.Value - 2] + 1
    else if (DM4.cdsEDDIAS.Value = 10) then
    begin
      if (DM4.cdsEDDIA1.Value = 5) then  g_dia[6] := g_dia[6] + 1
        else g_dia[8] := g_dia[8] + 1;
    end
    else if (DM4.cdsEDDIAS.Value = 11) then
    begin
      if (DM4.cdsEDDIA1.Value = 4) or (DM4.cdsEDDIA1.Value = 5) then  g_dia[7] := g_dia[7] + 1
        else g_dia[9] := g_dia[9] + 1;
    end
    else if (DM4.cdsEDDIAS.Value >= 12) and (DM4.cdsEDDIAS.Value <= 16) then g_dia[DM4.cdsEDDIAS.Value - 4] := g_dia[DM4.cdsEDDIAS.Value - 4] + 1;

    DM4.cdsED.Next;
  end;
end;

procedure TEstat.Nivel_Entregas;

var Bco : TBCo;

begin
  Bco := TBco.Create;
  Bco.EstatC_Entregas_Dias(g_idCli,  d_dataInicio, d_dataFim);
  Bco.Destroy;
end;

procedure TEstat.Notas_Certas;

var Bco : TBCo;
    i : Integer;
    no : Integer;

begin

  Bco := TBco.Create;
  Bco.EstatC_NotasOk(d_dataInicio, d_dataFim);
  Bco.Destroy;


  if (DM2.cdsTMP.RecordCount > 0) then
  begin
    DM2.cdsTMP.First;
    while not DM2.cdsTMP.Eof do
    begin
      //
      Total := Total + DM2.cdsTMP.Fields[1].Value;
      if (DM2.cdsTMP.Fields[0].Value = 1) then r_Entregues := r_Entregues + DM2.cdsTMP.Fields[1].Value;
      if (pos(','+DM2.cdsTMP.Fields[0].AsString+',' , f_Reentrega)>0) then r_Reentregas := r_Reentregas + DM2.cdsTMP.Fields[1].Value;
      if (pos(','+DM2.cdsTMP.Fields[0].AsString+',' , f_Transp   )>0) then r_DevolT     := r_DevolT     + DM2.cdsTMP.Fields[1].Value;
      if (pos(','+DM2.cdsTMP.Fields[0].AsString+',' , f_Cliente  )>0) then r_DevolC     := r_DevolC     + DM2.cdsTMP.Fields[1].Value;

      DM2.cdsTMP.Next;
    end;
    r_NaoEntregues := Total - r_Entregues;
    r_NotasCOM     := Total;

    r_Reentregas := r_NaoEntregues - r_DevolC - r_DevolT;
  end;
end;

procedure TEstat.Notas_Erradas;
var Bco : TBCo;
    err1, err2 : Integer;

begin
  err1 := 0;
  err2 := 0;

  Bco := TBco.Create;
  Bco.EstatC_NotasErr1(d_dataInicio, d_dataFim);
  Bco.Destroy;
  if (DM2.cdsTMP.RecordCount > 0) then
     err1 := DM2.cdsTMP.Fields[0].Value;

  Bco := TBco.Create;
  Bco.EstatC_NotasErr2(d_dataInicio, d_dataFim);
  Bco.Destroy;
  if (DM2.cdsTMP.RecordCount > 0) then
     err2 := DM2.cdsTMP.Fields[0].Value;

  e_NotasSEMroma := err1;
  e_NotasSEMcli  := err2;

end;

procedure TEstat.set_dt1(dt: TDateTime);
begin
  d_dataInicio := dt;
end;

procedure TEstat.set_dt2(dt: TDateTime);
begin
  d_dataFim := dt;
end;

procedure TEstat.set_idCli(i: Integer);
begin
  g_idCli := i;
end;

end.
