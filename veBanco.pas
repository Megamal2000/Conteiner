unit veBanco;

interface

uses Variants, SysUtils, StdCtrls, veDM, gBanco, SQLExpr, DBClient, Global, DB;

type
  // tipadas
  TstNF = (nfDigitada=0, nfPronta=1, nfConferida=2, nfEstoque=3, nfAnulada=4, nfCancelada=5);
  TstConferida = (cfNao=0, cfOk=1, cfErro=2, cfNaoVeio=3, cfMenor=4, cfMaior=5);
  TstSefaz = (sefNada=0, sefCriada=1, sefAssinada=2, sefValidada=3, sefEnviada=4,
              sefNumCancel=5, sefCancelada=6, sefDenegada=7, sefRegeitada=8);
  TstOrigem = (origManual=0, origXML=1, origEDI=2, origAPI);

  // Classe
  TBce = class(TObject)
  private
    sq : String;
    SubUM : Integer;
  protected

  public
  // Uteis
  function TraduzTipoObs(sTipo:String):smallint;
  function TraduzObsTipo(Obs:Smallint):String;

  // Geral ALterar Status
  procedure Geral_AlterarStatus(id, Status:Integer; sTab, sCampo:String);
  function  Geral_RetornarString(id:Integer; sTab, sCampo:String):String;
  function  Geral_RetornarInteiro(id:Integer; sTab, sCampo:String):Integer;
  // Clientes

  procedure Cli_Mostrar();
  procedure Cli_MostrarF(at:Smallint; id:Integer);
  procedure Cli_fMostrarF(at:Smallint; id:Integer);
  procedure Cli_Inserir(id:Integer; nome, cnpj:String);
  procedure Cli_Alterar(id, at:Integer; cnpj:String);
  procedure Cli_PadraoCB(var lista: Tcombobox);
  function  Cli_Padrao:String;
  procedure Cli_PreencheCB(var lista: Tcombobox);
  function  Cli_RecebeID(escolhido:String):Integer;
  function  Cli_existe(idc:Integer):boolean;
  procedure Cli_Ativo(idC:Integer; b:boolean);
  function  Cli_Nome(idC:Integer):String;
  function  fCli_Nome(idC:Integer):String;
  function  fCli_Id(Nome:String):Integer;
  procedure Cli_CB_fPreenche(var cb:TComboBox);
  procedure Cli_CB_fID(var Lista:TComboBox; idC:Integer);

  // Produtos
  procedure Prod_Mostrar(idC:Integer);
  procedure Prod_Inserir(NomeL, NomeC, C1,C2,C3,C4:String; ativo, val, fifo, qtMin, qtPalete, ligCli: Integer);
  procedure Prod_Alterar(idPr: Integer; NomeL, NomeC, C1,C2,C3,C4:String; ativo, val, fifo, qtMin, qtPalete: Integer);
  procedure Prod_AlterarNmCurto(idPr: Integer; NomeC:String);
  function  Prod_fID(NomeL:String):Integer;
  procedure Prod_fMostrarTodos();
  procedure Prod_MostrarEstoque(idC:Integer; tipo:Smallint);
  procedure Prod_MostrarEstoqueSub(idP:Integer);
  procedure Prod_MostrarEstoqueHist(idS:Integer);
  procedure Prod_Apagar(idP:Integer);

  procedure Prod_SubMostrar(idC:Integer);
  procedure Prod_SubInserir(ligCli, ligProd:Integer; NomeS, CodB, CodC, CodT, Unid:String; ativo, qtMin, qtUM :Integer);
  procedure Prod_SubAlterar(idSub:Integer; NomeS, CodB, CodC, CodT, Unid:String; ativo, qtMin, qtUM :Integer);
  procedure Prod_fSubIDP(idP:Integer);
  procedure Prod_fSubMostrarTodos();
  function  Prod_LSubNome(idS:Integer):String;

  procedure Prod_Pesquisado(idC: Integer);
  function  Prod_fPesqBar(sNum:String):boolean;
  procedure Prod_fPesqNome(sNome:String);
  procedure Prod_fPesqCode(sNum:String);
  procedure Prod_fPesqCodeCli(sNum:String);
  procedure Prod_fPesqMostrarTodos();
  procedure Prod_Class(var Lista:TComboBox; n:smallint; idC : Integer);

  // ESTOQUE - Alterações
  procedure Estoque_ItensNF(idNF:Integer);
  function  Estoque_fPosicaoSub(idSub:Integer):Integer;
  function  Estoque_fPosicaoProduto(idProd:Integer):Integer;
  function  Estoque_LPosicaoSub(idSub:Integer):Integer;
  function  Estoque_LPosicaoProduto(idProd:Integer):Integer;

  function  Estoque_PosicaoSub(idSub:Integer):Integer;
  function  Estoque_PosicaoProduto(idProd:Integer):Integer;

  procedure Estoque_AlteraSub(idSub, qt: Integer; tipo:string);
  procedure Estoque_AlteraProduto(idProd, qt: Integer; tipo:string);

  // MOVIMENTAÇÃO
  procedure Move_Insere(LigCli, Ligprod, LigSub, Quant, ObsMove:Integer; tipo, modo:String; numdoc:integer);


  // Confere
  procedure Confere_ListaBD(idCli, tipo, nNF:Integer);
  procedure Confere_ListaNF(idCli, tipo, nNF: Integer);
  procedure Confere_Marca(idNF, st:Integer);

  procedure NF_Insere(idCli, numnf, liguser, itens, vol, numPed, bPed:integer; tipo, doc, dimensao:String; dtNota:TDatetime; vTot, vProd, Peso:double; ua, um, us, up, ue:Smallint);
  procedure NF_Altera(idNF, numnf, itens, vol, numPed, bPed:integer; tipo, doc, dimensao:String; dtNota:TDatetime; vTot, vProd, peso:double; ua, um, us, up, ue:Smallint);
  procedure NF_Apagar(idNF:Integer);
  procedure NF_status(idNF:Integer; status:Integer); overload;
  procedure NF_status(idNF:Integer; status:TstConferida); overload;
  procedure NF_status(idNF:Integer; status:TstSefaz); overload;
  procedure NF_status(idNF:Integer; status:TstOrigem); overload;
  procedure NF_mostra(idCli:Integer);
  procedure NF_mostraID(idNF:Integer);
  procedure NF_mostraDT(dt:TDateTime);
  procedure NF_mostraPendentes(idCli, tipo:Integer);
  procedure NF_mostraFinalizadas(idCli:integer; dt1, dt2: TDateTime );
  procedure NF_fPesq(num:Integer); overload;
  procedure NF_fPesq(sDocs:String); overload;
  function  NF_fExiste(num, idC:Integer):Integer;

  procedure NFitem_Insere(idCli, idNF, ligProd, ligSub, numNF, Quant:Integer; dtNota:TDateTime; vUnit, vSubt:double; tipo:String );
  procedure NFitem_Altera(idItem, numNF, Quant:Integer; dtNota:TDateTime; vUnit, vSubt:double; tipo:String );
  procedure NFitem_AlteraQtLida(idItem, Quantlida:Integer );
  procedure NFitem_Apagar(idItem:Integer);
  procedure NFitem_status(idItem:Integer; status:TstNF); overload;
  procedure NFitem_status(idItem:Integer; status:TstConferida); overload;
  procedure NFitem_mostra( idNF:Integer);
  procedure NFitem_fMostraNF(idNF:Integer);
  function  NFitem_fExiste(idNF,idSub:Integer):Integer;

  procedure Cobra_Insere(idCli, bVal : Integer; dVal:TDateTime;
     Atipo:String; Aporc, Afixo, Alimite, Aexcede, Aminimo: double;
     Sdia:Smallint; Staxa, Sminimo: double;
     Mtipo, MdTipo:String; McontaDe, McontaDs, McontaDd: Smallint; MvlrDe,MvlrDs,MvlrDd, Mporc, Mminimo:double;
     Ptipo, Pconta:Smallint; Pporc, Pvalor, Pminimo:double;
     Etipo, Econta:Smallint; Eporc, Evalor, Eminimo:double);
  procedure Cobra_Altera(idCobra, bVal : Integer; dVal:TDateTime;
     Atipo:String; Aporc, Afixo, Alimite, Aexcede, Aminimo: double;
     Sdia:Smallint; Staxa, Sminimo: double;
     Mtipo, MdTipo:String; McontaDe, McontaDs, McontaDd: Smallint; MvlrDe,MvlrDs,MvlrDd, Mporc, Mminimo:double;
     Ptipo, Pconta:Smallint; Pporc, Pvalor, Pminimo:double;
     Etipo, Econta:Smallint; Eporc, Evalor, Eminimo:double);
  procedure Cobra_Mostra();
  procedure Cobra_Mostra2();
  procedure Cobra_fMostraID(idCob:Integer);
  procedure Cobra_fPesq(nomeCli:String; bValidos:boolean);

end;

var BCe : TBce;
    Bcg : TBcg;

implementation



function bdValor(num: double):String;
var i : integer;
    s, n : String;
begin
  s := '';
  n := FloatToStr(num);
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + '.';
  end;
  result := s;

end;

function bdDOC(doc:string):String;

var i : integer;
    s, n : String;
begin
  s := '';
  n := doc;
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
  end;
  result := s;
end;

function bdData(dt:TdateTime):String;
  var s : String;
begin
  s := FormatDateTime('yyy-MM-dd', dt);
  result := s;
end;

procedure ExecSQL(comSQL, descr:String);

begin
  Bcg := TBcg.Create;
  Bcg.sqlExecuta(comSQl, descr);
  Bcg.Destroy;
end;

procedure RodaSQL(Datset:TSQLDataSet; Clientds:TClientDataSet; comSQL:String);

begin
  Bcg := TBcg.Create;
  Bcg.sqlRoda(DatSet, Clientds, comSQL);
  Bcg.Destroy;
end;

procedure RodaSQLtemp(comSQL:String);

begin
  Bcg := TBcg.Create;
  Bcg.sqlRoda(eDM.sdsTMPe, eDM.cdsTMPe, comSQL);
  Bcg.Destroy;
end;


function bdNum(n:Double):String;
var resp : String;
begin
  resp := FormatFloat('#0.00',n);
  resp.Replace(',', '.');

  result := resp;
end;

function TBce.TraduzTipoObs(sTipo:String):smallint;
   var ObsMove : Smallint;
begin
    ObsMove := 0;
    if (sTipo = 'E') then ObsMove := 1;
    if (sTipo = 'S') then ObsMove := 2;
    if (sTipo = 'D') then ObsMove := 3;
    if (sTipo = 'M') then ObsMove := 4;
    if (sTipo = 'A') then ObsMove := 5;

    result := ObsMove;
end;

function TBce.TraduzObsTipo(Obs:Smallint):String;
   var sTipo:String;
begin
    sTipo := 'A';
    case Obs of
       1: sTipo := 'E';
       2: sTipo := 'S';
       3: sTipo := 'D';
       4: sTipo := 'M';
       5: sTipo := 'A';
    end;
    result := sTipo;
end;

{ TBce }


procedure TBce.Cli_Alterar(id, at: Integer; cnpj: String);
begin
  sq := 'UPDATE TBE_CLIENTE SET ';
  sq := sq + '  NotaCNPJ = ' + QuotedStr(cnpj);
  sq := sq + ', Ativo = '+ at.ToString;
  sq := sq + '  WHERE id = ' + id.ToString;
  ExecSQL(sq , 'Alterar');
end;

procedure TBce.Cli_Ativo(idC:Integer; b: boolean);
  var at : smallint;
begin
  at := 1;
  if not b then at := 0;

  sq := 'UPDATE TBE_CLIENTE SET ativo = '+ at.ToString;
  sq := sq + '  WHERE id = ' + idC.ToString;
  ExecSQL(sq , 'Alterar');
end;

function TBce.Cli_existe(idc: Integer): boolean;
var existe : boolean;
begin
  existe := false;
  if (eDM.cdsCli.RecordCount>0) then
  begin
    eDM.cdsCli.First;
    while not eDM.cdsCli.Eof  do
    begin
      if (idc = eDM.cdsCliID.Value) then existe := true;

      eDM.cdsCli.Next;
    end;
  end;

  result := existe;
end;

procedure TBce.Cli_Inserir(id: Integer; nome, cnpj: String);
begin
  sq := 'INSERT INTO TBE_CLIENTE (id, nome, ativo, NotaCNPJ) VALUES (';
  sq := sq + '  ' + id.ToString;
  sq := sq + ', ' + QuotedStr(Nome);
  sq := sq + ', 1' ;
  sq := sq + ', ' + QuotedStr(CNPJ);
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');
end;

procedure TBce.Cli_Mostrar;
begin
  sq := ' Select * from TBE_CLIENTE ';
  RodaSQL(eDM.sdsCli, eDM.cdsCli, sq);
end;

procedure TBce.Cli_MostrarF(at: Smallint; id: Integer);
begin
  sq := ' Select * from TBE_CLIENTE ';
  if (at<2) then sq := sq + ' Where ativo = '+at.ToString;
  if (id>0) then
  if (at<2) then sq := sq + ' and id = '+id.ToString
    else sq := sq + ' Where id = '+id.ToString;
  RodaSQL(eDM.sdsCli, eDM.cdsCli, sq);
end;

procedure TBce.Cli_fMostrarF(at: Smallint; id: Integer);
begin
  eDM.cdsCli.Filtered := false;
  if id > 0 then
  begin
    eDM.cdsCli.Filter := 'id = ' + id.ToString;
    eDM.cdsCli.Filtered := True;
  end
  else
  if at<2 then
  begin
    eDM.cdsCli.Filter := 'at = ' + at.ToString;
    eDM.cdsCli.Filtered := True;
  end;
end;

function TBce.Cli_Nome(idC: Integer): String;
var nm:STring;
begin
  nm := '';
  sq := 'select Nome from TBE_CLIENTE where id = ' + idC.ToString;
  RodaSQLtemp(sq);
  if eDM.cdsTMPe.RecordCount> 0 then nm := eDM.cdsTMPe.Fields[0].AsString;
  result := nm;
end;

function TBce.Cli_Padrao: String;
  var s : String;
begin
  s := '';
  Cli_fMostrarF(1,eCli);
  if eDM.cdsCli.RecordCount>0 then
    s := eDM.cdsCliNOME.Value;
  result := s;
end;

procedure TBce.Cli_PadraoCB(var lista: Tcombobox);

begin
  Bcg := TBcg.Create;
  Bcg.oiCp_Pos(lista, 'TBE_Cliente', eCli.ToString, 'NOME', eDM.sdsTMPe, eDM.cdsTMPe );
  //Bcg.oiCp_Pos2(lista, 'TBE_Cliente', eCli.ToString, 'NOME' );
  Bcg.Destroy;
end;

procedure TBce.Cli_PreencheCB(var lista: Tcombobox);
begin
  Bcg := TBcg.Create;
  Bcg.oiCb_Preenche(lista, 'TBE_Cliente',  'NOME',' ativo = 1 ', eDM.sdsTMPe, eDM.cdsTMPe );
  Bcg.Destroy;
end;

function TBce.Cli_RecebeID(escolhido:String): Integer;
  var resp : Integer;
begin
  resp := 0;
  Bcg := TBcg.Create;
  resp := Bcg.oiCp_leid(escolhido, 'TBE_Cliente',  'NOME', eDM.sdsTMPe, eDM.cdsTMPe );
  Bcg.Destroy;

  result := resp;
end;

procedure TBce.Cobra_Altera(idCobra, bVal: Integer; dVal: TDateTime;
  Atipo: String; Aporc, Afixo, Alimite, Aexcede, Aminimo: double;
  Sdia: Smallint; Staxa, Sminimo: double; Mtipo, MdTipo: String; McontaDe,
  McontaDs, McontaDd: Smallint; MvlrDe, MvlrDs, MvlrDd, Mporc, Mminimo: double;
  Ptipo, Pconta: Smallint; Pporc, Pvalor, Pminimo: double;
  Etipo, Econta: Smallint; Eporc, Evalor, Eminimo: double);
begin
  sq := 'UPDATE TBE_COBRA SET  ';
  sq := sq + '  bValido = ' + bVal.ToString;
  sq := sq + ', dtValido = ' + QuotedStr(bdData(dVal));
  sq := sq + ', ARM_tipo = ' + QuotedStr(Atipo);
  sq := sq + ', ARM_porc = ' + bdValor(Aporc);
  sq := sq + ', ARM_afixo = ' + bdValor(Afixo);
  sq := sq + ', ARM_alimite = ' + bdValor(Alimite);
  sq := sq + ', ARM_aexcede = ' + bdValor(Aexcede);
  sq := sq + ', ARM_minimo = ' + bdValor(Aminimo);
  sq := sq + ', SEG_dia = ' + Sdia.ToString;
  sq := sq + ', SEG_taxa = ' + bdValor(Staxa);
  sq := sq + ', SEG_minimo = ' + bdValor(Sminimo);
  sq := sq + ', MOV_tipo = ' + QuotedStr(Mtipo);
  sq := sq + ', MOV_dTipo = ' + QuotedStr(MdTipo);
  sq := sq + ', MOV_de_Contar = ' + McontaDe.ToString;
  sq := sq + ', MOV_ds_Contar = ' + McontaDs.ToString;
  sq := sq + ', MOV_dd_Contar = ' + McontaDd.ToString;
  sq := sq + ', MOV_de_Valor = ' + bdValor(MvlrDe);
  sq := sq + ', MOV_ds_Valor = ' + bdValor(MvlrDs);
  sq := sq + ', MOV_dd_Valor = ' + bdValor(MvlrDd);
  sq := sq + ', MOV_porc = ' + bdValor(Mporc);
  sq := sq + ', MOV_minimo = ' + bdValor(Mminimo);
  sq := sq + ', PACK_tipo = ' + Ptipo.ToString;
  sq := sq + ', PACK_contar = ' + Pconta.ToString;
  sq := sq + ', PACK_porc = ' + bdValor(Pporc);
  sq := sq + ', PACK_valor = ' + bdValor(Pvalor);
  sq := sq + ', PACK_minimo = ' + bdValor(Pminimo);
  sq := sq + ', EXPED_tipo = ' + Etipo.ToString;
  sq := sq + ', EXPED_contar = ' + Econta.ToString;
  sq := sq + ', EXPED_porc = ' + bdValor(Eporc);
  sq := sq + ', EXPED_valor = ' + bdValor(Evalor);
  sq := sq + ', EXPED_minimo = ' + bdValor(Eminimo);
  sq := sq + ' WHERE id = ' + idCobra.ToString;

  ExecSQL(sq , 'Alterar');

end;

procedure TBce.Cobra_fMostraID(idCob: Integer);
 var sFiltro:String;
begin
  sFiltro := ' id = ' + idCob.ToString;
  eDM.cdsCob.Filter := sFiltro;
  eDM.cdsCob.Filtered := True;
end;

procedure TBce.Cobra_fPesq(nomeCli: String; bValidos: boolean);
 var sFiltro:String;
begin
  sFiltro := ' UPPER(Nome) like ' + QuotedStr(UpperCase(nomeCli)+'%');
  if bValidos then sFiltro := sFiltro + ' and ativo = 1';

  eDM.cdsCob2.Filter := sFiltro;
  eDM.cdsCob2.Filtered := True;
end;

procedure TBce.Cobra_Insere(idCli, bVal: Integer; dVal: TDateTime;
  Atipo: String; Aporc, Afixo, Alimite, Aexcede, Aminimo: double;
  Sdia: Smallint; Staxa, Sminimo: double; Mtipo, MdTipo: String; McontaDe,
  McontaDs, McontaDd: Smallint; MvlrDe, MvlrDs, MvlrDd, Mporc, Mminimo: double;
  Ptipo, Pconta: Smallint; Pporc, Pvalor, Pminimo: double;
  Etipo, Econta: Smallint; Eporc, Evalor, Eminimo: double);
begin
  sq := 'INSERT INTO TBE_COBRA (ligCli, bValido, dtValido, dtCrado, ARM_tipo, ARM_porc, ';
  sq := sq + '  ARM_afixo, ARM_alimite, ARM_aexcede, ARM_minimo, SEG_dia, SEG_taxa, SEG_minimo,  ';
  sq := sq + '  MOV_tipo, MOV_dTipo, MOV_de_Contar, MOV_ds_Contar, MOV_dd_Contar,  ';
  sq := sq + '  MOV_de_Valor, MOV_ds_valor, MOV_dd_valor, MOV_porc, MOV_minimo, ';
  sq := sq + '  PACK_tipo, PACK_contar, PACK_porc, PACK_valor, PACK_minimo, ';
  sq := sq + '  EXPED_tipo, EXPED_contar, EXPED_porc, EXPED_valor, EXPED_minimo ';
  sq := sq + '  ) Values ( ';
  sq := sq + '   ' + idCli.ToString;
  sq := sq + ',  ' + bVal.ToString;
  sq := sq + ',  ' + QuotedStr(bdData(dVal));
  sq := sq + ',  ' + QuotedStr(bdData(Now));
  sq := sq + ',  ' + QuotedStr(Atipo);
  sq := sq + ',  ' + bdValor(Aporc);
  sq := sq + ',  ' + bdValor(Afixo);
  sq := sq + ',  ' + bdValor(Alimite);
  sq := sq + ',  ' + bdValor(Aexcede);
  sq := sq + ',  ' + bdValor(Aminimo);
  sq := sq + ',  ' + Sdia.ToString;
  sq := sq + ',  ' + bdValor(Staxa);
  sq := sq + ',  ' + bdValor(Sminimo);
  sq := sq + ',  ' + QuotedStr(Mtipo);
  sq := sq + ',  ' + QuotedStr(MdTipo);
  sq := sq + ',  ' + McontaDe.ToString;
  sq := sq + ',  ' + McontaDs.ToString;
  sq := sq + ',  ' + McontaDd.ToString;
  sq := sq + ',  ' + bdValor(MvlrDe);
  sq := sq + ',  ' + bdValor(MvlrDs);
  sq := sq + ',  ' + bdValor(MvlrDd);
  sq := sq + ',  ' + bdValor(Mporc);
  sq := sq + ',  ' + bdValor(Mminimo);
  sq := sq + ',  ' + Ptipo.ToString;
  sq := sq + ',  ' + Pconta.ToString;
  sq := sq + ',  ' + bdValor(Pporc);
  sq := sq + ',  ' + bdValor(Pvalor);
  sq := sq + ',  ' + bdValor(Pminimo);
  sq := sq + ',  ' + Etipo.ToString;
  sq := sq + ',  ' + Econta.ToString;
  sq := sq + ',  ' + bdValor(Eporc);
  sq := sq + ',  ' + bdValor(Evalor);
  sq := sq + ',  ' + bdValor(Eminimo);
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');
end;

procedure TBce.Cobra_Mostra();
begin
  sq := ' select * from TBE_COBRA ';
  RodaSQL(eDM.sdsCob, eDM.cdsCob, sq);

end;

procedure TBce.Cobra_Mostra2;
begin
  sq := ' select cob.id, cli.nome, cob.DTCRADO, cob.DTVALIDO, cob.SEG_DIA, cob.LigCli, cli.Ativo ';
  sq := sq + ' from TBE_COBRA cob, TBE_CLIENTE cli  ';
  sq := sq + ' where cli.id = cob.LIGCLI ';
  RodaSQL(eDM.sdsCob2, eDM.cdsCob2, sq);

end;

procedure TBce.Confere_ListaBD(idCli, tipo, nNF: Integer);
  var stipo : String;
begin
  sTipo := 'E';
  if (tipo = 1) then sTipo := 'S';
  if (tipo = 2) then sTipo := 'D';

  sq := 'Select LigSub, SUM(Quant) as Qt from TBE_NFitens ';
  sq := sq + ' WHERE LIGCLI = '+ idCli.ToString;
  sq := sq + ' and tipo = '+QuotedStr(sTipo)+' ';
  sq := sq + ' and statusConfere < 8 and (status = 1) ';
  if (nNF>0) then   sq := sq + ' and numNF = '+nNF.ToString;
  sq := sq + ' group by LigSUB ';

  RodaSQL(eDM.sdsCf0, eDM.cdsCf0, sq);
end;

procedure TBce.Confere_ListaNF(idCli, tipo, nNF: Integer);
  var stipo : String;
begin
  sTipo := 'E';
  if (tipo = 1) then sTipo := 'S';
  if (tipo = 2) then sTipo := 'D';

  sq := 'Select distinct lignf from TBE_NFitens ';
  sq := sq + ' WHERE LIGCLI = '+ idCli.ToString;
  sq := sq + ' and tipo = '+QuotedStr(sTipo)+' ';
  sq := sq + ' and statusConfere < 8 and status = 1 ';
  if (nNF>0) then   sq := sq + ' and numNF = '+nNF.ToString;

  RodaSQL(eDM.sdsCf1, eDM.cdsCf1, sq);

end;

procedure TBce.Confere_Marca(idNF, st: Integer);
  var stCf : Integer;
begin
  // status =2 : conferido
  // Nota Fiscal
  sq := 'UPDATE TBE_NF SET status =  '+st.ToString;
  sq := sq + '  WHERE id = ' + idNF.ToString;
  ExecSQL(sq , 'Alterar');
  // Itens
  stCF := 2;
  if st = 2 then stCF := 9;
  sq := 'UPDATE TBE_NFitens SET status =  '+st.ToString ;
  sq := sq + ', statusConfere = ' + stCf.ToString;
  sq := sq + '  WHERE LigNF = ' + idNF.ToString;
  ExecSQL(sq , 'Alterar');

end;

procedure TBce.Estoque_AlteraProduto(idProd, qt: Integer; tipo: string);
  var Atual, op : Integer;
begin
  Atual := Estoque_LPosicaoProduto(idProd);
  Atual := Estoque_PosicaoProduto(idProd);
  op := +1;
  if (tipo = 'S') or (tipo = '-') then op := -1;
  Atual := Atual + op*qt*SUBUM;

  sq := 'UPDATE TBE_PRODUTO SET Quantidade = '+ Atual.ToString+ ' , dtMov = '+QuotedSTr(bdData(Now));
  sq := sq + '  WHERE id = ' + idProd.ToString;
  ExecSQL(sq , 'Alterar');

  eDM.cdsProd.Edit;
  eDM.cdsProdQUANTIDADE.Value := Atual;
  eDM.cdsProd.Post;
  //Prod_fSubIDP(idProd);

end;

procedure TBce.Estoque_AlteraSub(idSub, qt: Integer; tipo: string);
  var Atual, AtualCalc, ValorUM, op : Integer;

begin

  Atual := Estoque_LPosicaoSub(idSub);
  Atual := Estoque_PosicaoSub(idSub);
  ValorUM := SubUM;

  op := +1;
  if (tipo = 'S') or (tipo = '-') then op := -1;
  Atual := Atual + op*qt;
  AtualCalc := Atual * ValorUM;

  sq := 'UPDATE TBE_PRODSUB SET QuantSub = '+ Atual.ToString+ ' , QuantCalc = '+AtualCalc.ToString;
  sq := sq + ',  statusweb = 0 ' ;
  sq := sq + '  WHERE id = ' + idSub.ToString;
  ExecSQL(sq , 'Alterar');

  eDM.cdsProdS.Locate('id', idSub,  [loCaseInsensitive, loPartialKey] );
  eDM.cdsProdS.Edit;
  eDM.cdsProdSQUANTSUB.Value := Atual;
  eDM.cdsProdSQUANTCALC.Value := AtualCalc;
  eDM.cdsProdS.Post;



end;

function TBce.Estoque_fPosicaoProduto(idProd: Integer): Integer;
  var resp : Integer;
begin
  eDM.cdsProd.Filter := 'id = '+ IdProd.ToString;
  eDM.cdsProd.Filtered := true;

  resp := eDM.cdsProdQUANTIDADE.Value;
  result := resp;
end;

function TBce.Estoque_fPosicaoSub(idSub: Integer): Integer;
  var resp : integer;
begin
  eDM.cdsProdS.Filter := 'id = '+ IdSub.ToString;
  eDM.cdsProdS.Filtered := true;

  resp := eDM.cdsProdSQUANTSUB.Value;
  SubUM := eDM.cdsProdSQUANTUM.Value;
  result := resp;
end;

procedure TBce.Estoque_ItensNF(idNF: Integer);
begin
  sq := ' Select it.*, sub.NOMESUB from TBE_NFITENS it, TBE_PRODSUB sub WHERE (sub.id = it.LIGSUB) and ligNF = '+idNF.ToString;
  RodaSQL(eDM.sdsNFi, eDM.cdsNFi2, sq);
end;

// Não Utilizar Locate ... Pode estar desatualizado
function TBce.Estoque_LPosicaoProduto(idProd: Integer): Integer;
  var resp : Integer;
begin
  eDM.cdsProd.Locate('id', IdProd, [loCaseInsensitive, loPartialKey]);
  resp := eDM.cdsProdQUANTIDADE.Value;
  result := resp;
end;

function TBce.Estoque_LPosicaoSub(idSub: Integer): Integer;
  var resp : Integer;
begin
  eDM.cdsProdS.Locate('id', IdSub, [loCaseInsensitive, loPartialKey]);

  resp := eDM.cdsProdSQUANTSUB.Value;
  SubUM := eDM.cdsProdSQUANTUM.Value;
  result := resp;

end;

function TBce.Estoque_PosicaoProduto(idProd: Integer): Integer;
  var resp : Integer;
begin
  resp := 0;
  sq := ' Select Quantidade FROM TBE_PRODUTO WHERE id = '+idProd.ToString;
  RodaSQL(eDM.sdsTMPe, eDM.cdsTMPe, sq);
  if eDM.cdsTMPe.RecordCount > 0 then
    resp := eDM.cdsTMPe.FieldByName('QUANTIDADE').Value;
  result := resp;
end;

function TBce.Estoque_PosicaoSub(idSub: Integer): Integer;
  var resp : Integer;
begin
  resp := 0;
  sq := ' Select QuantSub FROM TBE_PRODSUB WHERE id = '+idSub.ToString;
  RodaSQL(eDM.sdsTMPe, eDM.cdsTMPe, sq);
  if eDM.cdsTMPe.RecordCount > 0 then
    resp := eDM.cdsTMPe.FieldByName('QUANTSUB').Value;
  result := resp;
end;

procedure TBce.Cli_CB_fID(var Lista:TComboBox; idC: Integer);
  var
      achei : boolean;
      i : Integer;
      m,n : String;
begin
  Cli_fMostrarF(1,idC);
  n := eDM.cdsCliNOME.Value;

  achei := false;
  i := 0;
  Lista.ItemIndex := 0;
  while ((not achei) and (i<Lista.Items.Count)) do
  begin
    m := TRIM(Lista.Items[i]);
    if (n = UpperCase(m)) then
    begin
      Achei := true;
      Lista.ItemIndex := i;
    end;

    i := i + 1;
  end;
end;

procedure TBce.Cli_CB_fPreenche(var cb: TComboBox);
begin
   eDM.cdsCli.Filtered := false;
   cb.Clear;
   eDM.cdsCli.First;
   while not eDM.cdsCli.Eof do
   begin
     if eDM.cdsCliATIVO.Value = 1 then cb.Items.Append(eDM.cdsCliNOME.AsSTring);
     eDM.cdsCli.Next;
   end;
end;

function TBce.fCli_Id(Nome: String): Integer;
  var resp : Integer;
begin
    eDM.cdsCli.Filter := 'Nome = ' + QuotedStr(Nome);
    eDM.cdsCli.Filtered := True;
    resp := 0;
    if eDM.cdsCli.RecordCount > 0 then resp := eDM.cdsCliID.Value;
    eDM.cdsCli.Filtered := false;
    result := resp;
end;

function TBce.fCli_Nome(idC: Integer): String;
 var resp : String;
begin
    eDM.cdsCli.Filter := 'id = ' + idC.ToString;
    eDM.cdsCli.Filtered := True;
    resp := '';
    if eDM.cdsCli.RecordCount > 0 then resp := eDM.cdsCliNOME.AsString;
    eDM.cdsCli.Filtered := false;
    result := resp;
end;

procedure TBce.Geral_AlterarStatus(id, Status: Integer; sTab, sCampo:String);
begin
  Bcg := TBcg.Create;
  Bcg.acAlteraStatus(id, Status, sTab, sCampo);
  Bcg.Destroy;
end;

function TBce.Geral_RetornarInteiro(id: Integer; sTab, sCampo: String): Integer;
  var resp : Integer;
begin
  resp := 0;

  Bcg := TBcg.Create;
  resp := Bcg.tiRetornaINT(id, sTab, sCampo);
  Bcg.Destroy;

  Result := resp;

end;

function TBce.Geral_RetornarString(id:Integer; sTab, sCampo: String): String;
  var resp : String;
begin
  resp := '';

  Bcg := TBcg.Create;
  resp := Bcg.tiRetornaSTR(id, sTab, sCampo);
  Bcg.Destroy;

  Result := resp;
end;

procedure TBce.Move_Insere(LigCli, Ligprod, LigSub, Quant, ObsMove :Integer; tipo, modo:String; numdoc:integer);
begin
  sq := 'INSERT INTO TBE_ProdMove (ligCli, ligProd, ligSub, ligUser, Quant, ObsMove, tipo, NomeUser, ';
  sq := sq + ' dtCriado, Status, Origem, Destino, modoModifica, numdoc ';
  sq := sq + '  ) Values ( ';
  sq := sq + '   ' + LigCli.ToString;
  sq := sq + ',  ' + LigProd.ToString;
  sq := sq + ',  ' + ligSub.ToString;
  sq := sq + ',  ' + idUser.ToString;
  sq := sq + ',  ' + Quant.ToString;
  sq := sq + ',  ' + ObsMove.ToString;
  sq := sq + ',  ' + QuotedStr(tipo);
  sq := sq + ',  ' + QuotedStr(nmUser);
  sq := sq + ',  ' + QuotedStr(bdData(Now));
  sq := sq + ', 1 ';
  sq := sq + ', 0 ';
  sq := sq + ', 0 ';
  sq := sq + ',  ' + QuotedStr(modo);
  sq := sq + ',  ' + numdoc.ToString;
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');
end;

procedure TBce.NFitem_Altera(idItem, numNF, Quant: Integer; dtNota: TDateTime;
  vUnit, vSubt: double; tipo: String);
begin
  sq := 'UPDATE TBE_NFITENS SET  ';
  sq := sq + '  numNF = ' + NumNF.ToString;
  sq := sq + ', Quant = ' + Quant.ToString;
  sq := sq + ', dtNota = ' + QuotedStr(bdData(dtNota));
  sq := sq + ', tipo = ' + QuotedStr(tipo);
  sq := sq + ', vUnit = ' + bdValor(vUnit);
  sq := sq + ', vSubt = ' + bdValor(vSubt);
  sq := sq + ' WHERE id = ' + idItem.ToString;

  ExecSQL(sq , 'Alterar');

end;

procedure TBce.NFitem_AlteraQtLida(idItem, Quantlida: Integer);
begin
  sq := 'UPDATE TBE_NFITENS SET  ';
  sq := sq + ', Quant = ' + QuantLida.ToString;
  sq := sq + ' WHERE id = ' + idItem.ToString;

  ExecSQL(sq , 'Alterar');
end;

procedure TBce.NFitem_Apagar(idItem: Integer);
begin
  sq := 'DELETE FROM TBE_NFITENS ';
  sq := sq + ' WHERE id = ' + idItem.ToString;

  ExecSQL(sq , 'Apagar');
end;

function TBce.NFitem_fExiste(idNF, idSub: Integer): Integer;
  var resp : Integer;
begin
  resp := 0;
  eDM.cdsNFi2.Filtered := False;
  eDM.cdsNFi2.Filter := ' LIGNF = ' + idNF.ToString + ' and LIGSUB = '+idSub.ToString;
  eDM.cdsNFi2.Filtered := True;

  if eDM.cdsNFi2.RecordCount>0 then resp := eDM.cdsNFI2ID.Value;
  result := resp;
end;

procedure TBce.NFitem_fMostraNF(idNF:Integer);
begin
  eDM.cdsNFi.Filtered := False;
  eDM.cdsNFi.Filter := ' LIGNF = ' + idNF.ToString;
  eDM.cdsNFi.Filtered := True;
end;

procedure TBce.NFitem_Insere(idCli, idNF, ligProd, ligSub, numNF,
  Quant: Integer; dtNota: TDateTime; vUnit, vSubt: double; tipo: String);
begin
  sq := 'INSERT INTO TBE_NFITENS (ligCli, ligNF, ligProd, ligSub, numNF, dtNota, tipo, ';
  sq := sq + '  Quant, QuantLida, vUnit, vSubT, status, statusConfere  ';
  sq := sq + '  ) Values ( ';
  sq := sq + '   ' + idCli.ToString;
  sq := sq + ',  ' + idNF.ToString;
  sq := sq + ',  ' + ligProd.ToString;
  sq := sq + ',  ' + ligSub.ToString;
  sq := sq + ',  ' + NumNF.ToString;
  sq := sq + ',  ' + QuotedStr(bdData(dtNota));
  sq := sq + ',  ' + QuotedStr(tipo);
  sq := sq + ',  ' + Quant.ToString;
  sq := sq + ',  ' + Quant.ToString;
  sq := sq + ',  ' + bdValor(vUnit);
  sq := sq + ',  ' + bdValor(vSubt);
  sq := sq + ', 0 ';
  sq := sq + ', 0 ';
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');

end;

procedure TBce.NFitem_mostra( idNF:Integer);
begin
  sq := ' Select it.*, sub.NOMESUB, sub.CODCLI from TBE_NFITENS it, TBE_PRODSUB sub WHERE (sub.id = it.LIGSUB) and ligNF = '+idNF.ToString;
  RodaSQL(eDM.sdsNFi, eDM.cdsNFi, sq);
  RodaSQL(eDM.sdsNFi, eDM.cdsNFi2, sq);
end;

procedure TBce.NFitem_status(idItem: Integer; status: TstNF);
begin
  Geral_AlterarStatus(idItem, ord(status), 'TBE_NFITENS', 'status');
end;

procedure TBce.NFitem_status(idItem: Integer; status: TstConferida);
begin
  Geral_AlterarStatus(idItem, ord(status), 'TBE_NFITENS', 'statusConfere');
end;


procedure TBce.NF_Altera(idNF, numnf, itens, vol, numPed, bPed: integer; tipo, doc, dimensao: String;
  dtNota: TDatetime; vTot, vProd, peso: double; ua, um, us, up, ue:Smallint);
begin
  sq := 'UPDATE TBE_NF SET  ';
  sq := sq + '  numNF = ' + NumNF.ToString;
  sq := sq + ', dtNota = ' + QuotedStr(bdData(dtNota));
  sq := sq + ', tipo = ' + QuotedStr(tipo);
  sq := sq + ', numItens = ' + itens.ToString;
  sq := sq + ', volume = ' + vol.ToString;
  sq := sq + ', numPed = ' + numPed.ToString;
  sq := sq + ', bPed =   ' + bPed.ToString;
  sq := sq + ', vTotal = ' + bdValor(vTot);
  sq := sq + ', vProds = ' + bdValor(vprod);
  sq := sq + ', Peso = ' + bdValor(peso);
  sq := sq + ', docRef = ' + QuotedStr(doc);
  sq := sq + ', dimensao = ' + QuotedStr(dimensao);
  sq := sq + ', usaArm = ' + ua.ToString;
  sq := sq + ', usaMov = ' + um.ToString;
  sq := sq + ', usaSeg = ' + us.ToString;
  sq := sq + ', usaPack= ' + up.ToString;
  sq := sq + ', usaExp = ' + ue.ToString;
  sq := sq + ' WHERE id = ' + idNF.ToString;

  ExecSQL(sq , 'Alterar');

end;

procedure TBce.NF_Apagar(idNF: Integer);
begin
  sq := 'DELETE FROM TBE_NF  ';
  sq := sq + ' WHERE id = ' + idNF.ToString;
  ExecSQL(sq , 'Apagar');

end;

function TBce.NF_fExiste(num, idC: Integer): Integer;
  var resp : Integer;
begin
  resp := 0;
  sq := ' Select id from TBE_NF WHERE ligcli = '+idC.ToString;
  sq := sq + ' and NUMNF = '+ num.ToString;

  RodaSQL(eDM.sdsTMPe, eDM.cdsTMPe, sq);

  if (eDM.cdsTMPe.RecordCount > 0) then resp := eDM.cdsTMPe.Fields[0].Value;

  result := resp;
end;

procedure TBce.NF_fPesq(sDocs: String);
begin
  eDM.cdsNFPesq.Filtered := false;
  eDM.cdsNFPesq.Filter := ' DOCREF LIKE ' + QuotedStr('%' + sDocs+ '%');
  eDM.cdsNFPesq.Filtered := true;
end;

procedure TBce.NF_fPesq(num: Integer);
begin
  eDM.cdsNFPesq.Filtered := false;
  eDM.cdsNFPesq.Filter := 'NUMNF = '+ num.ToString;
  eDM.cdsNFPesq.Filtered := true;
end;

procedure TBce.NF_Insere(idCli, numnf, liguser, itens, vol, numPed, bPed: integer; tipo,
  doc, dimensao: String; dtNota: TDatetime; vTot, vProd, peso: double; ua, um, us, up, ue:Smallint);
begin
  sq := 'INSERT INTO TBE_NF (ligCli, dtcriado, numNF, dtNota, tipo, ';
  sq := sq + '  numItens, volume, vTotal, vprods, docRef, numPed, bPed, Peso, dimensao, ';
  sq := sq + '  usaArm, usaMov, usaSeg, usaPack, usaExp, ';
  sq := sq + '  status, statusConfere, statusNFe, stOrigem ';
  sq := sq + '  ) Values ( ';
  sq := sq + '   ' + idCli.ToString;
  sq := sq + ',  ' + QuotedStr(bdData(Now));
  sq := sq + ',  ' + NumNF.ToString;
  sq := sq + ',  ' + QuotedStr(bdData(dtNota));
  sq := sq + ',  ' + QuotedStr(tipo);
  sq := sq + ',  ' + itens.ToString;
  sq := sq + ',  ' + vol.ToString;
  sq := sq + ',  ' + bdValor(vTot);
  sq := sq + ',  ' + bdValor(vProd);
  sq := sq + ',  ' + QuotedStr(doc);
  sq := sq + ',  ' + numPed.ToString;
  sq := sq + ',  ' + bPed.ToString;
  sq := sq + ',  ' + bdValor(Peso);
  sq := sq + ',  ' + QuotedStr(dimensao);
  sq := sq + ',  ' + ua.ToString;
  sq := sq + ',  ' + um.ToString;
  sq := sq + ',  ' + us.ToString;
  sq := sq + ',  ' + up.ToString;
  sq := sq + ',  ' + ue.ToString;
  sq := sq + ', 0 ';
  sq := sq + ', 0 ';
  sq := sq + ', 0 ';
  sq := sq + ', 0 ';
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');
end;


procedure TBce.NF_mostra(idCli: Integer);
  var s : String;
begin
  sq := ' Select * from TBE_NF WHERE ligcli = '+idCli.ToString;
  RodaSQL(eDM.sdsNF, eDM.cdsNF, sq);
  RodaSQL(eDM.sdsNF, eDM.cdsNFpesq, sq);
end;


procedure TBce.NF_mostraDT(dt: TDateTime);
begin
  sq := ' Select id, NumNF, NumPed from TBE_NF WHERE DTNota >= '+QuotedSTr(bdData(dt-3))+ ' Order by NumPed ';
  RodaSQL(eDM.sdsNFdt, eDM.cdsNFdt, sq);

end;

procedure TBce.NF_mostraFinalizadas(idCli:integer; dt1, dt2: TDateTime);
  var sq0:String;
begin
  sq0 := ' Select TBE_NF.*, ';
  sq0 := sq0 + ' CASE status WHEN 4 THEN '+ QuotedStr('Cancelada')+ 'WHEN 3 THEN '+ QuotedStr('ESTOQUE');
  sq0 := sq0 + ' END  StatusDesc from TBE_NF ';
  sq0 := sq0 + ' WHERE ligcli = '+idCli.ToString+' and (status >=3) ';
  sq0 := sq0 + ' and DTCRIADO between '+QuotedStr(bdData(dt1))+' and '+ QuotedStr(bdData(dt2))+ ' ';

  sq0 := sq0 + ' order by DTCRIADO desc ';
  RodaSQL(eDM.sdsLi, eDM.cdsLi4, sq0);


end;

procedure TBce.NF_mostraID(idNF: Integer);
begin
  sq := ' Select * from TBE_NF WHERE id = '+idNF.ToString;
  RodaSQL(eDM.sdsNF, eDM.cdsNF, sq);
  RodaSQL(eDM.sdsNF, eDM.cdsNFpesq, sq);
end;

procedure TBce.NF_mostraPendentes(idCli, tipo: Integer);
  var sq0:String;
begin
  sq0 := ' Select TBE_NF.*, ';
  sq0 := sq0 + ' CASE status WHEN 0 THEN '+ QuotedStr('Iniciada');
  sq0 := sq0 + ' WHEN 1 THEN ' + QuotedStr('Pronta') ;
  sq0 := sq0 + ' WHEN 2 THEN ' + QuotedStr('Conferida');
  sq0 := sq0 + ' WHEN 3 THEN ' + QuotedStr('ESTOQUE');
  sq0 := sq0 + ' WHEN 4 THEN ' + QuotedStr('Cancelada');
  sq0 := sq0 + ' END  StatusDesc from TBE_NF WHERE ligcli = '+idCli.ToString+' and (status < 3) ';
  if (tipo = 0) then
  begin
    sq := sq0 + ' order by id desc ';
    RodaSQL(eDM.sdsLi, eDM.cdsLi0, sq);
  end;


  if (tipo = 1) then
  begin
    sq := sq0 + ' and (tipo = '+QuotedStr('E') + ' or tipo = '+QuotedStr('D')+') order by id ';
    RodaSQL(eDM.sdsLi, eDM.cdsLi1, sq);
  end;

  if (tipo = 2) then
  begin
    sq := sq0 + ' and (tipo = '+QuotedStr('S')+') order by id ';
    RodaSQL(eDM.sdsLi, eDM.cdsLi2, sq);
  end;

end;

procedure TBce.NF_status(idNF: Integer; status: TstSefaz);
begin
  Geral_AlterarStatus(idNF, ord(status), 'TBE_NF', 'statusNFe');
end;

procedure TBce.NF_status(idNF: Integer; status: Integer);
begin
  Geral_AlterarStatus(idNF, status, 'TBE_NF', 'status');
end;

procedure TBce.NF_status(idNF: Integer; status: TstConferida);
begin
  Geral_AlterarStatus(idNF, ord(status), 'TBE_NF', 'statusConfere');
end;

procedure TBce.NF_status(idNF: Integer; status: TstOrigem);
begin
  Geral_AlterarStatus(idNF, ord(status), 'TBE_NF', 'stOrigem');
end;

procedure TBce.Prod_Alterar(idPr: Integer; NomeL, NomeC, C1, C2, C3, C4: String;
  ativo, val, fifo, qtMin, qtPalete: Integer);
begin
  sq := 'UPDATE TBE_PRODUTO SET  ';
  sq := sq + '  NomeLongo = ' + QuotedStr(NomeL);
  sq := sq + ', NomeCurto = ' + QuotedStr(NomeC);
  sq := sq + ', Classif1Local = ' + QuotedStr(C1);
  sq := sq + ', Classif2 = ' + QuotedStr(C2);
  sq := sq + ', Classif3 = ' + QuotedStr(C3);
  sq := sq + ', Classif4 = ' + QuotedStr(C4);
  sq := sq + ', Ativo = ' + ativo.ToString;
  sq := sq + ', bValidade = ' + val.ToString;
  sq := sq + ', bFIFO = ' + fifo.ToString;
  sq := sq + ', quantMin = ' + qtMin.ToString;
  sq := sq + ', qtPalete = ' + qtPalete.ToString;
  sq := sq + ' WHERE id = ' + idPr.ToString;

  ExecSQL(sq , 'Alterar');
end;

procedure TBce.Prod_AlterarNmCurto(idPr: Integer; NomeC:String);
  var parte : TArray<string>;
      nomeS : String;
begin

  Prod_fSubIDP(idPr);
  if eDM.cdsProdS.RecordCount>0 then
  while not eDM.cdsProdS.Eof do
  begin
    parte := eDM.cdsProdSNOMESUB.AsString.Split(['|']);
    nomeS := NomeC + '|' + parte[1];
    sq := 'UPDATE TBE_PRODSUB SET NomeSUB = '+QuotedStr(nomeS)+ ' WHERE id = '+eDM.cdsProdSID.AsString;
    ExecSQL(sq, 'Alterar vários');
    eDM.cdsProdS.Next;
  end;
end;

procedure TBce.Prod_Apagar(idP: Integer);
begin
    // Apagar Produto
    sq := 'DELETE FROM TBE_PRODUTO WHERE id = '+ idP.toString;
    ExecSQL(sq, 'Apaga produto');

    // Apagar SUB Produto
    sq := 'DELETE FROM TBE_PRODSUB WHERE ligProd = '+ idP.toString;
    ExecSQL(sq, 'Apaga Sub produto');

end;

procedure TBce.Prod_Class(var Lista: TComboBox; n: smallint; idC : Integer);
var nc : string;
begin
  if n = 1  then nc := ' Classif1Local';
  if n = 2  then nc := ' Classif2';
  if n = 3  then nc := ' Classif3';
  if n = 4  then nc := ' Classif4';
  sq := ' Select Distinct '+ nc +' from TBE_PRODUTO WHERE ligcli = '+idC.ToString;
  RodaSQLtemp(sq);

  Lista.Clear;
  Lista.Items.Append('<Todos>');

  eDM.cdsTMPe.First;
  while not eDM.cdsTMPe.Eof do
  begin
    Lista.Items.Append(eDM.cdsTMPe.Fields[0].Value);
    eDM.cdsTMPe.Next;
  end;

  Lista.ItemIndex := 0;
end;

function TBce.Prod_fID(NomeL: String): Integer;
var resp : Integer;
begin
  resp := 0;
  Prod_Mostrar(eCli);
  eDM.cdsProd.Filter := 'NomeLongo = '+ QuotedStr(NomeL);
  eDM.cdsProd.Filtered := true;
  if eDM.cdsProd.RecordCount > 0 then resp :=eDM.cdsProdID.Value;
  Prod_fMostrarTodos;
  result := resp;
end;

procedure TBce.Prod_fMostrarTodos;
begin
  eDM.cdsProd.Filtered := false;
end;

function TBce.Prod_fPesqBar(sNum: String): boolean;
begin
  eDM.cdsPPesq.Filtered := false;
  eDM.cdsPPesq.Filter := 'CodBarras = '+ QuotedStr(sNum);
  eDM.cdsPPesq.Filtered := true;

  result := (eDM.cdsPPesq.RecordCount > 0);
end;

procedure TBce.Prod_fPesqCode(sNum: String);
begin
  if sNum.Length>1 then
  begin
    eDM.cdsPPesq.Filtered := false;
    eDM.cdsPPesq.Filter := '(CodBarras LIKE  '+ QuotedStr(sNum + '%')+ ') or ( CodCli LIKE  '+ QuotedStr(sNum + '%')+ ') or (CodTransp LIKE  '+ QuotedStr(sNum + '%')+ ') ';
    eDM.cdsPPesq.Filtered := true;
  end;

end;

procedure TBce.Prod_fPesqCodeCli(sNum: String);
begin
    eDM.cdsPPesq.Filtered := false;
    eDM.cdsPPesq.Filter := 'CodCli =  '+ QuotedStr(sNum)+ ' ';
    eDM.cdsPPesq.Filtered := true;

end;

procedure TBce.Prod_fPesqMostrarTodos;
begin
  eDM.cdsPPesq.Filtered := false;
end;

procedure TBce.Prod_fPesqNome(sNome: String);
begin
  if sNome.Length > 3 then
  begin
    eDM.cdsPPesq.Filter := 'UPPER(NomeSub) LIKE '+ QuotedStr('%'+UpperCase(sNome)+'%');
    eDM.cdsPPesq.Filtered := true;
  end;

end;

procedure TBce.Prod_fSubIDP(IdP:Integer);
begin
  eDM.cdsProdS.Filter := 'ligProd = '+ IdP.ToString;
  eDM.cdsProdS.Filtered := true;

end;

procedure TBce.Prod_fSubMostrarTodos;
begin
  eDM.cdsProdS.Filtered := false;

end;

procedure TBce.Prod_Inserir(NomeL, NomeC, C1, C2, C3, C4: String; ativo, val,
  fifo, qtMin, qtPalete, ligCli: Integer);
begin
  sq := 'INSERT INTO TBE_PRODUTO (NomeLongo, NomeCurto, Classif1Local, Classif2, ';
  sq := sq + '  Classif3, Classif4, ativo, bValidade, bFIFO, quantMin, qtPalete,   ';
  sq := sq + '  ligCli, Quantidade, dInventario, dtCria) Values ( ';
  sq := sq + '  ' + QuotedStr(NomeL);
  sq := sq + ', ' + QuotedStr(NomeC);
  sq := sq + ', ' + QuotedStr(C1);
  sq := sq + ', ' + QuotedStr(C2);
  sq := sq + ', ' + QuotedStr(C3);
  sq := sq + ', ' + QuotedStr(C4);
  sq := sq + ', ' + ativo.ToString;
  sq := sq + ', ' + val.ToString;
  sq := sq + ', ' + fifo.ToString;
  sq := sq + ', ' + qtMin.ToString;
  sq := sq + ', ' + qtPalete.ToString;
  sq := sq + ', ' + ligCli.ToString;
  sq := sq + ', 0';
  sq := sq + ', ' + QuotedStr('2007-07-01');
  sq := sq + ', ' + QuotedStr(bdData(Now));
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');

end;


function TBce.Prod_LSubNome(idS: Integer): String;
  var resp : String;
begin
  eDM.cdsProdS.First;
  resp := '';
  if eDM.cdsProdS.Locate('id', idS,  [loCaseInsensitive, loPartialKey] ) then
    resp := eDM.cdsProdSNOMESUB.Value;
  result := resp;
end;

procedure TBce.Prod_Mostrar(idC: Integer);
begin
  sq := ' Select * from TBE_PRODUTO WHERE ligcli = '+idC.ToString + ' Order by NomeLongo' ;
  RodaSQL(eDM.sdsProd, eDM.cdsProd, sq);
end;

procedure TBce.Prod_MostrarEstoque(idC: Integer; tipo: Smallint);
begin
  // tipo: quando QUANT é 0=zero; 1=positivo; 2=negativos
  sq := 'Select a.id, a.NOMELONGO, a.QUANTIDADE, a.DTMOV, a.DINVENTARIO, a.QUANTMIN, a.CLASSIF1LOCAL, b.CODCLI  ';
  sq := sq + ' from TBE_PRODUTO a, TBE_ProdSub b ';
  sq := sq + '  WHERE a.LIGCLI = ' + idC.ToString;
  sq := sq + '  and a.id = b.ligProd ';
  if Tipo = 0 then sq := sq + '  and a.QUANTIDADE = 0 ';
  if Tipo = 1 then sq := sq + '  and a.QUANTIDADE > 0 ';
  if Tipo = 2 then sq := sq + '  and a.QUANTIDADE < 0 ';
  if Tipo = 3 then sq := sq + '  and a.QUANTIDADE <> 0 ';
  sq := sq + '  order by a.nomelongo  ';
  RodaSQL(eDM.sdsStok, eDM.cdsStok, sq);

end;

procedure TBce.Prod_MostrarEstoqueHist(idS: Integer);
begin
  sq := 'Select first 15 dtcriado, tipo, nomeuser, quant, ligsub, ';
  sq := sq + ' case tipo when '+QuotedStr('E')+' then '+QuotedStr('Entrada');
  sq := sq + ' when '+QuotedStr('S')+' then '+QuotedStr('Saída');
  sq := sq + ' when '+QuotedStr('D')+' then '+QuotedStr('Devolução');
  sq := sq + ' when '+QuotedStr('M')+' then '+QuotedStr('Mov Interno');
  sq := sq + ' when '+QuotedStr('A')+' then '+QuotedStr('Ajustes')+ ' end as tipoDesc, ';
  sq := sq + ' modoModifica, numdoc ';
  sq := sq + ' from TBE_PRODMOVE ';
  sq := sq + '  WHERE LIGSUB = ' + idS.ToString;
  sq := sq + '  order by id desc   ';
  RodaSQL(eDM.sdsStokh, eDM.cdsStokh, sq);
end;

procedure TBce.Prod_MostrarEstoqueSub(idP: Integer);
begin
  sq := 'Select id, nomesub, quantsub, quantum, quantcalc, codcli, codtransp ';
  sq := sq + ' from TBE_PRODSUB ';
  sq := sq + '  WHERE LIGProd = ' + idP.ToString;
  sq := sq + '  order by nomesub  ';
  RodaSQL(eDM.sdsStoks, eDM.cdsStoks, sq);
end;

procedure TBce.Prod_Pesquisado(idC: Integer);
begin

  sq := 'select a.CODBARRAS, a.CODCLI, a.CODTRANSP, a.id, a.LigProd,  a.LIGKIT, a.NOMESUB,';
  sq := sq + ' a.ATIVO, a.QUANTSUB, a.QUANTSUBMIN, b.CLASSIF1LOCAL, b.CLASSIF2, b.BVALIDADE ';
  sq := sq + '  from TBE_ProdSub a, TBE_Produto b ';
  sq := sq + '  where a.LIGPROD = b.id ';
  sq := sq + '  and a.LigCli = ' + idC.ToString;
  RodaSQL(eDM.sdsPPesq, eDM.cdsPPesq, sq);
end;

procedure TBce.Prod_SubAlterar(idSub: Integer; NomeS, CodB, CodC, CodT, Unid: String;
  ativo, qtMin, qtUM: Integer);
begin
  sq := 'UPDATE TBE_PRODSUB SET  ';
  sq := sq + '  NomeSUB = ' + QuotedStr(NomeS);
  sq := sq + ', CodBarras = ' + QuotedStr(CodB);
  sq := sq + ', CodCli = ' + QuotedStr(CodC);
  sq := sq + ', CodTransp = ' + QuotedStr(CodT);
  sq := sq + ', Ativo = ' + ativo.ToString;
  sq := sq + ', quantSubMin = ' + qtMin.ToString;
  sq := sq + ', quantUM = ' + qtUM.ToString;
  sq := sq + ', Unidade = ' + QuotedStr(Unid);
  sq := sq + ' WHERE id = ' + idSub.ToString;

  ExecSQL(sq , 'Alterar');
end;

procedure TBce.Prod_SubInserir(ligCli, ligProd: Integer; NomeS, CodB, CodC,
  CodT, Unid: String; ativo, qtMin, qtUM: Integer);
begin
  sq := 'INSERT INTO TBE_PRODSUB (ligcli, LigProd, NomeSub, CodBarras, CodCli, ';
  sq := sq + '  CodTransp, ativo, quantSubMin, quantUM, Unidade, ligKit, ';
  sq := sq + '  quantSub, quantCalc, bPadrao) Values ( ';
  sq := sq + '  ' + ligCli.ToString;
  sq := sq + ', ' + ligProd.ToString;
  sq := sq + ', ' + QuotedStr(NomeS);
  sq := sq + ', ' + QuotedStr(CodB);
  sq := sq + ', ' + QuotedStr(CodC);
  sq := sq + ', ' + QuotedStr(CodT);
  sq := sq + ', ' + ativo.ToString;
  sq := sq + ', ' + qtMin.ToString;
  sq := sq + ', ' + qtUM.ToString;
  sq := sq + ', ' + QuotedStr(Unid);
  sq := sq + ', 0, 0, 0, 0 ';
  sq := sq + ') ';
  ExecSQL(sq , 'Inserir');

end;

procedure TBce.Prod_SubMostrar(idC: Integer);
begin
  sq := ' Select * from TBE_PRODSUB WHERE ligcli = '+idC.ToString;
  RodaSQL(eDM.sdsProdS, eDM.cdsProdS, sq);

end;

end.
