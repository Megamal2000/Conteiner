unit uEDIdoc;

interface

uses
  SysUtils;

type
  TEDId = class(TObject)

  private
    // variáveis
    linha : String;
    cab_Transp : String;

  public
    // procedures e métodos
    Function arquivo(sCli : String):String;
    Function cabecalho(sCli : String):String;
    Function transp(cnpj, nome : String):String;
    Function cobranca(Filial, Tipo :String; numDOC:Integer; dtEmissao, dtVenc:tDateTime; vCob, vICMS, vJuros:double; dtLimite:tDateTime; vDesc:double;banco, agencia,  digitoAg, contaC, digitoCC: String  ): String;
    Function Lista_Conhec(Filial, serie : String; numConhec: Integer): String;
    Function NotasF(numNF:Integer; dtEmissao:tDateTime; vpeso, vMercadoria:Double;CNPJemissor:String):String;
    Function Total_Cobranca(qTot: Integer; vTot: double): String;

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
Function TEDId.arquivo(sCli: String):String;

var c01, c02, c03, c04, c05, c06 : String;

begin
  // Campos
  c01 := '000';
  c02 := AdjustLeft('FLAYDEL LOG ', 35, ' ');
  c03 := AdjustLeft(sCli          , 35, ' ');
  c04 := FormatDateTime('ddMMyy', Now);
  c05 := FormatDateTime('HHmm', Now);
  c06 := 'COB'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02 + c03 + c04 + c05 + c06;
  arquivo := AdjustLeft(linha, 170, ' ');;
end;

{<<< 02 >>>----------------------------------------------------------------
|          Linha Cabecalho
---------------------------------------------------------------------------}
function TEDId.cabecalho(sCli: String): String;

var c01, c02 : String;

begin
  // Campos
  c01 := '350';
  c02 := 'COBRA'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02;
  cabecalho := AdjustLeft(linha, 170, ' ');;

end;

{<<< 03 >>>----------------------------------------------------------------
|          Linha Transportadora
---------------------------------------------------------------------------}
function TEDId.transp(cnpj, nome: String): String;

var c01, c02, c03 : String;

begin
  // Campos
  c01 := '351';
  c02 := AdjustLeft(cnpj , 14, ' ');
  c03 := AdjustLeft(nome , 40, ' ');

  linha := c01 + c02 + c03;
  transp := AdjustLeft(linha, 170, ' ');;
end;

{<<< 04 >>>----------------------------------------------------------------
|          Linha Cobranca
---------------------------------------------------------------------------}
Function TEDId.cobranca(Filial, Tipo :String; numDOC:Integer; dtEmissao, dtVenc:tDateTime; vCob, vICMS, vJuros:double; dtLimite:tDateTime; vDesc:double;banco, agencia,  digitoAg, contaC, digitoCC: String  ): String;

var c01, c02, c03, c04, c05, c06, c07, c08,
    c09, c10, c11, c12, c13, c14, c15, c16,
    c17, c18, c19 : String;

begin
  // Campos
  c01 := '352';
  c02 := AdjustLeft(Filial, 10, ' ');   // Filial
  c03 := Tipo;   // Série
  c04 := AdjustLeft(' ',  3, ' ');
  c05 := AdjustLeft(IntToStr(numDoc),  3, ' ');
  c06 := FormatDateTime('ddMMyyyy', dtEmissao);
  c07 := FormatDateTime('ddMMyyyy', dtVenc);
  c08 := AdjustLeft(FormataReal(vCob),  15, ' ');
  c09 := AdjustLeft(' ',  3, ' ');
  c10 := AdjustLeft(FormataReal(vICMS),  15, ' ');
  c11 := AdjustLeft(FormataReal(vJuros), 15, ' ');
  c12 := FormatDateTime('ddMMyyyy', dtLimite);
  c13 := AdjustLeft(FormataReal(vDesc), 15, ' ');
  c14 := AdjustLeft(banco,  35, ' ');
  c15 := AdjustLeft(agencia, 4, ' ');
  c16 := digitoAg;
  c17 := AdjustLeft(contaC, 15, ' ');
  c18 := AdjustLeft(digitoCC,  2, ' ');
  c19 := 'I';

  linha := c01 + c02 + c03 + c04 + c05 + c06 + c07 + c08
          +c09 + c10 + c11 + c12 + c13 + c14 + c15 + c16
          +c17 + c18 + c19 ;

  cobranca := AdjustLeft(linha, 170, ' ');;
end;

{<<< 05 >>>----------------------------------------------------------------
|          Linha Totalizadora
---------------------------------------------------------------------------}
function TEDId.Lista_Conhec(Filial, serie : String; numConhec: Integer): String;

var c01, c02, c03, c04 : String;

begin
  // Campos
  c01 := '353';
  c02 := AdjustLeft(Filial, 10, ' ');   // Filial
  c03 := AdjustLeft(serie ,  5, ' ');
  c04 := AdjustLeft(IntToStr(numConhec),  12, ' ');

  linha := c01 + c02 + c03 + c04;
  Lista_Conhec := AdjustLeft(linha, 170, ' ');;
end;

{<<< 05 >>>----------------------------------------------------------------
|          Linha Notas
---------------------------------------------------------------------------}
function TEDId.NotasF(numNF: Integer; dtEmissao: tDateTime; vpeso,
  vMercadoria: Double; CNPJemissor: String): String;

var c01, c02, c03, c04, c05, c06, c07 : String;

begin
  // Campos
  c01 := '354';
  c02 := AdjustLeft(' ',  3, ' ');   // Filial
  c03 := AdjustLeft(IntToStr(numNF) ,  8, ' ');
  c04 := FormatDateTime('ddMMyyyy', dtEmissao);
  c05 := AdjustLeft(FormataReal(vPeso), 7, ' ');
  c06 := AdjustLeft(FormataReal(vMercadoria), 15, ' ');
  c07 := AdjustLeft(CNPJemissor,  14, ' ');

  linha  := c01 + c02 + c03 + c04 + c05 + c06 + c07;
  NotasF := AdjustLeft(linha, 170, ' ');

end;


{<<< 07 >>>----------------------------------------------------------------
|          Linha Totalizadora
---------------------------------------------------------------------------}
function TEDId.Total_Cobranca(qTot: Integer; vTot: double): String;

var c01, c02, c03 : String;

begin
  // Campos
  c01 := '355';
  c02 := AdjustLeft(IntToStr(qTot)    ,  4, ' ');
  c03 := AdjustLeft(FormataReal(vTot) , 15, ' ');

  linha := c01 + c02 + c03;
  Total_Cobranca := AdjustLeft(linha, 680, ' ');;
end;




end.
