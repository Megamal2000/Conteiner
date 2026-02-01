unit veEstoque;

interface

uses  veDM, veBanco, uLib, Global;

type
  TStok = class(TObject)
  private

  protected

  public
  function ConectarEstoque:boolean;
  procedure Le_Padrao;
  procedure Inicia_Bancos;
  procedure Fecha;
  // Mostra Dados
  function moTipo(tp:string):String;
  function moStatus(st:Smallint):String;
  function moOrigem(Orig:Smallint):String;
  function moConfere(stC:Smallint):String;
  procedure moItens(idNF : Integer);

  // alterar o Estoque
  function Altera_Estoque(idNF:Integer): Boolean;
  procedure Altera_Estoque_Prod(ligcli, ligProd, ligSub, Quant, ObsMove:Integer; es:String; numNF:integer);
  procedure Excluir_Nota(idNF:Integer);
  procedure Confere_Marca(idNF:Integer);
  procedure Confere_ListaNF();

end;

implementation

{ TStok }

function TStok.Altera_Estoque(idNF: Integer): Boolean;
  var Bce : TBce;
      resp : Boolean;
      obs : Smallint;
      modo:String;
      numNF:integer;

  begin
  resp := true;

  Bce := TBce.Create;
  Bce.Estoque_ItensNF(idNF);
  obs := Bce.TraduzTipoObs(eDM.cdsNFi2TIPO.Value);

  try
    // Insere Item por Item
    eDM.cdsNFi2.First;
    while not eDM.cdsNFi2.Eof  do
    begin
      modo := '+';
      if eDM.cdsNFi2TIPO.AsString = 'S' then modo := '-';
      numNf := 0;
      if eDM.cdsNFi2NUMNF.Value>0 then numNF := eDM.cdsNFi2NUMNF.Value;


      // Altera Estoques
      Altera_Estoque_Prod(eDM.cdsNFi2LIGCLI.Value, eDM.cdsNFi2LIGPROD.Value, eDM.cdsNFi2LIGSUB.Value, eDM.cdsNFi2QUANT.Value,obs, modo, numNF);

      // Marca
      Bce.Geral_AlterarStatus(idNF, 3, 'TBE_NF', 'status');  // no estoque
      Bce.Geral_AlterarStatus(idNF, idUser, 'TBE_NF', 'LigUser'); // usuario que fez
      Bce.Geral_AlterarStatus(eDM.cdsNFi2LIGSUB.Value, 3, 'TBE_NFitens', 'status');  // no estoque


      eDM.cdsNFi2.Next;
    end;
  except
    resp := false;
  end;
  Bce.Destroy;
  result := resp;
end;

{
   ÚNICO
   Método para alterar os estoque - só pode existir ele
   - alterado em 23.jan.2023
}
procedure TStok.Altera_Estoque_Prod(ligcli, ligProd, ligSub, Quant, ObsMove: Integer; es:String; numNF:integer);
  var sTipo : String;
      Bce : TBce;

begin
    // es = entrada ou saída / verificar se é para somar ou subtrair
    // Tipo são vários E/S/D/M/A
    sTipo := Bce.TraduzObsTipo(ObsMove);
    Bce := TBce.Create;
    // Altera Estoques
    Bce.Estoque_AlteraSub(ligSub,Quant,es);
    Bce.Estoque_AlteraProduto(ligProd, Quant,es);
    // Historicos
    Bce.Move_Insere(ligCli, ligProd, ligSub, Quant, ObsMove, sTipo, es, numNF);
    Bce.Destroy;

end;

function TStok.ConectarEstoque:boolean;

var usa : TMarco;
    serv : string;
    ok : boolean;

begin
       ok := false;
       usa := TMarco.Create;
       eCli := usa.get_cliStok;
       usa.Le_INI;

       serv := usa.get_bdstok;
       eCli := usa.get_cliStok;
       ok := usa.TestaCon(eDM.ConSTOK, serv);
       usa.Destroy;

       result := ok;
end;

procedure TStok.Confere_ListaNF;
begin

end;

procedure TStok.Confere_Marca(idNF: Integer);
begin

end;

procedure TStok.Excluir_Nota(idNF: Integer);
  var Bce : TBce;
      resp : Boolean;
begin
  Bce := TBce.Create;
  Bce.Estoque_ItensNF(idNF);
  // Apagar Itens
  eDM.cdsNFi2.First;
  while not eDM.cdsNFi2.Eof  do
  begin
    // Apagando...
    Bce.NFitem_Apagar(eDM.cdsNFi2ID.Value);
    eDM.cdsNFi2.Next;
  end;
  // Apagar Nota
  Bce.NF_Apagar(idNF);
  Bce.Destroy;



end;

procedure TStok.Fecha;
begin
  eDM.ConSTOK.Connected := false;
end;

procedure TStok.Inicia_Bancos;
  var Bce : TBce;
begin
  eCli := 0;
  Bce := TBce.Create;
  Bce.Cli_Mostrar;
  if eDM.cdsCli.RecordCount>0 then
  begin
    Le_Padrao;
    if eCli=0 then
    begin
      eDM.cdsCli.First;
      eCli := eDM.cdsCliID.Value;
    end;
    Bce.Prod_Mostrar(eCli);
    Bce.Prod_SubMostrar(eCli);
  end;
  Bce.Destroy;
end;

procedure TStok.Le_Padrao;

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  eCli := usa.get_cliStok;
  usa.Destroy;
end;




function TStok.moConfere(stC: Smallint): String;
  var s : String;
begin
  s := 'Não Conferido';
  if (stC = 1) then s := 'Conferido: Ok';
  if (stC = 2) then s := 'Conferido: Erro';

  Result := s;
end;

procedure TStok.moItens(idNF: Integer);
  var Bce : TBce;
begin
  Bce := TBce.Create;
  Bce.NFitem_mostra( idNF);
  Bce.Destroy;
end;

function TStok.moOrigem(Orig: Smallint): String;
  var s : String;
begin
  s := 'Manual';
  if (orig = 1) then s := 'Importado: XML';
  if (orig = 2) then s := 'Importado: EDI';
  Result := s;
end;

function TStok.moStatus(st: Smallint): String;
  var s : String;
begin
  s := 'Iniciado';
  if (st = 1) then s := 'Pronto';
  if (st = 2) then s := 'Conferido';
  if (st = 3) then s := 'Estoque';

  Result := s;
end;

function TStok.moTipo(tp: string): String;
  var s : String;
begin
  s := 'Entrada';
  if (tp = 'D' ) then s := 'Devolução';
  if (tp = 'S' ) then s := 'Saída';
  Result := s;
end;

end.
