unit uEDIoco;

interface

uses
  SysUtils;

type
  TEDIo = class(TObject)

  private
    // variáveis
    linha : String;
    cab_Transp : String;

  public
    // procedures e métodos
    Function arquivo(sCli : String):String;
    Function cabecalho(sCli : String):String;
    Function transp(cnpj, nome : String):String;
    Function ocorrencia(numNF, nOcorr:Integer; dtEnt, hrEnt : tdateTime):String;


end;

implementation



{ TEDIo }

{<<< 00 >>>----------------------------------------------------------------
|          AdjustLeft
---------------------------------------------------------------------------}
function AdjustLeft(st:string; qt:byte; ch:char) : string;
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

{<<< 01 >>>----------------------------------------------------------------
|          Linha Arquivo
---------------------------------------------------------------------------}
Function TEDIo.arquivo(sCli: String):String;

var c01, c02, c03, c04, c05, c06 : String;

begin
  // Campos
  c01 := '000';
  c02 := AdjustLeft('FLAYDEL LOG ', 35, ' ');
  c03 := AdjustLeft(sCli          , 35, ' ');
  c04 := FormatDateTime('ddMMyy', Now);
  c05 := FormatDateTime('HHmm', Now);
  c06 := 'OCO'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02 + c03 + c04 + c05 + c06;
  arquivo := AdjustLeft(linha, 120, ' ');;
end;

{<<< 02 >>>----------------------------------------------------------------
|          Linha Cabecalho
---------------------------------------------------------------------------}
function TEDIo.cabecalho(sCli: String): String;

var c01, c02 : String;

begin
  // Campos
  c01 := '340';
  c02 := 'OCORR'+FormatDateTime('ddMM', Now)+FormatDateTime('HHmm', Now)+'0';

  linha := c01 + c02;
  cabecalho := AdjustLeft(linha, 120, ' ');;

end;

{<<< 03 >>>----------------------------------------------------------------
|          Linha Transportadora
---------------------------------------------------------------------------}
function TEDIo.transp(cnpj, nome: String): String;

var c01, c02, c03 : String;

begin
  // Campos
  c01 := '341';
  c02 := AdjustLeft(cnpj , 14, ' ');
  c03 := AdjustLeft(nome , 40, ' ');

  linha := c01 + c02 + c03;
  transp := AdjustLeft(linha, 120, ' ');;
end;

{<<< 04 >>>----------------------------------------------------------------
|          Linha Transportadora
---------------------------------------------------------------------------}
function TEDIo.ocorrencia(numNF, nOcorr: Integer; dtEnt,
  hrEnt: tdateTime): String;

var c01, c02, c03, c04, c05, c06, c07, c08 : String;

begin
  // Campos
  c01 := '342';
  c02 := '00300907000176';
  c03 := AdjustLeft('3',  3, ' ');
  c04 := AdjustLeft(IntToStr(numNF),  8, ' ');
  c05 := IntToStr(nOcorr);
  if (nOcorr<10) then c05 := '0'+c05;

  c06 := FormatDateTime('ddMMyyyy', dtEnt);
  c07 := FormatDateTime('HHmm', hrEnt);

  c08 := '03';

  linha := c01 + c02 + c03 + c04 + c05 + c06 + c07 + c08;
  ocorrencia := AdjustLeft(linha, 120, ' ');;
end;


end.
