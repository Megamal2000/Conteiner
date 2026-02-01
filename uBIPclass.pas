unit uBIPclass;

interface

uses
  uBanco, SysUtils, uDM5, uDM1;

  type
  TBIP = class(TObject)
     private
       Bco : TBco;
       Bip2id, Bip2Notas : Integer;

     public
       procedure Iniciar(dt:TDateTime);
       procedure Salvar_BIP(notas:Integer);
       procedure Salvar_Nota(num, vol:Integer);
       procedure Apagar_Nota(num:Integer);
       procedure Conferir();
       procedure Mostra_Dias();
       function ConverteNumeroNota(sNUM:String):Integer;
       procedure set_idBIP(idB:Integer);


  end;

implementation

{ TBIP }

procedure TBIP.Apagar_Nota(num: Integer);
begin
  Bco := TBco.Create;
  Bco.BIP2_NF_Apaga(Bip2id, num);
  Bco.Destroy;

end;

procedure TBIP.Conferir;
begin

end;

function TBIP.ConverteNumeroNota(sNUM: String): Integer;
  var nNum, comp : Integer;
      s : String;

begin
  nNum := 0;
  s := '0';
  comp :=  Length(sNUM);
  //s := sNum.;
  // // WEB-43807805922651  - 92265  - 0592265
  if (Pos('EB', UpperCase(sNum)) >0)   then
  begin
    s:= copy(sNum, 12, Length(Trim(sNum)) - 12);
  end
  else
  // Só o número
  if (comp<12) then
  begin
     s := sNUM.Trim;
  end
  else
  // Código simples
  if (comp>14) and (comp<=20)  then
  begin
     s := copy(sNUM, 13, Length(trim(sNUM)) - 13);
  end
  else
  // Chave da Nota
  if comp>40 then
   begin
     s:= copy(sNum, 26, 9);
   end;



  // converte para número
  try
    nNum := StrToInt(s);
  except
    nNum := -1;
  end;

  ConverteNumeroNota := nNum;
end;

procedure TBIP.Iniciar(dt: TDateTime);
begin
  Bco := TBco.Create;
  Bco.BIP2_MostraData(dt);
  if (DM5.cdsBIP2.RecordCount>0) then
  Begin
    Bip2id := DM5.cdsBIP2ID.Value;
    Bip2Notas := DM5.cdsBIP2NOTASENT.Value;
    Bco.BIP2_NF_MostraIdB2(Bip2id);
  End
  else
    Bco.BIP2_Insere(dt);

  Bco.Destroy;
end;

procedure TBIP.Mostra_Dias;
begin
  Bco := TBco.Create;
  Bco.BIP2_Mostra;
  Bco.Destroy;
end;

procedure TBIP.Salvar_BIP(notas: Integer);
begin
  Bco := TBco.Create;
  Bco.BIP2_Altera_Notas(Bip2id, notas);
  Bco.Destroy;
end;

procedure TBIP.Salvar_Nota(num, vol: Integer);
begin
  Bco := TBco.Create;
  Bco.BIP2_NF_MostraNF(Bip2id, num);
  if (DM5.cdsBIP2nf.RecordCount>0) then
    Bco.BIP2_NF_Insere(Bip2id, num, vol)
  else
    Bco.BIP2_NF_AlteraVol(Bip2id, num, vol);
  Bco.Destroy;
end;

procedure TBIP.set_idBIP(idB: Integer);
begin
  BIP2id := idB;
end;

end.
