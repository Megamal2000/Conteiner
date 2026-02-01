unit uImp;

interface

// Exportar
Function Lin216(mm : real):String;


var
  //Para impressora
  NegritoON, NegritoOFF,
  ItalicoON, ItalicoOFF,
  TamPagina, AvancoPag,
  Letra10cpi, Letra12cpi,
  Condensado,
  EV16,EV18,EV772 : String[5];

implementation

Function Lin216(mm : real):String;

var nb : byte;
    nc : Char;
    ni : integer;

begin
  ni := round(mm*8.5039);
  nc := Chr(ni);
  Lin216 := #27+'J'+nc;
end;

begin
   // Formatações
  NegritoON := #27+#69;
  NegritoOFF:= #27+#70;
  ItalicoON := #27+#52;
  ItalicoOFF:= #27+#53;

  // Tamanho = 4 polegadas
  TamPagina := #27+'C'+#0+#6;
  AvancoPag := #12;

  // Letras 10, 12 cpi e Condensado
  Letra10cpi := #27+'!'+#0;
  Letra12cpi := #27+'!'+#1;
  Condensado := #27+'!'+#4;

  //Espacamento vertical
  EV16  := #27+'2';  // Padrão 1/6 pol
  EV18  := #27+'0';  // 1/8 pol
  EV772 := #27+'1';  // 7/72 pol

end.
 