unit ExcelResponde;

interface

uses ComObj,DB;

type Txlr = class(TObject)
  private
    var Excel : variant;

  protected

  public
    // variaveis
    mQuant : integer;
    mArq : String;
    mColPesq, mLinAtual : Integer;
    mEscreveCol : Array[1..9] of Integer;
    mEscreveConteudo : Array[1..9] of String;

    // Procedimentos
    procedure Inicia;
    function LeLinha:String;
    procedure Fim;
    procedure EscreveCel(lin, col:Integer; valor : String);
    function Conta : Integer;


end;


implementation

{ Txlr }

function Txlr.Conta: Integer;
  var i : Integer;
      conteudo : String;
      temp : variant;
begin
  i := 2;
  conteudo := 'xxx';
  while length(conteudo) > 0 do
  begin
    temp := Excel.Workbooks[1].Sheets[1].Cells[i, mColPesq];
    conteudo := temp;
    i := i + 1;
  end;
  Result := i - 2;
end;

procedure Txlr.EscreveCel(lin, col: Integer; valor : String);
begin
  Excel.Workbooks[1].Sheets[1].Cells[lin, col] := Valor;
end;

procedure Txlr.Fim;
begin
  Excel.quit;
end;

procedure Txlr.Inicia;
begin
  //Abre o arquivo Excel para importar
  Excel := CreateOleObject('Excel.Application');
  Excel.Visible := True;
  Excel.WorkBooks.Open(mArq);
end;

function Txlr.LeLinha: String;
  var temp : Variant;
begin
  temp := Excel.Workbooks[1].Sheets[1].Cells[mLinAtual, mColPesq];
  Result := temp;
end;

end.
