unit uRastreio;

{
   Locais de Insercao
   Notas - NotasP
   - Quando Insere Nota
   - Quando Cria Reentrega
   - Quando Retira Nota do Romaneio
   ImpXLS
   - Quando Importa usando Excel
   ImpXML
   - Quando Importa usando XML da NF-e
   Romaneio - Roman
   - Quando Insere a Nota (só existe uma sem Romaneio)

   procurar: EVENTO NF
}

interface

uses uBanco, uDM1, uDM4, Global;

type Tevento = (evrImportado=1, evrDigitado=2, evrNaTransp=3, evrBIP=5, evrERRO=10, evrCTE=15,
                evrEmConferencia=14,   evrEmRota=20, evrRetiraRoma=21, evrReent=25, evrDescarteROT=26, evrDescarteSEM=27, evrNaWEB=30,
                evrPendeAguarde=40, evrPendeOK=41, evrPendeNaoOK=42, evrTicado=67, evrConcluiOcor=70,
                evrConcluiEntregue=80,evrConcluiEntregueLote=81,evrConcluiEntregueWeb=82,  evrRetiraBaixa=85, evrConcluiDevolve=90,
                evrDevolveCli=95, evrApagarSemCli=98, evrApagarSemRoma=99  );


type

  TRastreio = class(TObject)

  published

  protected

  protected

  public
    procedure set_ocor(NumNF, LigCli, Serie: Integer; evento:Tevento);overload;
    procedure set_ocor(NumNF, LigCli, Serie: Integer; evento:Tevento; idU:Integer);overload;
    procedure set_ocorID(idNF, idUser: Integer; ev:Tevento);
    procedure Lista_NaoEnviados(tipoEvento : Integer);
    function  get_NaoEnviados(): Integer;
    procedure Retira_Romaneio(NumNF, LigCli, numRoma: Integer);
    procedure Insere_Romaneio(NumNF, LigCli, numRoma: Integer);
    procedure Insere_Baixa(NumNF, LigCli, numRoma, idUs: Integer);

end;

implementation

var nOCO : Integer;
    Bco : TBco;
    totNAO : Integer;

{ TRastreio }

// **********************************
//   dez/2017
{
    //1 a 99: códigos de ocorrência de recebimento ou não
1. Importado ou criado manual
   Status Cliente: 01= Na Transportadora   x
2. BIPado
   Status Cliente: 05= Na Transportadora*
3. Recebido com ERRO
   Status Cliente: 10= Aguardando solução de problema
4. Emitido o Cte
   Status Cliente: 15= Emitido Ct-e
5. Inserido no Romaneio
   Status Cliente: 20= Em ROTA  x (Roman e RotasAdm)
6. Retirado no Romaneio
   Status Cliente: 21= Retirado do Romaneio  x
7. Inserido no Romaneio novamente  x
   Status Cliente: 25= Em ROTA reentrega
8. Enviado para WEB  x
   Status Cliente: 30= Na WEB  ==> Em Rota
9. Conclusão (data da ocorrência)
   Status Cliente: 70= Concluída Ocorrência
10.Baixa como Entregue
   Status Cliente: 80= Concluída Entregue na Nota
   Status Cliente: 81= Concluída Entregue no Lote (por Romaneio)
   Status Cliente: 82= Concluída Entregue vindo WEB

11.Retira Baixa
   Status Cliente: 85= Retira Baixa
12. Baixa como Devolvida
   Status Cliente: 90= Concluída Devolução
13.Devolvida ao Cliente
   Status Cliente: 95= Devolvida ao Cliente
 }
// **********************************


function TRastreio.get_NaoEnviados: Integer;
begin
  totNao := DM4.cdsNFa.RecordCount;
end;

procedure TRastreio.Insere_Baixa(NumNF, LigCli, numRoma, idUs: Integer);
var nOc : Integer;
    nSerie, idU : Integer;

begin
  // IdUser vem do Global
  if idUs=0 then idU := idUser else idU := idUs;

  nSerie := 0;
  nOc := 80;
  Bco := TBco.Create;
  nSerie := Bco.Notas_Fases_NumSerie(LigCli,NumNF);
  if (nSerie = 0) then nSerie := Bco.Notas_SeriePadrao(ligCli);
  Bco.Notas_Fases_Insere(LigCli,NumNF, nOc, idU, numRoma, nSerie);
  Bco.Destroy;

end;

procedure TRastreio.Insere_Romaneio(NumNF, LigCli, numRoma: Integer);
var nOc : Integer;
    nSerie : Integer;

begin
  nSerie := 0;
  nOc := 20;
  Bco := TBco.Create;
  //nSerie := Bco.Notas_Fases_NumSerie(LigCli,NumNF);
  //if (nSerie = 0) then nSerie := Bco.Notas_SeriePadrao(ligCli);
  Bco.Notas_Fases_Insere(LigCli,NumNF, nOc, idUser, numRoma, nSerie);
  Bco.Destroy;
end;


procedure TRastreio.Lista_NaoEnviados(tipoEvento: Integer);
begin
  Bco := TBco.Create;
  Bco.Notas_Fases_Lista(tipoEvento);
  Bco.Destroy;
end;


procedure TRastreio.Retira_Romaneio(NumNF, LigCli, numRoma: Integer);
var nOc : Integer;
    nSerie : Integer;

begin
  nSerie := 0;
  nOc := 21;
  Bco := TBco.Create;
  nSerie := Bco.Notas_Fases_NumSerie(LigCli,NumNF);
  if (nSerie = 0) then nSerie := Bco.Notas_SeriePadrao(ligCli);
  Bco.Notas_Fases_Insere(LigCli,NumNF, nOc, idUser, numRoma, nSerie);
  Bco.Destroy;
end;


procedure TRastreio.set_ocor(NumNF, LigCli, Serie: Integer; evento:Tevento);

var nOc : Integer;
    nSerie : Integer;

begin
  nSerie := Serie;
  nOc := Integer(evento);
  Bco := TBco.Create;
  if (nSerie = 0) then nSerie := Bco.Notas_Fases_NumSerie(LigCli,NumNF);
  if (nSerie = 0) then nSerie := Bco.Notas_SeriePadrao(ligCli);
  Bco.Notas_Fases_Insere(LigCli,NumNF, nOc, idUser, 0, nSerie);
  Bco.Destroy;
end;





procedure TRastreio.set_ocor(NumNF, LigCli, Serie: Integer; evento: Tevento;
  idU: Integer);

  var nOc : Integer;
    nSerie : Integer;

begin
  nSerie := Serie;
  nOc := Integer(evento);
  Bco := TBco.Create;
  if (nSerie = 0) then nSerie := Bco.Notas_Fases_NumSerie(LigCli,NumNF);
  if (nSerie = 0) then nSerie := Bco.Notas_SeriePadrao(ligCli);
  Bco.Notas_Fases_Insere(LigCli,NumNF, nOc, idU, 0, nSerie );
  Bco.Destroy;
end;


procedure TRastreio.set_ocorID(idNF, idUser: Integer; ev:Tevento);
begin
  Bco := TBco.Create;
  Bco.Notas_MostraID(idNF );
  Bco.Destroy;
  set_Ocor(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value, DM1.cdsNotasSERIENF.Value, ev, idUser);
end;

end.
