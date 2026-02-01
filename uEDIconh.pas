unit uEDIconh;

interface

uses
  SysUtils;

type
  TEDIc = class(TObject)

  private
    // variáveis
    linha : String;
    cab_Transp : String;

  public
    // procedures e métodos
    Function arquivo(sCli : String):String;
    Function cabecalho(sCli : String):String;
    Function transp(cnpj, nome : String):String;
    Function conhecimento(numC: Integer; dtEm:tDateTime; peso, vFrete, ICMSbase, ICMStaxa, ICMSvalor, vFreteNF,vSEC, vITR, vdespacho, vPedagio, vAdeme : double; NATop : Integer; listaNotas:String): String;
    Function Total_Conhec(qTot:Integer; vTot: double): String;


end;

implementation



{ TEDIo }

{<<< 00 >>>----------------------------------------------------------------
|          AdjustLeft
---------------------------------------------------------------------------}
function AdjustLeft(st:string; qt:smallint; ch:char) : string;
var
  aux : string;
  i   : integer;

begin
  aux := '';
  for i := 1 to qt do aux := aux + ch;
  aux := st + aux;
  aux := copy(aux, 1, qt);

  AdjustLeft := aux;
end;
//*************************************************************************

function FormataReal(n : double): String;

var s, x, n1, n2 : String;
begin
  s  := FormatFloat('#,##0.00', n);
  n1 := copy(s, 1,  length(s) - 3);
  n2 := copy(s, length(s) - 2, length(s));
  x  := n1 +n2;

  FormataReal := x;

end;




{<<< 01 >>>----------------------------------------------------------------
|          Linha Arquivo
---------------------------------------------------------------------------}
Function TEDIc.arquivo(sCli: String):String;

var c01, c02, c03, c04, c05, c06 : String;

begin
  // Campos
  c01 := '000';
  c02 := AdjustLeft('FLAYDEL LOG ', 35, ' ');
  c03 := AdjustLeft(sCli          , 35, ' ');
  c04 := FormatDateTime('ddMMyy', Now);
  c05 := FormatDateTime('HHmm', Now);
  c06 := 'CON'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02 + c03 + c04 + c05 + c06;
  arquivo := AdjustLeft(linha, 680, ' ');;
end;

{<<< 02 >>>----------------------------------------------------------------
|          Linha Cabecalho
---------------------------------------------------------------------------}
function TEDIc.cabecalho(sCli: String): String;

var c01, c02 : String;

begin
  // Campos
  c01 := '320';
  c02 := 'CONHE'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02;
  cabecalho := AdjustLeft(linha, 680, ' ');;

end;

{<<< 03 >>>----------------------------------------------------------------
|          Linha Transportadora
---------------------------------------------------------------------------}
function TEDIc.transp(cnpj, nome: String): String;

var c01, c02, c03 : String;

begin
  // Campos
  c01 := '321';
  c02 := AdjustLeft(cnpj , 14, ' ');
  c03 := AdjustLeft(nome , 40, ' ');

  linha := c01 + c02 + c03;
  transp := AdjustLeft(linha, 680, ' ');;
end;

{<<< 04 >>>----------------------------------------------------------------
|          Linha Conhecimentos
---------------------------------------------------------------------------}
Function TEDIc.conhecimento(numC: Integer; dtEm:tDateTime; peso, vFrete, ICMSbase, ICMStaxa, ICMSvalor, vFreteNF,vSEC, vITR, vdespacho, vPedagio, vAdeme : double; NATop : Integer; listaNotas:String): String;

var c01, c02, c03, c04, c05, c06, c07, c08,
    c09, c10, c11, c12, c13, c14, c15, c16,
    c17, c18, c19, c20, c21, c22, c23, c24, c25 : String;

begin
  // Campos
  c01 := '322';
  c02 := AdjustLeft(' ', 10, ' ');   // Filial
  c03 := AdjustLeft(' ',  5, ' ');   // Série
  c04 := AdjustLeft(IntToStr(numC),  12, ' ');
  c05 := FormatDateTime('ddMMyyyy', dtEm);
  c06 := 'C';
  c07 := AdjustLeft(FormataReal(peso),  7, ' ');
  c08 := AdjustLeft(FormataReal(vFrete),  15, ' ');
  c09 := AdjustLeft(FormataReal(ICMSbase),  15, ' ');
  c10 := AdjustLeft(FormataReal(ICMStaxa),  4, ' ');
  c11 := AdjustLeft(FormataReal(ICMSvalor),  15, ' ');
  c12 := AdjustLeft(FormataReal(vFrete / peso),  15, ' ');
  c13 := AdjustLeft(FormataReal(vFreteNF),  15, ' ');
  c14 := AdjustLeft(FormataReal(vSEC),  15, ' ');
  c15 := AdjustLeft(FormataReal(vITR),  15, ' ');
  c16 := AdjustLeft(FormataReal(vdespacho),  15, ' ');
  c17 := AdjustLeft(FormataReal(vPedagio),  15, ' ');
  c18 := AdjustLeft(FormataReal(vAdeme),  15, ' ');
  c19 := '1';
  c20 := AdjustLeft(IntToStr(NATop),  3, ' ');
  c21 := '';
  c22 := '';
  c23 := listaNotas;
  c24 := 'I';
  c25 := 'N';

  linha := c01 + c02 + c03 + c04 + c05 + c06 + c07 + c08
          +c09 + c10 + c11 + c12 + c13 + c14 + c15 + c16
          +c17 + c18 + c19 + c20 + c21 + c22 + c23 + c24 + c25;

  conhecimento := AdjustLeft(linha, 680, ' ');;
end;

{<<< 05 >>>----------------------------------------------------------------
|          Linha Totalizadora
---------------------------------------------------------------------------}
function TEDIc.Total_Conhec(qTot: Integer; vTot: double): String;

var c01, c02, c03 : String;

begin
  // Campos
  c01 := '323';
  c02 := AdjustLeft(IntToStr(qTot)    ,  4, ' ');
  c03 := AdjustLeft(FormataReal(vTot) , 15, ' ');

  linha := c01 + c02 + c03;
  Total_Conhec := AdjustLeft(linha, 680, ' ');;
end;


end.
