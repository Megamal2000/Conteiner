unit uRoma;

interface

uses
  DB, uDM1, uDM2, uDM3, uLib, DateUtils, SysUtils, uBanco;

type
  TRoma = class(TObject)

  private
    // variáveis


  protected

  public
    // procedures e métodos
    function  Converte_NumBD(num : Integer; dtR : TDateTime): Integer;
    function  Converte_BDNum(num : Integer): Integer;
    function  Pega_Ano(num : integer): Integer;
    procedure Reentrega(idNF : Integer);
    function  Pesquisa_Romaneio(R : String): Integer;
    function  Pesquisa_Romaneio_Motorista(R : String): String;

  published
end;

implementation

var resp : Integer;
    Bco : TBco;
// Converte Num --> BD


{ TRoma }

function TRoma.Converte_BDNum(num: Integer): Integer;

var ano  : Integer;
begin
  ano  := Pega_Ano(num);
  resp := num - (ano * 1000000);
  Converte_BDNum := resp;
end;

function TRoma.Converte_NumBD(num: Integer; dtR : TDateTime): Integer;

var ano : Integer;

begin
  ano  := YearOf(dtR);
  resp := num + (ano * 1000000);
  Converte_NumBD := resp;
end;

function TRoma.Pega_Ano(num: integer): Integer;

begin
  resp := num div 1000000;
  Pega_Ano := resp;
end;

function TRoma.Pesquisa_Romaneio(R: String): Integer;

var resp : integer;
    PesqNUM, ano : Integer;
    PesqDT  : TDateTime;

begin
    resp := 0;

    if (Pos('/', R) = 0) then
    begin
      PesqNUM := StrToInt(R);
      PesqDT  := Now;
    end
    else
    begin
      ano     := StrToInt(copy(R, Pos('/', R)+1, Length(R)));
      if (ano < 2000) then ano := ano + 2000;
      PesqNUM := StrToInt(copy(R, 1, Pos('/', R)-1));
      PesqDT  := EncodeDate(ano, 2, 2);
    end;

    resp := Converte_NumBD(PesqNUM, PesqDT);
    Pesquisa_Romaneio := resp;
end;

function TRoma.Pesquisa_Romaneio_Motorista(R: String): String;
var resp : String;
    PesqNUM, ano : Integer;
    PesqDT  : TDateTime;
    numRoma : Integer;

begin
    resp := '';

    if (Pos('/', R) = 0) then
    begin
      PesqNUM := StrToInt(R);
      PesqDT  := Now;
    end
    else
    begin
      ano     := StrToInt(copy(R, Pos('/', R)+1, Length(R)));
      if (ano < 2000) then ano := ano + 2000;
      PesqNUM := StrToInt(copy(R, 1, Pos('/', R)-1));
      PesqDT  := EncodeDate(ano, 2, 2);
    end;

    numRoma := Converte_NumBD(PesqNUM, PesqDT);

    Bco := TBco.Create;
    Bco.Romaneio_MostraNum(numRoma);
    Bco.Funcs_MostraId(DM1.cdsRomaLIGMOT.Value);
    Bco.Destroy;

    resp := DM1.cdsFuncsNOME.Value;
    Pesquisa_Romaneio_Motorista := resp;

end;

procedure TRoma.Reentrega(idNF: Integer);
begin
  // Transforma Nota em Reentrega

end;

end.
