unit uBanco;

interface

uses
  DB, uDM1, uDM2, uDM3, uDM4, uDM5, uLib, DateUtils, Variants, SQLExpr, DBClient;

type
  // Tipadas

  // principaL
  TBco = class(TObject)

  private
    // variáveis
    sq : String;
    numRoma : Integer;
    procedure sqlRoda(DataS : TSQLDataSet; ClientDS : TClientDataSet; SQL : String);
  protected

  public
    // procedures e métodos
    procedure set_numRoma(i : Integer);
    { Usuários - TB_Usuarios }
    procedure Usuarios_Mostra;
    procedure Usuarios_MostraId(id : integer);
    procedure Usuarios_Insere(login : String; nivel, status : integer);
    procedure Usuarios_Altera(id : integer; login : String; nivel, status : integer);
    procedure Usuarios_AlteraUltA(id : integer; dt : Tdatetime);
    procedure Usuarios_AlteraSenha(id : integer; Senha : String);
    procedure Usuarios_AlteraNome(id : integer; Nome : String);
    procedure Usuarios_Apaga(id : integer);
    function  Usuarios_Procura(login, Senha: String):integer; overload;
    function  Usuarios_Procura(login : String):integer; overload;
    { Valores }
    procedure CarroF_Mostra;
    procedure CarroF_MostraId(idC : integer);
    procedure CarroF_Insere(Placa, Tipo, chassi, codLibera: String);
    procedure CarroF_Altera(idC : integer; Placa, Tipo, chassi, codLibera: String);
    procedure CarroF_Apaga(idC : integer);
    procedure CarroF_ProcuraPlaca(inic : String);
    procedure CarroF_PesqCarro(dt1, dt2:TdateTime; idCar : Integer);
    procedure CarroF_PesqMotor(dt1, dt2:TdateTime; idMot : Integer);
    { Valores }
    procedure Valores_Mostra;
    procedure Valores_MostraId(id : integer);
    procedure Valores_Insere(serv:String; vp, vm, vg, ve : double; num, idU:integer);
    procedure Valores_Altera(id : integer;serv:String; vp, vm, vg, ve : double; num, idU:integer);
    procedure Valores_Apaga(id : integer);
    function  Valores_ProcuraNum(n : integer): integer;
    procedure Valores_ProcuraDesc(inic : String);
    { Grupo }
    procedure Grupo_Mostra(idM : Integer);
    procedure Grupo_MostraId(id : integer);
    procedure Grupo_Insere(idM, Num : Integer; Descricao :String);
    procedure Grupo_Altera(id, Num : integer; Descricao: String);
    procedure Grupo_Apaga(id : integer);
    procedure Grupo_ProcuraDesc(inic : String;idM : integer);
    function  Grupo_Conta(idM : Integer):Integer;
    { Modelos }
    procedure Modelos_Mostra;
    procedure Modelos_MostraId(id : integer);
    procedure Modelos_Insere(modelo :String; tamanho : smallint);
    procedure Modelos_Altera(id : integer;modelo :String; tamanho : smallint);
    procedure Modelos_Apaga(id : integer);
    procedure Modelos_ProcuraDesc(inic : String);
    { Funcs }
    procedure Funcs_Mostra;
    procedure Funcs_MostraId(id : integer);
    procedure Funcs_Insere(Nome :String; cpf, rg, obs : String; idUser : integer; dtnasc,dtFicha : tDateTime; tipo : smallint; chnum, chcat : String; chval : tdateTime; seg:Smallint; segValidade, dtAjuste:TDateTime; Rntrc: String; vPonto:Double );
    procedure Funcs_Altera(id: integer; Nome, cpf, rg, obs, ch, CHcategoria: String; idU : integer; seg:Smallint; segValidade, CHValidade, dtNasc,dtFicha, dtAjuste:TDateTime; vPonto, Salario:Double; Rntrc: String; Ativo:Integer );
    procedure Funcs_Apaga(id : integer);
    procedure Funcs_ProcuraNome(inic : String; tipo, ativo : smallint);
    function  Funcs_Existe(cpf : String; ativo:smallint): integer;
    function  Funcs_LeKM(id : Integer): double;
    procedure Funcs_GravaKM(id: Integer; km:double);
    function  Funcs_Ultimo():Integer;
    procedure Funcs_Lista();
    procedure Funcs_ListaMotoristas();
    procedure Funcs_ListaFat(ativo:Integer);
    procedure Funcs_Detalhes_Mostrar1(idM:Integer; dt1, dt2:TDateTime);
    procedure Funcs_Detalhes_Mostrar2(idM:Integer; dt1, dt2:TDateTime);
    procedure Funcs_Detalhes_Mostrar3(idM:Integer; dt:TDateTime);
    function  Funcs_Nome(idM:Integer):String;

    { enderecos: Tab=C (Cliente) Tab=F (Funcs) }
    procedure Enderecos_MostraId(Tab:String;idM : integer);
    procedure Enderecos_Insere(Tab:String;idM : integer);
    procedure Enderecos_Altera(Tab:String;idM : integer; Endereco:String; Numero: integer; Complemento, Bairro, Cidade, Estado, CEP, codMun:String);
    procedure Enderecos_Apaga(Tab:String;idM : integer);
    { tels: Tab=C (Cliente) Tab=F (Funcs) }
    procedure Tels_MostraId(Tab:String;id : integer);
    procedure Tels_MostraTodos(Tab:String;idM : integer);
    procedure Tels_Insere(Tab:String;idM : integer; Desc, Num, Detalhe : String );
    procedure Tels_Altera(Tab:String;id : integer; Descricao:String; Numero, detalhe: String);
    procedure Tels_Apaga(Tab:String;id : integer);
    procedure Tels_ApagaTodos(Tab:String;idM : integer);
    function  Tels_Conta(Tab:String; idM : Integer): integer;
    { Cliente }
    procedure Cliente_Mostra;
    procedure Cliente_MostraId(id : integer);
    procedure Cliente_Insere(Nome :String; cpf, rg, cnpj, ie, obs : String; pessoa : smallint; idUser : integer);
    procedure Cliente_Altera(id : integer;Nome :String; cpf, rg, cnpj, ie, obs : String; pessoa : smallint; idUser, ativo : integer);
    procedure Cliente_AlteraCarroEXTRA(id : integer;Valor : Double);
    procedure Cliente_AlteraPadrao(id : integer; PadraoSP, PadraoGSP, PadraoINT, nSaida : Smallint);
    procedure Cliente_Apaga(id : integer);
    procedure Cliente_ProcuraNome(inic : String);
    function  Cliente_Existe(cpf : String): integer;
    function  Cliente_ExisteNome(n : String): integer;
    procedure Cliente_SalvaOutros(id, ImpRec, nfSerie, prazo:Integer; PagoExtra : Double; Armazenagem, usa_SMS, ctee, ctei, cteIE, OCcliente :Smallint);
    procedure Cliente_GrupoProd();
    function  Cliente_Nome(idC:Integer):String;

    procedure GrupoProd_Grupos(idCli:integer);
    procedure GrupoProd_Produtos(idgrupo:Integer);

    { CEPS }
    procedure CEP_Procura(cep : String);
    { Web: Tab=C (Cliente) Tab=F (Funcs) }
    procedure Web_MostraId(Tab:String;id : integer);
    procedure Web_MostraTodos(Tab:String;idM : integer);
    procedure Web_Insere(Tab:String;idM : integer; Descricao, Web : String );
    procedure Web_Altera(Tab:String;id : integer; Descricao:String; Web: String);
    procedure Web_Apaga(Tab:String;id : integer);
    procedure Web_ApagaTodos(Tab:String;idM : integer);
    function  Web_Conta(Tab: String; idM: Integer): Integer;

    procedure WebAt_Pesq1(dt:TdateTime);
    procedure WebAt_Pesq2(numR : Integer);
    procedure WebAt_Pesq3(idNF : Integer);
    procedure WebAt_Pesq4();
    procedure WebAt_Pesq5a();

    {PRODUTO}
    procedure Prod_Altera(id: integer; Cod, CodBarra, CodCli, Descricao, Comp, Unidade, nfNCM: String;
         Minimo, nfCFOP, flg_MinTela, flg_MinMail: Smallint; Palete, Peso: Double; LigGrupo, Cubagem : Integer);
    procedure Prod_Apaga(id : integer);
    procedure Prod_ApagaTodosC(idM : integer);
    procedure Prod_ApagaTodosG(idM : integer);
    procedure Prod_Insere(idM : Integer;Cod, CodBarra, CodCli, Descricao, Comp, Unidade, nfNCM: String;
         Minimo, nfCFOP, flg_MinTela, flg_MinMail: Smallint; Palete, Peso: Double; LigGrupo, Cubagem : Integer);
    procedure Prod_MostraId(id : integer);
    procedure Prod_MostraTodos(idM : integer);
    procedure Prod_MostraGrupo(idM : integer);
    procedure Prod_MostraDescricao(idM: integer; desc : String);
    procedure Prod_MostraCod(idM: integer; cod : String);
    function  Prod_Existe(CodBarra : String): integer;
    { BANCO }
    procedure Banco_MostraId(id : integer);
    procedure Banco_MostraTodos(idM : integer);
    procedure Banco_Insere(idM : integer; BcoNum, BcoNome, Agencia, Conta, CPF, favorecido : String; tipoCC:Smallint );
    procedure Banco_Altera(id : integer; BcoNum, BcoNome, Agencia, Conta, CPF, favorecido : String; tipoCC:Smallint);
    procedure Banco_Apaga(id : integer);
    procedure Banco_ApagaTodos(idM : integer);
    function  Banco_Conta( idM : Integer): integer;
    { CARRO }
    procedure Carro_MostraId(id : integer);
    procedure Carro_MostraTodos(idM : integer);
    procedure Carro_Insere(idM : integer; Placa, Veiculo, CodLibera : String; Ano : Smallint );
    procedure Carro_Altera(id : integer; Placa, Veiculo, CodLibera : String; Ano : Smallint );
    procedure Carro_Apaga(id : integer);
    procedure Carro_ApagaTodos(idM : integer);
    function  Carro_Conta(idM : Integer): integer;
    { NOTAS }
    procedure Notas_MostraId(id : integer);

    procedure Notas_MostraNum(Num : integer);
    procedure Notas_MostraNumNovo(Num : integer);
    procedure Notas_MostraNum2Novo(idNF, Num : integer);
    procedure Notas_MostraNum2(idNF, Num : integer);
    procedure Notas_MostraCEP(idNF : integer; CEP:string);
    procedure Notas_MostraLocal(idNF : integer; Local:string);
    procedure Notas_MostraDest(idNF : integer; Dest:string);
    procedure Notas_MostraValor(idNF : integer; Valor:Double);
    procedure Notas_MostraDOC(idNF : integer; Doc:string);
    procedure Notas_MostraPED(idNF : integer; Doc:string);
    procedure Notas_MostraSMS(dia:TDateTime; tipo:Smallint);
    procedure Notas_MostraTodos(idM : integer);
    procedure Notas_SemCli();
    procedure Notas_AlteraCli(idNF, idC:integer);
    function  Notas_RecuperaId(numNF : Integer):Integer;
    procedure Notas_Inserir(idC, numNF, Volume: Integer; Valor, Peso : double; CEP, Locali:String; nConh, Origem:integer; ContaReent:Smallint; Dest, FoneDest, DocDest, cnpjEmb:String; serieNF, Priorid:Integer);
    procedure Notas_Alterar(idN, numNF, Volume: Integer; Valor, Peso : double; CEP, Locali:String; nConh:Integer; ligCli, Origem:integer; Dest, FoneDest, DocDest:String; Priorid:Smallint);
    procedure Notas_AlterarSMS(idN, usa_SMS: Integer );
    procedure Notas_AlterarFrete(idN:Integer; Valor:Double );
    procedure Notas_AlterarNFcomb(idN:Integer; Valor:Double );
    procedure Notas_Alterarfone(idN: Integer; tel:String);
    procedure Notas_Entregas_Alterar(idN:Integer;DTent, HRent, Obs, Recebedor, entregue  : String; nOcorr : Integer );
    procedure Notas_Entregas_Ocorr(idN:Integer; Obs,  entregue  : String; nOcorr : Integer );
    procedure Notas_Escolhe(numNF : integer);
    procedure Notas_Reentrega(idN : Integer);
    procedure Notas_MarcarStatus(idN, st : Integer);
    procedure Notas_MarcarBaixa(idN, idUser, tipo : Integer);
    procedure Notas_MarcarBaixa2(idN, tipo : Integer);
    procedure Notas_MarcarProxRoma(idN, px : Integer);
    procedure Notas_RefazProxRoma(numNF, ligCli : Integer);
    procedure Notas_Geral(idN : Integer);
    procedure Notas_Alterar_Motivo(idN, nOcorr : Integer);
    procedure Notas_TipoLocal(idN, tLocal : Integer);
    procedure Notas_TipoLocal_Calc(idN : Integer);
    procedure Notas_MarcarCubagem(idN : Integer; cub : double; Peso : double);
    procedure Notas_Baixa(nNF, idCli : Integer);
    procedure Notas_BaixaGrupo(idCli, nfinicio, nffim : Integer);
    procedure Notas_BaixaGrupo2();
    procedure Notas_ListaReent(dt : TDateTime);
    procedure Notas_SemMarca(dta, dtb : TDateTime);
    procedure Notas_Apagar(idNF:Integer);
    procedure Notas_Anotar(idNF, idUser:Integer);
    procedure Notas_ContaTipos(dt1,dt2 : TdateTime);
    procedure Notas_MostraDia(Tipo: Integer; dti, dtf: TDateTime);
    function  Notas_MostraDia_Rel(Tipo: Integer; dti, dtf: TDateTime):Integer;
    function  Notas_MostraDia_Rel2(Tipo: Integer; dti, dtf: TDateTime):Integer;
    procedure Notas_MostraDia_Partes(Tipo: Integer; dti, dtf: TDateTime);
    procedure Notas_MostraDia_Cli(dti: TDateTime);
    procedure Notas_MostraDia_SemCob(dti, dtf: TDateTime);
    procedure Notas_MostraDatas(dti, dtf: TDateTime);
    Function  Notas_MostraDia_ContaTodas(dti, dtf: TDateTime):Integer;
    function  Notas_Existe(ligCli, numNF, volume: Integer; valorNF : Double): Boolean;
    function  Notas_Existe_Reentrega(idNF, nNF, idC: Integer): Boolean;
    procedure Notas_Pesquisa(idCli, Origem : Integer; dt1, dt2:TDateTime);
    function  Notas_PQcontaNF(tipo, idCli, Origem : Integer; dt1, dt2:TDateTime):Double;
    function  Notas_PQcontaSEM(idCli, Origem : Integer; dt1, dt2:TDateTime):integer;
    procedure Notas_Altera_TipoCob(idNota, tipo:Integer);
    procedure Notas_PesquisaCLI(idCli:Integer; dt1, dt2:TDateTime);
    procedure Notas_PesquisaNFI(idCli, numNF:Integer);
    procedure Notas_PesquisaRota(idRota:Integer);
    procedure Notas_setIMP(idNF, imp : Integer);
    function  Notas_SeriePadrao(idCli:Integer):Smallint;
    procedure Notas_AlteraDiasE(idNF,Dias:Integer);
    procedure Notas_AlteraRecebedor(idNota:Integer; Rec:String);
    procedure Notas_MarcaPendencia(idNF, pende:integer);
    procedure Notas_AlteraObs(idNota:Integer; Obs:String);
    procedure Notas_VisualizaPendencias(pende:integer);
    procedure Notas_TodasDia(dt:TdateTime; idCli:Integer);
    procedure Notas_OCOREN(dt:TdateTime; idCli:Integer);
    function  Notas_semWEB():integer;
    procedure Notas_SAC(dtR:TDateTime);
    procedure Notas_Prioridade(idNF, Prioridade:Integer);
    procedure Notas_fCli(idCli:Integer);
    procedure Notas_fID(idNF:Integer);
    procedure Notas_Altera_numCham(nNota, nCli, nCham:Integer);
    procedure Notas_Altera_Baixa(idN, nOc, nOrigem:Integer; Recebedor, dtE, hrE:String);
    procedure Notas_MarcaGrupo(idNF, CTgrupo:Integer);



    procedure Notas_XML_Importa(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali: String; DtNotaF: TDateTime; tLocal:Integer; nomeDest,FoneDest, DocDest:String; serie:Integer);

    procedure Notas_XML_Importa_Alt(ligCli, numNF, serieNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, nomeDest, foneDest, DocDest: String);

    procedure Espelho_XML_Importa(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, trp_nome, trp_cnpj, RazaoS, Endereco, Complemento, Bairro, Cidade, CodMunicipio, Estado: String; Numero, NumConhec: Integer; CNPJ, IE,ChaveNFe : String);
    procedure Espelho_XML_Altera(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, trp_nome, trp_cnpj, RazaoS, Endereco,
  Complemento, Bairro, Cidade, CodMunicipio, Estado: String; Numero,
  NumConhec: Integer; CNPJ, IE, ChaveNFe: String);

    procedure Notas_InserirFIG(idNF:Integer; fig:String);
    procedure Notas_MostrarFIG(idNF:Integer);

    procedure NotasFora_Insere(LigNF, LigUser, NUMnota : Integer;  EVnum:Smallint; EVdesc:String );
    procedure NotasFora_Altera(idEV, LigUser: Integer;  EVnum:Smallint; EVdesc:String );
    procedure NotasFora_MostraId(idEV:Integer);
    procedure NotasFora_PesqNF(numNF, ligCli:Integer);
    procedure NotasFora_PesqNFid(idNF:Integer);
    procedure NotasFora_PesqEV(numNF:Integer);

    procedure NotasVolta_MostraDevol();
    procedure NotasVolta_MostraColetas();
    function  NotasVolta_ExisteDevol(LigCli, numNF:Integer):Integer;
    function  NotasVolta_ExisteColeta(LigCli, numNF:Integer):Integer;
    procedure NotasVolta_Marca(idNF:Integer; StatusDev:Smallint);
    procedure NotasVolta_ClassDev(Tipo:Integer);
    procedure NotasVolta_SelecionaDevol();
    procedure NotasVolta_SelecionaColeta();

    procedure NotasReent_MostraDia(dtRoma : TDateTime);
    procedure NotasReent_MostraNum(numNF, idCli  : Integer);

    procedure Nota_Reenvia(idNF, idCli : Integer);
    { Tela: Notas sem Cobrança }
    function  NotasSC_ContaCob(dt1, dt2:TDateTime):Integer;
    function  NotasSC_ContaDevol(dt1, dt2:TDateTime):Integer;
    function  NotasSC_ContaBaixa(dt1, dt2:TDateTime):Integer;
    procedure NotasSC_MostraCob(dt1, dt2:TDateTime);
    procedure NotasSC_MostraDevol(dt1, dt2:TDateTime);
    procedure NotasSC_MostraBaixa(dt1, dt2:TDateTime);

    procedure Notas_Alt_MostraNF(idNF : integer);
    procedure Notas_Alt_Insere(idNF:Integer; FretePeso, AdicPeso, AdValor, Gris, pedagio, Emissao, TDE, qtPontos, vPontos, Reent, Devol, Outros, Icms:Double );
    procedure Notas_Alt_Altera(idNF:Integer; FretePeso, AdicPeso, AdValor, Gris, pedagio, Emissao, TDE, qtPontos, vPontos, Reent, Devol, Outros, Icms:Double );

    procedure Notas_Fases_Insere(Ligcli, NumNF, NumEvento, LigUser, numRoma, Serie: Integer);
    procedure Notas_Fases_AlteraOC(Ligcli, NumNF, NumEvento, Envio_OC : Integer);
    procedure Notas_Fases_AlteraWEB(Ligcli, NumNF, NumEvento, Envio_WEB : Integer);
    procedure Notas_Fases_Lista(Evento:Smallint);
    function  Notas_Fases_Conta(Ligcli, NumNF:Integer):Integer;
    function  Notas_Fases_Ultimo(Ligcli, NumNF:Integer):Integer;
    function  Notas_Fases_NumSerie(Ligcli, NumNF:Integer):Integer;

    procedure Notas_Fases_MostraNF(Ligcli, NumNF:Integer);
    procedure Notas_Fases_Retiradas(dt:TDateTime);

    procedure Notas_Unica_AltCli(nNF, idCant, idCnovo:Integer);
    procedure Notas_Unica_AltStatus(nNF, idC, st : Integer);
    procedure Notas_Unica_Apagar(idU:Integer);
    procedure Notas_Unica_MostraQT(dias:Smallint);
    procedure Notas_Unica_BIPtotais(dt:TDateTime);
    procedure Notas_Unica_BIPnotas(dt:TDateTime);
    procedure Notas_Unica_MarcaVol(idU, volB, stB:Integer);
    procedure Notas_Unica_Rel(idCli:Integer);
    procedure Notas_Unica_DiasProcura(dt:TDateTime; idCli:Integer);
    procedure Notas_Unica_Acompanha(dtA, dtB:TDateTime; idCli:Integer);




    procedure Notas_Obs2_Mostra(nNF, idCli:Integer);
    procedure Notas_Obs2_Inserir(nNF, idCli, idUsuario, tipo:Integer; obs2:String);

    procedure Notas_Retorno_Baixas(grupoNF:String);
    procedure Notas_Retorno_fBaixas(nNF:Integer);

    procedure Notas_Retorno_Rastreio(grupoNF:String);
    procedure Notas_Retorno_fRastreio(nNF:Integer);
    procedure Rastreio_Mostra;


    procedure BIP2_Insere(dtEntrada:TDateTime);
    procedure BIP2_Altera_UltConfere(idB2:Integer; dtUlt:TDateTime);
    procedure BIP2_Altera_Notas(idB2, nts:Integer);
    procedure BIP2_Mostra();
    procedure BIP2_MostraData(dtE:TDateTime);

    procedure BIP2_NF_Insere(ligBip, nfnum, vol:Integer);
    procedure BIP2_NF_AlteraVol(ligBip, nfnum, vol:Integer);
    procedure BIP2_NF_AlteraStatus(ligBip, nfnum, status:Integer);
    procedure BIP2_NF_Apaga(ligBip, nfnum:Integer);
    procedure BIP2_NF_MostraID(idB2nf:Integer);
    procedure BIP2_NF_MostraIdB2(idB2:Integer);
    procedure BIP2_NF_MostraNF(idB2, numnf:Integer);
    procedure BIP2_NF_MostraST(ligBip, St:Integer);

        {
    function  CobV_Existe(idNF:integer):boolean;
    procedure Cobv_insere(idNF, idCli, cpnumNf, cpNcte : integer; cpDtRoma:TDateTime);
    procedure Cobv_Altera(idNf:Integer);
    procedure Cobv_AlteraStatus(idNf:Integer);
    procedure Cobv_AlteraFlag(idNf:Integer);
    procedure Cobv_Combinado(idNf:Integer, v, tipo)
    procedure Cobv_copiaNF(idNf:Integer, mf, ped)
    procedure Cobv_copiaRoma(idNf:Integer, dt)
    procedure Cobv_copiaCte(idNf:Integer, n)
      }
    { ROMANEIO }
    procedure Romaneio_Insere();
    function  Romaneio_RecuperaID(): Integer;
    procedure Romaneio_Altera(idR, LigMot, ligAjud, ligReg, ligVeic: Integer; dtR : TDateTime; tCarro, ligCarF:Integer);
    procedure Romaneio_InsereNota(idN, num : integer);
    procedure Romaneio_AnoNovo();
    procedure Romaneio_MostraNum(num : Integer);
    procedure Romaneio_MostraNotas(num : Integer);
    procedure Romaneio_MostraNotasRec(num : Integer);
    procedure Romaneio_MostraNotasRecFiltro(num : Integer);
    procedure Romaneio_NotasSEM(pag : Integer);
    procedure Romaneio_NotasR(dtR : TDateTime; idC: Integer);
    procedure Romaneio_NotasRel(dtR: TDateTime);
    procedure Romaneio_NotasRel2(idCob : Integer);
    procedure Romaneio_MostraUlt();
    procedure Romaneio_NotasRegiao(numR, Reg : Integer);
    procedure Romaneio_NotasCarro(numR, Carro : Integer);
    procedure Romaneio_Soma(numR : Integer);
    procedure Romaneio_NotasCli(numR:Integer);
    procedure Romaneio_NotasBaixa(numR:Integer);
    procedure Romaneio_PesqDT(dt : TDateTime);
    procedure Romaneio_PesqDT2(dt : TDateTime);
    procedure Romaneio_PesqDT3(dt : TDateTime);
    procedure Romaneio_PesqDT4(dt : TDateTime);
    function  Romaneio_PesqDT_Total(dt : TDateTime):Integer;
    procedure Romaneio_ListaServ(idC : Integer; dt1, dt2 : TDateTime);
    function  Romaneio_PesoTotal(numR:Integer):double;
    procedure Romaneio_SalvaCombinado(numR:Integer; vCombina:Double);
    procedure Romaneio_SalvaFreteCombinado(numR:Integer; vCombina:Double);
    function  Romaneio_Existe(numBD:Integer):boolean;
    procedure Romaneio_PesqDT5(dt : TDateTime);
    procedure Romaneio_MostraMot(numR : Integer);
    procedure Romaneio_Doc(numR, ligCli : Integer);

    function  Roma_Obs_Mostra(idR:Integer):String;
    procedure Roma_Obs_Grava(idR, idUs, nR : Integer; sObs:String);
    function  Roma_Obs_Existe(idR:Integer):Boolean;

    { WEB notas }
    procedure WS_Notas_Mostra(dt : TDateTime);
    procedure WS_MarcaResp(idN, r : Integer);
    procedure WS_MarcaRespVarias(r : Integer; ids:string);
    procedure WS_Notas_Atualiza(numNF, numR, idCli, status, nMotivo : String; datae, horae : String);
    procedure WS_Notas_Atualiza2(idNF, status, nMotivo : String; datae, horae : String);
    procedure WS_MarcaRespRomaneio(numRoma, st : Integer);
    procedure WS_MarcaRespDia(dia:TDateTime; st : Integer);

    procedure REST_Notas(nRoma:Integer; reenviar:boolean);
    procedure REST_NotasSEL(cjNotas:String; reenviar:boolean);
    procedure REST_NotasDia(dia:TDateTime; reenviar:boolean);
    procedure REST_RomaDia(dia:TDateTime);
    procedure REST_RomaDiaFiltra(nRoma:Integer);

    procedure REST_Romaneio(nRoma:Integer);
    procedure REST_BaixaAlterados();
    procedure REST_BaixaRoma(nR:Integer);
    procedure REST_BaixaDia(dia:TDateTime);
    procedure REST_BaixaNotas(ids:String);
    procedure REST_BaixaMarcaVarios(ids:String);

    procedure REST_dadosWEB_Marca(idN, idC, status : Integer);
    procedure REST_dadosWEB_Mostra(status : Integer);

    { REGIAO }
    procedure Regiao_MostraId(id : integer);
    procedure Regiao_MostraClass(cl : smallint);
    procedure Regiao_Mostra();
    procedure Regiao_Insere(Descr : String; cl : Smallint );
    procedure Regiao_Altera(id : integer; Descr : String; cl : Smallint );
    procedure Regiao_Apaga(id : integer);
    procedure Regiao_Pesquisa(descr : String);
    { OCORRENCIA }
    procedure Ocorre_MostraId(id : integer);
    procedure Ocorre_Mostra();
    procedure Ocorre_Insere(num : integer; Descr : String; uso, pend, sms, sac, gcte : integer );
    procedure Ocorre_Altera(id : integer; num : integer; Descr : String; uso, pend, sms, sac, gcte : integer );
    procedure Ocorre_Apaga(id : integer);
    procedure Ocorre_PesqNum(no : integer);
    procedure Ocorre_PesqNF(no : integer; dt : TdateTime);
    procedure Ocorre_PesqInicio(inic : String);
    procedure Ocorre_PesqMeio(inic : String);
    function  Ocorre_uso(nUso:Integer):String;
    function  Ocorre_fPesq(nOc:Integer):String;

    procedure Ocorre_Cliente_Insere(idG, tipo, pad, novo:Integer);
    procedure Ocorre_Cliente_Altera(idG, tipo, pad, novo:Integer);
    procedure Ocorre_Cliente_Apaga(idG, tipo, pad:Integer);
    procedure Ocorre_Cliente_Mostra(idG:Integer);



    {CONTROLE}
    procedure Controle_Mostra_Romaneios(dt : TDateTime);
    procedure Controle_Mostra_Ticket(no : Integer);
    procedure Controle_Mostra_Restante();
    procedure Controle_Mostra_Reent(dtR : TDateTime);
    procedure Controle_Altera_StatusENT(numR,  st : Integer);
    procedure Controle_Altera_StatusTkt(numNF, numR,st : Integer);
    {FRETE}
    procedure Frete_CadAdic_Mostra(idC: Integer);
    procedure Frete_CadAdic_Insere(idC: Integer; tipo, Local: Smallint; AdVal, AdValMin, Gris, GrisMin, GrisSup, DifTx, DifMin, DifMax, ICMSma, ICMSme, ICMSate,  Ponto, Pedagio,FMin, Emissao, Devol, Reent, VRisco, VRiscoAD: Double);
    procedure Frete_CadAdic_Altera(idC: Integer; tipo, Local: Smallint; AdVal, AdValMin, Gris, GrisMin, GrisSup, DifTx, DifMin, DifMax, ICMSma, ICMSme, ICMSate,  Ponto, Pedagio,FMin, Emissao, Devol, Reent, VRisco, VRiscoAD: Double);
    function  Frete_CadAdic_Procura(idC:Integer; tipo, Local:Smallint ): Boolean;
    {FRETE PESO 1}
    procedure FretePeso_Altera(idF:Integer; inicio, fim, vcap, vgsp, vint, vint2, voest, vout : double );
    procedure FretePeso_Insere(idC:Integer; inicio, fim, vcap, vgsp, vint, vint2, voest, vout : double );
    procedure FretePeso_Apaga(idF: Integer);
    procedure FretePeso_ApagaCLI(idC: Integer);
    procedure FretePeso_MostraId(idF : Integer);
    procedure FretePeso_Mostra(idC : Integer);
    {FRETE PESO 2}
    procedure FretePesoExc_Altera(idC:Integer; ecap, egsp, eint, eint2, eoest, eout : double);
    procedure FretePesoExc_Insere(idC:Integer; ecap, egsp, eint, eint2, eoest, eout : double);
    procedure FretePesoExc_Mostra(idC : Integer);
    {Frete SAIDA}
    procedure FreteSaida_Insere(ligCli, faixa:Integer);
    procedure FreteSaida_Altera(ligCli, faixa:Integer; cobSP, pagSP, cobG, pagG, cobINT, pagINT, cobINT2, pagINT2, cobOEST, pagOEST, cobOUT, pagOUT : Double);
    procedure FreteSaida_Mostra(ligCli, faixa:Integer);
    {FRETE Entrega}
    procedure FreteEntrega_Altera(idC:Integer; cap_valor, gsp_valor, int_valor, int2_valor, oest_valor, out_valor : double);
    procedure FreteEntrega_Insere(idC:Integer; cap_valor, gsp_valor, int_valor, int2_valor, oest_valor, out_valor : double);
    procedure FreteEntrega_Mostra(idC : Integer);
    {FRETE Taxa}
    procedure FreteTaxa_Altera(idC:Integer; cap_perc, cap_min, gsp_perc, gsp_min, int_perc, int_min, int2_perc, int2_min, oest_perc, oest_min, out_perc, out_min : double);
    procedure FreteTaxa_Insere(idC:Integer; cap_perc, cap_min, gsp_perc, gsp_min, int_perc, int_min, int2_perc, int2_min, oest_perc, oest_min, out_perc, out_min : double);
    procedure FreteTaxa_Mostra(idC : Integer);
    {FRETE Contrato}
    procedure FreteContrato_Altera(idC:Integer; vMensal, vAvulso_km, vAvulso_hora : double; km:Integer; hora, tipocob:Smallint);
    procedure FreteContrato_Insere(idC:Integer; vMensal, vAvulso_km, vAvulso_hora : double; km:Integer; hora, tipocob:Smallint);
    procedure FreteContrato_Mostra(idC : Integer);
    procedure FreteContrato_Notas(nRoma : Integer);
    procedure FreteContrato_Grava(idNF, Tipo_Cob : Integer; vFrete : Double);

    {FRETE Contrato}
    procedure FreteContratoDia_Altera(id, idC, idM :Integer; dia, hr1, hr2:TDateTime; km1, km2 : Integer; desconto:Double; Motivo:String; hrExtra:Double; kmExtra:Integer; vhr,vkm,vhrPago,vkmPago : Double; nRoma:Integer);
    procedure FreteContratoDia_Insere(idC, idM :Integer; dia, hr1, hr2:TDateTime; km1, km2 : Integer; desconto:Double; Motivo:String; hrExtra:Double; kmExtra:Integer; vhr,vkm,vhrPago,vkmPago : Double; nRoma:Integer);
    procedure FreteContratoDia_Mostra(id  : Integer);
    procedure FreteContratoDia_MostraC(idC : Integer; dt1, dt2 : tDateTime);
    procedure FreteContratoDia_MostraB(idC : Integer; dt1, dt2 : tDateTime);
    procedure FreteContratoDia_MostraM(idM : Integer; dt1, dt2 : tDateTime);
    Function  FreteContratoDia_Existe(idC, idM : Integer; dt : TDateTime): Integer;
    procedure FreteContratoDia_Notas(idC, idM : Integer; dt : TDateTime);
    procedure FreteContratoDia_Romaneios(idC, idM : Integer; dt1,dt2 : TDateTime);
    procedure FreteContratoDia_Romaneio(idC, idM : Integer; dt1,dt2 : TDateTime);
    procedure FreteContratoDia_Notas2(idCred2 : Integer);

    procedure FreteCOB_MostraDias(dt1, dt2 : tDateTime);
    procedure FreteCOB_MostraClientes(dt1, dt2 : tDateTime);
    procedure FreteCOB_MostraNotas(dt1, dt2 : tDateTime);
    procedure FreteCOB_fMostraNFcli(idCli:Integer);
    procedure FreteCOB_fMostraNota(idNF:Integer);
    procedure FreteCOB_Inicia(idNF:Integer); overload;
    procedure FreteCOB_Inicia(nRoma:Integer; c:char); overload;
    procedure FreteCOB_Inicia(dt1,dt2:TDateTime); overload;
    procedure FreteCOB_Servico();
    procedure FreteCOB_Total();
    procedure FreteCOB_Cte(dt1,dt2:TDateTime); overload;
    procedure FreteCOB_CTe(idNF:Integer); overload;
    procedure FreteCOB_fCTe(idNF:Integer);

    {pagamento}
    procedure Pagamento_Mostrar(idMot:Integer; dt1, dt2:tDateTime);
    procedure Pagamento_AlterarKm(numR, tipo, km:Integer);
    procedure Pagamento_AlterarValor(numR, tipo:Integer; Valor:Double);
    procedure Pagamento_AlterarTipo(numR, tipo:Integer);
    procedure Pagamento_Rel1(dt1, dt2 : TDateTime);
    procedure Pagamento_Rel1a(dt1, dt2 : TDateTime);
    procedure Pagamento_Rel1b(dt1, dt2 : TDateTime);
    procedure Pagamento_ContarCli(tipo, idMot: Integer; dt1,dt2:TDateTime);
    function  Pagamento_CalcOutrasNF(numR:Integer):Double;
    function  Pagamento_CalcPontos(idM, Pontos:Integer):Double;
    function  Pagamento_CalcPesoExc(numR, LimiteNF:Integer):Double;
    procedure Pagamento_CopiaDados(idMotOrigem, idMotDest:Integer);
    procedure Pagamento_ContaCEP_repetidos(nR : Integer);


    procedure PagFaixa_Mostrar(idMot, tipolocal:Integer);
    procedure Pagfaixa_Inserir(idMot, tipolocal, inicio, fim:Integer;ValorMot,ValorAjud:Double);
    procedure PagFaixa_Alterar(idP1, tipolocal, inicio, fim:Integer;ValorMot,ValorAjud:Double);
    procedure PagFaixa_Apagar(idP1:Integer);

    procedure Pag2Faixa_Mostrar(idMot, tipolocal:Integer);
    procedure Pag2Faixa_Inserir(idMot, tipolocal, inicio, fim:Integer;vpag,vcob:Double);
    procedure Pag2Faixa_Alterar(idP3, tipolocal, inicio, fim:Integer;vpag,vcob:Double);
    procedure Pag2Faixa_Apagar(idP3:Integer);

    procedure PagFaixaMais_Mostrar(idMot, tipolocal:Integer);
    procedure PagFaixaMais_Inserir(idMot, tipolocal, acimade:Integer;ValorMot,ValorAjud, Nota_Extra, vMinimo:Double; usaPeso:Smallint);
    procedure PagFaixaMais_Alterar(idP2, tipolocal, acimade:Integer;ValorMot,ValorAjud, Nota_Extra, vMinimo:Double; usaPeso:Smallint);
    procedure PagFaixaMais_Apagar(idP2:Integer);

    procedure Pag2FaixaMais_Mostrar(idMot, tipolocal:Integer);
    procedure Pag2FaixaMais_Inserir(idMot, tipolocal:Integer; Minimo, AcimaDe:Double);
    procedure Pag2FaixaMais_Alterar(idP4, tipolocal:Integer; Minimo, AcimaDe:Double);
    procedure Pag2FaixaMais_Apagar(idP4:Integer);

    procedure PagFaixaPeso_Mostrar(idMot, tipolocal:Integer);
    procedure PagfaixaPeso_Inserir(idMot, tipolocal:Integer; inicio, fim, Valor:Double);
    procedure PagFaixaPeso_Alterar(idP5, tipolocal:Integer; inicio, fim, Valor:Double);
    procedure PagFaixaPeso_Apagar(idP5:Integer);

    procedure PagLote_MostrarId(idPG:Integer);
    procedure PagLote_MostrarMot(idPG:Integer);
    procedure PagLote_Mostrar(q:Integer);
    Function  PagLote_Inserir(Descr:String; Quant:Smallint; vTotal:Double):Integer;
    procedure PagLote_Alterar(idPG:Integer;Descr:String; Quant:Smallint; vTotal:Double);
    procedure PagLote_Apagar(idPG:Integer);
    procedure PagLote_AlterarTabs(idPG:Integer; dt1, dt2:TDateTime);

    {Relatório}
    procedure Relatorio_Gerar(numRoma, idcli, idCob: Integer);
    procedure Relatorio_Datas(idCli, iTodos:Integer; dt1, dt2 : TDateTime);
    procedure Relatorio_Notas(idR:Integer);
    procedure Relatorio_NotasZero(idCob:Integer);

    procedure Relatorio_Mostrar(dt : TdateTime);
    procedure Relatorio_Grava(idN: Integer; vFrete : double; tpServ : Integer);
    procedure Relatorio_GravaPonto(idN: Integer; Pontos: smallint);
    procedure Relatorio_RetiraNota(idN: Integer);

    procedure Edi_Notas(nCli : Integer);
    procedure Edi_setStatus(idN, Status : Integer);
    function Edi_Reenvia(idCli:Integer; dt1, dt2:TdateTime):Integer;

    { PAGAMENTO - Notas}
    procedure PagNotas_Altera(SP_nt1, SP_nt2,GSP_nt1, GSP_nt2,INT_nt1, INT_nt2:Smallint;
      SP_mot1, SP_mot2, SP_mot3, SP_Ajud1, SP_Ajud2, SP_Ajud3, SP_Extra,
      GSP_mot1, GSP_mot2, GSP_mot3, GSP_Ajud1, GSP_Ajud2, GSP_Ajud3, GSP_Extra,
      INT_mot1, INT_mot2, INT_mot3, INT_Ajud1, INT_Ajud2, INT_Ajud3, INT_Extra:Double   );
    procedure PagNotas_Mostra();

    { PAGAMENTO - Notas}
    procedure PagContrato_Altera(vMensal, vAvulso_km, vAvulso_hora:Double);
    procedure PagContrato_Mostra();

    {Vales}
    procedure Vale_Altera(id , Tipo : integer; dtV:TdateTime; Descr:String; Valor: Double);
    procedure Vale_Insere(idM, Tipo : integer; dtV:TdateTime;  Descr:String; Valor: Double);
    procedure Vale_Apaga(id:integer);
    procedure Vale_MostraId(id:integer);
    procedure Vale_MostraDatas(idM:integer; dt1, dt2:TDateTime);
    procedure Vale_Total(idM:integer; dt1, dt2:TDateTime);
    {CredMot}
    procedure CredMot_Altera(id , Tipo : integer; dtV:TdateTime; Descr:String; Valor: Double);
    procedure CredMot_Insere(idM, Tipo : integer; dtV:TdateTime;  Descr:String; Valor: Double);
    procedure CredMot_Apaga(id:integer);
    procedure CredMot_MostraId(id:integer);
    procedure CredMot_MostraDatas(idM:integer; dt1, dt2:TDateTime);
    procedure CredMot_Total(idM:integer; dt1, dt2:TDateTime);

    { Credito }
    procedure Credito_Altera(id:Integer; descr:String; dtp:TdateTime);
    procedure Credito_Insere(idC:Integer; descr:String; dtp:TdateTime);
    procedure Credito_Apaga(id:integer);
    procedure Credito_MostraId(id:integer);
    procedure Credito_MostraDesc(idC: Integer; d : String);
    procedure Credito_MostraMes(idC, mes,ano : Integer);
    procedure Credito_MostraAno(idC, ano : Integer);
    procedure Credito_MostraItens(idM:Integer);
    procedure Credito_SPtotal(idC : Integer);

    { Credito2 - Contratos }
    procedure Credito2_Altera(id: Integer; descr: String; DataPrev: TdateTime; km:Integer; Hora:Double; vMensal, KmC, vKm, HoraC, vHora, SegNotas, vSeg, VCalc, Vdesp:Double; dt1,dt2:TDateTime);
    procedure Credito2_Insere(idC: Integer; descr: String; DataPrev: TdateTime; km:Integer; Hora:Double; vMensal, KmC, vKm, HoraC, vHora, SegNotas, vSeg, VCalc, Vdesp:Double; dt1,dt2:TDateTime);
    procedure Credito2_AlteraD(id: Integer; descr: String; DataPrev: TdateTime);
    procedure Credito2_InsereD(idC: Integer; descr: String; DataPrev: TdateTime);
    procedure Credito2_Apaga(id:integer);
    procedure Credito2_MostraId(id:integer);
    procedure Credito2_MostraAno(idC, ano : Integer);
    procedure Credito2_Existe(idC:Integer; dt1, dt2:TDateTime);
    procedure Credito2_MarcaDias(id, idC:Integer; dt1, dt2:TDateTime);
    procedure Credito2_MostraItens(id : Integer);

    { Conhecimentos }
    procedure Conhec_MostraData(idC:integer; dt1, dt2:TDateTime; todos:boolean);
    procedure Conhec_MostraDataNaoGeradosGrupo(dt1, dt2:TDateTime);

    procedure Conhec_AlteraEmissao(idC:integer; dt:TDateTime);
    procedure Conhec_MostraTransp(idC:integer; dt:TDateTime; reg:Integer);
    procedure Conhec_MarcaTransp(idNF, LigTransp:integer);
    procedure Conhec_InsereCalc(LigTransp, NumNota, LigCli, Serie: Integer; FretePeso, FreteValor, SecCat,
       Despacho, Pedagio, Outros, Total, Base, AliQ, ICMS, AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao:double;idNF, grupo : Integer; dtR : TDateTime; MotNome, MotPlaca, Motveiculo : String);
    procedure Conhec_AlteraCalc(idCTe, NumNota, NumC, idNota: Integer; FretePeso, FreteValor, SecCat,
       Despacho, Pedagio, Outros, Total, Base, AliQ, ICMS, AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao:double; dtR : TDateTime; MotNome, MotPlaca, Motveiculo : String );
    procedure Conhec_AlteraValores(idCTe:Integer; FretePeso, FreteValor, SecCat,
       Despacho, Pedagio, Outros, Total, Base, AliQ, ICMS, AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao:double );
    procedure Conhec_Status(idC, NumNota, Status:Integer);
    procedure Conhec_StatusEDI(idC, NumNota, StatusEDI:integer);
    function  Conhec_ExisteNF(idNF:integer):Boolean;
    procedure Conhec_PesqData(dt1,dt2: TdateTime; idCli:Integer);
    procedure Conhec_PesqNumC(numConhec, idTransp: Integer);
    procedure Conhec_PesqDocCob(numCob, idTransp: Integer);
    procedure Conhec_PesqNF(numNF:Integer);
    procedure Conhec_Motor(idN:integer);
    procedure Conhec_Numera( idNota:integer);
    procedure Conhec_NumeraGrupo( idNota, nGrupo:integer);
    procedure Conhec_UltimoNum(dt:TdateTime);
    procedure Conhec_MostraNF(idNF:Integer);
    procedure Conhec_MostraGrupo(nGrupo:Integer);
    procedure Conhec_MostraID(idCte:Integer);
    procedure Conhec_MostraNUM(nCte, nTransp:Integer);
    procedure Conhec_GrupoSoma(nGrupo:Integer; dia:TDateTime);
    function  Conhec_NotaCalculada(idNF:Integer):boolean;
    procedure Conhec_TomadorSalva(idCTe, Toma, TomaIe:Integer);
    function  Conhec_TomadorLe(idCte:Integer): Smallint;
    function  Conhec_TomadorLeIe(idCte:Integer): Smallint;

    procedure ConhecNF_PesqData(dt1,dt2: TdateTime; idCli:Integer);
    procedure ConhecNF_PesqDOCCOB(nDOC:Integer);

    {Outras Cobranças do Cliente}
    procedure CliCob_Alterar(idC, ligCli:Integer; Servico:String);
    procedure CliCob_Apagar(idC:Integer);
    procedure CliCob_Inserir(ligCli:Integer; Servico:String);
    procedure CliCob_Mostrar(idC:Integer);
    procedure CliCob_AlterarRomaneio(idCli, nRoma, Tipo:Integer);

    procedure Espelho_Mostra(idM, numNF : Integer);
    procedure Espelho_InsereCodMun(idE, codMun : Integer);
    procedure Espelho_AlteraDados(idE:Integer; CNPJ, iE, Chave:String; Endereco:String; Numero: integer; Complemento, Bairro, Cidade, Estado, CEP, codMun:String);
    procedure Espelho_AlteraCNPJ(idE:Integer; CNPJ: String);
    procedure Espelho_InsereDados(nNF, nCli: Integer);

    function  Func_Tel(idF : Integer):String;

    procedure Ticket_Devol_Seleciona;
    procedure Ticket_Devol_Marca(idNF, Status:Integer);
    procedure Ticket_Devol_Mostra;

    procedure Ticket_DiaConta(idC:Integer; dt1, dt2 : TDateTime);
    procedure Ticket_DiaMostra(idC:Integer; dt1, dt2 : TDateTime);

    procedure Ticket2_DiaConta(idC:Integer; dt1, dt2 : TDateTime);
    procedure Ticket2_DiaMostra(idC:Integer; dt1, dt2 : TDateTime);

    function  VoltaDev_Inserir():Integer;
    procedure VoltaDev_AdicionaItem(num, idNF:Integer);
    procedure VoltaDev_MostraNum(num:integer);
    procedure VoltaDev_MostraNota(idNF:integer);
    procedure VoltaDev_MostraUlt(n : integer);
    procedure VoltaDev_MostraTodos(tipo:integer);
    procedure VoltaDev_Receber(idDev:Integer; Nome:String);
    procedure VoltaDev_ReceberUM(idNF, idDev:Integer; Nome:String);

    function  VoltaCol_Inserir():Integer;
    procedure VoltaCol_AdicionaItem(num, idNF:Integer);
    procedure VoltaCol_MostraNum(num:integer);
    procedure VoltaCol_MostraNota(idNF:integer);
    procedure VoltaCol_MostraUlt(n : integer);
    procedure VoltaCol_MostraTodos(tipo:integer);
    procedure VoltaCol_Receber(idCol:Integer; Nome:String);

    procedure Pesq_Carro(veiculo : String);
    procedure Pesq_TicketDatas(idcli:Integer; dt1, dt2:TDateTime);

    procedure Gerencial_GanhoMot(idMot:integer; dta,dtb:TdateTime);

    { Agenda e Avisos }
    function  Agenda_Inserir(dia:TDateTime; descr:String; valorPrev:double; reFlag, reVezes, reTipo, Aviso_Dias : Smallint ) : Integer;
    procedure Agenda_Alterar(idAg:Integer; dia:TDateTime; descr:String; valorPrev:double; reFlag, reVezes, reTipo, Aviso_Dias : Smallint);
    procedure Agenda_Apagar(idAg : Integer);
    procedure Agenda_AlterarStatus(idAg:Integer; Status : Smallint);
    procedure Agenda_MostrarID(idAg : Integer);
    procedure Agenda_MostrarDesc(parte:String);
    function  Agenda_MostrarUlt():Integer;

    procedure Aviso_Inserir(ligAg:Integer; DT:TdateTime; Parte, Status:Smallint);
    procedure Aviso_Alterar(idAv:Integer; DT:TdateTime);
    procedure Aviso_Marcar(idAv:Integer; Status:Smallint);
    procedure Aviso_Apagar(idAv:Integer);
    procedure Aviso_ApagarTodos(idAg:Integer);
    procedure Aviso_Mostrar(ligAg:Integer);
    procedure Aviso_PQdatas(dt1, dt2:TDateTime);
    procedure Aviso_PQdescr(nome:String);
    procedure Aviso_Agora();

    procedure Marca_Cobrado(idNF, st : Integer);
    procedure Marca_Pago(idNF, st : Integer);

    procedure CTe_Padrao_EmitInserir(RazaoS, Fantasia, Tels, CNPJ, Ie, RNTRC: String);
    procedure CTe_Padrao_EmitAlterar(idT:Integer; RazaoS, Fantasia, Tels, CNPJ, Ie, RNTRC: String);
    procedure CTe_Padrao_EmitAlterar2(idT:Integer; PastaXML, PastaPDF, Predom, MedidaUnid, MedidaTipo, Mot, Veic, Placa : String; Ambiente, Imposto:Integer);
    procedure CTe_Padrao_EnderInserir(LigTransp,Numero:Integer;CEP, Ender, Complemento, Bairro, Cidade, Estado, codMun:String);
    procedure CTe_Padrao_EnderAlterar(idT,LigTransp,Numero:Integer;CEP, Ender, Complemento, Bairro, Cidade, Estado, codMun:String);
    //procedure CTe_Padroa_OutrosInserir(
    procedure CTe_Padrao_Mostra(idT:Integer);
    procedure Cte_Ger_Mostrar(dt1, dt2: TDateTime; tipo, idC:Integer);
    procedure Cte_Ger_MostrarNao(dt1, dt2: TDateTime);
    procedure Cte_Ger_MostrarNaoDet(dt1, dt2: TDateTime;  idC:Integer);
    procedure Cte_Ger_MostrarNaoDetf(idC:Integer);
    procedure Cte_Ger_Pesq(numPQ:String);
    procedure Cte_Ger_PesqFaixa(Faixa:String);

    procedure Cte_MarcarEnvio(idCte, st : Integer);
    procedure Cte_MarcarEDI(nCte,idCli, st : Integer);
    procedure Cte_MarcarImpressao(idCte, st : Integer);
    procedure Cte_AlterarArq(idCte: Integer; Arq:String);
    procedure Cte_Entregue(numCTE, idNota : Integer);
    procedure Cte_NaoEntregue(idNota : Integer);
    procedure Cte_Transp(ligTransp, idcli:integer; dt:TDateTime);
    procedure Cte_Notas(nCte, idTransp:Integer);
    procedure Cte_NotasNUM(nCte:Integer);
    procedure Cte_NotasTOT(nCte, idTransp:Integer);

    function  Cte_Erros_Conta(dta, dtb: TDateTime): Integer;
    procedure Cte_erros_Mostra(dta, dtb: TDateTime);
    procedure Cte_erros_Lista(dta, dtb: TDateTime);
    procedure Cte_erros_Itens(dta, dtb: TDateTime; erro:Integer);


    procedure Transp_SalAjud_Altera(Salario_Ajud : Double);
    function  Transp_SalAjud_Mostra():Double;

    Function  PagGrupo_Grupoinsere(ano:Integer; Descricao:String; dtInicio, dtFim:TDateTime) : Integer;
    procedure PagGrupo_GrupoLista(AnoNum : Integer);
    procedure PagGrupo_GrupoMostraID(idPg : integer);
    procedure PagGrupo_GrupoTotais(idPg:Integer; vCalc, vPago:Double ) ;

    procedure PagGrupo_ItensLista(idPg : integer);
    procedure PagGrupo_ItensInsere(ligPag, ligFunc: Integer; vServico, vCreditos, vVales, VcalcF:Double);
    procedure PagGrupo_ItensAltera(ligPag, ligFunc: Integer; vServico, vCreditos, vVales, VcalcF:Double);
    procedure PagGrupo_ItensMostraID(idIt : Integer);
    procedure PagGrupo_ItensGravaVM(idIt : Integer; vMotorista : double);
    procedure PagGrupo_ItensGravaVP(idIt : Integer; vPago:Double; modo, banco, conta:String);
    procedure PagGrupo_ItensMotorista(idMot : integer);

    procedure CliGrupo_Insere(cliG:String);
    procedure CliGrupo_Altera(idG:Integer;cliG:String);
    procedure CliGrupo_Apaga(idG:integer);
    procedure Cligrupo_Mostra();
    procedure Cligrupo_Pesquisa(cliG:String);
    procedure CliGrupo_ListaCli(idG:integer);
    procedure CliGrupo_InsereCli(idC, idG:Integer);

    procedure Cotacao_Insere(ligCli, numNF, Volume, Status:Integer; Valor, Peso, med1, med2, med3, VlrCot:double; Nome, email, obs, Cep, DestNome, DestCNPJ, locali:String; dtServ:TDateTime);
    procedure Cotacao_Altera(idCot, ligCli, numNF, Volume, Status:Integer; Valor, Peso, med1, med2, med3, VlrCot:double; Nome, email, obs, Cep, DestNome, DestCNPJ, locali:String; dtServ:TDateTime);
    procedure Cotacao_AltStatus(idCot, status:Integer);
    procedure Cotacao_Pesq(idCli, status:Integer);
    procedure Cotacao_MostraID(idCot:Integer);
    procedure Cotacao_PesqDEST(Dest:String);
    procedure Cotacao_PesqDatas(dtA, dtB : TDateTime);

    procedure Graficos_ultimos();
    procedure Graficos_ano(Ano:Integer);
    procedure Graficos_frete(idCli, Ano:Integer);
    procedure Graficos_ocorrencias();

    procedure Stok_Central();
    function  Stok_Contrato_Insere(idUser, idCli:Integer; dtCad, dtInic, dtFim:TdateTime):Integer;
    procedure Stok_Contrato_Altera(idCont, idUser: Integer; dtInic, dtFim,
  SegDia: TdateTime; aFatp, aFatm, aAreaVlr, aAreaExc, aAreaLim, mFatp,
  mFatmENT, mFatmSAI, mDIVn, mDIVd, mDIVsai, SegTx, SegMin, especm: double; mDIVnf, mDIVdf,
  af, nf, mDIVsaif: Smallint);
    procedure Stok_Contrato_Apaga(idCont:Integer);
    procedure Stok_Contrato_MostraLista(idCli : Integer);
    procedure Stok_Contrato_MostraID(idCont:Integer);
    procedure Stok_Contrato_MostraAtual(idCli:Integer);
    procedure Stok_Contrato_AlteraStatus(idCont, st: Integer);

    procedure Mails_Inserir(Nome, Mil:String; Uso:Smallint);
    procedure Mails_Alterar(idM:integer; Nome, Mil:String; Uso:Smallint);
    procedure Mails_Apagar(idM:integer);
    procedure Mails_Mostrar();
    procedure Mails_MostrarID(idM:integer);

    procedure MailSai_Inserir(LigCli, LigMail: Integer; Vezes:Smallint);
    procedure MailSai_Mostra();

    procedure Config_DTP_Altera(dtPesq:TDateTime);
    function  Config_DTP_MostraDT():TDateTime;
    function  Config_DTP_MostraN():Integer;
    procedure Config_SMS_Altera(SMSuser, SMSsen, SMSn1, SMSn2, SMSrel, SMSfrase, SMSurl:String);
    procedure Config_SMS_Mostra();
    function  Config_BIP_Mostra():String;
    procedure Config_BIP_Altera(dirb:String);
    function  Config_AMB_Mostra():Smallint;
    procedure Config_AMB_Altera(amb:Smallint);
    procedure Config_BaixaQT_Altera(qt:Integer);
    function  Config_BaixaQT_Mostra():Integer;
    procedure Config_SAC_Ult_Altera(nCh:Integer);
    function  Config_SAC_Ult_Mostra():Integer;


    procedure EstatC_NotasOk(dtA, dtB: TDateTime);
    procedure EstatC_NotasErr1(dtA, dtB: TDateTime);
    procedure EstatC_NotasErr2(dtA, dtB: TDateTime);
    procedure EstatC_NotasCli(Oco:integer; dtA, dtB: TDateTime);
    procedure EstatC_NotasMot_Roma(dtA, dtB: TDateTime);
    procedure EstatC_NotasMot_Notas(oco:Integer; dtA, dtB: TDateTime);
    procedure EstatC_Entregas_Dias(idC:Integer; dtA, dtB: TDateTime);

    function EstatC_NotasDia(dt: TDateTime):Integer;
    function EstatC_RomaDia(dt: TDateTime): Integer;

    procedure EstatC_Prazo(dtA, dtB:TDateTime; idC:Integer);
    procedure EstatC_PrazoCLI();
    procedure EstatC_PrazoDet(dtA, dtB:TDateTime; idC:Integer);

    // Usa DM5
    procedure Rotas_Insere(Nome:String);
    procedure Rotas_Altera(idR:Integer; Nome:String);
    procedure Rotas_Apaga(idR:Integer);
    procedure Rotas_Mostra();
    procedure Rotas_MostraID(idR:Integer);

    procedure Rotas_CEPs_Insere(LigRota, cep1, cep2:Integer);
    procedure Rotas_CEPs_Altera(idCEP, cep1, cep2:Integer);
    procedure Rotas_CEPs_Apaga(idCEP:Integer);
    procedure Rotas_CEPs_AlteraRota(idCEP, LigRota:Integer);
    procedure Rotas_CEPs_Mostra();
    procedure Rotas_CEPs_Mostra2();
    procedure Rotas_CEPs_MostraRot(LigRota:Integer);
    procedure Rotas_CEPs_MostraID(idCEP:Integer);

    procedure Rotas_adm_SEM(ListaCli : String);
    procedure Rotas_adm_SEM_Cli();
    function  Rotas_adm_SEM_Conta():Integer;
    procedure Rotas_adm_Conta();
    procedure Rotas_adm_Mostra(idRota:Integer);
    procedure Rotas_adm_passaRota(idNF, idRota:Integer);
    procedure Rotas_adm_altCEP(idNF:Integer; CEP:String);
    procedure Rotas_bip_CEP(onde:String);

    procedure BIP_Roma_Mostra();
    function BIP_Roma_Confere(numR, status:Integer; nomeU, SenhaU:String):boolean;

    procedure Diario_MostraDias(idC, tipo:Integer);
    procedure Diario_MostraNotas(idC:Integer; dia:TDateTime);
    procedure Diario_Reentrega(idC, numNota:Integer; dia:TDateTime);


    procedure Cob2_Zera(f1,f2:Smallint);
    function  Cob2_Marcar(dta, dtb:TDateTime; flag:Smallint):Integer;
    procedure Cob2_Clientes();

    function  Ocorrencia_Traduz(tipo, nOc:Integer):String;

    procedure NaoEntregues_Quant(idC:Integer);
    procedure NaoEntregues_Dia(dt:TDateTime; idC : integer);
    procedure NaoEntregues_Notas(idC, numNF : Integer; dta:TDateTime);
    {Financeiro}
    procedure Fin_Conta_Mostra(st:Smallint);
    procedure Fin_Conta_MostraID(idF:Smallint);
    procedure Fin_Conta_Insere(Nivel:Smallint; NomeConta:String);
    procedure Fin_Conta_Altera(idF:Integer; Nivel, Status:Smallint; NomeConta:String);
    function  Fin_Conta_Apagar(iNivel:Integer):Smallint;

    procedure Fin_Item_Insere(dtContab, dtPrev:TDateTime; vContab, vPrev:Double; Descr:String; st, LigU, LigC:Integer);
    procedure Fin_Item_Altera(idFi:Integer;dtContab, dtPrev:TDateTime; vContab, vPrev:Double; Descr:String; st, LigU, LigC:Integer);
    procedure Fin_Item_Apaga(idFi:Integer);
    procedure Fin_Item_Mostra(LigC:Integer; dtP:TDateTime);
    procedure Fin_Item_MostraID(idFi:Integer);
    procedure Fin_Item_Datas(LigC:Integer; dt1, dt2:TDateTime; TipoDT:Smallint);

    procedure Prazos_Mostrar(opcao:smallint);
    procedure Prazos_Mostrar_ID(idPr:Integer);
    procedure Prazos_Inserir(Descr:String; Validade:TDatetime);
    procedure Prazos_Alterar(idPr:Integer; Descr:String; Validade:TDatetime);
    procedure Prazos_Apagar(idPr:Integer);

    procedure PrazosFaixa_Mostrar(LigPr:Integer);
    procedure PrazosFaixa_Mostrar_ID(idPrF:Integer);
    procedure PrazosFaixa_Mostrar_Cli(idCli:Integer);
    procedure PrazosFaixa_Inserir(LigPr, Prazo, CEPi, CEPf:Integer; Risco:String);
    procedure PrazosFaixa_Alterar(idPrF, Prazo, CEPi, CEPf:Integer; Risco:String );
    procedure PrazosFaixa_Apagar(idPrF:Integer);

    procedure PrazosClientes_Nao();
    procedure PrazosClientes_Mostra(Ligpr: Integer);
    procedure PrazosClientes_Altera(idcli, LigPr:integer);

    procedure Prazo2DTentrega(dta,dtb:TDateTime; tipo:smallint);
    function  Prazo2DTentregaQT(dta,dtb:TDateTime; tipo:smallint): integer;
    function  Prazo2DiasEntregaQT(dta,dtb:TDateTime; tipo:smallint):Integer;
    procedure Prazo2DiasEntrega_Mostra(diaCria:TDateTime; tipo:smallint);
    procedure Prazo2DiasEntrega_Altera(diaCria, diaEnt:TDateTime; diasQt, tipo:smallint);
    procedure Prazo2Copia_Padrao(padrao, tipo:Integer; diaCria:TDateTime);
    procedure Prazo2Copia_Nota(idUnica, nPrazo: Integer);
    procedure Prazo2Copia_Mostra(dta, dtb:TDateTime);
    procedure Prazo2Copia_MostraCli(dta, dtb:TDateTime);

    procedure Prazo2Estat_Clientes(dta, dtb:TDateTime);
    procedure Prazo2Estat_Dias(dta, dtb:TDateTime; ListaCli:String);
    procedure Prazo2Estat_Notas(dta, dtb:TDateTime; ListaCli:String);
    procedure Prazo2Estat_Tentativas(dta, dtb:TDateTime; ListaCli:String);
    procedure Prazo2Estat_Tentativas_Gravar(nNF, ligcli, nOC:Integer; dtR, dtoc : TDateTime);
    procedure Prazo2Estat_Resultado_Gravar(idNF, resp:Integer);
    procedure Prazo2Estat_Notasf(ListaCli:String);

    procedure Prazo2Inuteis_Mostra(idI:integer);
    procedure Prazo2Inuteis_MostraDT(dt1, dt2:TDateTime);
    procedure Prazo2Inuteis_Inserir(dt:TdateTime);
    procedure Prazo2Inuteis_Alterar(idIN:Integer;dt:TDateTime);
    procedure Prazo2Inuteis_Apagar(idIN:Integer);

    // Banco CC Transportadora - maio19
    procedure CC_Insere(Desc, Nome:String; Ag, AgDig, Conta, ContaDig:Integer);
    procedure CC_Altera(idCC:Integer; Desc, Nome:String; Ag, AgDig, Conta, ContaDig:Integer);
    procedure CC_AlteraStatus(idCC, status:Integer);
    procedure CC_Mostra();

    // DOCCOB - maio/19
    function  DOCCOB_Insere(idCli, idUser, idCC:Integer; dtVenc:TDateTime; Obs:String ):Integer;
    procedure DOCCOB_Altera(idCob:Integer; idCC:Integer;  dtEmissao, dtVenc:TDateTime; Obs:String );
    procedure DOCCOB_Altera_Status(idCob, Status:Integer);
    procedure DOCCOB_Altera_StatusENV(idCob, Status:Integer);
    procedure DOCCOB_Altera_Valor(idCob:Integer; vTotal, vICMS: Double);
    procedure DOCCOB_Altera_Desconto(idCob:Integer; vDesc:Double; dtLimite:TDateTime);
    procedure DOCCOB_Altera_Juros(idCob:Integer; vJuros:Double);
    procedure DOCCOB_Altera_NFtransp(idCob, nNF:Integer);
    procedure DOCCOB_Altera_Totais(idCob:Integer);
    procedure DOCCOB_Inclui_Conhec(idCob, NumConhec, idTransp:Integer);
    procedure DOCCOB_Mostra_Cte(idCli, idCob:Integer);
    procedure DOCCOB_Mostra_NF(idCli, idCob:Integer);
    procedure DOCCOB_Mostra(idCli, ult:Integer);
    procedure DOCCOB_MostraID(idCob:Integer);








    {
    procedure Digital_Inserir(idF:Integer; dedo:Smallint; digital:);
    procedure Digital_Alterar(idF:Integer; dedo:Smallint; digital:);
    procedure Digital_Apagar(idD:Integer);
    procedure Digital_Testar(digital:);
    }
    //procedure EstMOV_MostraId(id : integer);
    //procedure EstMOV_MostraTodos(idM : integer);
    //procedure EstMOV_Insere();

  published

  end;

implementation

uses SysUtils, uRastreio;
{ TBco }

function BD_dia(dt : TDateTime; tipo : smallint):String;

var usa : TMarco;

begin
  if (tipo = 1) then
    BD_dia := FormatDateTime('yyyy-mm-dd HH:MM', dt);
  if (tipo = 2) then
    BD_dia := FormatDateTime('yyyy-mm-dd 00:00', dt);
  if (tipo = 3) then
    BD_dia := FormatDateTime('yyyy-mm-dd', dt);
  if (tipo = 4) then
  begin
    usa := TMarco.Create;
    usa.Le_INI();
    BD_dia := FormatDateTime('yyyy-mm-dd', usa.get_dtSis);
    usa.Destroy;
  end;
end;

function DataBco(dtNormal:String):String;
  var resp : String;
begin
  // Normal = dd/MM/yyyy
  resp := copy(dtNormal,7)+'-'+ copy(dtNormal, 4,2)+'-'+ copy(dtNormal, 1,2);

  result := resp;
end;



function Formata_Num(num: double): String;

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
  Formata_num := s;
end;

function  devolucoesNaoPagar(tipo:Smallint): STring;

var s : string;

begin
  if (tipo = 1) then s := ' and nocorr<>20 ';
  if (tipo = 2) then s := ' and nocorr<>20 and nocorr<>58 ';
  if (tipo = 3) then s := ' and nocorr<>20 and nocorr<>23  and nocorr<>27 and nocorr<>58 and nocorr<>90 ';
  devolucoesNaoPagar := s;
end;

function retirarPendencias(): String;
  var s : String;

begin
  s := ' and ((PENDE is null) or (PENDE < 2)) ';

  retirarPendencias := s;
end;

function retirarAgendados(): String;

  var s : String;

begin
  s := ' and PENDE < 2 ';

  retirarAgendados := s;
end;


{
  Usuarios
  ======================================================
  25.01.2010 - 10 métodos
  ------------------------------------------------------
}
procedure TBco.Usuarios_Altera(id: integer; login: String; nivel,
  status: integer);
begin
  sq := 'update TB_USUARIOS set LOGIN = '+QuotedStr(login)+', Nivel = '+intToStr(nivel)+', USSTATUS = '+IntToStr(status)+' where id = ' + intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Altera');
end;

procedure TBco.Usuarios_AlteraNome(id: integer; Nome: String);
begin
  sq := 'update TB_USUARIOS set Nome = '+QuotedStr(Nome)+'  where ID = ' + intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Altera');
end;

procedure TBco.Usuarios_AlteraSenha(id: integer; Senha: String);

var snCod : String;
    usa : TMarco;
begin
  usa := TMarco.Create;
  snCod := usa.Codifica(Senha);

  sq := 'update TB_USUARIOS set Senha = '+QuotedStr(snCod)+' where ID = ' + intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Altera');
end;

procedure TBco.Usuarios_AlteraUltA(id: integer; dt: Tdatetime);
begin
  sq := 'update TB_USUARIOS set ultAcesso = ' +QuotedStr(BD_dia(dt,1))+ ' where ID = ' + intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Altera');
end;

procedure TBco.Usuarios_Apaga(id: integer);
begin
  sq := 'delete from TB_USUARIOS where ID = ' + intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Apaga');
end;

procedure TBco.Usuarios_Insere(login : String; nivel, status : integer);

var snCod : String;
    usa : TMarco;
begin
  usa := TMarco.Create;
  snCod := usa.Codifica('12345');

  sq := 'Insert Into TB_USUARIOS (login, senha, nivel, usstatus) values ';
  sq := sq + ' ( '+QuotedStr(login)+', '+QuotedStr(snCod);
  sq := sq + ', '+ IntToStr(nivel) + ', '+IntToStr(status)+ ' )';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Insere');
end;

procedure TBco.Usuarios_Mostra;
begin
  sq := 'select * from TB_USUARIOS Where id < 90000 order by login';
  DM2.Roda_SQL(DM2.sdsUser, DM2.cdsUser, sq);
end;

procedure TBco.Usuarios_MostraId(id: integer);
begin
  sq := 'select * from TB_USUARIOS where ID = '+intToStr(id);
  DM2.Roda_SQL(DM2.sdsUser, DM2.cdsUser, sq);
end;

function TBco.Usuarios_Procura(login, Senha: String):integer;

var snCod : String;
    usa : TMarco;
    id : integer;

begin
  id := 0;
  usa := TMarco.Create;
  snCod := usa.Codifica(Senha);
  sq := 'select * from TB_USUARIOS where UPPER(LOGIN) = '+QuotedStr(UpperCase(login))+' and Senha = '+QuotedStr(snCod)+' ';
  DM2.Roda_SQL(DM2.sdsUser, DM2.cdsUser, sq);
  if (DM2.cdsUser.RecordCount>0) then id := DM2.cdsUserID.Value ;

  Usuarios_Procura := id;
end;

function TBco.Usuarios_Procura(login: String):integer;

var id : Integer;

begin
  id := 0;
  sq := 'select * from TB_USUARIOS where UPPER(LOGIN) = '+QuotedStr(UpperCase(login))+' ';
  DM2.Roda_SQL(DM2.sdsUser, DM2.cdsUser, sq);
  if (DM2.cdsUser.RecordCount>0) then id := DM2.cdsUserID.Value ;

  Usuarios_Procura := id;

end;

{
  Valores
  ======================================================
  25.01.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Valores_Altera(id : integer; serv: String; vp, vm, vg, ve: double; num,
  idU: integer);
begin
  sq := 'update TB_VALORES set Servico = '+QuotedStr(serv);
  sq := sq + ', ValorP = '+FloatToStr(vp)+', ValorM = '+FloatToStr(vm);
  sq := sq + ', ValorG = '+FloatToStr(vg)+', ValorE = '+FloatToStr(ve);
  sq := sq + ', NUM = '+intToStr(num)+', USERID = '+intToStr(idU);
  sq := sq + ', DTALTERADO = '+ QuotedStr(BD_dia(Now,1));
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsValores,sq , 'Alterar');
end;

procedure TBco.Valores_Apaga(id: integer);
begin
  sq := 'delete from TB_VALORES ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsValores,sq , 'Apagar');
end;

procedure TBco.Valores_Insere(serv: String; vp, vm, vg, ve: double; num,
  idU: integer);
begin
  sq := 'insert into TB_VALORES (Servico, ValorP, ValorM, ValorG, ValorE, NUM, USERID, DTALTERADO) values ';
  sq := sq + ' ( '+QuotedStr(serv)+', '+FloatToStr(vp)+', '+FloatToStr(vm)+', '+FloatToStr(vg)+', '+FloatToStr(ve);
  sq := sq + ', '+intToStr(num)+', '+intToStr(idU)+', '+ QuotedStr(BD_dia(Now,1));
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsValores,sq , 'Inserir');
end;

procedure TBco.Valores_Mostra;
begin
  sq := 'select * from TB_VALORES order by num';
  DM2.Roda_SQL(DM1.sdsValores, DM1.cdsValores, sq);
end;

procedure TBco.Valores_MostraId(id: integer);
begin
  sq := 'select * from TB_VALORES where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsValores, DM1.cdsValores, sq);
end;

procedure TBco.Valores_ProcuraDesc(inic: String);
begin
  sq := 'select * from TB_VALORES where Servico like '+QuotedStr(inic+'%')+' order by servico';
  DM2.Roda_SQL(DM1.sdsValores, DM1.cdsValores, sq);
end;

function TBco.Valores_ProcuraNum(n: integer): integer;
begin
  sq := 'select * from TB_VALORES where num = '+IntToStr(n);
  DM2.Roda_SQL(DM1.sdsValores, DM1.cdsValores, sq);

  if (DM1.cdsValores.RecordCount>0) then
    Valores_ProcuraNum := DM1.cdsValoresNUM.Value
  else
    Valores_ProcuraNum := 0;
end;
{
  Cores
  ======================================================
  25.01.2010 - 6 métodos
  ------------------------------------------------------
}

{
  Modelos
  ======================================================
  25.01.2010 - 6 métodos
  ------------------------------------------------------
}
procedure TBco.Modelos_Altera(id: integer;modelo :String; tamanho : smallint);
begin
  sq := 'update TB_MODELOS set MODELO = '+QuotedStr(modelo);
  sq := sq + ', TAMANHO = '+ IntToStr(tamanho);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsModelos, sq , 'Alterar');
end;

procedure TBco.Modelos_Apaga(id: integer);
begin
  sq := 'delete from TB_MODELOS ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsModelos, sq , 'Apagar');
end;

procedure TBco.Modelos_Insere(modelo :String; tamanho : smallint);
begin
  sq := 'insert into TB_MODELOS (MODELO, TAMANHO) values ';
  sq := sq + '( '+QuotedStr(modelo)+', '+ IntToStr(tamanho)+ ') ';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsModelos, sq , 'Inserir');
end;

procedure TBco.Modelos_Mostra;
begin
  sq := 'select * from TB_MODELOS order by modelo ';
  DM2.Roda_SQL(DM1.sdsModelos, DM1.cdsModelos, sq);

end;

procedure TBco.Modelos_MostraId(id: integer);
begin
  sq := 'select * from TB_MODELOS where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsModelos, DM1.cdsModelos, sq);

end;

procedure TBco.Modelos_ProcuraDesc(inic: String);
begin
  sq := 'select * from TB_MODELOS where MODELO like '+QuotedStr(inic + '%')+ ' order by modelo';
  DM2.Roda_SQL(DM1.sdsModelos, DM1.cdsModelos, sq);
end;

{
  Funcs
  ======================================================
  26.01.2010 - 6 métodos
  ------------------------------------------------------
}
procedure TBco.Funcs_Altera(id: integer; Nome, cpf, rg, obs, ch, CHcategoria: String; idU : integer; seg:Smallint; segValidade, CHValidade, dtNasc,dtFicha, dtAjuste:TDateTime; vPonto, Salario:Double; Rntrc: String; Ativo:Integer );
begin
  sq := 'update TB_FUNCS set Nome = '+QuotedStr(Nome);
  sq := sq + ', CPF = '+ QuotedStr(cpf);
  sq := sq + ', RG = '+ QuotedStr(rg);
  sq := sq + ', DTNasc = '+ QuotedStr(BD_dia(dtNasc,3));
  sq := sq + ', DTFicha = '+ QuotedStr(BD_dia(dtFicha,1));
  sq := sq + ', DtAjuste = '+ QuotedStr(BD_dia(dtAjuste,3));
  sq := sq + ', CH = '+ QuotedStr(ch);
  sq := sq + ', CHvalidade = '+ QuotedStr(BD_dia(CHValidade,3));
  sq := sq + ', CHcategoria = '+ QuotedStr(CHcategoria);
  sq := sq + ', SEG = '+ IntToStr(seg);
  sq := sq + ', USERID = '+ IntToStr(idU);
  sq := sq + ', SEG = '+ IntToStr(seg);
  sq := sq + ', SEGVALIDADE = '+ QuotedStr(BD_dia(SegValidade,3));
  sq := sq + ', Obs = '+ QuotedStr(obs);
  sq := sq + ', vPonto  = '+ Formata_Num(vPonto);
  sq := sq + ', Salario = '+ Formata_Num(Salario);
  sq := sq + ', RNTRC = '+ QuotedStr(Rntrc);
  sq := sq + ', Ativo = '+ IntToStr(Ativo);

  sq := sq + '  where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFuncs, sq , 'Alterar');
end;

procedure TBco.Funcs_Apaga(id: integer);
begin
  sq := 'delete from TB_FUNCS ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFuncs, sq , 'Apagar');
end;

procedure TBco.Funcs_Detalhes_Mostrar1(idM: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select d.dtRoma, d.num,  d.num - extract(YEAR from d.dtRoma)* 1000000 as Romaneio, count(*) as qtNotas from TB_NOTAF c, TB_ROMA d Where c.nroma=d.num ';
  sq := sq + ' and c.nocorr<>20 ';
  sq := sq + ' and d.dtRoma between '+QuotedStr(BD_dia(dt1, 3) ) + ' and '+QuotedStr(BD_dia(dt2, 3) ) + ' ';
  sq := sq + ' and d.ligmot = ' + idM.ToString;
  sq := sq + ' group by d.dtRoma, d.num ';
  sq := sq + ' order by d.dtRoma';
  DM2.Roda_SQL(DM5.sdsFuD1, DM5.cdsFuD1, sq);

end;

procedure TBco.Funcs_Detalhes_Mostrar2(idM: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select b.dtRoma, b.num, a.nocorr, count(*) as qtNotas, c.DESCR   from TB_NOTAF a, TB_ROMA b , TB_OCORRE c ';
  sq := sq + ' Where a.nroma=b.num  and c.NUM =a.NOCORR ';
  sq := sq + ' and b.dtRoma between '+QuotedStr(BD_dia(dt1, 3) ) + ' and '+QuotedStr(BD_dia(dt2, 3) ) + ' ';
  sq := sq + ' and b.ligmot = ' + idM.ToString;
  sq := sq + ' group by b.dtRoma, b.num, a.nocorr, c.DESCR ';
  DM2.Roda_SQL(DM5.sdsFuD2, DM5.cdsFuD2, sq);
end;

procedure TBco.Funcs_Detalhes_Mostrar3(idM: Integer; dt: TDateTime);
begin
  sq := 'select b.dtRoma, b.num, a.nocorr, count(*) as qtNotas, c.DESCR   from TB_NOTAF a, TB_ROMA b , TB_OCORRE c ';
  sq := sq + ' Where a.nroma=b.num  and c.NUM =a.NOCORR ';
  sq := sq + ' and b.dtRoma = '+QuotedStr(BD_dia(dt, 3) ) + ' ';
  sq := sq + ' and b.ligmot = ' + idM.ToString;
  sq := sq + ' group by b.dtRoma, b.num, a.nocorr, c.DESCR ';
  DM2.Roda_SQL(DM5.sdsFuD2, DM5.cdsFuD3, sq);
end;

function TBco.Funcs_Existe(cpf: String; ativo:smallint): integer;
begin
  sq := 'select * from TB_FUNCS where cpf = '+ QuotedStr(cpf) ;
  if ativo = 1 then sq := sq + ' and ativo=1 ';
  DM2.Roda_SQL(DM1.sdsFuncs2, DM1.cdsFuncs2, sq);
  if (DM1.cdsFuncs2.RecordCount > 0) then Funcs_Existe := DM1.cdsFuncs2ID.Value
    else Funcs_Existe := 0;
end;

procedure TBco.Funcs_Insere(Nome, cpf, rg, obs: String; idUser: integer; dtnasc,dtFicha : tDateTime; tipo : smallint; chnum, chcat : String; chval : tdateTime; seg:Smallint; segValidade, dtAjuste:TDateTime; Rntrc: String; vPonto:Double );
begin
  sq := 'insert into TB_FUNCS (Nome, cpf, rg, obs, USERID, DTCAD, DTNASC, Tipo, dtFicha, dtAjuste, CH, CHcategoria, CHvalidade, Ativo, Seg, SegValidade, RNTRC, vPonto, Salario ) values ';
  sq := sq + '( '+QuotedStr(Nome)+', '+ QuotedStr(cpf)+ ', '+ QuotedStr(rg);
  sq := sq + ', '+QuotedStr(obs)+', '+ IntToStr(idUser);
  sq := sq + ', '+QuotedStr(BD_dia(Now,3))+', '+ QuotedStr(BD_dia(dtnasc,3))+', '+ IntToStr(tipo);
  sq := sq + ', '+QuotedStr(BD_dia(dtFicha,1));
  sq := sq + ', '+QuotedStr(BD_dia(dtAjuste,3));
  sq := sq + ', '+QuotedStr(chnum)+', '+QuotedStr(chcat)+', '+ QuotedStr(BD_dia(chval,2))+', 1 ';
  sq := sq + ', '+intToStr(seg)+', '+QuotedStr(BD_dia(SegValidade,3))+', '+QuotedStr(Rntrc)+' ,0,0 )';

  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFuncs, sq , 'Inserir');
end;

procedure TBco.Funcs_Mostra;
begin
  sq := 'select * from TB_FUNCS order by nome';
  DM2.Roda_SQL(DM1.sdsFuncs, DM1.cdsFuncs, sq);
end;

procedure TBco.Funcs_MostraId(id: integer);
begin
  sq := 'select * from TB_FUNCS where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsFuncs, DM1.cdsFuncs, sq);
end;

function TBco.Funcs_Nome(idM: Integer): String;
  var resp : String;
begin
  resp := '';
  sq := 'select Nome from TB_FUNCS where id = '+ idM.ToString;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if DM2.cdsTMP.RecordCount > 0 then
    resp := DM2.cdsTMP.Fields[0].AsString;

  result := resp;

end;

procedure TBco.Funcs_ProcuraNome(inic: String; tipo, ativo : smallint);

var onde : String;

begin
  {
    tipo = 0 // Funcionários
    tipo = 1 // Motoristas
    tipo = 2 // Ajudantes
    tipo = 5 // TODOS
  }
  if (tipo = 5) then onde := ''
  else
    onde := ' and tipo = '+IntToStr(tipo);
    if ativo = 1 then onde := onde + ' and ativo=1 ';

  sq := 'select * from TB_FUNCS where UPPER(NOME) like '+QuotedStr(UpperCase(inic)+'%')+onde+' order by nome';
  DM2.Roda_SQL(DM1.sdsFuncs2, DM1.cdsFuncs2, sq);
end;
{
  Enderecos
  ======================================================
  26.01.2010 - 6 métodos
  ------------------------------------------------------
}

procedure TBco.Enderecos_Altera(Tab: String; idM: integer;
  Endereco: String; Numero: integer; Complemento, Bairro, Cidade, Estado,
  CEP, codMun: String);

  var erro : Integer;

begin
  erro := 0;

  if (Length(Endereco)>50) then erro := 1;
  if (Length(Complemento)>10) then erro := 2;
  if (Length(Bairro)>20) then erro := 3;
  if (Length(Cidade)>30) then erro := 4;


  if (erro=0) then
  begin
    if (Tab = 'C') then Tab := 'TB_CLIENDER';
    if (Tab = 'F') then Tab := 'TB_FUNCENDER';

    sq := 'update '+Tab+ ' set Ender = '+QuotedStr(Endereco);
    sq := sq + ', Numero = '+ IntToStr(Numero)+ ', Complemento = '+ QuotedStr(Complemento);
    sq := sq + ', Bairro = '+ QuotedStr(Bairro)+ ', Cidade = '+ QuotedStr(Cidade);
    sq := sq + ', Estado = '+ QuotedStr(Estado)+ ', CEP = '+ QuotedStr(CEP);
    sq := sq + ', CODmUN = '+ QuotedStr(codMun);
    sq := sq + ' where FUNC_ID = '+ IntToStr(idM);
    DM2.Executa_SQL(DM1.Conexao, DM1.sdsEnder, sq , 'Alterar');
  end
  else
  begin
    if (erro = 1) then raise E_endereco.create('- Endereço com mais de 50 caracteres');
    if (erro = 2) then raise E_complemento.create('- Complemento com mais de 10 caracteres');
    if (erro = 3) then raise E_bairro.create('- Bairro com mais de 20 caracteres');
    if (erro = 4) then raise E_cidade.create('- Cidade com mais de 30 caracteres');
  end;


end;

procedure TBco.Enderecos_Apaga(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIENDER';
  if (Tab = 'F') then Tab := 'TB_FUNCENDER';

  sq := 'delete from '+Tab+ ' ';
  sq := sq + ' where FUNC_ID = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsEnder, sq , 'Apagar');

end;

procedure TBco.Enderecos_Insere(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIENDER';
  if (Tab = 'F') then Tab := 'TB_FUNCENDER';

  sq := 'insert into '+Tab+ ' (FUNC_ID) values ( '+IntToStr(idM)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsEnder, sq , 'Apagar');
end;

procedure TBco.Enderecos_MostraId(Tab: String; idM: integer);

begin
  if (Tab = 'C') then Tab := 'TB_CLIENDER';
  if (Tab = 'F') then Tab := 'TB_FUNCENDER';

  sq := 'select * from '+Tab+ ' where FUNC_ID = '+IntToStr(idM)+' ';
  DM2.Roda_SQL(DM1.sdsEnder, DM1.cdsEnder, sq);
end;

{
  Tels
  ======================================================
  26.01.2010 - 6 métodos
  ------------------------------------------------------
}

procedure TBco.Tels_Altera(Tab: String; id: integer; Descricao: String;  Numero, detalhe: String);
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'update '+Tab+ ' set Descricao = '+QuotedStr(Descricao);
  sq := sq + ', Numero = '+ QuotedStr(Numero);
  sq := sq + ', Detalhe = '+ QuotedStr(detalhe);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsTel, sq , 'Alterar');

end;

procedure TBco.Tels_Apaga(Tab: String; id: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'delete from '+Tab+ ' ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsTel, sq , 'Apagar');
end;

procedure TBco.Tels_Insere(Tab: String; idM: integer; Desc, Num, Detalhe : String );
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'insert into '+Tab+ ' (FUNC_ID, DESCRICAO, NUMERO, DETALHE) values ( '+ IntToStr(idM);
  sq := sq +', '+QuotedStr(Desc)+', '+QuotedStr(Num)+', '+QuotedStr(detalhe)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsTel, sq , 'Inserir');

end;

procedure TBco.Tels_MostraId(Tab: String; id: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'select * from '+Tab+ ' where ID = '+ IntToStr(id);
  DM2.Roda_SQL(DM1.sdsTel, DM1.cdsTel, sq);

end;

procedure TBco.Tels_MostraTodos(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'select * from '+Tab+ ' where FUNC_ID = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsTel, DM1.cdsTel, sq);

end;

procedure TBco.Tels_ApagaTodos(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  sq := 'delete from '+Tab+ ' ';
  sq := sq + ' where FUNC_ID = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsTel, sq , 'Apagar');

end;

function TBco.Tels_Conta(Tab: String; idM: Integer): Integer;
begin
  if (Tab = 'C') then Tab := 'TB_CLITEL';
  if (Tab = 'F') then Tab := 'TB_FUNCTEL';

  Tels_Conta := DM2.Conta(Tab, ' FUNC_ID = '+IntToStr(idM));
end;

{
  Cliente
  ======================================================
  26.01.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Cliente_Altera(id: integer; Nome, cpf, rg, cnpj, ie,
  obs: String; pessoa: smallint; idUser, ativo: integer);
begin
  sq := 'update TB_CLIENTE set Nome = '+QuotedStr(Nome);
  sq := sq + ', CPF = '+ QuotedStr(cpf)+ ', RG = '+ QuotedStr(rg);
  sq := sq + ', CNPJ = '+ QuotedStr(cnpj)+ ', IE = '+ QuotedStr(ie);
  sq := sq + ', OBS = '+ QuotedStr(obs)+', USERID = '+ IntToStr(idUser);
  sq := sq + ', PESSOA = '+ IntToStr(pessoa);
  sq := sq + ', ATIVO = '+ IntToStr(ativo);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsCli, sq , 'Alterar');
end;

procedure TBco.Cliente_AlteraCarroEXTRA(id: integer; Valor: Double);
begin
  sq := 'update TB_CLIENTE set CarroExtra = '+Formata_Num(Valor);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Cliente_Apaga(id: integer);
begin
  sq := 'delete from TB_CLIENTE ';
  sq := sq + ' where ID = '+ IntToStr(id);
  //desativar
  //DM2.Executa_SQL(DM1.Conexao, DM1.sdsCli, sq , 'Apagar');
end;

function TBco.Cliente_Existe(cpf: String): integer;
begin
  sq := 'select * from TB_CLIENTE where CPF = '+QuotedStr(cpf)+' or CNPJ = '+QuotedStr(cpf)+' ';
  DM2.Roda_SQL(DM1.sdsCli2, DM1.cdsCli2, sq);
  if (DM1.cdsCli2.RecordCount > 0) then Cliente_Existe := DM1.cdsCli2ID.Value
    else Cliente_Existe := 0;
end;

procedure TBco.Cliente_Insere(Nome, cpf, rg, cnpj, ie, obs: String;
  pessoa: smallint; idUser: integer);
begin
  sq := 'insert into TB_CLIENTE (Nome, cpf, rg, ie, cnpj, obs, pessoa, USERID, PADRAO_SP, PADRAO_GSP, PADRAO_INT, ImpRec, LigGrupo, ativo, usa_SMS) values ';
  sq := sq + '( '+QuotedStr(Nome)+', '+ QuotedStr(cpf)+ ', '+ QuotedStr(rg)+ ', '+ QuotedStr(ie);
  sq := sq + ', '+QuotedStr(cnpj)+', '+QuotedStr(obs)+', '+IntToStr(pessoa)+', '+IntToStr(idUser)+ ',1,1,1,1,0,1,0 ';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsCli, sq , 'Inserir');
end;

procedure TBco.Cliente_Mostra;
begin
  sq := 'select * from TB_CLIENTE order by Nome ';
  DM2.Roda_SQL(DM1.sdsCli, DM1.cdsCli, sq);
end;

procedure TBco.Cliente_MostraId(id: integer);
begin
  sq := 'select * from TB_CLIENTE where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsCli, DM1.cdsCli, sq);
end;

function TBco.Cliente_Nome(idC: Integer): String;
  var resp : String;
begin
  sq := 'select Nome from TB_CLIENTE where id = '+idC.ToString;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  resp := '';
  if DM2.cdsTMP.RecordCount>0 then
    resp := DM2.cdsTMP.Fields[0].AsString;

  Result := resp;
end;

procedure TBco.Cliente_ProcuraNome(inic: String);
begin
  sq := 'select * from TB_CLIENTE where UPPER(Nome) LIKE '+QuotedStr(UpperCase(inic)+'%')+' order by Nome ';
  DM2.Roda_SQL(DM1.sdsCli2, DM1.cdsCli2, sq);
end;



procedure TBco.Cliente_GrupoProd();
begin
  sq := 'select * from TB_CLIENTE order by Nome ';
  DM2.Roda_SQL(DM1.sdsCli2, DM1.cdsCli2, sq);
end;

{
  CEP
  ======================================================
  26.01.2010 - 1 método
  ------------------------------------------------------
}

procedure TBco.CEP_Procura(cep: String);
begin
  sq := 'select * from CEP where CEP = '+QuotedStr(cep);
  DM2.Roda_SQL(DM1.sdsCEP, DM1.cdsCEP, sq);

end;

{
  fd Grupo
  ======================================================
  21.05.2010 - 6 métodos
  ------------------------------------------------------
}
procedure TBco.Grupo_Altera(id, Num : integer; Descricao: String);
begin
  sq := 'update TB_GRUPO set NUM = '+ IntToStr(Num)+ ', Descricao = '+QuotedStr(Descricao);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsGrupo, sq , 'Alterar Grupo');
end;

procedure TBco.Grupo_Apaga(id: integer);
begin
  sq := 'Delete From TB_GRUPO ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsGrupo, sq , 'Apagar Grupo');
end;

procedure TBco.Grupo_Insere(idM, Num : integer; Descricao: String);
begin
  sq := 'Insert Into TB_GRUPO (LigCLI, Num, Descricao) Values( '+ IntToStr(idM)+ ', '+ IntToStr(Num)+ ', '+QuotedStr(Descricao)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsGrupo, sq , 'Alterar Grupo');
end;

procedure TBco.Grupo_Mostra(idM : integer);
begin
  sq := 'select * from TB_GRUPO where LigCli = '+IntToStr(idM)+' ORDER BY Num, Descricao';
  DM2.Roda_SQL(DM1.sdsGrupo, DM1.cdsGrupo, sq);
end;

procedure TBco.Grupo_MostraId(id: integer);
begin
  sq := 'select * from TB_GRUPO where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsGrupo, DM1.cdsGrupo, sq);
end;

procedure TBco.Grupo_ProcuraDesc(inic : String;idM : integer);
begin
  sq := 'select * from TB_GRUPO where UPPER(Descricao) LIKE '+QuotedStr(UpperCase(inic)+'%') +' and LigCli = '+IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsGrupo, DM1.cdsGrupo, sq);
end;

function TBco.Grupo_Conta(idM: Integer):Integer;
begin
  Grupo_Conta := DM2.Conta('TB_GRUPO',' LigCli = '+IntToStr(idM));
End;
{
  fd WEB
  ======================================================
  31.05.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Web_Altera(Tab: String; id: integer; Descricao,
  Web: String);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'update '+Tab+ ' set Descricao = '+QuotedStr(Descricao);
  sq := sq + ', Web = '+ QuotedStr(Web);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsWEB, sq , 'Alterar');
end;

procedure TBco.Web_Apaga(Tab: String; id: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'delete from '+Tab+ ' ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsWEB, sq , 'Apagar');
end;

procedure TBco.Web_ApagaTodos(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'delete from '+Tab+ ' ';
  sq := sq + ' where LIGCli = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsWEB, sq , 'Apagar Todos');
end;

procedure TBco.Web_Insere(Tab: String; idM: integer; Descricao,
  Web: String);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'insert into '+Tab+ ' (LIGCLI, DESCRICAO, WEB) values ( '+ IntToStr(idM);
  sq := sq +', '+QuotedStr(Descricao)+', '+QuotedStr(Web)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsWEB, sq, 'Inserir');

end;

procedure TBco.Web_MostraId(Tab: String; id: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'select * from '+Tab+ ' where ID = '+ IntToStr(id);
  DM2.Roda_SQL(DM1.sdsWEB, DM1.cdsWEB, sq);

end;

procedure TBco.Web_MostraTodos(Tab: String; idM: integer);
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  sq := 'select * from '+Tab+ ' where LigCli = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsWEB, DM1.cdsWEB, sq);

end;

function TBco.Web_Conta(Tab: String; idM: Integer): Integer;
begin
  if (Tab = 'C') then Tab := 'TB_CLIWEB';
  if (Tab = 'F') then Tab := 'TB_FUNCWEB';

  Web_Conta := DM2.Conta(Tab, ' LIGCLI = '+IntToStr(idM));

end;

{
  pRODUTOS
  ======================================================
  07.05.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Prazo2Copia_Mostra(dta, dtb: TDateTime);
begin
  sq := 'select a.id, b.CEP, b.LigCli from TB_NFUNICA a, TB_NOTAF b  ';
  sq := sq + ' where a.numnota = b.numnf and a.ligcli=b.LIGCLI ';
  sq := sq + ' and (a.dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  sq := sq + ' and a.status<>11 '; // nota apagada
  sq := sq + ' and a.Prazo = -9 ';
  sq := sq + ' order by b.Ligcli, b.CEP ';
  DM2.Roda_SQL(DM5.sdsPrCep, DM5.cdsPrCep, sq);

end;

procedure TBco.Prazo2Copia_MostraCli(dta, dtb: TDateTime);
begin
  sq := 'select ligcli, COUNT(*) as qt from TB_NFUNICA ';
  sq := sq + ' where (dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  sq := sq + ' and status<>11 ';
  sq := sq + ' and Prazo = -9 ';
  sq := sq + ' group by ligcli  ';
  sq := sq + ' order by count(*) desc';
  DM2.Roda_SQL(DM5.sdsPrCli, DM5.cdsPrCli, sq);
end;

procedure TBco.Prazo2Copia_Nota(idUnica, nPrazo: Integer);
begin
  sq := 'update TB_NFUNICA set Prazo = ' + nPrazo.ToString ;
  sq := sq + ' where id = ' + idUnica.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Prazo2Copia_Padrao(padrao, tipo:Integer; diaCria:TDateTime);
begin
  sq := 'update TB_NFUNICA set Prazo = ' + padrao.ToString ;
  sq := sq + ' where dtCriada ='+QuotedStr(BD_dia(diaCria,3))+' ';
  //sq := sq + ' and status = 1 ';
  if (tipo = 2) then sq := sq + ' and (Prazo is null or Prazo=0) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

function TBco.Prazo2DiasEntregaQT(dta, dtb: TDateTime; tipo: smallint): Integer;
begin
  sq := 'select id, ligcli, numnota from TB_NFUNICA  ';
  sq := sq + ' where  (dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  sq := sq + ' order by ligcli, numnota ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.Prazo2DiasEntrega_Altera(diaCria, diaEnt: TDateTime;
  diasQt, tipo: smallint);

begin
  sq := 'update TB_NFUNICA set DiasEntrega = ' + diasQt.ToString ;
  sq := sq + ' where dtCriada ='+QuotedStr(BD_dia(diaCria,3))+'  and dtEntrega = '+QuotedStr(BD_dia(diaEnt,3))+' ';
  sq := sq + ' and status = 1 ';
  if (tipo = 2) then sq := sq + ' and (DiasEntrega is null or DiasEntrega=0) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Prazo2DiasEntrega_Mostra(diaCria: TDateTime; tipo: smallint);
begin
  sq := 'select  dtentrega, COUNT(*) as qt2  from TB_NFUNICA  ';
  sq := sq + ' where dtCriada = '+QuotedStr(BD_dia(diaCria,3))+' ';
  sq := sq + ' and status = 1 ';
  if (tipo = 2) then sq := sq + ' and (DiasEntrega is null or DiasEntrega=0) ';
  sq := sq + ' group by dtEntrega ';
  sq := sq + ' order by dtEntrega ';
  DM2.Roda_SQL(DM5.sdsPrDia, DM5.cdsPrDia, sq);
end;

procedure TBco.Prazo2DTentrega(dta, dtb: TDateTime; tipo: smallint);
begin
  sq := 'update TB_NFUNICA a set dtentrega = (select  MAX(dtEnt) from TB_NOTAF b where a.NUMNOTA=b.numnf and a.Ligcli=b.Ligcli and b.nocorr=1), a.status=1 ' ;
  sq := sq + ' where (dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  if (tipo = 2) then
  begin
    sq := sq + ' and (dtentrega is null or dtEntrega= '+QuotedStr('2008-01-01')+ ') ';
  end;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

  sq := 'update TB_NFUNICA  set status=0  ' ;
  sq := sq + ' where (dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  sq := sq + ' and (dtentrega is null or dtEntrega= '+QuotedStr('2008-01-01')+ ') ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

function TBco.Prazo2DTentregaQT(dta, dtb: TDateTime; tipo: smallint): integer;

  var resp : Integer;

begin
  sq := 'select counT(*) as qt from TB_NFUNICA ';
  sq := sq + ' where (dtCriada between '+QuotedStr(BD_dia(dta,3))+'  and '+QuotedStr(BD_dia(dtb,3))+') ';
  if (tipo = 2) then
  begin
    sq := sq + ' and ( (dtentrega is null or dtEntrega= '+QuotedStr('2008-01-01')+ ') ';
    sq := sq + ' or (DiasEntrega is Null or DiasEntrega < 1) ) ';
  end;

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  resp := DM2.cdsTMP.Fields[0].AsInteger;

  result := resp;
end;

procedure TBco.Prazo2Estat_Clientes(dta, dtb: TDateTime);
begin
  sq := 'select ligcli, b.NOME, count(*) as criadas ';
  sq := sq + ' from TB_NFUNICA a, TB_CLIENTE b ';
  sq := sq + ' where a.ligcli = b.id ';
  sq := sq + ' and a.DTCRIADA>='+QuotedStr(BD_dia(dta,3))+' and dtcriada <= '+QuotedStr(BD_dia(dtb,3))+' ';
  sq := sq + ' and status<>11 ';
  sq := sq + ' group by a.ligcli, b.nome ';
  sq := sq + ' order by b.nome ';
  DM2.Roda_SQL(DM5.sdsPrE1, DM5.cdsPrE1, sq);
end;

procedure TBco.Prazo2Estat_Dias(dta, dtb: TDateTime; ListaCli: String);
begin
  sq := 'select diasentrega, count(*) as notas from TB_NFUnica ';
  sq := sq + ' Where DTCRIADA>='+QuotedStr(BD_dia(dta,3))+' and dtcriada <= '+QuotedStr(BD_dia(dtb,3))+' ';
  //sq := sq + ' and status=1 ';
  sq := sq + ' '+ ListaCli;
  sq := sq + ' group by diasEntrega ';
  sq := sq + ' order by diasEntrega ';
  DM2.Roda_SQL(DM5.sdsPrDias, DM5.cdsPrDias, sq);

end;

procedure TBco.Prazo2Estat_Notas(dta, dtb: TDateTime; ListaCli: String);
begin
  sq := 'Select distinct a.ligcli, c.NOME,  a.numnota,  b.cep, ';
  sq := sq + ' a.DTCRIADA, a.dtentrega, a.diasentrega, a.prazo, a.status, b.tipolocal, a.id, a.primsaida, a.primocor, a.prazoresp, a.nocor, b.nocorr as oc_prim ';
  sq := sq + ' from TB_NFUNICA a, TB_NOTAF b, TB_Cliente c ';
  sq := sq + ' WHERE a.NUMNOTA=b.numnf and a.ligcli=b.ligcli and a.ligcli=c.id ';
  sq := sq + ' and DTCRIADA>='+QuotedStr(BD_dia(dta,3))+' and dtcriada <= '+QuotedStr(BD_dia(dtb,3))+' ';
  sq := sq + ' '+ ListaCli;
  sq := sq + ' order by a.ligcli, a.prazoresp,  numnota, nroma ';
  DM2.Roda_SQL(DM5.sdsPrE2, DM5.cdsPrE2, sq);

end;

procedure TBco.Prazo2Estat_Notasf(ListaCli: String);
    var f : String;
begin
  DM5.cdsPrE2.Filtered := false;
  if LengTh(ListaCli)>10 then
  begin
    f := copy(ListaCli, 5, LengTh(ListaCli));
    f := f.Replace('TB_NFUNICA.', '');
    DM5.cdsPrE2.Filter := f;
    DM5.cdsPrE2.Filtered := true;
  end;
end;

procedure TBco.Prazo2Estat_Resultado_Gravar(idNF, resp: Integer);
begin
  sq := 'update TB_NFUNICA  set prazoresp = '+resp.ToString;
  sq := sq + ' where id = '+ idNF.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Prazo2Estat_Tentativas(dta, dtb: TDateTime; ListaCli: String);
begin
  sq := 'select b.ligcli, b.NUMNF, count(*) as qt, MIN(b.nRoma) nroman, MIN(b.DTOCOREN) dt_ocor, MIN(c.dtroma) dt_roma, min(b.nocorr) as numOC ';
  sq := sq + ' from TB_NFUNICA a, TB_NOTAF b, TB_ROMA c ';
  sq := sq + ' where a.numnota = b.numnf and a.ligcli=b.LIGCLI  and b.NROMA=c.num ';
  sq := sq + ' and DTCRIADA>='+QuotedStr(BD_dia(dta,3))+' and dtcriada <= '+QuotedStr(BD_dia(dtb,3))+' ';
  //sq := sq + ' and a.status=1 ';
  sq := sq + ' '+ ListaCli;
  sq := sq + ' group by b.ligcli, b.NUMNF ';
  sq := sq + ' order by b.NUMNF ';
  DM2.Roda_SQL(DM5.sdsPrTent, DM5.cdsPrTent, sq);

end;

procedure TBco.Prazo2Estat_Tentativas_Gravar(nNF, ligcli, nOC: Integer; dtR,
  dtoc: TDateTime);
begin
  sq := 'update TB_NFUNICA  set primsaida = '+QuotedSTr( BD_dia(dtR,3) ) + ', primocor = '+ QuotedSTr( BD_dia(dtR,3) )+ ', nocor = '+ nOC.ToString ;
  sq := sq + ' where ligcli = '+ ligcli.ToString+ ' and numnota = '+ nNF.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Prazo2Inuteis_Alterar(idIN: Integer; dt: TDateTime);
begin
  sq := 'update TB_INUTEIS set ';
  sq := sq + '  DIA_INUTIL = '+ QuotedStr(BD_dia(dt,3));
  sq := sq + ' WHERE id = '+ IntToStr(idIN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Prazo2Inuteis_Apagar(idIN: Integer);
begin
  sq := 'Delete from TB_INUTEIS ';
  sq := sq + ' WHERE id = '+ IntToStr(idIN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
end;

procedure TBco.Prazo2Inuteis_Inserir(dt: TdateTime);
begin
  sq := 'insert into TB_INUTEIS (DIA_INUTIL) Values ( ';
  sq := sq + '  '+ QuotedStr(BD_dia(dt,3));
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.Prazo2Inuteis_Mostra(idI: integer);
begin
  sq := 'Select * from TB_INUTEIS ';
  if idI> 0 then sq := sq + ' WHERE id = '+ IntToStr(idI);
  sq := sq + ' order by DIA_INUTIL ';
  DM2.Roda_SQL(DM5.sdsInu, DM5.cdsInu, sq);
end;

procedure TBco.Prazo2Inuteis_MostraDT(dt1, dt2: TDateTime);
begin
  sq := 'Select * from TB_INUTEIS ';
  sq := sq + ' WHERE DIA_INUTIL >='+QuotedStr(BD_dia(dt1,3))+' and DIA_INUTIL <= '+QuotedStr(BD_dia(dt2,3))+' ';;
  DM2.Roda_SQL(DM5.sdsInu, DM5.cdsInu, sq);
end;

procedure TBco.PrazosClientes_Altera(idcli, LigPr: integer);
begin
  sq := 'update TB_CLIENTE set ';
  sq := sq + '  LigPrazo = '+ IntToStr(Ligpr);
  sq := sq + ' WHERE id = '+ IntToStr(idCli);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.PrazosClientes_Mostra(Ligpr: Integer);
begin
  sq := 'select id, Nome, Ligprazo, Prazo from  TB_Cliente Where LigPrazo = '+Ligpr.ToString+ ' order by Nome';
  DM2.Roda_SQL(DM5.sdsPrCli1, DM5.cdsPrCli1, sq);
end;

procedure TBco.PrazosClientes_Nao;
begin
  sq := 'select id, Nome, Ligprazo from  TB_Cliente Where LigPrazo = 0 or LigPrazo is Null and id > 0 order by Nome';
  DM2.Roda_SQL(DM5.sdsPrCli2, DM5.cdsPrCli2, sq);
end;

procedure TBco.PrazosFaixa_Alterar(idPrF, Prazo, CEPi, CEPf: Integer; Risco:String);
begin
  sq := 'update TB_PRAZOCEP set ';
  sq := sq + '  Prazo = '+ IntToStr(Prazo);
  sq := sq + ', CEPi = '+ IntToStr(CEPi);
  sq := sq + ', CEPf = '+ IntToStr(CEPf);
  sq := sq + ', AreaRisco = '+ QuotedStr(Risco);

  sq := sq + ' WHERE id = '+ IntToStr(idPrF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.PrazosFaixa_Apagar(idPrF: Integer);
begin
  sq := 'delete from TB_PRAZOCEP  ';
  sq := sq + ' WHERE id = '+ IntToStr(idPrF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');

end;

procedure TBco.PrazosFaixa_Inserir(LigPr, Prazo, CEPi, CEPf: Integer; Risco:String);
begin
  sq := 'insert into TB_PRAZOCEP (LigPrazoL, Prazo, CEPi, CEPf, AreaRisco) VALUES ( ';
  sq := sq + '  '+ IntToStr(LigPr);
  sq := sq + ', '+ IntToStr(Prazo);
  sq := sq + ', '+ IntToStr(CEPi);
  sq := sq + ', '+ IntToStr(CEPf);
  sq := sq + ', '+ QuotedStr(Risco);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.PrazosFaixa_Mostrar(LigPr: Integer);
begin
  sq := 'select * from TB_PRAZOCEP  ';
  sq := sq + ' WHERE LigPrazoL = '+ IntToStr(LigPr);
  DM2.Roda_SQL(DM5.sdsPr2, DM5.cdsPr2, sq);

end;

procedure TBco.PrazosFaixa_Mostrar_Cli(idCli: Integer);
begin
  sq := 'select a.* from TB_PRAZOCEP a, TB_CLIENTE b ';
  sq := sq + ' Where a.LIGPRAZOL = b.LIGPRAZO ';
  sq := sq + ' and b.id = '+ IntToStr(idCli);
  sq := sq + ' Order by CEPi ';
  DM2.Roda_SQL(DM5.sdsPr2, DM5.cdsPr2, sq);

end;

procedure TBco.PrazosFaixa_Mostrar_ID(idPrF: Integer);
begin
  sq := 'select * from TB_PRAZOCEP  ';
  sq := sq + ' WHERE id = '+ IntToStr(idPrF);
  sq := sq + ' Order by CEPi ';
  DM2.Roda_SQL(DM5.sdsPr2, DM5.cdsPr2, sq);

end;

procedure TBco.Prazos_Alterar(idPr: Integer; Descr: String;
  Validade: TDatetime);
begin
  sq := 'update TB_PRAZO set  ';
  sq := sq + '  Descreve = '+ QuotedStr(Descr);
  sq := sq + ', Validade = '+ QuotedStr(BD_dia(Validade, 3));
  sq := sq + ' WHERE id = '+ IntToStr(idPr);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Prazos_Apagar(idPr: Integer);
begin
  sq := 'delete from TB_PRAZO  ';
  sq := sq + ' WHERE id = '+ IntToStr(idPr);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');

end;

procedure TBco.Prazos_Inserir(Descr: String; Validade: TDatetime);
begin
  sq := 'insert into TB_PRAZO (Descreve, Validade) Values ( ';
  sq := sq + '  '+ QuotedStr(Descr);
  sq := sq + ', '+ QuotedStr(BD_dia(Validade, 3));
  sq := sq + ' )' ;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.Prazos_Mostrar(opcao: smallint);
begin
  // opcao 0 = todos
  // opcao 1 = Validos
  // opcao 2 = Vencidos
  sq := 'select * from TB_PRAZO  ';
  if (opcao = 1) then sq := sq + ' WHERE Validade >= '+ QuotedStr(BD_dia(Now, 3));
  if (opcao = 2) then sq := sq + ' WHERE Validade <  '+ QuotedStr(BD_dia(Now, 3));
  sq := sq + ' Order by Descreve ';
  DM2.Roda_SQL(DM5.sdsPr1, DM5.cdsPr1, sq);

end;

procedure TBco.Prazos_Mostrar_ID(idPr: Integer);
begin
  sq := 'select * from TB_PRAZO  ';
  sq := sq + ' WHERE id = '+ IntToStr(idPr);
  DM2.Roda_SQL(DM5.sdsPr1, DM5.cdsPr1, sq);

end;

procedure TBco.Prod_Altera(id: integer; Cod, CodBarra, CodCli, Descricao, Comp, Unidade, nfNCM: String;
  Minimo, nfCFOP, flg_MinTela, flg_MinMail: Smallint; Palete, Peso: Double; LigGrupo, Cubagem : Integer);
begin
  sq := 'update TB_PRODUTO set COD = '+QuotedStr(Cod);
  sq := sq + ', CODBARRA = '+ QuotedStr(CodBarra);
  sq := sq + ', DESCRICAO = '+ QuotedStr(Descricao);
  sq := sq + ', UNIDADE = '+ QuotedStr(Unidade);
  sq := sq + ', MINIMO = '+ IntToStr(Minimo);
  sq := sq + ', PALETE = '+ FloatToStr(Palete);
  sq := sq + ', LIGGRUPO = '+ IntToStr(LigGrupo);
  sq := sq + ', Complemento = '+ QuotedStr(Comp);
  sq := sq + ', CodCli = '+ QuotedStr(CodCli);
  sq := sq + ', Peso = '+ Formata_Num(Peso);
  sq := sq + ', Cubagem = '+ IntToStr(Cubagem);
  sq := sq + ', nfNCM = '+ QuotedStr(nfNCM);
  sq := sq + ', nfCFOP = '+ IntToStr(nfCFOP);
  sq := sq + ', flg_MinTela = '+ IntToStr(flg_MinTela);
  sq := sq + ', flg_MinMail = '+ IntToStr(flg_MinMail);
  sq := sq + '  where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsProd, sq , 'Alterar');
end;


procedure TBco.Prod_Apaga(id: integer);
begin
  sq := 'delete from TB_PRODUTO ';
  sq := sq + ' where id = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsProd, sq , 'Apagar UM');

end;

procedure TBco.Prod_ApagaTodosC(idM: integer);
begin
  sq := 'delete from TB_PRODUTO ';
  sq := sq + ' where LIGCli = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsProd, sq , 'Apagar Todos');
end;

procedure TBco.Prod_ApagaTodosG(idM: integer);
begin
  sq := 'delete from TB_PRODUTO ';
  sq := sq + ' where LIGGrupo = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsProd, sq , 'Apagar Todos');

end;

function TBco.Prod_Existe(Codbarra: String): integer;
begin
  sq := 'select * from TB_PRODUTO where CODBARRA = '+ QuotedStr(CodBarra) ;
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
  if (DM1.cdsProd.RecordCount > 0) then Prod_Existe := DM1.cdsProdID.Value
    else Prod_Existe := 0;

end;

procedure TBco.Prod_Insere(idM : Integer;Cod, CodBarra, CodCli, Descricao, Comp, Unidade, nfNCM: String;
  Minimo, nfCFOP, flg_MinTela, flg_MinMail: Smallint; Palete, Peso: Double; LigGrupo, Cubagem : Integer);
begin
  sq := 'insert into TB_PRODUTO (LIGCLI, COD,CODBARRA, DESCRICAO, UNIDADE,MINIMO, ';
  sq := sq + ' PALETE, LIGGRUPO, COMPLEMENTO, CodCli, Peso, Cubagem,   ';
  sq := sq + ' nfNCM, nfCFOP, flg_MinTela, flg_MinMail, QUANT ) Values  ';

  sq := sq + '( '+ IntToStr(idM);
  sq := sq + ', '+ QuotedStr(Cod);
  sq := sq + ', '+ QuotedStr(CodBarra);
  sq := sq + ', '+ QuotedStr(Descricao);
  sq := sq + ', '+ QuotedStr(Unidade);
  sq := sq + ', '+ IntToStr(Minimo);
  sq := sq + ', '+ Formata_Num(Palete);
  sq := sq + ', '+ IntToStr(LigGrupo);
  sq := sq + ', '+ QuotedStr(Comp);
  sq := sq + ', '+ QuotedStr(CodCli);
  sq := sq + ', '+ Formata_Num(Peso);
  sq := sq + ', '+ IntToStr(Cubagem);
  sq := sq + ', '+ QuotedStr(nfNCM);
  sq := sq + ', '+ IntToStr(nfCFOP);
  sq := sq + ', '+ IntToStr(flg_MinTela);
  sq := sq + ', '+ IntToStr(flg_MinMail);
  sq := sq + ',  0';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsProd, sq , 'Inserir');
end;

procedure TBco.Prod_MostraId(id: integer);
begin
  sq := 'select * from TB_PRODUTO  where ID = '+ IntToStr(id);
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Prod_MostraTodos(idM: integer);
begin
  sq := 'select * from TB_PRODUTO  where LigCli = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;


procedure TBco.Prod_MostraGrupo(idM: integer);
begin
  sq := 'select * from TB_PRODUTO  where LigGrupo = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Prod_MostraCod(idM: integer; cod: String);
begin
  sq := 'select * from TB_PRODUTO  where LigCli = '+ IntToStr(idM) + ' and UPPER(Cod) LIKE '+ QuotedStr(UpperCase(cod)) +' or CodBarra = '+ QuotedStr(cod);
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Prod_MostraDescricao(idM: integer; desc: String);
begin
  sq := 'select * from TB_PRODUTO  where LigCli = '+ IntToStr(idM) + ' and UPPER(Descricao) LIKE '+ QuotedStr(UpperCase(desc)+'%');
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;


{
  BANCO
  ======================================================
  06.07.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Banco_Altera(id: integer; BcoNum, BcoNome, Agencia, Conta,
  CPF, favorecido: String; tipoCC:Smallint);
begin
  sq := 'update TB_FUNCBANCO set BCONUM = '+QuotedStr(bcoNum);
  sq := sq + ', BCONOME = '+ QuotedStr(bcoNome);
  sq := sq + ', AGENCIA = '+ QuotedStr(Agencia);
  sq := sq + ', CONTA = '+ QuotedStr(Conta);
  sq := sq + ', CPF = '+ QuotedStr(CPF);
  sq := sq + ', Favorecido = '+ QuotedStr(favorecido);
  sq := sq + ', tipoCC = '+ IntToStr(tipoCC);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFBco, sq , 'Alterar');

end;

procedure TBco.Banco_Apaga(id: integer);
begin
  sq := 'delete from TB_FUNCBANCO ';
  sq := sq + ' where id = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFBco, sq , 'Apagar UM');
end;

procedure TBco.Banco_ApagaTodos(idM: integer);
begin
  sq := 'delete from TB_FUNCBANCO ';
  sq := sq + ' where LIGFUNC = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFBco, sq , 'Apagar Todos');
end;

function TBco.Banco_Conta(idM: Integer): integer;
begin
  Banco_Conta := DM2.Conta('TB_FUNCBANCO', ' LIGFUNC = '+IntToStr(idM));
end;

procedure TBco.Banco_Insere(idM: integer; BcoNum, BcoNome, Agencia, Conta,
  CPF, favorecido: String; tipoCC:Smallint);
begin
  sq := 'insert into TB_FUNCBANCO (LIGFUNC, BCONUM, BCONOME, AGENCIA, CONTA, CPF, FAVORECIDO, TIPOCC ) Values ';
  sq := sq + ' ( '+IntToStr(idM);
  sq := sq + ', '+QuotedStr(BcoNum);
  sq := sq + ', '+QuotedStr(BcoNome);
  sq := sq + ', '+QuotedStr(Agencia);
  sq := sq + ', '+QuotedStr(Conta);
  sq := sq + ', '+QuotedStr(CPF);
  sq := sq + ', '+QuotedStr(favorecido);
  sq := sq + ', '+IntToStr(tipoCC)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFBco, sq , 'Inserir');

end;

procedure TBco.Banco_MostraId(id: integer);
begin
  sq := 'select * from TB_FUNCBANCO where ID = '+ IntToStr(id);
  DM2.Roda_SQL(DM1.sdsFBco, DM1.cdsFBco, sq);
end;

procedure TBco.Banco_MostraTodos(idM: integer);
begin
  sq := 'select * from TB_FUNCBANCO where LIGFUNC = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsFBco, DM1.cdsFBco, sq);
end;
{
  CARRO
  ======================================================
  06.07.2010 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Carro_Altera(id: integer; Placa, Veiculo, CodLibera: String;
  Ano: Smallint);
begin
  sq := 'update TB_FUNCCAR set PLACA = '+QuotedStr(Placa);
  sq := sq + ', VEICULO = '+ QuotedStr(Veiculo);
  sq := sq + ', CODLIBERA = '+ QuotedStr(CodLibera);
  sq := sq + ', ANO = '+ IntToStr(Ano);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFCar, sq , 'Alterar');
end;

procedure TBco.Carro_Apaga(id: integer);
begin
  sq := 'delete from TB_FUNCCAR ';
  sq := sq + ' where id = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFCar, sq , 'Apagar UM');
end;

procedure TBco.Carro_ApagaTodos(idM: integer);
begin
  sq := 'delete from TB_FUNCCAR ';
  sq := sq + ' where LIGFUNC = '+ IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFCar, sq , 'Apagar UM');
end;

function TBco.Carro_Conta(idM: Integer): integer;
begin
  Carro_Conta := DM2.Conta('TB_FUNCCAR', ' LIGFUNC = '+IntToStr(idM));
end;

procedure TBco.Carro_Insere(idM: integer; Placa, Veiculo, CodLibera: String;
  Ano: Smallint);
begin
  sq := 'insert into TB_FUNCCAR (LIGFUNC, PLACA, VEICULO, CODLIBERA, ANO ) Values ';
  sq := sq + ' ( '+IntToStr(idM);
  sq := sq + ',  '+QuotedStr(Placa);
  sq := sq + ', '+QuotedStr(Veiculo);
  sq := sq + ', '+QuotedStr(CodLibera);
  sq := sq + ', '+IntToStr(Ano)+' )';
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFCar, sq , 'Inserir');
end;

procedure TBco.Carro_MostraId(id: integer);
begin
  sq := 'select * from TB_FUNCCAR where ID = '+ IntToStr(id);
  DM2.Roda_SQL(DM1.sdsFCar, DM1.cdsFCar, sq);
end;

procedure TBco.Carro_MostraTodos(idM: integer);
begin
  sq := 'select * from TB_FUNCCAR where LIGFUNC = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsFCar, DM1.cdsFCar, sq);
end;

procedure TBco.CC_Altera(idCC: Integer; Desc, Nome: String; Ag, AgDig, Conta,
  ContaDig: Integer);
begin
  sq := 'Update TB_CONTABANCO SET ';
  sq := sq + ' Descreve   = '+QuotedStr(Desc);
  sq := sq + ',NomeBanco  = '+QuotedStr(Nome);
  sq := sq + ',NumAgencia = '+IntToStr(Ag);
  sq := sq + ',DigAgencia = '+IntToStr(AgDig);
  sq := sq + ',NumConta   = '+IntToStr(Conta);
  sq := sq + ',DigConta   = '+IntToStr(ContaDig);
  sq := sq + ' WHERE id = '+IntToStr(idCC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.CC_AlteraStatus(idCC, status: Integer);
begin
  sq := 'Update TB_CONTABANCO SET ';
  sq := sq + ' Ativo   = '+IntToStr(status);
  sq := sq + ' WHERE id = '+IntToStr(idCC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.CC_Insere(Desc, Nome: String; Ag, AgDig, Conta,
  ContaDig: Integer);
begin
  sq := 'insert into TB_CONTABANCO (Descreve, NomeBanco, NumAgencia, DigAgencia, NumConta, DigConta, Ativo ) Values (';
  sq := sq + '  '+QuotedStr(Desc);
  sq := sq + ', '+QuotedStr(Nome);
  sq := sq + ', '+IntToStr(Ag);
  sq := sq + ', '+IntToStr(AgDig);
  sq := sq + ', '+IntToStr(Conta);
  sq := sq + ', '+IntToStr(ContaDig);
  sq := sq + ',1 )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
end;

procedure TBco.CC_Mostra;
begin
  sq := 'select * from TB_CONTABANCO order by descreve ';
  DM2.Roda_SQL(DM5.sdsCC, DM5.cdsCC, sq);
end;

{
  NOTAS
  ======================================================
  08.08.2011 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Notas_MostraId(id: integer);
begin
    sq := 'select * from TB_NOTAF where id = '+ IntToStr(id);
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
end;


procedure TBco.Notas_SAC(dtR: TDateTime);
begin
  sq := 'select tb_roma.num - extract(YEAR from dtRoma)* 1000000 as Romaneio,dtRoma, ';
  sq := sq + ' TB_CLIENTE.id as idC, TB_CLIENTE.NOME, numNF, ';
  sq := sq + ' nRoma, Tb_NotaF.id as idNF, Tb_Roma.id as idR, ';
  sq := sq + ' CASE tb_ocorre.uso WHEN 2 THEN '+QuotedStr('Reentrega')+ ' WHEN 3 THEN '+QuotedStr('Devolução')+ ' ELSE '+QuotedStr('-')+ ' END as tipotxt, ';
  sq := sq + ' nocorr, tb_ocorre.DESCR ';
  sq := sq + ' from Tb_ocorre, tb_Notaf,  TB_ROMA, TB_CLIENTE ';
  sq := sq + ' where  tb_ocorre.num  = tb_notaf.nocorr and tb_roma.num  = tb_notaf.nroma and TB_CLIENTE.id = TB_NOTAF.LIGCLI and TB_NOTAF.nocorr>1 ';
  sq := sq + ' and TB_OCORRE.autosac=1 and tb_roma.dtRoma = '+ QuotedStr(BD_dia(dtR, 3));
  sq := sq + ' order by tb_notaf.numnf ';
  DM2.Roda_SQL(DM5.sdsSAC, DM5.cdsSAC, sq);

end;

procedure TBco.Notas_SemCli();
begin
    sq := 'select * from TB_NOTAF where ligcli = 0 or ligcli is null ';
    DM2.Roda_SQL(DM5.sdsSemC, DM5.cdsSemC, sq);
end;

procedure TBco.Notas_AlteraCli(idNF, idC:integer);
begin
  sq := 'Update TB_NOTAF set LigCli = ' + IntToStr(idC) + ' WHERE id = ' + IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_MostraNum(Num: integer);
begin
    sq := 'select * from TB_NOTAF where numNF = '+ IntToStr(Num)+ ' order by id ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
end;

procedure TBco.Notas_MostraNum2(idNF, Num: integer);
begin
    sq := 'select * from TB_NOTAF where ';
    sq := sq + ' (id > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' numNF = '+ IntToStr(Num)+ ' order by id ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
end;

procedure TBco.Notas_MostraNumNovo(Num: integer);
begin
    sq := 'select * from VIEW_NOTASPQ where numNF = '+ IntToStr(Num)+ ' order by idN desc';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_MostraPED(idNF: integer; Doc: string);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' UPPER(numped) LIKE '+ QuotedStr('%'+UpperCase(Doc)+'%')+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);

end;

procedure TBco.Notas_MostraNum2Novo(idNF, Num: integer);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' numNF = '+ IntToStr(Num)+ ' order by idN desc';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_MostraCEP(idNF:integer; CEP:string);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' CEP LIKE '+ QuotedStr(CEP+'%')+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_MostraLocal(idNF:integer; Local:string);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' UPPER(Locali) LIKE '+ QuotedStr('%'+UpperCase(Local)+'%')+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_MostraDatas(dti, dtf: TDateTime);
begin
  sq := 'select nf.* ';
  sq := sq + ' from TB_NOTAF nf, TB_ROMA ro ';
  sq := sq + ' Where (nf.nRoma = ro.num) ';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  sq := sq + ' Order by nf.LigCli ';
  DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);

end;

procedure TBco.Notas_MostraDest(idNF:integer; Dest:string);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' UPPER(NomeDest) LIKE '+ QuotedStr('%'+UpperCase(Dest)+'%')+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_MostraValor(idNF:integer; valor:Double);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' Valor = '+ Formata_Num(valor)+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_Obs2_Inserir(nNF, idCli, idUsuario, tipo: Integer;
  obs2: String);
begin
  sq := 'insert into TB_NFOBS (DTobs, LigUser, LigCli, NFnum, tipoObs, obs2 ) VALUES ( ';
  sq := sq + '  '+ QuotedStr(BD_dia(Now, 1));
  sq := sq + ', '+ IntToStr(idUsuario);
  sq := sq + ', '+ IntToStr(idCli);
  sq := sq + ', '+ IntToStr(nNF);
  sq := sq + ', '+ IntToStr(tipo);
  sq := sq + ', '+ QuotedStr(obs2);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.Notas_Obs2_Mostra(nNF, idCli: Integer);
begin
    sq := 'Select a.DTOBS, b.LOGIN, a.OBS2, a.TIPOOBS ';
    sq := sq + ' from Tb_NFOBS a, TB_USUARIOS b ';
    sq := sq + ' where a.LIGUSER = b.id ';
    sq := sq + ' and a.NFNUM = ' + IntToStr(nNF);
    sq := sq + ' and a.ligCli = ' + IntToStr(idCli);
    sq := sq + ' order by a.DTobs desc ';
    DM2.Roda_SQL(DM5.sdsObs2, DM5.cdsObs2, sq);

end;

procedure TBco.Notas_OCOREN(dt: TdateTime; idCli: Integer);
begin
  sq := ' select b.dtRoma, a.nRoma, a.NUMNF, a.VALOR, b.num - extract(YEAR from b.dtRoma)* 1000000 as Romaneio, c.NOME, a.DTocoren, a.ID as idNF, a.nocorr ';
  sq := sq + ' from TB_NOTAF a, TB_ROMA b , TB_CLIENTE c ';
  sq := sq + ' Where a.nroma=b.num  and a.LIGCLI=c.id ';
  sq := sq + ' and b.dtRoma='+ QuotedStr(BD_dia(dt, 3))+' ';
  if idCli>0 then sq := sq + ' and a.LigCli = ' + idCli.ToString;
  sq := sq + ' order by a.nRoma, a.numnf ';
  DM2.Roda_SQL(DM5.sdsNFenvia, DM5.cdsNFenvia, sq);
end;

procedure TBco.Notas_MostraDOC(idNF:integer; Doc:string);
begin
    sq := 'select * from VIEW_NOTASPQ where ';
    if (idNF>0) then sq := sq + ' (idN > ' + IntToStr(idNF) + ') and ';
    sq := sq + ' UPPER(DocDest) LIKE '+ QuotedStr('%'+UpperCase(Doc)+'%')+' order by idN ';
    DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;


procedure TBco.Notas_MostraSMS(dia:TDateTime; tipo:Smallint);

begin
    sq := 'select x.id, y.NOME, x.numnf, x.valor, x.fonedest,  x.NUMPED, ';
    sq := sq + ' CASE  x.ENVIASMS when 1  then ' +QuotedStr('Enviado OK')+' when 2 then ' +QuotedStr('NULO')+' when 3 then ' +QuotedStr('RET ERRO')+' when 33 then ' +QuotedStr('FIXO')+' when 0 then ' +QuotedStr('Não Enviado')+' Else '+QuotedStr('ERRO')+ ' end  ';
    sq := sq + ' as Status, x.ENVIASMS ';
    sq := sq + ' FROM TB_Notaf x , TB_CLIENTE y, TB_ROMA z';
    sq := sq + ' where (x.LIGCLI = y.id) and (z.num = x.NROMA)';
    sq := sq + ' and z.DTROMA = '+QuotedStr(BD_dia(dia, 3));
    sq := sq + ' and not(x.fonedest is null) ';
    sq := sq + ' and y.USA_SMS = 1';
    if (tipo=1) then sq := sq + ' and x.ENVIASMS = 0';
    DM2.Roda_SQL(DM4.sdsSMS, DM4.cdsSMS, sq);
end;

procedure TBco.Notas_MostraTodos(idM: integer);
begin
  if (idM > 0) then
  begin
    sq := 'select * from TB_NOTAF where LigCli = '+ IntToStr(idM);
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
  end
  else
  begin
    sq := 'select * from TB_NOTAF ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
  end

end;

procedure TBco.Notas_Alterar(idN, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali: String; nConh:Integer; ligCli, Origem:integer; Dest, FoneDest, DocDest:String; Priorid:Smallint);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  numNF = '+IntToStr(numNF);
  sq := sq + ', Volume ='+IntToStr(Volume);
  sq := sq + ', Valor = '+Formata_Num(Valor);
  sq := sq + ', Peso = '+Formata_Num(Peso);
  sq := sq + ', PesoNF = '+Formata_Num(Peso);
  sq := sq + ', CEP = '+QuotedStr(CEP);
  sq := sq + ', Locali = '+QuotedStr(Locali);
  sq := sq + ', nConh ='+IntToStr(nConh);
  sq := sq + ', LigCli ='+IntToStr(ligCli);
  //sq := sq + ', Origem ='+IntToStr(origem);
  sq := sq + ', NomeDest = '+QuotedStr(Dest);
  sq := sq + ', FoneDest = '+QuotedStr(FoneDest);
  sq := sq + ', DocDest = '+QuotedStr(DocDest);
  sq := sq + ', dtalt = '+QuotedStr(BD_dia(Now, 1));
  sq := sq + ', Prioridade ='+IntToStr(Priorid);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_AlterarSMS(idN, usa_SMS: Integer);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  enviaSMS ='+IntToStr(usa_SMS);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_AlterarFone(idN:Integer; tel:String);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + ' fonedest ='+QuotedStr(tel);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_AlterarFrete(idN:Integer; Valor: Double);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  vFrete ='+Formata_Num(valor);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_AlterarNFcomb(idN: Integer; Valor: Double);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  vlrCombinado ='+Formata_Num(valor);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_Entregas_Alterar(idN: Integer; DTent, HRent, Obs,
  Recebedor, entregue: String; nOcorr: Integer);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  DTent ='+QuotedStr(DTent);
  sq := sq + ', HRent = '+QuotedStr(HRent);
  sq := sq + ', Obs = '+QuotedStr(Obs);
  sq := sq + ', Recebedor = '+QuotedStr(Recebedor);
  sq := sq + ', Entregue = '+QuotedStr(Entregue);
  sq := sq + ', nOcorr = '+IntToStr(nOcorr);
  sq := sq + ', Status_EDI = 1';
  sq := sq + ', dtBaixa = '+QuotedStr(BD_dia(Now,3));

  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_Entregas_Ocorr(idN:Integer; Obs,  entregue:String; nOcorr:Integer );
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  Obs        = '+QuotedStr(Obs);
  sq := sq + ', Entregue   = '+QuotedStr(Entregue);
  sq := sq + ', nOcorr     = '+IntToStr(nOcorr);
  sq := sq + ', Status_EDI = 1';
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_Inserir(idC, numNF, Volume: Integer; Valor, Peso: double;
  CEP, Locali: String; nConh, Origem:Integer; ContaReent:Smallint; Dest, FoneDest, DocDest, cnpjEmb:String; serieNF, Priorid:Integer);

    var ligc : integer;
begin
  ligc := idC;
  sq := 'insert into TB_NOTAF (ligCli, NumNF, Volume, Valor, Peso, PesoNF, CEP, Locali, ';
  sq := sq + ' nRoma, nConh, nOcorr, proxRoma, dtNota, Origem, ContaReent, NomeDest, FoneDest, DocDest, ';
  sq := sq + ' Entregue, ligrel, ponto, status_edi, extranum, cob_ok, pag_ok, ligTransp, ';
  sq := sq + ' Baixa_Orig, Baixa_Func, nCham, serieNF, flag_imp, dtcria, dtalt, enviaSMS, Pende, Prioridade, CNPJEMB) Values ';
  sq := sq + ' ('+IntToStr(idC);
  sq := sq + ', '+IntToStr(numNF);
  sq := sq + ', '+IntToStr(Volume);
  sq := sq + ', '+Formata_Num(Valor);
  sq := sq + ', '+Formata_Num(Peso);
  sq := sq + ', '+Formata_Num(Peso);
  sq := sq + ', '+QuotedStr(CEP);
  sq := sq + ', '+QuotedStr(Locali);
  sq := sq + ', 0, '+IntToStr(nConh)+ ', 0, 0 ';
                { TODO : Usar 4 para data do Sistemas, testar pq colcoa 2010 }
  sq := sq + ', '+QuotedStr(BD_dia(Now, 3));
  sq := sq + ', '+IntToStr(Origem);
  sq := sq + ', '+IntToStr(ContaReent);
  sq := sq + ', '+QuotedStr(Dest);
  sq := sq + ', '+QuotedStr(FoneDest);
  sq := sq + ', '+QuotedStr(DocDest);
  sq := sq + ', '+QuotedStr('-  ')+',0,0,0,0,0,0,3 ';
  sq := sq + ',0,0,0 ';
  sq := sq + ', '+IntToStr(SerieNF);
  sq := sq + ',0 ';
  sq := sq + ', '+QuotedStr(BD_dia(Now, 1));
  sq := sq + ', '+QuotedStr(BD_dia(Now, 1));
  sq := sq + ',0,0 ';
  sq := sq + ', '+IntToStr(Priorid);
  sq := sq + ', '+QuotedStr(cnpjEmb);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
  {
  // origem DESCREVE
  0= Nao Marcada
  1= Manual
  2= Coleta
  3= Importada EDI
  4= Reentrega
  5= Importada XML
  6= Importada XLS
  7=Tiny

  // Status
  0= Em Transito
  1= Entregue
  2= Devolvida
  3= Reentrega
  4= Cancelada/Apagada
   }


  if (Origem = 1) or (Origem=3) or (Origem=6)  or (Origem=5)   or (Origem=7) then
  begin
    sq := 'insert into TB_NFUNICA (ligCli, NumNota, Status, dtCriada, webcopia) VALUES ';
    sq := sq + ' ('+IntToStr(ligc);
    sq := sq + ', '+IntToStr(numNF);
    sq := sq + ', 0';
    sq := sq + ', '+QuotedStr(BD_dia(Now, 3));;
    sq := sq + ', 5';
    sq := sq + ' ) ';

    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
  end;

end;

function TBco.Notas_RecuperaId(numNF : Integer): Integer;

var idN : integer;

begin
    sq := 'select FIRST 1 id from TB_NOTAF Where numNF = '+IntToStr(numNF)+' ORDER BY id DESC ';
    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
    idN := DM2.cdsTMP.Fields[0].value;
    Notas_RecuperaId := idN;
end;

procedure TBco.Notas_Escolhe(numNF: integer);
begin
  sq := 'select * from VIEW_NOTASPQ where VIEW_NOTASPQ."NUMNF"  = '+IntToStr(numNF)+' order by VIEW_NOTASPQ."IDN" desc ';
  DM2.Roda_SQL(DM3.vsNFp, DM3.vcNFp, sq);
end;

procedure TBco.Notas_Reentrega(idN: Integer);

var c_nf, c_volume, c_conh, c_idC, c_tipoLO, idNot, c_Origem, c_nCham, c_serie : Integer;
    c_valor, c_peso, prim, ult : double;
    c_cep, c_local, c_dest, c_foneD, c_docD, c_cnpjEmb : string;
    c_reent : Smallint;

begin
  {
    =================================================
        CUIDADO! - 28/08/2014
        Qualquer erro na reentrega resulta em
        um efeito colateral nas devoluções

        Quando geramos uma reentrega a partir da
        devolução a nota é (erronemanete) retirada
        do romeneio e inserida no novo romaneio.

    =================================================
  }

  sq := 'select * from TB_NOTAF where id = '+ IntToStr(idN) + ' order by id ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  DM2.cdsTMP.Last;

  // Copia
  c_nf     := DM2.cdsTMP.Fields[1].Value;
  c_volume := DM2.cdsTMP.Fields[3].Value;
  c_conh   := DM2.cdsTMP.Fields[9].Value;
  c_valor  := DM2.cdsTMP.Fields[2].Value;
  c_peso   := DM2.cdsTMP.Fields[4].Value;
  c_cep    := DM2.cdsTMP.Fields[5].Value;
  c_local  := DM2.cdsTMP.Fields[6].Value;
  c_idC    := DM2.cdsTMP.Fields[10].Value;
  c_reent  := DM2.cdsTMP.Fields[40].AsInteger; // contareent
  c_serie  := 1;

  if (DM2.cdsTMP.Fields[66].Value <> null) then
     c_cnpjEmb := DM2.cdsTMP.Fields[66].AsString;

  if (DM2.cdsTMP.Fields[42].Value <> null) then
    c_serie  := DM2.cdsTMP.Fields[42].AsInteger;

  if (DM2.cdsTMP.Fields[41].Value <> null) then
    c_dest   := DM2.cdsTMP.Fields[41].AsString; // destina

  if (DM2.cdsTMP.Fields[46].Value <> null) then
    c_foneD  := DM2.cdsTMP.Fields[46].AsString; // Fone destina

  if (DM2.cdsTMP.Fields[51].Value <> null) then
    c_docD  := DM2.cdsTMP.Fields[51].AsString; // DOC destina

  // Outros valores
  c_nCham  := DM2.cdsTMP.Fields[45].AsInteger; // nChamada

  //c_roma   := DM2.cdsTMP.Fields[8].Value;
  c_tipoLO := DM2.cdsTMP.Fields[18].Value;

  //c_Origem := DM2.cdsTMP.Fields[30].Value;
  if (c_Origem <> 2) then
    c_Origem := 4; // Marca origem como reentrega

  // Insere Nova Nota Fiscal
  Notas_Inserir(c_idC, c_nf, c_volume, c_valor, c_peso, c_cep, c_local, c_conh, c_Origem, c_reent + 1, c_dest, c_foneD, c_docD,c_cnpjEmb, c_serie, 1);
  idNot := Notas_RecuperaId(c_nf);
  Notas_TipoLocal(idNot,c_tipoLO);

  // Atualiza outros valores
  sq := 'Update TB_NOTAF ';
  sq := sq + ' SET nCham = ' + IntToStr(c_nCham);
  sq := sq + ' Where ID = ' + IntToStr(idNot);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
  {
  // Valores
  DM2.cdsTMP.First;
  prim := DM2.cdsTMP.Fields[1].Value;
  DM2.cdsTMP.Last;
  ult  := DM2.cdsTMP.Fields[1].Value;

  if (prim <> ult) then
  begin
    sq := 'INSERT INTO TB_LOG01 (DIA, LIGsUSER, NUMNOTA, VANTE, VDEPO, OBS ) VALUES (';
    sq := sq + ' ' + QuotedStr(FormatDatetime('yyyy-MM-dd', Now));
    sq := sq + ', 0 ';
    sq := sq + ', ' + intToStr(c_NF);
    sq := sq + ', ' + Formata_Num(prim);
    sq := sq + ', ' + Formata_Num(ult);
    sq := sq + ', ' + QuotedSTr('Valor INSERE');
    sq := sq + ' ) ';
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Valor INSERIR');
  end;
  }
end;

procedure TBco.Notas_MarcarProxRoma(idN, px: Integer);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  ProxRoma = '+IntToStr(px);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP2, sq , 'Alterar');

end;

procedure TBco.Notas_RefazProxRoma(numNF, ligCli: Integer);

var aid, aligcli, aNumNF, aNRoma, aProxRoma,
    bid, bligcli, bNumNF, bNRoma, bProxRoma : Integer;

    aValor, aPeso, bValor, bPeso : Double;

begin
  sq := 'select id, nRoma, ProxRoma, origem from TB_Notaf ';
  sq := sq + ' WHERE numnf = '+IntToStr(numNF) + ' and ligcli = '+ligCli.ToString;
  sq := sq + ' Order by id ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 1) then
  begin
    DM2.cdsTMP.First;
    aid := 0;
    while not DM2.cdsTMP.Eof do
    begin
      aproxRoma := DM2.cdsTMP.Fields[2].Value;
      if aid > 0 then
      begin
        aNRoma  := DM2.cdsTMP.Fields[1].Value;
        Notas_MarcarProxRoma(aid, aNRoma);
      end;

      if aProxRoma=0  then
        aid     := DM2.cdsTMP.Fields[0].Value
      else aid := 0;

      DM2.cdsTMP.Next;
    end;
    {
    aid     := DM2.cdsTMP.Fields[0].Value;
    aligcli := DM2.cdsTMP.Fields[1].Value;
    aNumNF  := DM2.cdsTMP.Fields[2].Value;
    aNRoma  := DM2.cdsTMP.Fields[3].Value;
    aproxRoma := DM2.cdsTMP.Fields[4].Value;
    aValor  := DM2.cdsTMP.Fields[5].Value;
    aPeso   := DM2.cdsTMP.Fields[6].Value;

    DM2.cdsTMP.Next;

    bid     := DM2.cdsTMP.Fields[0].Value;
    bligcli := DM2.cdsTMP.Fields[1].Value;
    bNumNF  := DM2.cdsTMP.Fields[2].Value;
    bNRoma  := DM2.cdsTMP.Fields[3].Value;
    bproxRoma := DM2.cdsTMP.Fields[4].Value;
    bValor  := DM2.cdsTMP.Fields[5].Value;
    bPeso   := DM2.cdsTMP.Fields[6].Value;

    if ((aligcli = bligcli) and (aNumNF=bNumNF) and (aProxRoma <> bNRoma) and (aNRoma <> bNRoma)) then
      Notas_MarcarProxRoma(bid, aNRoma);
      }
  end;
end;

procedure TBco.Notas_Retorno_Baixas(grupoNF: String);
begin
  sq := ' select id, numnf, nocorr, dtent, hrent, ligcli from tb_notaf ';
  sq := sq + ' WHERE (dtnota > CURRENT_DATE - 90) and numnf in ( '+grupoNF+' )' ;
  DM2.Roda_SQL(DM5.sdsRetR1, DM5.cdsRetR1, sq);

end;

procedure TBco.Notas_Retorno_fBaixas(nNF: Integer);
begin
  DM5.cdsRetR1.Filtered := false;
  DM5.cdsRetR1.Filter := 'numnf = ' + nNF.ToString;
  DM5.cdsRetR1.Filtered := true;

end;

procedure TBco.Notas_Retorno_fRastreio(nNF: Integer);
begin
  DM5.cdsRetR2.Filtered := false;
  DM5.cdsRetR2.Filter := 'numnota = ' + nNF.ToString;
  DM5.cdsRetR2.Filtered := true;

end;

procedure TBco.Notas_Retorno_Rastreio(grupoNF: String);
begin
  sq := 'select a.numnota, a.DTEV, c.DESCR, b.Login, a.numroma ';
  sq := sq + ' from tb_NFstatus a, TB_Usuarios b, TB_INTERNO c  ';
  sq := sq + ' where a.LIGUSER = b.ID and a.NUMEVENTO = c.CODINT and a.DTEV > CURRENT_DATE - 90 ';
  sq := sq + ' and a.NUMnota in ( ' + grupoNF + ' )' ;
  sq := sq + ' order by a.DTEV ';
  DM2.Roda_SQL(DM5.sdsRetR2, DM5.cdsRetR2, sq);

end;

procedure TBco.Notas_MarcarStatus(idN, st: Integer);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  status_ent = '+IntToStr(st);
  if (st > 0) then   sq := sq + ',  status_edi = 1';
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_MarcaGrupo(idNF, CTgrupo: Integer);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  Ctegrupo = '+IntToStr(CTgrupo);
  sq := sq + ' WHERE id = '+IntToStr(idNF) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_MarcaPendencia(idNF, pende: integer);
begin
  // Pende =
  // 0 - normal; 1=Solucionada pode entregar;
  // 2=Pendencia, aguardar; 3=Não solucionada Devolução
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  Pende = '+IntToStr(pende);
  sq := sq + ' WHERE id = '+IntToStr(idNF) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_MarcarBaixa(idN, idUser, tipo: Integer);
begin
  // idUser = 0 (sem) /
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  Baixa_Orig = '+IntToStr(tipo);
  sq := sq + ', Baixa_Func = '+IntToStr(idUser);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_MarcarBaixa2(idN, tipo: Integer);
begin
  // idUser = 0 (sem) /
  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  Baixa_Orig = '+IntToStr(tipo);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Notas_TipoLocal(idN, tLocal: Integer);
begin
  sq := 'update TB_NOTAF SET  tipolocal = '+intToStr(tLocal)+' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.Notas_TipoLocal_Calc(idN : Integer);

var tl, ncep : integer;
    scep : String;
begin
  Notas_MostraId(idN);
  scep := DM1.cdsNotasCEP.Value;
  tl := 0;
  if (Length(scep) > 4) then
  begin
    scep := copy(scep, 1, 5);
    ncep := StrToInt(scep);
    if (ncep >= 11000) then tl := 2;
    if (ncep >= 7000) and  (ncep < 11000) then tl := 1;
  end;


  sq := 'update TB_NOTAF SET  tipolocal = '+IntToStr(tl)+' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;


procedure TBco.Notas_TodasDia(dt: TdateTime; idCli: Integer);
begin
  sq := ' select a.NUMNF, a.VALOR, a.nRoma as Romaneio, c.NOME, a.DTocoren, a.ID as idNF, ';
  sq := sq + ' case origem when 1 then '+QuotedSTr('manual')+' when 2 then '+QuotedSTr('Coleta')+' when 3 then '+QuotedSTr('Importada EDI')+' when 4 then '+QuotedSTr('Reentrega')+' when 5 then ' +QuotedSTr('Importada XML')+' when 6 then '+QuotedSTr('Importada Excel')+'  ELSE '+QuotedSTr('Outras Entradas')+' end as origem2 ';
  sq := sq + ' from TB_NOTAF a, TB_CLIENTE c ';
  sq := sq + ' Where a.LIGCLI=c.id ';
  sq := sq + ' and a.dtCria>='+ QuotedStr(BD_dia(dt, 3)+' 00:00')+ ' and a.dtCria<='+ QuotedStr(BD_dia(dt, 3)+ ' 23:59') + ' ';
  if idCli>0 then sq := sq + ' and a.LigCli = ' + idCli.ToString;
  sq := sq + ' order by a.nRoma, a.numnf ';
  DM2.Roda_SQL(DM5.sdsNFdia, DM5.cdsNFdia, sq);
end;

{
  ROMANEIO
  ======================================================
  08.08.2011 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.Romaneio_Altera(idR, LigMot, ligAjud, ligReg, ligVeic: Integer; dtR : TDateTime; tCarro, ligCarF:Integer);
begin
  sq := 'Update TB_ROMA SET ';
  sq := sq + '  LigMot  = '+IntToStr(LigMot);
  sq := sq + ', LigAjud = '+IntToStr(LigAjud);
  sq := sq + ', LigReg  = '+IntToStr(LigReg);
  sq := sq + ', LigVeic = '+IntToStr(LigVeic);
  sq := sq + ', dtRoma  = '+QuotedStr(BD_dia(dtR,3));
  sq := sq + ', tipo_Carro  = '+IntToStr(tCarro);
  sq := sq + ', LigCarF  = '+IntToStr(ligCarF);
  sq := sq + '  WHERE num = '+IntToStr(idR) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Romaneio_AnoNovo;

var s : String;
    ultDT : TDATETime;

begin
   { DONE -oMarco -cMedio : Fazer a virada de Ano automática }
      if (MonthOf(Now) = 12) then s := IntToStr(YearOf(now)+1);
      if (MonthOf(Now) = 1) then s := IntToStr(YearOf(now));
      s := s + '000000';

      sq := 'SELECT First 2 dtroma from TB_ROMA order by dtroma desc ';
      DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

      DM2.cdsTMP.First;
      ultDT := DM2.cdsTMP.Fields[0].AsDateTime;

      if (YearOf(now) > YearOf(ultDT)) then
      begin
        sq := 'SET GENERATOR GEN_ROMA_NUM TO ' + s;
        DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Zerar')
      end;
end;

//
// Romaneio_Doc
// Método para agrupar e contar o campo docDest onde é inserido o tipo de entrega
// Criado em 15.junho.2023 para entregas daa Oceano
//
procedure TBco.Romaneio_Doc(numR, ligCli: Integer);
begin
    sq := ' select docDest, count(*) as qt from Tb_Notaf where nRoma = '+IntToStr(numR)+' and ligcli='+IntToStr(ligCli)+ ' Group by docDest ';
    DM2.Roda_SQL(DM1.sdsRomaDoc, DM1.cdsRomaDoc, sq);
end;

procedure TBco.Romaneio_Insere;
begin
  sq := 'insert into TB_ROMA (dtRoma, extranum, ligCarF, vCombina, fCombina, conferidopor, confere) VALUES ';
  sq := sq + ' ('+QuotedStr(BD_dia(Now, 4))+ ',0,0,0,0,0,0 )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.Romaneio_InsereNota(idN, num: integer);
begin

  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  nRoma = '+IntToStr(num)+ ', status_web = 0 ' ;
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

function TBco.Romaneio_RecuperaID(): Integer;

var idR : integer;

begin
    sq := 'select First 3 * from TB_ROMA Order By id DESC';
    DM2.Roda_SQL(DM1.sdsRoma, DM1.cdsRoma, sq);
    DM1.cdsRoma.First;
    idR := DM1.cdsRomaID.value;
    Romaneio_RecuperaId := idR;

end;

procedure TBco.Romaneio_MostraNum(num: Integer);
begin
    sq := 'select * from TB_ROMA Where num = '+IntToStr(num);
    DM2.Roda_SQL(DM1.sdsRoma, DM1.cdsRoma, sq);
end;
procedure TBco.Romaneio_MostraMot(numR: Integer);
begin
    sq := 'select dtRoma, ligmot from TB_ROMA  ';
    sq := sq + ' WHERE num = '+IntToStr(numR);
    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

end;

procedure TBco.Romaneio_MostraNotas(num : Integer);
begin
    sq := 'select TB_NOTAF.ID, NUMNF, VALOR, VOLUME, NCONH, CEP, LOCALI, NROMA, ';
    sq := sq + ' NOME, PESO, STATUS_ENT, nOcorr, Origem, nomedest, Fonedest, docdest, ';
    sq := sq + ' TB_CLIENTE.id  as idCli, status_web, ';
    sq := sq + ' case prioridade when 1 then '+QuotedStr('PRIORID')+' when 2 then '+QuotedStr('H O J E')+' else '+QuotedStr('  -    ')+' END as Priorid, contareent, prioridade ';
    sq := sq + ' from TB_NOTAF, TB_CLIENTE ';
    sq := sq + ' where TB_NOTAF.LigCli = TB_CLIENTE.id and nRoma = '+IntToStr(num) + ' Order by contareent desc, NUMNF ';
    DM2.Roda_SQL(DM1.sdsRomaNF, DM1.cdsRomaNF, sq);
end;

procedure TBco.Romaneio_MostraNotasRec(num : Integer);
begin
    sq := 'select TB_NOTAF.ID, NUMNF, NROMA, NOME, nomedest, ligcli, fonedest, Peso ';
    sq := sq + ' from TB_NOTAF, TB_CLIENTE ';
    sq := sq + ' where TB_NOTAF.LigCli = TB_CLIENTE.id ';
    sq := sq + ' and nRoma = '+IntToStr(num);
    DM2.Roda_SQL(DM1.sdsRecb, DM1.cdsRecb, sq);
end;

procedure TBco.Romaneio_MostraNotasRecFiltro(num : Integer);
begin
    sq := 'select TB_NOTAF.ID, NUMNF, NROMA, NOME, nomedest, ligcli, fonedest, Peso ';
    sq := sq + ' from TB_NOTAF, TB_CLIENTE ';
    sq := sq + ' where TB_NOTAF.LigCli = TB_CLIENTE.id ';
    sq := sq + ' and nRoma = '+IntToStr(num);
    sq := sq + ' and ImpRec = 1 ';
    DM2.Roda_SQL(DM1.sdsRecb, DM1.cdsRecb, sq);
end;

procedure TBco.Romaneio_NotasSEM(pag : Integer);

var n : Integer;

begin
{
  n := (pag - 1) * 18;
  sq := 'select FIRST 18 SKIP '+IntToStr(n)+' TB_NotaF.ID, NUMNF, Nome, Valor, Locali, dtNota ';
  sq := sq + ' from TB_Notaf, TB_CLIENTE';
  sq := sq + ' WHERE TB_CLIENTE.id = TB_NOTAF.LIGCLI and nRoma = 0';
  sq := sq + ' and (select TB_NOTAF_OBS.id from TB_NOTAF_OBS where TB_NOTAF_OBS.LIGNF =TB_NOTAF.id) is null';
  sq := sq + ' ORDER BY dtNota Desc';
  DM2.Roda_SQL(DM1.sdsSEM, DM1.cdsSEM, sq);
  }
  sq := 'select TB_NotaF.ID, NUMNF, Nome, Valor, Locali, dtNota, CEP, TB_NOTAF.LIGCLI ';
  sq := sq + ' from TB_CLIENTE,';
  sq := sq + ' TB_Notaf left join TB_NOTAF_OBS on TB_NOTAF_OBS.LIGNF =TB_NOTAF.id ';
  sq := sq + ' WHERE TB_CLIENTE.id = TB_NOTAF.LIGCLI ';
  sq := sq + ' and nRoma = 0  and TB_NOTAF_OBS.LIGNF is null ';
  sq := sq + retirarPendencias;
  sq := sq + ' ORDER BY dtNota Desc';
  DM2.Roda_SQL(DM1.sdsSEM, DM1.cdsSEM, sq);

end;

procedure TBco.Romaneio_NotasR(dtR: TDateTime; idC : Integer);
begin
  sq := 'select TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, dtEnt, ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then '+QuotedSTr('Ok')+'  when 2 then TB_NOTAF.Obs else '+QuotedStr('')+' END as Entregue, ';
  //sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then hrENT ELse '+QuotedSTr('-')+' END as Hora, ';
  sq := sq + ' substring(CAST(hrENT as VARCHAR(15)) from 1 for 5) as Hora, ';
  sq := sq + ' numnf, valor, volume, peso, Nome,  tb_notaf.NCONH , Minuta, vFrete, tipolocal,';
  sq := sq + ' case tipolocal when 0 then '+QuotedSTr('SP')+' when 1 then '+QuotedSTr('GSP')+' when 2 then '+QuotedSTr('INT')+' ELSE '+QuotedSTr('-')+' end as Local, ';
  sq := sq + ' nRoma, tipo_cob, TB_NOTAF.ligCli,';
  sq := sq + ' Cub_Volume, Ponto, Servico,';
  sq := sq + ' case tipo_cob when 1 then '+QuotedSTr('Peso')+' when 2 then '+QuotedSTr('Taxa')+' when 3 then '+QuotedSTr('Entrega')+' when 4 then '+QuotedSTr('Saída')+' when 5 then '+QuotedSTr('Contrato')+' ELSE '+QuotedSTr('sem Serv')+' end as Servico2 ';
  sq := sq + ' , Recebedor, CEP, ';
  sq := sq + ' case origem when 2 then '+QuotedStr('Coleta')+'  ELSE '+QuotedStr('Nota Fiscal')+' end as DOC, ';
  sq := sq + ' case TB_OCORRE.USO when 1 then '+QuotedStr('Normal')+' when 2 then '+QuotedStr('Reentrega')+ ' when 3 then '+QuotedStr('Devolução')+' ELSE '+QuotedStr('não feita')+' end as Ocorrencia ';
  sq := sq + ' , NCHAM, TB_NOTAF.id as idNF, dtCria , NomeDest, DOCDest, SerieNF, NumPed, dtNota, Locali ';

  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_FUNCS, TB_CLICOB, TB_OCORRE ';

  sq := sq + ' where TB_NOTAF.NROMA = TB_ROMA.NUM and ';
  sq := sq + ' TB_ROMA.LIGMOT = TB_FUNCS.id and ';
  sq := sq + ' TB_NOTAF.EXTRANUM = TB_CLICOB.ID and ';
  sq := sq + ' TB_NOTAF.NOCORR = TB_OCORRE.NUM and ';
  sq := sq + ' dtRoma = '+ QuotedStr(BD_dia(dtR,3));
  if (idC > 0) then sq := sq + ' and TB_NOTAF.LigCli = '+ IntToStr(idC);

  DM2.Roda_SQL(DM1.sdsRomaR, DM1.cdsRomaR, sq);

end;

procedure TBco.Romaneio_NotasRel(dtR: TDateTime);
begin
  sq := 'select TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, dtEnt, ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then '+QuotedSTr('Ok')+'  when 2 then TB_NOTAF.Obs else '+QuotedStr('')+' END as Entregue, ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then hrENT ELse '+QuotedSTr('-')+' END as Hora, ';
  sq := sq + ' numnf, valor, volume, peso, Nome,  tb_notaf.NCONH , Minuta, vFrete, tipolocal,';
  sq := sq + ' case tipolocal when 0 then '+QuotedSTr('SP')+' when 1 then '+QuotedSTr('GSP')+' when 2 then '+QuotedSTr('INT')+' ELSE '+QuotedSTr('-')+' end as Local, ';
  sq := sq + ' nRoma, tipo_cob, TB_NOTAF.ligCli,';
  sq := sq + ' Cub_Volume, Ponto, Servico,';
  sq := sq + ' case tipo_cob when 1 then '+QuotedSTr('Peso')+' when 2 then '+QuotedSTr('Taxa')+' when 3 then '+QuotedSTr('Entrega')+' when 4 then '+QuotedSTr('Saída')+' when 5 then '+QuotedSTr('Contrato')+' ELSE '+QuotedSTr('sem Serv')+' end as Servico2 ';
  sq := sq + ' , Recebedor, CEP, ';
  sq := sq + ' case origem when 2 then '+QuotedStr('Coleta')+'  ELSE '+QuotedStr('Nota Fiscal')+' end as DOC, ';
  sq := sq + ' case TB_OCORRE.USO when 1 then '+QuotedStr('Normal')+' when 2 then '+QuotedStr('Reentrega')+ ' when 3 then '+QuotedStr('Devolução')+' ELSE '+QuotedStr('não feita')+' end as Ocorrencia ';
  sq := sq + ' , NCHAM, TB_NOTAF.id as idNF, dtCria, NomeDest, DOCDest, SerieNF, NumPed, dtNota, Locali ';

  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_FUNCS, TB_RELAT, TB_CLICOB, TB_OCORRE ';

  sq := sq + ' where TB_NOTAF.NROMA = TB_ROMA.NUM and ';
  sq := sq + ' TB_ROMA.LIGMOT = TB_FUNCS.id and ';
  sq := sq + ' TB_NOTAF.ligrel = TB_RELAT.ID and ';
  sq := sq + ' TB_NOTAF.EXTRANUM = TB_CLICOB.ID and ';
  sq := sq + ' TB_NOTAF.NOCORR = TB_OCORRE.NUM and ';
  sq := sq + ' CAST(DTEMISSAO as DATE) = '+ QuotedStr(BD_dia(dtR,3));

  sq := sq + ' Order by  Tipo_Cob, nRoma, numnf';

  DM2.Roda_SQL(DM1.sdsRomaR, DM1.cdsRomaR, sq);

end;

procedure TBco.Romaneio_NotasRel2(idCob : Integer);
begin
  sq := 'select TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, dtEnt, ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then '+QuotedSTr('Ok')+'  when 2 then TB_NOTAF.Obs else '+QuotedStr('')+' END as Entregue, ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then hrENT ELse '+QuotedSTr('-')+' END as Hora, ';
  sq := sq + ' numnf, valor, volume, peso, Nome,  tb_notaf.NCONH , Minuta, vFrete, tipolocal,';
  sq := sq + ' case tipolocal when 0 then '+QuotedSTr('SP')+' when 1 then '+QuotedSTr('GSP')+' when 2 then '+QuotedSTr('INT')+' ELSE '+QuotedSTr('-')+' end as Local, ';
  sq := sq + ' nRoma, tipo_cob, TB_NOTAF.ligCli,';
  sq := sq + ' Cub_Volume, Ponto, Servico,';
  sq := sq + ' case tipo_cob when 1 then '+QuotedSTr('Peso')+' when 2 then '+QuotedSTr('Taxa')+' when 3 then '+QuotedSTr('Entrega')+' when 4 then '+QuotedSTr('Saída')+' when 5 then '+QuotedSTr('Contrato')+' ELSE '+QuotedSTr('sem Serv')+' end as Servico2 ';
  sq := sq + ' , Recebedor, CEP, ';
  sq := sq + ' case origem when 2 then '+QuotedStr('Coleta')+'  ELSE '+QuotedStr('Nota Fiscal')+' end as DOC, ';
  sq := sq + ' case TB_OCORRE.USO when 1 then '+QuotedStr('Normal')+' when 2 then '+QuotedStr('Reentrega')+ ' when 3 then '+QuotedStr('Devolução')+' ELSE '+QuotedStr('não feita')+' end as Ocorrencia ';
  sq := sq + ' , NCHAM, TB_NOTAF.id as idNF, dtCria, NomeDest, DOCDest, SerieNF, NumPed, dtNota, Locali ';

  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_FUNCS, TB_RELAT, TB_CLICOB, TB_OCORRE ';

  sq := sq + ' where TB_NOTAF.NROMA = TB_ROMA.NUM and ';
  sq := sq + ' TB_ROMA.LIGMOT = TB_FUNCS.id and ';
  sq := sq + ' TB_NOTAF.ligrel = TB_RELAT.ID and ';
  sq := sq + ' TB_NOTAF.EXTRANUM = TB_CLICOB.ID and ';
  sq := sq + ' TB_NOTAF.NOCORR = TB_OCORRE.NUM and ';
  sq := sq + ' TB_RELAT.nCOB = '+ IntToStr(idCob);

  sq := sq + ' Order by  Tipo_Cob, nRoma, numnf';

  DM2.Roda_SQL(DM1.sdsRomaR, DM1.cdsRomaR, sq);

end;

{
  WS_NOTAS
  ======================================================
  08.08.2011 - 7 métodos
  ------------------------------------------------------
}

procedure TBco.WS_Notas_Mostra(dt: TDateTime);
begin
    sq := ' SELECT tb_notaf.id as IDN, DTROMA, num -extract(YEAR from dtRoma)* 1000000 as ROMANEIO , NUMNF, VALOR, STATUS_ENT, STATUS_WEB, LIGCLI, LIGMOT, DOCDEST, NUMPED, ';
    sq := sq + ' CASE status_web ';
    sq := sq + ' when 0 then ' + QuotedStr('Não enviado') ;
    sq := sq + ' when 1 then ' + QuotedStr('sem Cliente') ;
    sq := sq + ' when 2 then ' + QuotedStr('Cliente não existe na WEB') ;
    sq := sq + ' when 3 then ' + QuotedStr('Sem Nota') ;
    sq := sq + ' when 4 then ' + QuotedStr('Sem Romaneio') ;
    sq := sq + ' when 5 then ' + QuotedStr('ERRO') ;
    sq := sq + ' when 6 then ' + QuotedStr('Enviado') ;
    sq := sq + ' when 7 then ' + QuotedStr('sem Permissão') ;
    sq := sq + ' end as MSG';
    sq := sq + ' from tb_notaf, tb_roma';
    sq := sq + ' WHERE nRoma = num';
    sq := sq + ' and dtRoma = '+QuotedStr(BD_dia(dt, 3));
    sq := sq + ' order by num ';
    DM2.Roda_SQL(DM3.vsWeb, DM3.vcWeb, sq);
end;

procedure TBco.WS_MarcaResp(idN, r: Integer);
begin
  sq := 'Update TB_NOTAF SET  status_web = '+intToStr(r)+' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Marcar');
end;

procedure TBco.WS_MarcaRespRomaneio(numRoma, st: Integer);
begin
  sq := 'Update TB_NOTAF SET  status_web = '+intToStr(st)+' WHERE nRoma  ='+numRoma.ToString + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Marcar');
end;

procedure TBco.WS_MarcaRespDia(dia:TDateTime; st: Integer);
begin
  DM5.cdsRestR.First;
  while not DM5.cdsRestR.Eof do
  begin
    WS_MarcaRespRomaneio(DM5.cdsRestRNUM.Value, st);
    DM5.cdsRestR.Next;
  end;
end;

procedure TBco.WS_MarcaRespVarias(r: Integer; ids: string);
begin
  sq := 'Update TB_NOTAF SET  status_web = '+intToStr(r)+' WHERE id in ('+ids + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Marcar');
end;

{
  OCORRENCIAS
  ======================================================
  08.08.2011 - 7 métodos
  ------------------------------------------------------
}
procedure TBco.Ocorre_Altera(id, num: integer; Descr: String;
  uso, pend, sms, sac, gcte: integer);
begin
  sq := 'Update TB_OCORRE SET ';
  sq := sq + '   num = '+IntToStr(num);
  sq := sq + ',  Descr = '+QuotedStr(Descr);
  sq := sq + ',  uso = '+intToStr(uso);
  sq := sq + ',  autoPende = '+intToStr(pend);
  sq := sq + ',  autoSMS = '+intToStr(sms);
  sq := sq + ',  autoSAC = '+intToStr(sac);
  sq := sq + ',  GeraCTE = '+intToStr(gcte);
  sq := sq + ' WHERE id = '+IntToStr(id) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Ocorre_Apaga(id: integer);
begin
  sq := 'Delete from TB_OCORRE ';
  sq := sq + ' WHERE id = '+IntToStr(id) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;
procedure TBco.Ocorre_Cliente_Altera(idG, tipo, pad, novo: Integer);
begin
  // tipo=1 Proceda // tipo=2 Interno
  sq := 'Update TB_CLIOC SET ';
  sq := sq + '   codnovo = '+IntToStr(novo);
  sq := sq + ' WHERE LigGrupo = '+IntToStr(idG) + ' and  tipo = '+IntToStr(tipo) + ' and codpad = '+IntToStr(pad) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Ocorre_Cliente_Apaga(idG, tipo, pad: Integer);
begin
  // tipo=1 Proceda // tipo=2 Interno
  sq := 'delete from TB_CLIOC ';
  sq := sq + ' WHERE LigGrupo = '+IntToStr(idG) + ' and tipo = '+IntToStr(tipo) + ' and codpad = '+IntToStr(pad) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Ocorre_Cliente_Insere(idG, tipo, pad, novo: Integer);
begin
  // tipo=1 Proceda // tipo=2 Interno
  sq := 'Insert Into TB_CLIOC (liggrupo, tipo, codpad, codnovo) VALUES ( ';
  sq := sq + '   '+IntToStr(idG);
  sq := sq + ',  '+IntToStr(tipo);
  sq := sq + ',  '+IntToStr(pad);
  sq := sq + ',  '+IntToStr(novo);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Ocorre_Cliente_Mostra(idG: Integer);
begin
  // tipo=1 Proceda // tipo=2 Interno
  sq := 'select * FROM TB_CLIOC ';
  sq := sq + ' Where liggrupo = '+IntToStr(idG);
  DM2.Roda_SQL(DM5.sdsOCcli, DM5.cdsOCcli, sq);
end;

function TBco.Ocorre_fPesq(nOc: Integer): String;
  var resp : String;
begin
  resp := 'x';
  DM1.cdsOc.First;
  DM1.cdsOc.Filtered := false;
  DM1.cdsOc.Filter := 'num ='+nOc.ToString;
  DM1.cdsOc.Filtered := true;

  resp :=   DM1.cdsOcDESCR.Value;

  result := resp;


end;

procedure TBco.Ocorre_Insere(num: integer; Descr: String; uso, pend, sms, sac, gcte: integer);
begin
  sq := 'insert into TB_OCORRE (num, Descr, uso, autopende, autosms, autosac, geracte) VALUES ';
  sq := sq + ' ('+IntToStr(num)+', '+QuotedStr(Descr)+', '+IntToStr(uso)+', '+IntToStr(pend)+', '+IntToStr(sms)+', '+IntToStr(sac)+', '+IntToStr(gcte)+ ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
end;

procedure TBco.Ocorre_MostraId(id: integer);
begin
  sq := 'select TB_OCORRE.*, ';
  sq := sq + ' case autopende when 1 then '+QuotedStr('Pendência')+' else '+QuotedStr('-')+' end as ap, ';
  sq := sq + ' case autosms when 1 then '+QuotedStr('SMS')+ ' else '+QuotedStr('-')+' end as asms, ';
  sq := sq + ' case autosac when 1 then '+QuotedStr('SAC')+ ' else '+QuotedStr('-')+' end as asac, ';
  sq := sq + ' case geracte when 1 then '+QuotedStr('sim')+ ' else '+QuotedStr('NÃO PODE')+' end as gcte ';
  sq := sq + ' from  TB_OCORRE Where id = '+IntToStr(id);
  DM2.Roda_SQL(DM1.sdsOc, DM1.cdsOc, sq);
end;

procedure TBco.Ocorre_Mostra;
begin
  sq := 'select TB_OCORRE.*, ';
  sq := sq + ' case autopende when 1 then '+QuotedStr('Pendência')+' else '+QuotedStr('-')+' end as ap, ';
  sq := sq + ' case autosms when 1 then '+QuotedStr('SMS')+ ' else '+QuotedStr('-')+' end as asms, ';
  sq := sq + ' case autosac when 1 then '+QuotedStr('SAC')+ ' else '+QuotedStr('-')+' end as asac, ';
  sq := sq + ' case geracte when 1 then '+QuotedStr('sim')+ ' else '+QuotedStr('NÃO PODE')+' end as gcte ';
  sq := sq + ' from  TB_OCORRE  ';
  DM2.Roda_SQL(DM1.sdsOc, DM1.cdsOc, sq);
end;

{
  REGIAO
  ======================================================
  08.08.2011 - 7 métodos
  ------------------------------------------------------
}
procedure TBco.Rastreio_Mostra;
begin
  sq := 'select * from TB_INTERNO order by CODINT';
  DM2.Roda_SQL(DM5.sdsCODi, DM5.cdsCODi, sq);
end;

procedure TBco.Regiao_Altera(id: integer; Descr: String; cl: Smallint);
begin
  sq := 'Update TB_REGIAO SET ';
  sq := sq + '  Descr = '+QuotedStr(Descr);
  sq := sq + ',  Class = '+intToStr(cl);
  sq := sq + ' WHERE id = '+IntToStr(id) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Regiao_Apaga(id: integer);
begin
  sq := 'Delete from TB_REGIAO ';
  sq := sq + ' WHERE id = '+IntToStr(id) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
end;

procedure TBco.Regiao_Insere(Descr: String; cl: Smallint);
begin
  sq := 'insert into TB_REGIAO (Descr, Class) VALUES ';
  sq := sq + ' ('+QuotedStr(Descr)+', '+IntToStr(cl)+ ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
end;

procedure TBco.Regiao_MostraClass(cl: smallint);
begin

end;

procedure TBco.Regiao_MostraId(id: integer);
begin
    sq := 'select id, Descr, class, CASE class WHEN 1 THEN '+QuotedStr('Capital')+' WHEN 2 THEN '+QuotedStr('GSP')+' WHEN 3 THEN '+QuotedStr('Interior')+' WHEN 4 THEN '+QuotedStr('Interior 2')+' WHEN 5 THEN '+QuotedStr('Out Estados')+' WHEN 6 THEN '+QuotedStr('Outros')+' END as Local from TB_REGIAO Where id = '+IntToStr(id);
    DM2.Roda_SQL(DM1.sdsReg, DM1.cdsReg, sq);
end;

procedure TBco.Regiao_Mostra;
begin
    sq := 'select id, Descr, class, CASE class WHEN 1 THEN '+QuotedStr('Capital')+' WHEN 2 THEN '+QuotedStr('GSP')+' WHEN 3 THEN '+QuotedStr('Interior')+' WHEN 4 THEN '+QuotedStr('Interior 2')+' WHEN 5 THEN '+QuotedStr('Out Estados')+' WHEN 6 THEN '+QuotedStr('Outros')+' END as Local from TB_REGIAO ' ;
    DM2.Roda_SQL(DM1.sdsReg, DM1.cdsReg, sq);
end;

procedure TBco.Regiao_Pesquisa(descr: String);
begin
    sq := 'select id, Descr, class, CASE class WHEN 1 THEN '+QuotedStr('Capital')+' WHEN 2 THEN '+QuotedStr('GSP')+' WHEN 3 THEN '+QuotedStr('Interior')+' WHEN 4 THEN '+QuotedStr('Interior 2')+' WHEN 5 THEN '+QuotedStr('Out Estados')+' WHEN 6 THEN '+QuotedStr('Outros')+' END as Local from TB_REGIAO WHERE UPPER(descr) like '+QuotedStr(UpperCase(Descr)+'%') ;
    DM2.Roda_SQL(DM1.sdsReg, DM1.cdsReg, sq);
end;


procedure TBco.WS_Notas_Atualiza(numNF, numR, idCli, status,
  nMotivo: String; datae, horae: String);

  var idNF, numMot : integer;
       Rast : TRastreio;

begin
  Ocorre_PesqNum(StrToInt(nMotivo));

  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  status_ent = '+status;
//  sq := sq + ', status_web = 1';
  sq := sq + ', status_edi = 1';
  sq := sq + ', nOcorr = '+nMotivo;
  sq := sq + ', dtEnt = '+QuotedStr(datae);
  sq := sq + ', hrEnt = '+QuotedStr(horae);
  sq := sq + ', Obs = '+QuotedStr(Dm1.cdsOcDESCR.Value);
  sq := sq + ', Baixa_Orig = 2 ';
  sq := sq + ', Baixa_Func = 0 ';
  sq := sq + ', dtBaixa = '+QuotedStr(BD_dia(Now,3));

  sq := sq + ' WHERE numNF = '+numNF;
  sq := sq + ' and nRoma = '+numR;
  sq := sq + ' and LigCli = '+idCli;

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

  if (DM1.cdsOcAUTOPENDE.Value = 1) then
  begin
    numMot := DM1.cdsOcNUM.Value;

    sq := 'Select id, PENDE from TB_NOTAF ';
    sq := sq + ' WHERE numNF = '+numNF;
    sq := sq + ' and nRoma   = '+numR;
    sq := sq + ' and LigCli  = '+idCli;
    sq := sq + ' Order by id ';

    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );
    DM2.cdsTMP.Last;

    if (DM2.cdsTMP.RecordCount>0)  then
    begin
      if (DM2.cdsTMP.Fields[1].Value < 2)  then
      begin
        idNF := DM2.cdsTMP.Fields[0].Value;
        Notas_Reentrega(idNF);
        idNF := Notas_RecuperaId(StrToInt(numNF));
        Notas_MarcaPendencia(idNF, 2);
        Notas_AlteraObs(idNF, 'Pendência Automática');

        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.set_ocor( StrToInt(numNF) , StrToInt(idCli), 0, evrPendeAguarde );
        Rast.Destroy;
      end;
    end;


  end;

end;

procedure TBco.WS_Notas_Atualiza2(idNF, status,
  nMotivo: String; datae, horae: String);

  var  numMot : integer;
       Rast : TRastreio;

begin
  Ocorre_PesqNum(StrToInt(nMotivo));

  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  status_ent = '+status;
//  sq := sq + ', status_web = 1';
  sq := sq + ', status_edi = 1';
  sq := sq + ', nOcorr = '+nMotivo;
  sq := sq + ', dtEnt = '+QuotedStr(datae);
  sq := sq + ', hrEnt = '+QuotedStr(horae);
  sq := sq + ', Obs = '+QuotedStr(Dm1.cdsOcDESCR.Value);
  sq := sq + ', Baixa_Orig = 2 ';
  sq := sq + ', Baixa_Func = 0 ';
  sq := sq + ', dtBaixa = '+QuotedStr(BD_dia(Now,3));

  sq := sq + ' WHERE idNF = '+idNF;

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

  {
  if (DM1.cdsOcAUTOPENDE.Value = 1) then
  begin
    numMot := DM1.cdsOcNUM.Value;

    sq := 'Select id, PENDE from TB_NOTAF ';
    sq := sq + ' WHERE numNF = '+numNF;
    sq := sq + ' and nRoma   = '+numR;
    sq := sq + ' and LigCli  = '+idCli;
    sq := sq + ' Order by id ';

    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );
    DM2.cdsTMP.Last;

    if (DM2.cdsTMP.RecordCount>0)  then
    begin
      if (DM2.cdsTMP.Fields[1].Value < 2)  then
      begin
        idNF := DM2.cdsTMP.Fields[0].Value;
        Notas_Reentrega(idNF);
        idNF := Notas_RecuperaId(StrToInt(numNF));
        Notas_MarcaPendencia(idNF, 2);
        Notas_AlteraObs(idNF, 'Pendência Automática');

        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.set_ocor( StrToInt(numNF) , StrToInt(idCli), 0, evrPendeAguarde );
        Rast.Destroy;
      end;
    end;


  end;
   }
end;



procedure TBco.Controle_Altera_StatusENT(numR, st : Integer);
begin
  sq := 'UPDATE TB_ROMA SET Status_DEV = '+IntToStr(st)+' WHERE num = '+ IntToStr(numR) ;
  DM2.Executa_SQL(Dm1.Conexao, Dm2.sdsTMP,sq , 'Altera Roma');
end;

procedure TBco.Controle_Altera_StatusTkt(numNF, numR,st : Integer);
begin

  sq := 'UPDATE TB_NOTAF SET Status_TKT = '+IntToStr(st)+' WHERE STATUS_ENT > 0 and numNF = '+ IntToStr(numNF)+ ' and nRoma = '+ IntToStr(numR) ;
  DM2.Executa_SQL(Dm1.Conexao, Dm2.sdsTMP,sq , 'Altera NotaF');

  // se Tkt então altere a data do ticket
  if (st = 1) then
  begin
    sq := 'UPDATE TB_NOTAF SET dtTKT = '+QuotedStr(BD_dia(Now,3))+' WHERE STATUS_ENT > 0 and numNF = '+ IntToStr(numNF)+ ' and nRoma = '+ IntToStr(numR) ;
    DM2.Executa_SQL(Dm1.Conexao, Dm2.sdsTMP,sq , 'Altera NotaF');
  end;

end;

procedure TBco.Controle_Mostra_Restante;
begin
  sq := 'Select * from VIEW_Control3' ;
  DM2.Roda_SQL(DM3.vsC3, DM3.vcC3, sq);
end;

procedure TBco.Controle_Mostra_Romaneios(dt : TDateTime);
begin
  sq := 'Select * from VIEW_Control1 where dtRoma = '+ QuotedStr(BD_dia(dt, 3)) ;
  DM2.Roda_SQL(DM3.vsC1, DM3.vcC1, sq);
end;

procedure TBco.Controle_Mostra_Ticket(no : Integer);
begin
  sq := 'Select * from VIEW_Control2 where "nroma" = '+ IntToStr(no) ;
  DM2.Roda_SQL(DM3.vsC2, DM3.vcC2, sq);
end;

procedure TBco.Ocorre_PesqInicio(inic: String);
begin
  sq := 'select TB_OCORRE.*, ';
  sq := sq + ' case autopende when 1 then '+QuotedStr('Pendência')+' else '+QuotedStr('-')+' end as ap, ';
  sq := sq + ' case autosms when 1 then '+QuotedStr('SMS')+ ' else '+QuotedStr('-')+' end as asms, ';
  sq := sq + ' case autosac when 1 then '+QuotedStr('SAC')+ ' else '+QuotedStr('-')+' end as asac, ';
  sq := sq + ' case geracte when 1 then '+QuotedStr('sim')+ ' else '+QuotedStr('NÃO PODE')+' end as gcte ';
  sq := sq + ' from  TB_OCORRE Where UPPER(DESCR) LIKE  '+QuotedStr(UpperCase(inic)+'%');
  DM2.Roda_SQL(DM1.sdsOc, DM1.cdsOc, sq);
end;

procedure TBco.Ocorre_PesqNum(no: integer);
begin
  sq := 'select TB_OCORRE.*, ';
  sq := sq + ' case autopende when 1 then '+QuotedStr('Pendência')+' else '+QuotedStr('-')+' end as ap, ';
  sq := sq + ' case autosms when 1 then '+QuotedStr('SMS')+ ' else '+QuotedStr('-')+' end as asms, ';
  sq := sq + ' case autosac when 1 then '+QuotedStr('SAC')+ ' else '+QuotedStr('-')+' end as asac, ';
  sq := sq + ' case geracte when 1 then '+QuotedStr('sim')+ ' else '+QuotedStr('NÃO PODE')+' end as gcte ';
  sq := sq + ' from  TB_OCORRE Where num = '+IntToStr(no);
  DM2.Roda_SQL(DM1.sdsOc, DM1.cdsOc, sq);
end;

function TBco.Ocorre_uso(nUso: Integer): String;
  var s : String;
begin
  sq := 'select num from tb_ocorre where uso = '+IntToStr(nUso);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  s := '';
  while not DM2.cdsTMP.Eof do
  begin
    if (s = '') then  s :=  DM2.cdsTMP.Fields[0].AsString
      else s :=  s + ',' + DM2.cdsTMP.Fields[0].AsString;
    DM2.cdsTMP.Next;
  end;

  result := s;
end;

procedure TBco.set_numRoma(i: Integer);
begin
  numRoma := i;
end;

procedure TBco.sqlRoda(DataS: TSQLDataSet; ClientDS: TClientDataSet;
  SQL: String);
begin
try
  DataS.Active := False;
  DataS.CommandType := ctQuery;
  DataS.CommandText := SQL;
  DataS.Active := True;

  ClientDS.Active := False;
  ClientDS.Active := True;
except
    on Exc : Exception do
      begin
        //ShowMessage('Erro: CONSULTA '+#13+ sql+#13+#13+Exc.Message);
      end;
   end;
end;

procedure TBco.Notas_Geral(idN: Integer);
begin
  sq := 'select * from VIEW_NotasGE Where "idNF" = '+IntToStr(idN);
  DM2.Roda_SQL(DM3.vsNFg, DM3.vcNFg, sq);
end;

procedure TBco.Notas_Alterar_Motivo(idN, nOcorr: Integer);
begin
  Ocorre_PesqNum(nOcorr);

  sq := 'Update TB_NOTAF SET ';
  sq := sq + ' nOcorr = '+IntToStr(nOcorr);
  sq := sq + ',Obs = '+QuotedStr(DM1.cdsOcDESCR.Value);
  sq := sq + ' WHERE id = '+IntToStr(idN) + ' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Ocorrência');

end;

procedure TBco.Romaneio_MostraUlt;
begin
  sq := 'select First 3 num from TB_Roma ORDER BY Num DESC';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  DM2.cdsTMP.First;

  Romaneio_MostraNum(DM2.cdsTMP.Fields[0].Value);
  Romaneio_MostraNotas(DM2.cdsTMP.Fields[0].Value);

end;

procedure TBco.Controle_Mostra_Reent(dtR: TDateTime);
begin
  sq := 'select * from VIEW_Control4 Where "dtRoma" = '+QuotedStr(BD_dia(dtR, 3));
  DM2.Roda_SQL(DM3.vsC4, DM3.vcC4, sq);
end;

procedure TBco.Cliente_AlteraPadrao(id: integer; PadraoSP, PadraoGSP,
  PadraoINT, nSaida: Smallint);
begin
  sq := 'update TB_CLIENTE set ';
  sq := sq + '  PADRAO_SP  = '+ IntToStr(PadraoSP);
  sq := sq + ', PADRAO_GSP = '+ IntToStr(PadraoGSP);
  sq := sq + ', PADRAO_INT = '+ IntToStr(PadraoINT);
  sq := sq + ', SAIDANAO = '+ IntToStr(nSaida);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsCli, sq , 'Alterar');

end;

procedure TBco.Frete_CadAdic_Altera(idC: Integer; tipo, Local: Smallint; AdVal,
  AdValMin, Gris, GrisMin, GrisSup, DifTx, DifMin, DifMax, ICMSma, ICMSme, ICMSate,
  Ponto, Pedagio,FMin, Emissao, Devol, Reent, VRisco, VRiscoAD: Double);
begin
  sq := 'update TB_FRETE0 set ';
  sq := sq + ' ADVAL         = '+ Formata_Num(AdVal);
  sq := sq + ',ADVAL_MIN     = '+ Formata_Num(AdValMin);
  sq := sq + ',GRIS          = '+ Formata_Num(Gris);
  sq := sq + ',GRIS_MIN      = '+ Formata_Num(GrisMin);
  sq := sq + ',GRIS_SUP      = '+ Formata_Num(GrisSup);
  sq := sq + ',DIF_TAXA      = '+ Formata_Num(DifTx);
  sq := sq + ',DIF_MIN       = '+ Formata_Num(DifMin);
  sq := sq + ',DIF_MAX       = '+ Formata_Num(DifMax);
  sq := sq + ',ICMS_MAIOR    = '+ Formata_Num(ICMSma);
  sq := sq + ',ICMS_MENOR    = '+ Formata_Num(ICMSme);
  sq := sq + ',ICMS_LIMITE   = '+ Formata_Num(ICMSate);
  sq := sq + ',PONTO         = '+ Formata_Num(Ponto);
  sq := sq + ',PEDAGIO       = '+ Formata_Num(Pedagio);
  sq := sq + ',FRETE_MIN     = '+ Formata_Num(FMin);
  sq := sq + ',EMISSAO       = '+ Formata_Num(Emissao);
  sq := sq + ',DEVOLUCAO     = '+ Formata_Num(Devol);
  sq := sq + ',REENTREGA     = '+ Formata_Num(Reent);
  sq := sq + ',VRisco        = '+ Formata_Num(VRisco);
  sq := sq + ',VRiscoAD      = '+ Formata_Num(VRiscoAD);

  sq := sq + ' WHERE LIGCLI = '+IntToStr(idC)+ ' and tipo = '+IntToStr(tipo)+ ' and Local = '+IntToStr(Local);
  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFAd, sq , 'Alterar');

end;

procedure TBco.Frete_CadAdic_Insere(idC: Integer; tipo, Local: Smallint; AdVal,
  AdValMin, Gris, GrisMin, GrisSup, DifTx, DifMin, DifMax, ICMSma, ICMSme, ICMSate,
  Ponto, Pedagio,FMin, Emissao, Devol, Reent, VRisco, VRiscoAD: Double);
begin
  sq := 'INSERT INTO TB_FRETE0 (LIGCLI, TIPO, LOCAL, ADVAL, ADVAL_MIN, ';
  sq := sq + ' GRIS, GRIS_MIN, GRIS_SUP, DIF_TAXA, DIF_MIN, DIF_MAX,  ';
  sq := sq + ' ICMS_MAIOR, ICMS_MENOR, ICMS_LIMITE, PONTO,  PEDAGIO,';
  sq := sq + ' FRETE_MIN, EMISSAO, DEVOLUCAO, REENTREGA, VRISCO, VRISCOAD ) VALUES ( ';
  sq := sq + '  '+ IntToStr(idC);
  sq := sq + ', '+ IntToStr(tipo);
  sq := sq + ', '+ IntToStr(Local);
  sq := sq + ', '+ Formata_Num(AdVal);
  sq := sq + ', '+ Formata_Num(AdValMin);
  sq := sq + ', '+ Formata_Num(Gris);
  sq := sq + ', '+ Formata_Num(GrisMin);
  sq := sq + ', '+ Formata_Num(GrisSup);
  sq := sq + ', '+ Formata_Num(DifTx);
  sq := sq + ', '+ Formata_Num(DifMin);
  sq := sq + ', '+ Formata_Num(DifMax);
  sq := sq + ', '+ Formata_Num(ICMSma);
  sq := sq + ', '+ Formata_Num(ICMSme);
  sq := sq + ', '+ Formata_Num(ICMSate);
  sq := sq + ', '+ Formata_Num(Ponto);
  sq := sq + ', '+ Formata_Num(Pedagio);
  sq := sq + ', '+ Formata_Num(FMin);
  sq := sq + ', '+ Formata_Num(Emissao);
  sq := sq + ', '+ Formata_Num(Devol);
  sq := sq + ', '+ Formata_Num(Reent);
  sq := sq + ', '+ Formata_Num(VRisco);
  sq := sq + ', '+ Formata_Num(VRiscoAD);

  sq := sq + ') ';

  DM2.Executa_SQL(DM1.Conexao, DM1.sdsFAd, sq , ' Inserir');

end;

procedure TBco.Frete_CadAdic_Mostra(idC: Integer);
begin
  // usado para expoprtar os dados
  sq := 'select * from TB_FRETE0 Where ligCli = '+IntToStr(idC);
  DM2.Roda_SQL(DM1.sdsFAd, DM1.cdsFAd, sq);
end;

function TBco.Frete_CadAdic_Procura(idC: Integer; tipo, local: Smallint): Boolean;

var achei : Boolean;
    servTipo : Smallint;

begin
  achei := false;
  // 7 e 8 utilizam o mesmo cadastro
  ServTipo := tipo;
  if (tipo = 8)  then servTipo := 4;

  sq := 'select * from TB_FRETE0 Where ligCli = '+IntToStr(idC)+ ' and Tipo = '+IntToStr(tipo)+ ' and local = '+IntToStr(local);
  DM2.Roda_SQL(DM1.sdsFAd, DM1.cdsFAd, sq);

  if (DM1.cdsFAd.RecordCount > 0) then achei := true;

  Frete_CadAdic_Procura := achei;
end;

procedure TBco.FreteEntrega_Altera(idC: Integer; cap_valor, gsp_valor,
  int_valor, int2_valor, oest_valor, out_valor : double);
begin
  sq := 'update TB_FRETE3 set ';
  sq := sq + '  cap_valor  = '+ Formata_Num(cap_valor);
  sq := sq + ', gsp_valor  = '+ Formata_Num(gsp_valor);
  sq := sq + ', int_valor  = '+ Formata_Num(int_valor);
  sq := sq + ', int2_valor = '+ Formata_Num(int2_valor);
  sq := sq + ', oest_valor = '+ Formata_Num(oest_valor);
  sq := sq + ', out_valor  = '+ Formata_Num(out_valor);
  sq := sq + ' WHERE ligcli = '+ intToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT3, sq , 'Alterar');
end;

procedure TBco.FreteEntrega_Insere(idC: Integer; cap_valor, gsp_valor,
  int_valor, int2_valor, oest_valor, out_valor : double);
begin
  sq := 'INSERT INTO TB_FRETE3 (ligcli, CAP_VALOR, GSP_VALOR, INT_VALOR, INT_VALOR, OEST_VALOR, OUT_VALOR) VALUES ( ';
  sq := sq + '  '+ Formata_Num(idC);
  sq := sq + ', '+ Formata_Num(cap_valor);
  sq := sq + ', '+ Formata_Num(gsp_valor);
  sq := sq + ', '+ Formata_Num(int_valor);
  sq := sq + ', '+ Formata_Num(int2_valor);
  sq := sq + ', '+ Formata_Num(oest_valor);
  sq := sq + ', '+ Formata_Num(out_valor);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT3, sq , 'Alterar');
end;

procedure TBco.FreteEntrega_Mostra(idC: Integer);
begin
  sq := 'select * from TB_FRETE3 Where ligCli = '+IntToStr(idC);
  DM2.Roda_SQL(DM3.sdsFT3, DM3.cdsFT3, sq);

end;

procedure TBco.FretePeso_Altera(idF: Integer; inicio, fim, vcap, vgsp,
  vint, vint2, voest, vout: double);
begin
  sq := 'update TB_FRETE1 set ';
  sq := sq + '  Inicio  = '+ Formata_Num(inicio);
  sq := sq + ', Fim     = '+ Formata_Num(fim);
  sq := sq + ', vCap    = '+ Formata_Num(vcap);
  sq := sq + ', vGSP    = '+ Formata_Num(vgsp);
  sq := sq + ', vINT    = '+ Formata_Num(vint);
  sq := sq + ', vINT2   = '+ Formata_Num(vint2);
  sq := sq + ', vOEST   = '+ Formata_Num(voest);
  sq := sq + ', vOUT    = '+ Formata_Num(vout);
  sq := sq + ' where ID = '+ IntToStr(idF);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1, sq , 'Alterar');

end;

procedure TBco.FretePeso_Apaga(idF: Integer);
begin
  sq := 'Delete from TB_FRETE1 ';
  sq := sq + ' where ID = '+ IntToStr(idF);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1, sq , 'Apagar');
end;

procedure TBco.FretePeso_ApagaCLI(idC: Integer);
begin
  sq := 'Delete from TB_FRETE1 ';
  sq := sq + ' where LigCli = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1, sq , 'Apagar');
end;

procedure TBco.FretePeso_Insere(idC: Integer; inicio, fim, vcap, vgsp,
  vint, vint2, voest, vout: double);
begin
  sq := 'INSERT INTO TB_FRETE1 (ligcli, inicio, fim, vcap, vgsp, vint, vint2, voest, vout) VALUES ( ';
  sq := sq + '  '+ Formata_Num(idC);
  sq := sq + ', '+ Formata_Num(inicio);
  sq := sq + ', '+ Formata_Num(fim);
  sq := sq + ', '+ Formata_Num(vcap);
  sq := sq + ', '+ Formata_Num(vgsp);
  sq := sq + ', '+ Formata_Num(vint);
  sq := sq + ', '+ Formata_Num(vint2);
  sq := sq + ', '+ Formata_Num(voest);
  sq := sq + ', '+ Formata_Num(vout);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1, sq , 'Alterar');

end;

procedure TBco.FretePeso_Mostra(idC: Integer);
begin
  sq := 'select * from TB_FRETE1 Where ligCli = '+IntToStr(idC)+ ' Order by INICIO ';
  DM2.Roda_SQL(DM3.sdsFt1, DM3.cdsFT1, sq);
end;

procedure TBco.FretePeso_MostraId(idF: Integer);
begin
  sq := 'select * from TB_FRETE1 Where id = '+IntToStr(idF);
  DM2.Roda_SQL(DM3.sdsFt1, DM3.cdsFT1, sq);
end;

procedure TBco.FretePesoExc_Altera(idC: Integer; ecap, egsp, eint, eint2, eoest, eout: double);
begin
  sq := 'update TB_FRETE1a set ';
  sq := sq + '  ecap  = '+ Formata_Num(ecap);
  sq := sq + ', egsp  = '+ Formata_Num(egsp);
  sq := sq + ', eint  = '+ Formata_Num(eint);
  sq := sq + ', eint2 = '+ Formata_Num(eint2);
  sq := sq + ', eoest = '+ Formata_Num(eoest);
  sq := sq + ', eout  = '+ Formata_Num(eout);
  sq := sq + ' where ligcli = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1a, sq , 'Alterar');

end;

procedure TBco.FretePesoExc_Insere(idC: Integer; ecap, egsp, eint, eint2, eoest, eout: double);
begin
  sq := 'INSERT INTO TB_FRETE1a (ligcli, ecap, egsp, eint, eint2, eoest, eout) VALUES ( ';
  sq := sq + '  '+ Formata_Num(idC);
  sq := sq + ', '+ Formata_Num(ecap);
  sq := sq + ', '+ Formata_Num(egsp);
  sq := sq + ', '+ Formata_Num(eint);
  sq := sq + ', '+ Formata_Num(eint2);
  sq := sq + ', '+ Formata_Num(eoest);
  sq := sq + ', '+ Formata_Num(eout);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT1a, sq , 'Alterar');

end;

procedure TBco.FretePesoExc_Mostra(idC: Integer);
begin
  sq := 'select first 1 * from TB_FRETE1a Where ligCli = '+IntToStr(idC);
  DM2.Roda_SQL(DM3.sdsFt1a, DM3.cdsFT1a, sq);

end;

procedure TBco.Relatorio_Datas(idCli, iTodos:Integer; dt1, dt2: TDateTime);

//var n : Integer;

begin
 // n := (pag - 1) * 12;  FIRST 12 SKIP '+IntToStr(n)+'
  sq := 'Select dtRoma, num, num - extract(YEAR from dtRoma)* 1000000 as Romaneio, ';
  sq := sq + ' TB_CLIENTE.NOME, COUNT(numNF) as Notas, TB_Cliente.id as idCli';
  sq := sq + ' from Tb_roma, Tb_Cliente, TB_NOTAF ';
  sq := sq + ' Where TB_ROMA.num = tb_notaf.nroma and TB_NOTAF.LIGCLI = TB_CLIENTE.id ';
  if (iTodos = 0) then sq := sq + ' and ligRel = 0  '
    else sq := sq + ' and ((ligRel = 0) or (ligRel=-1))  ';
  sq := sq + ' and dtRoma >= '+QuotedStr(BD_dia(dt1,3))+' and dtRoma <= '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' and LigCli = '+IntToStr(idCli);
  sq := sq + ' GROUP BY num, dtRoma, Nome, TB_Cliente.id ';
  sq := sq + ' ORDER BY dtRoma, num ';

  DM2.Roda_SQL(DM3.sdsRelG, DM3.cdsRelG, sq);

end;

procedure TBco.Relatorio_Gerar(numRoma, idcli, idCob: Integer);

var idRel : Integer;

begin
  sq := 'INSERT INTO TB_RELAT (vFreteT, Alterado, Status, DTemissao, numRoma, nCob ) VALUES ( ';
  sq := sq + '  0,0,0';
  sq := sq + ', '+ QuotedStr(BD_Dia(Now, 1));
  sq := sq + ', '+ IntToStr(numRoma);
  sq := sq + ', '+ IntToStr(idCob);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'select first 3 id, alterado from TB_RELAT order by id desc';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  DM2.cdsTMP.First;
  idRel := DM2.cdsTMP.Fields[0].Value;

  sq := 'update TB_NOTAF set ';
  sq := sq + '  ligrel  = '+ IntToStr(idRel);
  sq := sq + ' where ligrel = 0 and ';
  sq := sq + ' nRoma = '+IntToStr(numRoma) + ' and ligCli = '+IntToStr(idCli);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');


end;

procedure TBco.Relatorio_Notas(idR: Integer);
begin
  sq := 'select TB_NOTAF.id, NUMNF, Locali, Valor, Volume, peso, vfrete, cep, tipolocal, ligCli, ponto, ';
  sq := sq + ' nocorr, uso, descr, ';
  sq := sq + ' case tipolocal when 0 then '+QuotedStr('SP')+' when 1 then '+QuotedStr('GSP')+' when 2 then '+QuotedStr('INT')+' when 3 then '+QuotedStr('INT2')+' when 4 then '+QuotedStr('OEST')+' when 5 then '+QuotedStr('OUT')+' ELSE '+QuotedStr('-')+' end as Local, Carro, nRoma, tipo_cob, ';
  sq := sq + ' case tipo_cob when 1 then '+QuotedSTr('Peso')+' when 2 then '+QuotedSTr('Taxa')+' when 3 then '+QuotedSTr('Entrega')+' when 4 then '+QuotedSTr('Saída')+' when 5 then '+QuotedSTr('Contrato')+' ELSE '+QuotedSTr('sem Serv')+' end as Servico2 ';
  sq := sq + ' from TB_Notaf LEFT JOIN  TB_OCORRE ON TB_OCORRe.num = nocorr ';
  sq := sq + ' WHERE ligrel = '+IntToStr(idR);
  sq := sq + ' ORDER BY NUMNF ';
  DM2.Roda_SQL(DM3.sdsRelN, DM3.cdsRelN, sq);
end;

procedure TBco.Relatorio_NotasZero(idCob: Integer);
begin
  sq := 'select TB_NOTAF.id, NUMNF, Locali, Valor, Volume, peso, vfrete, cep, tipolocal, ligCli, ponto, ';
  sq := sq + ' nocorr, uso, descr, ';
  sq := sq + ' case tipolocal when 0 then '+QuotedStr('SP')+' when 1 then '+QuotedStr('GSP')+' when 2 then '+QuotedStr('INT')+' when 3 then '+QuotedStr('INT2')+' when 4 then '+QuotedStr('OESP')+' when 5 then '+QuotedStr('OUT')+' ELSE '+QuotedStr('-')+' end as Local, Carro, nRoma, tipo_cob, ';
  sq := sq + ' case tipo_cob when 1 then '+QuotedSTr('Peso')+' when 2 then '+QuotedSTr('Taxa')+' when 3 then '+QuotedSTr('Entrega')+' when 4 then '+QuotedSTr('Saída')+' when 5 then '+QuotedSTr('Contrato')+' ELSE '+QuotedSTr('sem Serv')+' end as Servico2 ';
  sq := sq + ' from TB_Relat, TB_Notaf LEFT JOIN  TB_OCORRE ON TB_OCORRe.num = nocorr ';
  sq := sq + ' WHERE vFrete = 0 and nocorr <> 20 and nocorr <> 58 and ';
  sq := sq + ' TB_NOTAF.ligrel = TB_RELAT.ID and ';
  sq := sq + ' TB_RELAT.nCOB = '+ IntToStr(idCob);
  sq := sq + ' ORDER BY NUMNF ';
  DM2.Roda_SQL(DM3.sdsRelN, DM3.cdsRelN, sq);
end;


procedure TBco.Relatorio_Mostrar(dt : TdateTime);
begin
  sq := 'select id, numRoma, numRoma - extract(YEAR from dtemissao)* 1000000 as Romaneio ';
  sq := sq + ' , case status when 0 then '+QuotedStr('emitido')+' when 1 then '+QuotedStr('pronto')+' when 2 then '+QuotedStr('emitido')+' end as relStatus ';
  sq := sq + ', dtEmissao, vfretet, nCob from TB_RELAT  WHERE CAST(DTemissao as DATE) = '+ QuotedStr(BD_Dia(dt,3));
  sq := sq + ' ORDER BY numRoma ';

  DM2.Roda_SQL(DM3.sdsRelV, DM3.cdsRelV, sq);
end;

procedure TBco.Relatorio_Grava(idN: Integer; vFrete: double; tpServ : Integer);

var idR : integer;

begin
  // IF adicionado por causa de erros de cálculo que geram
  // valores maiores que 2.000.000.000 e erros nas consultas do BD 
  if (vFrete > 999999) then vFrete := 0;
  sq := 'update TB_NOTAF SET vFrete = ' + Formata_Num(vFrete) + ' ,TIPO_COB = '+IntToStr(tpServ)+' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');

  sq := 'Select ligrel, numNf from TB_NOTAF WHERE id = '+IntToStr(idN);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  idR := DM2.cdsTMP.Fields[0].Value;
  sq := 'Select Sum(Vfrete) from TB_NotaF  WHERE ligRel = '+ DM2.cdsTMP.Fields[0].AsString;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.Fields[0].Value  > 0) then
  begin
    sq := 'update TB_relat SET vFreteT = ' + Formata_Num(DM2.cdsTMP.Fields[0].Value) + ' WHERE id = '+IntToStr(idR);
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
  end;

end;


procedure TBco.Relatorio_GravaPonto(idN: Integer; Pontos: smallint);

begin
  sq := 'update TB_NOTAF SET Ponto = ' + intToStr(Pontos) + ' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;


procedure TBco.Relatorio_RetiraNota(idN: Integer);
begin
  sq := 'update TB_NOTAF SET ligRel = 0 WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');

end;

procedure TBco.REST_BaixaAlterados;
begin
  sq := 'select id, nocorr, dtent, hrent, baixa_func, baixa_orig, recebedor from  tb_notaf ';
  sq := sq + ' where baixa_orig >10 and nocorr>0 ';
  DM2.Roda_SQL(DM5.sdsRestB, DM5.cdsRestB, sq);
end;

procedure TBco.REST_BaixaDia(dia: TDateTime);
begin
  sq := 'select n.id, n.nocorr, n.dtent, n.hrent, n.baixa_func, n.baixa_orig, n.recebedor from  tb_notaf n, TB_ROMA r';
  sq := sq + ' where (n.nRoma=r.num) and r.dtRoma = '+QuotedStr( BD_dia(dia,3) )+' and n.nocorr>0 ';
  DM2.Roda_SQL(DM5.sdsRestB, DM5.cdsRestB, sq);
end;

procedure TBco.REST_BaixaMarcaVarios(ids: String);
begin
  sq := 'update TB_NOTAF SET baixa_orig = baixa_orig - 10, flag_geral = 7 ';
  sq := sq + ' WHERE (Baixa_orig > 10) and (id in ( '+ids + ' )) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.REST_BaixaNotas(ids: String);
begin
  sq := 'select n.id, n.nocorr, n.dtent, n.hrent, n.baixa_func, n.baixa_orig, n.recebedor from  tb_notaf n ';
  sq := sq + ' where n.id in ('+ids+') and n.nocorr>0 ';
  DM2.Roda_SQL(DM5.sdsRestB, DM5.cdsRestB, sq);
end;

procedure TBco.REST_BaixaRoma(nR: Integer);
begin
  sq := 'select id, nocorr, dtent, hrent, baixa_func, baixa_orig, recebedor from  tb_notaf ';
  sq := sq + ' where nRoma = '+nR.ToString+' and nocorr>0 ';
  DM2.Roda_SQL(DM5.sdsRestB, DM5.cdsRestB, sq);
end;

procedure TBco.REST_dadosWEB_Marca(idN, idC, status: Integer);
begin
  // status
  // = 5 ; preparado para exportar
  // = 7 : exportado
  // = 9 : erro ao exportar
  sq := 'update TB_NFUNICA SET WEBCOPIA = '+IntToStr(status)+' WHERE ligcli = '+IntToStr(idC) + 'and  numnota = ' + IntToStr(idN) ;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.REST_dadosWEB_Mostra(status: Integer);
begin
  // status
  // = 5 ; preparado para exportar
  // = 7 : exportado
  // = 9 : erro ao exportar
  sq := 'select distinct b.id, a.numnf, a.ligcli, a.valor, a.peso, a.volume, a.DTCRIA, a.docdest, a.numped ';
  sq := sq + ' from tb_notaf a, tb_nfunica b ';
  sq := sq + ' where a.ligcli = b.LIGCLI and a.numnf = b.NUMNOTA ';
  sq := sq + ' and  WEBcopia = ' + IntToStr(status);
  DM2.Roda_SQL(DM5.sdsRestD, DM5.cdsRestD, sq);
end;

procedure TBco.REST_Notas(nRoma: Integer; reenviar:boolean);
begin
  sq := 'select id, numnf, ligcli, valor, docdest, numped, nroma from tb_notaf ';
  sq := sq + ' WHERE (NROMA = '+IntToStr(nRoma)+') ';
  if not reenviar then sq := sq + ' and  (status_web = 0) ';
  DM2.Roda_SQL(DM5.sdsRestN, DM5.cdsRestN, sq);
end;

procedure TBco.REST_NotasDia(dia: TDateTime; reenviar: boolean);
begin
  sq := 'select n.id, n.numnf, n.ligcli, n.valor, n.docdest, n.numped, n.nroma from tb_notaf n, tb_roma r';
  sq := sq + ' WHERE (n.nRoma=r.num) and (r.dtRoma = '+QuotedStr( BD_dia(dia,3) )+') ';
  if not reenviar then sq := sq + ' and  (n.status_web = 0) ';
  DM2.Roda_SQL(DM5.sdsRestN, DM5.cdsRestN, sq);
end;

procedure TBco.REST_RomaDia(dia: TDateTime);
begin
  sq := 'select id, num, dtRoma, ligmot, num -extract(YEAR from dtRoma)* 1000000 as Romaneio from Tb_roma ';
  sq := sq + ' WHERE dtRoma = '+QuotedStr(FormatDateTime('yyyy-MM-dd', dia) );
  DM2.Roda_SQL(DM5.sdsRestR, DM5.cdsRestR, sq);
end;

procedure TBco.REST_RomaDiaFiltra(nRoma: Integer);
begin
  DM5.cdsRestR.Filtered := false;
  DM5.cdsRestR.Filter := 'num ='+nRoma.ToString;
  DM5.cdsRestR.Filtered := true;

end;

procedure TBco.REST_NotasSEL(cjNotas: String; reenviar: boolean);
begin
  sq := 'select id, numnf, ligcli, valor, docdest, numped, nroma from tb_notaf ';
  sq := sq + ' WHERE id in ('+cjNotas+') ';
  if not reenviar then sq := sq + ' and  (status_web = 0) ';
  DM2.Roda_SQL(DM5.sdsRestN, DM5.cdsRestN, sq);
end;

procedure TBco.REST_Romaneio(nRoma: Integer);
begin
  sq := 'select id, num, dtRoma, ligmot, num -extract(YEAR from dtRoma)* 1000000 as Romaneio from Tb_roma ';
  sq := sq + ' WHERE NUM = '+IntToStr(nRoma);
  DM2.Roda_SQL(DM5.sdsRestR, DM5.cdsRestR, sq);
end;

procedure TBco.Romaneio_NotasRegiao(numR, Reg: Integer);
begin
  sq := 'update TB_NOTAF SET  tipolocal = '+IntToStr(Reg)+' WHERE nRoma = '+IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.Edi_Notas(nCli : Integer);
begin
  sq := 'select * from TB_NOTAF WHERE STATUS_ENT > 0 and STATUS_EDI = 1 and LIGCLI = '+IntToStr(nCli);
  DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
end;

Function TBco.Edi_Reenvia(idCli: Integer; dt1, dt2:TdateTime):Integer;

var qt : Integer;

begin
  // falta contar os enviados
  qt := 0;

  sq := 'select TB_NOTAF.id from TB_NOTAF, TB_ROMA ';
  sq := sq + ' WHERE nroma = num  and origem in(1,3,4) and STATUS_ENT > 0 ';
  sq := sq + ' and dtRoma between '+QuotedStr(FormatDateTime('yyyy-MM-dd', dt1)) + ' and ' + QuotedStr(FormatDateTime('yyyy-MM-dd', dt2));
  sq := sq + ' and ligCli = '+IntToStr(idCli);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  qt := DM2.cdsTMP.RecordCount;

  if (qt > 0) then
  begin
    DM2.cdsTMP.First;
    while not DM2.cdsTMP.Eof do
    begin
      Edi_setStatus(DM2.cdsTMP.Fields[0].AsInteger, 1);
      DM2.cdsTMP.Next;
    end;
  end;

  Edi_Reenvia := qt;
end;


procedure TBco.Edi_setStatus(idN, Status: Integer);
begin
  sq := 'Update TB_NOTAF set STATUS_EDI = '+ IntToStr(Status)+ ' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.Notas_MarcarCubagem(idN: Integer; cub: double; Peso : double);
begin
  sq := 'Update TB_NOTAF set CUB_VOLUME = ' + Formata_Num(cub) + ', PESO = '+ Formata_Num(Peso) +' WHERE id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');
end;

procedure TBco.Romaneio_Soma(numR: Integer);
begin
  sq := 'select Sum(Peso) from TB_NOTAF WHERE nRoma = '+IntToStr(numR);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

function TBco.Roma_Obs_Existe(idR: Integer): Boolean;
  var resp : Boolean;
begin
  resp := false;
  sq := 'Select id from TB_ROMA_OBS ';
  sq := sq + ' WHERE  LigRoma = '+ IntToStr(idR);

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if DM2.cdsTMP.RecordCount > 0 then resp := true;

  result:= resp;
end;

procedure TBco.Roma_Obs_Grava(idR, idUs, nR : Integer; sObs:String);
  var sHoje:String;
begin
  sHoje := FormatDateTime('yyyy-MM-dd',Now);
  if Not Roma_Obs_Existe(idR) then
  begin
    sq := 'Insert into TB_Roma_Obs (ligRoma, NumRoma, LigUser, dtCria, Obs) VALUES ( ';
    sq := sq + '  '+idR.ToString;
    sq := sq + ', '+nR.ToString;
    sq := sq + ', '+idUs.ToString;
    sq := sq + ', '+QuotedStr(sHoje);
    sq := sq + ', '+QuotedStr(sObs);
    sq := sq + ' )';
  end
  else
  begin
    sq := 'Update TB_Roma_Obs SET ';
    sq := sq + ' LigUser = '+idUs.ToString;
    sq := sq + ',Obs = '+QuotedStr(sObs);
    sq := sq + ' WHERE LigRoma = '+idR.ToString;
  end;

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Salvar');

end;

Function TBco.Roma_Obs_Mostra(idR: Integer):String;
  var resp : String;
begin
  resp := '';
  sq := 'Select Obs from TB_ROMA_OBS ';
  sq := sq + ' WHERE  LigRoma = '+ IntToStr(idR);

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if DM2.cdsTMP.RecordCount > 0 then resp := DM2.cdsTMP.Fields[0].AsAnsiString;

  result:= resp;

end;

{
  FRETE 4 - SAIDA
  ======================================================
  08.10.2011 - 3 métodos
  ------------------------------------------------------
}

procedure TBco.FreteSaida_Altera(ligCli, faixa: Integer; cobSP, pagSP,
  cobG, pagG, cobINT, pagINT, cobINT2, pagINT2, cobOEST, pagOEST, cobOUT, pagOUT : Double);
begin
  sq := 'Update TB_FRETE4 SET ';
  sq := sq + '  COB_SP = '+ Formata_Num(cobSP);
  sq := sq + ', PAG_SP = '+ Formata_Num(pagSP);
  sq := sq + ', COB_GSP = '+ Formata_Num(cobG);
  sq := sq + ', PAG_GSP = '+ Formata_Num(pagG);
  sq := sq + ', COB_INT = '+ Formata_Num(cobINT);
  sq := sq + ', PAG_INT = '+ Formata_Num(pagINT);
  sq := sq + ', COB_INT2 = '+ Formata_Num(cobINT2);
  sq := sq + ', PAG_INT2 = '+ Formata_Num(pagINT2);
  sq := sq + ', COB_OEST = '+ Formata_Num(cobOEST);
  sq := sq + ', PAG_OEST = '+ Formata_Num(pagOEST);
  sq := sq + ', COB_OUT = '+ Formata_Num(cobOUT);
  sq := sq + ', PAG_OUT = '+ Formata_Num(pagOUT);
  sq := sq + ' WHERE ligCli = '+ IntToStr(ligCli);
  sq := sq + ' and faixa = '+ IntToStr(faixa);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.FreteSaida_Insere(ligCli, faixa: Integer);

begin
  sq := 'Insert into TB_FRETE4 (ligCli, faixa, cob_SP,pag_SP, cob_GSP, pag_GSP, cob_INT, pag_INT, cob_OUT, pag_OUT) ';
  sq := sq + ' Values ('+intToStr(ligCli)+', '+intToStr(faixa)+', 0,0,0,0,0,0,0,0)';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');
end;

procedure TBco.FreteSaida_Mostra(ligCli, faixa: Integer);
begin
  sq := 'Select * from TB_FRETE4 ';
  sq := sq + ' WHERE ligCli = '+ IntToStr(ligCli);
  sq := sq + ' and faixa = '+ IntToStr(faixa);

  DM2.Roda_SQL(DM3.sdsFT4, DM3.cdsFT4, sq);

end;


procedure TBco.Romaneio_NotasCarro(numR, Carro: Integer);
begin
  sq := 'update TB_NOTAF SET  carro = '+IntToStr(Carro)+' WHERE nRoma = '+IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Atualiza');

end;

procedure TBco.FreteContrato_Altera(idC: Integer; vMensal, vAvulso_km,
  vAvulso_hora: double;  km:Integer; hora, tipocob:Smallint);
begin
  sq := 'update TB_FRETE5 set ';
  sq := sq + '  vMensal       = '+ Formata_Num(vMensal);
  sq := sq + ', vAvulso_km    = '+ Formata_Num(vAvulso_km);
  sq := sq + ', vAvulso_Hora  = '+ Formata_Num(vAvulso_Hora);
  sq := sq + ', km            = '+ IntToStr(km);
  sq := sq + ', horas         = '+ IntToStr(hora);
  sq := sq + ', tipocob       = '+ IntToStr(tipocob);
  sq := sq + 'WHERE ligcli = '+ intToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT5, sq , 'Alterar');
end;

procedure TBco.FreteContrato_Insere(idC: Integer; vMensal, vAvulso_km,
  vAvulso_hora: double; km:Integer; hora, tipocob:Smallint);
begin
  sq := 'INSERT INTO TB_FRETE5 (ligcli, vMensal, vAvulso_km, vAvulso_hora, km, horas, tipocob) VALUES ( ';
  sq := sq + '  '+ Formata_Num(idC);
  sq := sq + ', '+ Formata_Num(vMensal);
  sq := sq + ', '+ Formata_Num(vAvulso_km);
  sq := sq + ', '+ Formata_Num(vAvulso_Hora);
  sq := sq + ', '+ IntToStr(km);
  sq := sq + ', '+ IntToStr(hora);
  sq := sq + ', '+ IntToStr(tipocob);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT5, sq , 'Alterar');
end;

procedure TBco.FreteContrato_Mostra(idC: Integer);
begin
  sq := 'select * from TB_FRETE5 Where ligCli = '+IntToStr(idC);
  DM2.Roda_SQL(DM3.sdsFT5, DM3.cdsFT5, sq);
end;

procedure TBco.Fin_Conta_Altera(idF: Integer; Nivel, Status: Smallint;
  NomeConta: String);
begin
  sq := 'UPDATE TB_FINCONTA SET ';
  sq := sq + '  Nivel     = ' + IntToStr(Nivel);
  sq := sq + ', NomeConta = ' + QuotedStr(NomeConta);
  sq := sq + ', Status    = ' + IntToStr(Status);
  sq := sq + ', dtAlt     = ' + QuotedStr(BD_dia(Now, 1) );
  sq := sq + ' WHERE id = ' + IntToStr(idF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

function  TBco.Fin_Conta_Apagar(iNivel: Integer):Smallint;

var resp : Smallint;

begin
  resp := 0;
  sq := 'Select First 5 * from TB_FINANC where LigConta = ' + IntToStr(iNivel);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount=0) then
  begin
    sq := 'Delete from TB_FINCONTA where Nivel = ' + IntToStr(iNivel);
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
  end
  else resp := 1;
  Fin_Conta_Apagar := resp;
end;

procedure TBco.Fin_Conta_Insere(Nivel: Smallint; NomeConta: String);
begin
  sq := 'INSERT INTO TB_FINCONTA (Nivel, NomeConta, Permissao, Status, dtCria, dtAlt) VALUES ( ';
  sq := sq + '  '+ IntToStr(Nivel);
  sq := sq + ', '+ QuotedStr(NomeConta);
  sq := sq + ', 2';
  sq := sq + ', 1';
  sq := sq + ', ' + QuotedStr(BD_dia(Now, 1) );
  sq := sq + ', ' + QuotedStr(BD_dia(Now, 1) );;
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Fin_Conta_Mostra(st: Smallint);
begin
  // st = 0 : somente ocultos
  // st = 1 : somente visiveis
  // st = 2 : todos
  sq := 'select * from TB_FINCONTA ';
  if (st < 2) then sq := sq + ' Where Status = '+IntToStr(st);
  sq := sq + ' Order By Nivel ';
  DM2.Roda_SQL(DM5.sdsFinC, DM5.cdsFinC, sq);

end;

procedure TBco.Fin_Conta_MostraID(idF: Smallint);
begin
  sq := 'select * from TB_FINCONTA ';
  sq := sq + ' Where id = '+IntToStr(idF);
  DM2.Roda_SQL(DM5.sdsFinC, DM5.cdsFinCo, sq);
end;

procedure TBco.Fin_Item_Altera(idFi: Integer; dtContab, dtPrev: TDateTime;
  vContab, vPrev: Double; Descr: String; st, LigU, LigC: Integer);
begin
  sq := 'UPDATE TB_FINANC SET ';
  sq := sq + '  dtContab = '+ QuotedStr(BD_dia(dtContab, 3) );
  sq := sq + ', dtPrev = '+ QuotedStr(BD_dia(dtPrev, 3) );
  sq := sq + ', ValorContab = '+ Formata_Num(vContab);
  sq := sq + ', ValorPrev = '+ Formata_Num(vPrev);
  sq := sq + ', Descricao = '+ QuotedStr(Descr);
  sq := sq + ', Status = '+ IntToStr(st);
  sq := sq + ', LigUser = '+ IntToStr(LigU);
  sq := sq + ', LigConta = '+ IntToStr(LigC);
  sq := sq + ' WHERE id = ' + IntToStr(idFi);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Fin_Item_Apaga(idFi: Integer);
begin
  sq := 'DELETE FROM TB_FINANC SET ';
  sq := sq + ' WHERE id = ' + IntToStr(idFi);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');

end;

procedure TBco.Fin_Item_Datas(LigC: Integer; dt1, dt2: TDateTime; TipoDT:Smallint);
begin
  sq := 'select * from TB_FINANC ';
  if (tipoDT = 1) then sq := sq + ' Where dtContab beetwen '+QuotedStr(BD_dia(dt1, 3) ) + ' and '+QuotedStr(BD_dia(dt2, 3) );
  if (tipoDT = 2) then sq := sq + ' Where dtPrev beetwen '+QuotedStr(BD_dia(dt1, 3) ) + ' and '+QuotedStr(BD_dia(dt2, 3) );
  if (LigC > 0) then sq := sq + ' and LigConta = ' + IntToStr(LigC);

  DM2.Roda_SQL(DM5.sdsFinanc, DM5.cdsFinanc, sq);
end;

procedure TBco.Fin_Item_Insere(dtContab, dtPrev: TDateTime; vContab,
  vPrev: Double; Descr: String; st, LigU, LigC: Integer);
begin
  sq := 'INSERT INTO TB_FINANC (dtCria, dtContab, dtPrev, ValorContab, ValorPrev, ';
  sq := sq + ' Descricao, Status, LigUser, LigConta) VALUES ( ';
  sq := sq + '  '+ QuotedStr(BD_dia(Now, 1) );
  sq := sq + ', '+ QuotedStr(BD_dia(dtContab, 3) );
  sq := sq + ', '+ QuotedStr(BD_dia(dtPrev, 3) );
  sq := sq + ', '+ Formata_Num(vContab);
  sq := sq + ', '+ Formata_Num(vPrev);
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ IntToStr(st);
  sq := sq + ', '+ IntToStr(LigU);
  sq := sq + ', '+ IntToStr(LigC);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Fin_Item_Mostra(LigC: Integer; dtP: TDateTime);
begin
  sq := 'select * from TB_FINANC ';
  sq := sq + ' Where dtPrev >= '+QuotedStr(BD_dia(dtP, 3) );
  if (LigC > 0) then sq := sq + ' and LigConta = ' + IntToStr(LigC);

  DM2.Roda_SQL(DM5.sdsFinanc, DM5.cdsFinanc, sq);
end;

procedure TBco.Fin_Item_MostraID(idFi: Integer);
begin
  sq := 'select * from TB_FINANC ';
  sq := sq + ' Where id = '+IntToStr(idFi);

  DM2.Roda_SQL(DM5.sdsFinanc, DM5.cdsFinanc, sq);
end;

procedure TBco.FreteCOB_fMostraNota(idNF: Integer);
begin
  DM1.cdsNotas.Filtered := false;
  DM1.cdsNotas.Filter := 'id = ' + idNF.ToString;
  DM1.cdsNotas.Filtered := True;
end;

procedure TBco.FreteCOB_CTe(idNF: Integer);
begin
  sq := 'select DATAC, NUMC, ARQUIVO, STATUS ';
  sq := sq + ' from TB_CONHEC ';
  sq := sq + ' where LIGNOTA= ' +idNF.ToString;
  DM2.Roda_SQL(DM1.sdsCTe, DM1.cdsCTe, sq);
end;

procedure TBco.FreteCOB_Cte(dt1, dt2: TDateTime);
begin
  sq := 'select DATAC, NUMC, ARQUIVO, STATUS ';
  sq := sq + ' from TB_CONHEC ';
  sq := sq + ' where DATAC between  ' +QuotedStr(BD_dia(dt1,3)) +  ' and '+QuotedStr(BD_dia(dt2,3));
  DM2.Roda_SQL(DM1.sdsCTe, DM1.cdsCTe, sq);
end;

procedure TBco.FreteCOB_fCTe(idNF: Integer);
begin
  DM1.cdsCTe.Filtered := false;
  DM1.cdsCTe.Filter := 'ligNota = ' + idNF.ToString;
  DM1.cdsCTe.Filtered := True;
end;

procedure TBco.FreteCOB_fMostraNFcli(idCli: Integer);
begin
  DM5.cdsFrtNotas.Filtered := false;
  DM5.cdsFrtNotas.Filter := 'ligCli = ' + idCli.ToString;
  DM5.cdsFrtNotas.Filtered := True;
end;

procedure TBco.FreteCOB_Inicia(dt1, dt2: TDateTime);
begin
  sq := 'SP_FRETE_INICIO';
  DM2.sspInicia.Active := false;
  DM2.sspInicia.StoredProcName := sq;
  DM2.sspInicia.ParamByName('DT1').AsDateTime := dt1;
  DM2.sspInicia.ParamByName('DT2').AsDateTime := dt2;
  DM2.sspInicia.ParamByName('IDNF').AsDateTime := 0;
  DM2.sspInicia.ParamByName('NUMROMA').AsDateTime := 0;

  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM2.sspInicia);
end;

procedure TBco.FreteCOB_MostraClientes(dt1, dt2: tDateTime);
begin
  sq := 'select LIGCLI, TB_CLIENTE.NOME,  count(*) as Notas,  SUM(VFRETETOTAL) as Valores ';
  sq := sq + ' from TB_COBVALOR, tb_cliente ';
  sq := sq + ' where LIGCLI=TB_CLIENTE.ID ';
  sq := sq + ' and cpdtRoma between '+QuotedStr(BD_dia(dt1, 3) ) + '  and '+ QuotedStr(BD_dia(dt2, 3) );
  sq := sq + ' Group by ligcli, nome ';
  sq := sq + ' Order by nome ';

  DM2.Roda_SQL(DM5.sdsFrtCli, DM5.cdsFrtCli, sq);
end;

procedure TBco.FreteCOB_MostraDias(dt1, dt2: tDateTime);
begin
  sq := 'select cpdtroma, count(*) as Notas,  SUM(VFRETETOTAL) as Valores ';
  sq := sq + ' from TB_COBVALOR ';
  sq := sq + ' Where cpdtRoma between '+QuotedStr(BD_dia(dt1, 3) ) + '  and '+ QuotedStr(BD_dia(dt2, 3) );
  sq := sq + ' Group by cpdtRoma ';
  DM2.Roda_SQL(DM5.sdsFrtDia, DM5.cdsFrtDia, sq);
end;

procedure TBco.FreteCOB_MostraNotas(dt1, dt2: tDateTime);
begin
  sq := 'select * ';
  sq := sq + ' from TB_COBVALOR ';
  sq := sq + ' Where cpdtRoma between '+QuotedStr(BD_dia(dt1, 3) ) + '  and '+ QuotedStr(BD_dia(dt2, 3) );
  sq := sq + ' Order by cpdtRoma ';
  DM2.Roda_SQL(DM5.sdsFrtNotas, DM5.cdsFrtNotas, sq);
  DM2.Roda_SQL(DM5.sdsFrtNotas, DM5.cdsFrtNotas2, sq);
end;

procedure TBco.FreteCOB_Servico;
begin
  sq := 'SP_FRETE_SERV';
  DM2.sspExec.Active := false;
  DM2.sspExec.StoredProcName := sq;
  DM2.sspExec.Params.Clear;
  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM2.sspExec);

end;

procedure TBco.FreteCOB_Total;
begin
  sq := 'SP_FRETE_TOTAL';
  DM2.sspExec.Active := false;
  DM2.sspExec.StoredProcName := sq;
  DM2.sspExec.Params.Clear;
  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM2.sspExec);

end;

procedure TBco.FreteCOB_Inicia(nRoma: Integer; c: char);
begin
  sq := 'SP_FRETE_INICIO';
  DM2.sspExec.Active := false;
  DM2.sspExec.StoredProcName := sq;
  DM2.sspExec.Params.Clear;
  DM2.sspExec.ParamByName('DT1').AsDateTime := Now;
  DM2.sspExec.ParamByName('DT2').AsDateTime := Now;
  DM2.sspExec.ParamByName('IDNF').AsDateTime := nRoma;
  DM2.sspExec.ParamByName('NUMROMA').AsDateTime := 0;

  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM2.sspExec);
  // O CHAR é só para poder existir um novo overload
end;

procedure TBco.FreteCOB_Inicia(idNF: Integer);
begin
  sq := 'SP_FRETE_INICIO';
  DM5.sspZero.Active := false;
  DM2.sspInicia.Active := false;
  DM2.sspInicia.StoredProcName := sq;
  DM2.sspInicia.ParamByName('DT1').AsDateTime := Now;
  DM2.sspInicia.ParamByName('DT2').AsDateTime := Now;
  DM2.sspInicia.ParamByName('IDNF').AsDateTime := 0;
  DM2.sspInicia.ParamByName('NUMROMA').AsDateTime := idNF;

  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM2.sspInicia);

end;

procedure TBco.FreteContratoDia_Altera(id, idC, idM: Integer; dia, hr1,
  hr2: TDateTime; km1, km2: Integer; desconto: Double; Motivo: String; hrExtra:Double; kmExtra:Integer; vhr,vkm,vhrPago,vkmPago : Double; nRoma:Integer);
begin
  sq := 'update TB_FRETE5A set ';
  sq := sq + '  ligCli        = '+ IntToStr(idC);
  sq := sq + ', ligMot        = '+ IntToStr(idM);
  sq := sq + ', dia           = '+ QuotedStr(BD_Dia(dia, 3));
  sq := sq + ', hrInicio      = '+ QuotedStr(FormatDateTime('HH:mm', hr1));
  sq := sq + ', hrFim         = '+ QuotedStr(FormatDateTime('HH:mm', hr2));
  sq := sq + ', kmInicio      = '+ IntToStr(km1);
  sq := sq + ', kmFim         = '+ IntToStr(km2);
  sq := sq + ', desconto      = '+ Formata_Num(desconto);
  sq := sq + ', motivo        = '+ QuotedStr(Motivo);
  sq := sq + ', hrExtra       = '+ Formata_Num(hrExtra);
  sq := sq + ', kmExtra       = '+ IntToStr(kmExtra);
  sq := sq + ', vhr           = '+ Formata_Num(vhr);
  sq := sq + ', vkm           = '+ Formata_Num(vkm);
  sq := sq + ', vHrPago       = '+ Formata_Num(vhrPago);
  sq := sq + ', vKmPago       = '+ Formata_Num(vkmPago);
  sq := sq + ', nRoma         = '+ IntToStr(nRoma);

  sq := sq + 'WHERE id = '+ intToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT5A, sq , 'Alterar');

end;

procedure TBco.FreteContratoDia_Insere(idC, idM: Integer; dia, hr1,
  hr2: TDateTime; km1, km2: Integer; desconto: Double; Motivo: String; hrExtra:Double; kmExtra:Integer; vhr,vkm,vhrPago,vkmPago : Double; nRoma:Integer);
begin
  sq := 'INSERT INTO TB_FRETE5A (ligcli, ligMot, dia, hrInicio, hrFim, kmInicio, kmFim, desconto, motivo, hrExtra, kmExtra, vHr, vKm, vHrPago, vKmPago, nRoma) VALUES ( ';
  sq := sq + '  '+ IntToStr(idC);
  sq := sq + ', '+ IntToStr(idM);
  sq := sq + ', '+ QuotedStr(BD_Dia(dia, 3));
  sq := sq + ', '+ QuotedStr(FormatDateTime('HH:mm', hr1));
  sq := sq + ', '+ QuotedStr(FormatDateTime('HH:mm', hr2));
  sq := sq + ', '+ IntToStr(km1);
  sq := sq + ', '+ IntToStr(km2);
  sq := sq + ', '+ Formata_Num(desconto);
  sq := sq + ', '+ QuotedStr(Motivo);
  sq := sq + ', '+ Formata_Num(hrExtra);
  sq := sq + ', '+ IntToStr(kmExtra);
  sq := sq + ', '+ Formata_Num(vhr);
  sq := sq + ', '+ Formata_Num(vkm);
  sq := sq + ', '+ Formata_Num(vhrPago);
  sq := sq + ', '+ Formata_Num(vkmPago);
  sq := sq + ', '+ IntToStr(nRoma);

  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT5A, sq , 'Alterar');
end;

procedure TBco.FreteContratoDia_Mostra(id: Integer);
begin
  sq := 'select * from TB_FRETE5A Where id = '+IntToStr(id);
  DM2.Roda_SQL(DM3.sdsFT5A, DM3.cdsFT5A, sq);

end;

procedure TBco.FreteContratoDia_MostraC(idC: Integer; dt1, dt2: tDateTime);
begin
  sq := 'select * from TB_FRETE5A Where ligCli = '+IntToStr(idC) + ' and dia >= '+QuotedStr(BD_Dia(dt1, 3))+ ' and dia <= '+QuotedStr(BD_Dia(dt2, 3));
  DM2.Roda_SQL(DM3.sdsFT5A, DM3.cdsFT5A, sq);

end;

procedure TBco.FreteContratoDia_MostraB(idC: Integer; dt1, dt2: tDateTime);
begin
  sq := 'select TB_FRETE5A.*,nRoma - extract(YEAR from dia)* 1000000 as Romaneio from TB_Frete5a Where ligCli = '+IntToStr(idC) + ' and dia >= '+QuotedStr(BD_Dia(dt1, 3))+ ' and dia <= '+QuotedStr(BD_Dia(dt2, 3));
  sq := sq + ' order by ligmot, dia ';
  DM2.Roda_SQL(DM3.sdsFT5B, DM3.cdsFT5B, sq);

end;

procedure TBco.FreteContratoDia_MostraM(idM: Integer; dt1, dt2: tDateTime);
begin
  sq := 'select TB_FRETE5A.*,nRoma - extract(YEAR from dia)* 1000000 as Romaneio from TB_FRETE5A Where ligMot = '+IntToStr(idM) + ' and dia >= '+QuotedStr(BD_Dia(dt1, 3)) + ' and dia <= '+QuotedStr(BD_Dia(dt2, 3));
  DM2.Roda_SQL(DM3.sdsFT5b, DM3.cdsFT5b, sq);

end;

function TBco.FreteContratoDia_Existe(idC, idM: Integer;
  dt: TDateTime): Integer;

var ex : Integer;

begin
  ex := 0;
  sq := 'select * from TB_FRETE5A Where ligCli = '+IntToStr(idC) + ' and ligMot = '+IntToStr(idM) + ' and dia = '+QuotedStr(BD_Dia(dt, 3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 0) then ex := DM2.cdsTMP.Fields[0].Value;
  FreteContratoDia_Existe := ex;
end;

procedure TBco.PagContrato_Altera(vMensal, vAvulso_km,
  vAvulso_hora: Double);
begin
  sq := 'update TB_PAGCONT set ';
  sq := sq + '  vMensal        = '+ Formata_Num(vMensal );
  sq := sq + ', vAvulso_Km     = '+ Formata_Num(vAvulso_Km );
  sq := sq + ', vAvulso_Hora   = '+ Formata_Num(vAvulso_Hora );
  sq := sq + 'WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.PagContrato_Mostra;
begin
  sq := 'select * from TB_PAGCONT Where id = 1';
  DM2.Roda_SQL(DM3.sdsPGCont, DM3.cdsPGCont, sq);
end;

procedure TBco.PagNotas_Altera(SP_nt1, SP_nt2, GSP_nt1, GSP_nt2, INT_nt1,
  INT_nt2: Smallint; SP_mot1, SP_mot2, SP_mot3, SP_Ajud1, SP_Ajud2,
  SP_Ajud3, SP_Extra, GSP_mot1, GSP_mot2, GSP_mot3, GSP_Ajud1, GSP_Ajud2,
  GSP_Ajud3, GSP_Extra, INT_mot1, INT_mot2, INT_mot3, INT_Ajud1, INT_Ajud2,
  INT_Ajud3, INT_Extra: Double);
begin
  sq := 'update TB_PAGNOTA set ';
  sq := sq + '  SP_nt1    = '+ IntToStr(SP_nt1 );
  sq := sq + ', SP_nt2    = '+ IntToStr(SP_nt2 );
  sq := sq + ', SP_mot1   = '+ Formata_Num(SP_mot1);
  sq := sq + ', SP_mot2   = '+ Formata_Num(SP_mot2);
  sq := sq + ', SP_mot3   = '+ Formata_Num(SP_mot3);
  sq := sq + ', SP_ajud1   = '+ Formata_Num(SP_ajud1);
  sq := sq + ', SP_ajud2   = '+ Formata_Num(SP_ajud2);
  sq := sq + ', SP_ajud3   = '+ Formata_Num(SP_ajud3);
  sq := sq + ', SP_Extra   = '+ Formata_Num(SP_Extra);

  sq := sq + ', GSP_nt1    = '+ IntToStr(GSP_nt1 );
  sq := sq + ', GSP_nt2    = '+ IntToStr(GSP_nt2 );
  sq := sq + ', GSP_mot1   = '+ Formata_Num(GSP_mot1);
  sq := sq + ', GSP_mot2   = '+ Formata_Num(GSP_mot2);
  sq := sq + ', GSP_mot3   = '+ Formata_Num(GSP_mot3);
  sq := sq + ', GSP_ajud1   = '+ Formata_Num(GSP_ajud1);
  sq := sq + ', GSP_ajud2   = '+ Formata_Num(GSP_ajud2);
  sq := sq + ', GSP_ajud3   = '+ Formata_Num(GSP_ajud3);
  sq := sq + ', GSP_Extra   = '+ Formata_Num(GSP_Extra);

  sq := sq + ', INT_nt1    = '+ IntToStr(INT_nt1 );
  sq := sq + ', INT_nt2    = '+ IntToStr(INT_nt2 );
  sq := sq + ', INT_mot1   = '+ Formata_Num(INT_mot1);
  sq := sq + ', INT_mot2   = '+ Formata_Num(INT_mot2);
  sq := sq + ', INT_mot3   = '+ Formata_Num(INT_mot3);
  sq := sq + ', INT_ajud1   = '+ Formata_Num(INT_ajud1);
  sq := sq + ', INT_ajud2   = '+ Formata_Num(INT_ajud2);
  sq := sq + ', INT_ajud3   = '+ Formata_Num(INT_ajud3);
  sq := sq + ', INT_Extra   = '+ Formata_Num(INT_Extra);

  sq := sq + ' WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.PagNotas_Mostra;
begin
  sq := 'select * from TB_PAGNOTA Where id = 1';
  DM2.Roda_SQL(DM3.sdsPGnota, DM3.cdsPGnota, sq);
end;

procedure TBco.Pagamento_AlterarKm(numR, tipo, km: Integer);
begin
  sq := 'update TB_ROMA set ';
  sq := sq + '  km        = '+ IntToStr(km );
  sq := sq + ', tipo_pag  = '+ IntToStr(tipo );
  sq := sq + ' WHERE num   = '+IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Pagamento_AlterarValor(numR, tipo: Integer; Valor: Double);
begin
  sq := 'update TB_ROMA set ';
  sq := sq + ' vPag  = '+ Formata_Num(valor);
  sq := sq + ', tipo_pag      = '+ IntToStr(tipo );
  sq := sq + ' WHERE num = '+IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Pagamento_Mostrar(idMot: Integer; dt1, dt2: tDateTime);
begin

  sq := 'select dtRoma, num - extract(YEAR from dtRoma)* 1000000 as Romaneio, count(numnf) as Notas, ';
  sq := sq + ' case TB_ROMA.TIPO_PAG when 1 then '+QuotedStr('Entrega')+' when 2 then '+QuotedStr('Km')+' when 3 then '+QuotedStr('Saída')+' when 4 then '+QuotedStr('Contrato')+' when 5 then '+QuotedStr('Tratado')+' when 6 then '+QuotedStr('Alterado');
  sq := sq + ' when 11 then '+QuotedStr('Entrega*')+' when 12 then '+QuotedStr('Km*')+' when 13 then '+QuotedStr('Saída*')+' when 14 then '+QuotedStr('Contrato*')+' when 15 then '+QuotedStr('Tratado*');
  sq := sq + ' else '+QuotedStr('nao especificado')+' END as Pagm, vPag, km, SUM(Ponto) as Pt, num, Tipo_Carro, TB_ROMA.Tipo_pag, LigAjud, SUM(Peso) as Peso, ligReg ';
  sq := sq + ' from TB_ROMA, TB_NOTAF ';
  sq := sq + ' where TB_ROMA.num = TB_NOTAF.nRoma ';
  sq := sq + ' and ligMot = '+IntToStr(idMot);
  sq := sq + ' and dtRoma between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  sq := sq + devolucoesNaoPagar(3);  // 20, 58 e 90

  sq := sq + ' Group by dtRoma, num, TB_ROMA.tipo_pag, vPag, km, Tipo_Carro, LigAjud, ligReg ';
  sq := sq + ' Order by dtRoma ';

  DM2.Roda_SQL(DM3.sdsPG, DM3.cdsPG, sq);

end;

procedure TBco.Pagamento_ContaCEP_repetidos(nR: Integer);
begin
  sq := 'select CEP, Count(CEP) from tb_Notaf ';
  sq := sq + ' where (nRoma = '+nR.ToString+') ';
  sq := sq + ' group by CEP ';
  sq := sq + ' having Count(CEP)>1 ';
  DM2.Roda_SQL(DM3.sdsPGrepet, DM3.cdsPGrepet, sq);
end;

procedure TBco.Pagamento_ContarCli(tipo, idMot: Integer; dt1,dt2:TDateTime);
begin
  sq := 'select num, count(numnf) as Notas ';
  sq := sq + ' from TB_ROMA, TB_NOTAF ';
  sq := sq + ' where TB_ROMA.num = TB_NOTAF.nRoma ';
  sq := sq + ' and ligMot = '+IntToStr(idMot);
  sq := sq + ' and dtRoma between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  sq := sq + devolucoesNaoPagar(3);  // 20, 58 e 90

  if (tipo = 1)  then   sq := sq + ' and ligCli = 1 '; // Staples
  if (tipo = 22) then   sq := sq + ' and ligCli = 22 '; // Staples Sites
  if (tipo = 3)  then   sq := sq + ' and (ligCli <> 1  and ligCli <> 22)'; // outros

  sq := sq + ' Group by num ';
  sq := sq + ' Order by Num ';

  DM2.Roda_SQL(DM3.sdsPGconta, DM3.cdsPGconta, sq);
end;


procedure TBco.Pagamento_CopiaDados(idMotOrigem, idMotDest: Integer);
begin
  // Apagar tabelas destino
  sq := 'delete from TB_FUNC_PG1 where LigFunc = '+ idMotDest.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
  sq := 'delete from TB_FUNC_PG2 where LigFunc = '+ idMotDest.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
  sq := 'delete from TB_FUNC_PG5 where LigFunc = '+ idMotDest.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');

  // Ler dados
  sq := 'select * from TB_FUNC_PG1 where LigFunc = '+ idMotOrigem.ToString + ' order by tipolocal ';
  DM2.Roda_SQL(DM3.sdsPag1, DM3.cdsPag1, sq );
  sq := 'select * from TB_FUNC_PG2 where LigFunc = '+ idMotOrigem.ToString + ' order by tipolocal ';
  DM2.Roda_SQL(DM3.sdsPag2, DM3.cdsPag2, sq );
  sq := 'select * from TB_FUNC_PG5 where LigFunc = '+ idMotOrigem.ToString + ' order by tipolocal ';
  DM2.Roda_SQL(DM3.sdsPag5, DM3.cdsPag5, sq );

  // Copiar dados PG1
  if (DM3.cdsPag1.RecordCount>0) then
  begin
    DM3.cdsPag1.First;
    while not DM3.cdsPag1.Eof do
    begin
      Pagfaixa_Inserir(idMotDest, DM3.cdsPag1TIPOLOCAL.Value, DM3.cdsPag1INICIO.Value, DM3.cdsPag1FIM.Value, DM3.cdsPag1VALORMOT.AsFloat, DM3.cdsPag1VALORAJUD.AsFloat);
      DM3.cdsPag1.Next;
    end;
  end;

  // Copiar dados PG1
  if (DM3.cdsPag2.RecordCount>0) then
  begin
    DM3.cdsPag2.First;
    while not DM3.cdsPag2.Eof do
    begin
      PagFaixaMais_Inserir(idMotDest, DM3.cdsPag2TIPOLOCAL.Value, DM3.cdsPag2ACIMADE.Value, DM3.cdsPag2VALORMOT.AsFloat, DM3.cdsPag2VALORAJUD.AsFloat,DM3.cdsPag2NOTA_EXTRA.AsFloat,DM3.cdsPag2VMINIMO.AsFloat,DM3.cdsPag2USAPESO.value);
      DM3.cdsPag2.Next;
    end;
  end;

    // Copiar dados PG1
  if (DM3.cdsPag5.RecordCount>0) then
  begin
    DM3.cdsPag5.First;
    while not DM3.cdsPag5.Eof do
    begin
      PagfaixaPeso_Inserir(idMotDest, DM3.cdsPag5TIPOLOCAL.Value, DM3.cdsPag5INICIO.AsFloat, DM3.cdsPag5FIM.AsFloat, DM3.cdsPag5VALOR.AsFloat);
      DM3.cdsPag5.Next;
    end;
  end;

end;

procedure TBco.Pagamento_AlterarTipo(numR, tipo: Integer);
begin
  sq := 'update TB_ROMA set ';
  sq := sq + '  tipo_pag      = '+ IntToStr(tipo );
  sq := sq + 'WHERE num = '+IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Romaneio_NotasCli(numR: Integer);
begin
  sq := 'Select FIRST 2 id, numNF, LigCli FROM TB_NOTAF WHERE NROMA = '+IntToStr(numR);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );
end;

procedure TBco.Funcs_GravaKM(id : Integer; km : Double);
begin
  sq := 'update TB_FUNCS set ';
  sq := sq + '  vKM      = '+ Formata_Num(km );
  sq := sq + 'WHERE id = '+IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar KM');
end;

function TBco.Funcs_LeKM(id: Integer): double;

var r : Double;

begin
  sq := 'Select vKm  FROM TB_FUNCS WHERE id = '+IntToStr(id);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

  r := 0;
  if (DM2.cdsTMP.Fields[0].Value > 0)Then
    r := DM2.cdsTMP.Fields[0].Value;
  Funcs_LeKM := r;
end;

procedure TBco.FreteContratoDia_Notas(idC, idM: Integer; dt: TDateTime);
begin
  sq := 'select Count(numNF), Count(Valor), dtRoma from tb_Notaf, tb_roma ';
  sq := sq + ' where num = nRoma ';
  sq := sq + ' and CAST(dtRoma AS DATE) = '+ QuotedStr(BD_dia(dt, 3));
  sq := sq + ' and ligMot = '+ IntToStr(idM);
  sq := sq + ' and ligCli = '+ IntToStr(idC);
  sq := sq + ' GROUP BY dtRoma ';

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

end;

procedure TBco.Pagamento_Rel1(dt1, dt2: TDateTime);
begin
  // SERV
  sq := 'select ligMot, nome , Sum(vPag) as Valor  ';
  sq := sq + ' from tb_roma Left Join TB_FUNCS on tb_funcs.id = ligMot ';
  sq := sq + ' where CAST(dtRoma AS Date) between '+QuotedStr(BD_DIa(dt1,3))+' and '+QuotedStr(BD_DIa(dt2,3));
  sq := sq + ' Group by LigMot, nome ';
  sq := sq + ' Order by Nome ';

  DM2.Roda_SQL(DM3.sdsPagR1, DM3.cdsPagR1, sq );

end;

procedure TBco.Pagamento_Rel1a(dt1, dt2: TDateTime);
begin
  // VALES
  sq := 'select LigFunc as ligMot, nome , Sum(Valor) as Valor  ';
  sq := sq + ' from TB_VALES Left Join TB_FUNCS on tb_funcs.id = TB_VALES.LIGFUNC ';
  sq := sq + ' where CAST(DATA AS Date) between '+QuotedStr(BD_DIa(dt1,3))+' and '+QuotedStr(BD_DIa(dt2,3));
  sq := sq + ' Group by LigFunc, nome ';
  sq := sq + ' Order by Nome ';

  DM2.Roda_SQL(DM3.sdsPagR1, DM3.cdsPagR1, sq );
end;

procedure TBco.Pagamento_Rel1b(dt1, dt2: TDateTime);
begin
  // CRED
  sq := 'select LigFunc as ligMot, nome , Sum(Valor) as Valor  ';
  sq := sq + ' from TB_CRED Left Join TB_FUNCS on tb_funcs.id = TB_CRED.LIGFUNC ';
  sq := sq + ' where CAST(DATA AS Date) between '+QuotedStr(BD_DIa(dt1,3))+' and '+QuotedStr(BD_DIa(dt2,3));
  sq := sq + ' Group by LigFunc, nome ';
  sq := sq + ' Order by Nome ';

  DM2.Roda_SQL(DM3.sdsPagR1, DM3.cdsPagR1, sq );

end;


procedure TBco.Vale_Altera(id, Tipo: integer;  dtV:TdateTime; Descr: String;
  Valor: Double);
begin
  sq := 'update TB_VALES set ';
  sq := sq + '   Tipo       = '+ IntToStr(Tipo );
  sq := sq + ',  Data       = '+ QuotedStr(BD_DIA(dtV,3));
  sq := sq + ',  Descr      = '+ QuotedStr(Descr);
  sq := sq + ',  Valor      = '+ Formata_Num(Valor );
  sq := sq + 'WHERE id = '+IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Vale');

end;

procedure TBco.Vale_Apaga(id: integer);
begin
  sq := 'delete from TB_VALES ';
  sq := sq + 'WHERE id = '+IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Vale');
end;

procedure TBco.Vale_Insere(idM, Tipo: integer;  dtV:TdateTime; Descr: String;
  Valor: Double);
begin
  sq := 'Insert Into TB_VALES (ligFunc, Tipo, Data, Descr, Valor) VALUES ( ';
  sq := sq + '  '+ IntToStr(idM );
  sq := sq + ', '+ IntToStr(Tipo );
  sq := sq + ', '+ QuotedStr(BD_DIA(dtV,3));
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ Formata_Num(Valor );
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Vale');
end;

procedure TBco.Vale_MostraDatas(idM: integer; dt1, dt2: TDateTime);
begin
  sq := 'Select * FROM TB_VALES WHERE LigFunc = '+IntToStr(idM)+' and CAST(Data As Date) between '+QuotedStr(BD_DIA(dt1,3))+' and '+QuotedStr(BD_DIA(dt2,3));
  DM2.Roda_SQL(DM3.sdsVale, DM3.cdsVale, sq );
end;

procedure TBco.Vale_MostraId(id: integer);
begin
  sq := 'Select * FROM TB_VALES WHERE id = '+IntToStr(id);
  DM2.Roda_SQL(DM3.sdsVale, DM3.cdsVale, sq );
end;

procedure TBco.Vale_Total(idM: integer; dt1, dt2: TDateTime);
begin
  sq := 'Select Count(*), Sum(Valor) FROM TB_VALES WHERE LigFunc = '+IntToStr(idM)+' and CAST(Data As Date) between '+QuotedStr(BD_DIA(dt1,3))+' and '+QuotedStr(BD_DIA(dt2,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );
end;

procedure TBco.CredMot_Altera(id, Tipo: integer; dtV: TdateTime;
  Descr: String; Valor: Double);
begin
  sq := 'update TB_CRED set ';
  sq := sq + '   Tipo       = '+ IntToStr(Tipo );
  sq := sq + ',  Data       = '+ QuotedStr(BD_DIA(dtV,3));
  sq := sq + ',  Descr      = '+ QuotedStr(Descr);
  sq := sq + ',  Valor      = '+ Formata_Num(Valor );
  sq := sq + 'WHERE id = '+IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Vale');
end;

procedure TBco.CredMot_Apaga(id: integer);
begin
  sq := 'delete from TB_CRED ';
  sq := sq + 'WHERE id = '+IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Vale');
end;

procedure TBco.CredMot_Insere(idM, Tipo: integer; dtV: TdateTime;
  Descr: String; Valor: Double);
begin
  sq := 'Insert Into TB_CRED (ligFunc, Tipo, Data, Descr, Valor) VALUES ( ';
  sq := sq + '  '+ IntToStr(idM );
  sq := sq + ', '+ IntToStr(Tipo );
  sq := sq + ', '+ QuotedStr(BD_DIA(dtV,3));
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ Formata_Num(Valor );
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Vale');
end;

procedure TBco.CredMot_MostraDatas(idM: integer; dt1, dt2: TDateTime);
begin
  sq := 'Select * FROM TB_CRED WHERE LigFunc = '+IntToStr(idM)+' and CAST(Data As Date) between '+QuotedStr(BD_DIA(dt1,3))+' and '+QuotedStr(BD_DIA(dt2,3));
  DM2.Roda_SQL(DM4.sdsCred, DM4.cdsCred, sq );
end;

procedure TBco.CredMot_MostraId(id: integer);
begin
  sq := 'Select * FROM TB_CRED WHERE id = '+IntToStr(id);
  DM2.Roda_SQL(DM4.sdsCred, DM4.cdsCred, sq );
end;

procedure TBco.CredMot_Total(idM: integer; dt1, dt2: TDateTime);
begin
  sq := 'Select Count(*), Sum(Valor) FROM TB_CRED WHERE LigFunc = '+IntToStr(idM)+' and CAST(Data As Date) between '+QuotedStr(BD_DIA(dt1,3))+' and '+QuotedStr(BD_DIA(dt2,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );
end;


procedure TBco.Ocorre_PesqNF(no: integer; dt : TdateTime);
begin
  sq := 'select tb_notaf.id, dtRoma, numnf, locali, nConh from tb_notaf, tb_roma where nRoma = num AND nOcorr = '+IntToStr(no)+ ' AND CAST(dtRoma As DATE) = '+QUotedStr(BD_DIA(dt,3))+' Order by NUMNF ';
  DM2.Roda_SQL(DM3.sdsNFoc, DM3.cdsNFoc, sq);
end;

procedure TBco.Credito_Altera(id: Integer; descr: String; dtp: TdateTime);
begin
  sq := 'Update TB_FONTECRED Set ';
  sq := sq + '  Descr    = '+ QuotedStr(Descr);
  sq := sq + ', DataPrev = '+ QuotedStr(BD_DIA(dtp,3));
  sq := sq + '  Where id = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Crédito');
end;

procedure TBco.Credito_Apaga(id: integer);
begin
  sq := 'Delete From  TB_FONTECRED ';
  sq := sq + '  Where id = '+ IntToStr(id );
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Crédito');
end;

procedure TBco.Credito_Insere(idC: Integer; descr: String; dtp: TdateTime);
begin
  sq := 'Insert Into TB_FONTECRED (ligCli, Descr, DataPrev, Status) VALUES ( ';
  sq := sq + '  '+ IntToStr(idC );
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ QuotedStr(BD_DIA(dtp,3));
  sq := sq + ', 0';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Crédito');
end;

procedure TBco.Credito_MostraDesc(idC: Integer; d: String);
begin
  sq := 'select TB_FONTECRED.*, TB_CLIENTE.Nome from TB_FONTECRED, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED.LIGCLI and LigCli = '+IntToStr(idC)+' and UPPER(Descr) like '+QuotedStr(UpperCase(d)+'%');
  DM2.Roda_SQL(DM3.sdsCred, DM3.cdsCred, sq );
end;

procedure TBco.Credito_MostraId(id: integer);
begin
  sq := 'select TB_FONTECRED.*, TB_CLIENTE.Nome from TB_FONTECRED, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED.LIGCLI and TB_FONTECRED.id = '+IntToStr(id);
  DM2.Roda_SQL(DM3.sdsCred, DM3.cdsCred, sq );
end;

procedure TBco.Credito_MostraMes(idC, mes, ano: Integer);

var dt1, dt2 : TDateTime;

begin
  dt1 := EncodeDate(ano, mes, 1);
  mes := mes + 1;
  if (mes = 13) then
  begin
    mes := 1;
    ano := ano +1;
  end;
  dt2 := EncodeDate(ano, mes, 1) - 1;

  sq := 'select TB_FONTECRED.*, TB_CLIENTE.Nome from TB_FONTECRED, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED.LIGCLI and TB_FONTECRED.LigCli = '+IntToStr(idC)+ ' and TB_FONTECRED.DATAPREV >= '+QuotedStr(BD_Dia(dt1,3)) + ' and  TB_FONTECRED.DATAPREV <= '+QuotedStr(BD_Dia(dt2,3)) ;
  DM2.Roda_SQL(DM3.sdsCred, DM3.cdsCred, sq );

end;

procedure TBco.Credito_MostraAno(idC, ano: Integer);
begin
  sq := 'select TB_FONTECRED.*, TB_CLIENTE.Nome from TB_FONTECRED, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED.LIGCLI and TB_FONTECRED.LigCli = '+IntToStr(idC)+' and EXTRACT(YEAR FROM DATAPREV) = '+IntToStr(ano)+' order by TB_FONTECRED.id Desc' ;
  DM2.Roda_SQL(DM3.sdsCred, DM3.cdsCred, sq );
end;

procedure TBco.Credito_MostraItens(idM:Integer);
begin
  sq := 'select id, numRoma, numRoma - CAST(numRoma / 1000000 AS INTEGER)* 1000000 as Romaneio ';
  sq := sq + ' , case status when 0 then '+QuotedStr('emitido')+' when 1 then '+QuotedStr('pronto')+' when 2 then '+QuotedStr('emitido')+' end as relStatus ';
  sq := sq + ', dtEmissao, vfretet, nCob from TB_RELAT  WHERE nCob = '+ IntToStr(idM);
  sq := sq + ' ORDER BY numRoma ';

  DM2.Roda_SQL(DM3.sdsRelV, DM3.cdsRelV, sq);

end;

procedure TBco.FreteContratoDia_Romaneios(idC, idM: Integer; dt1,
  dt2: TDateTime);
begin
  sq := 'select TB_ROMA.id,  dtRoma, num,SUM( TB_NOtaf.VALOR), COUNT(tb_notaf.numnf), TB_ROMA.Tipo_Pag, num - extract(YEAR from dtRoma)* 1000000 as Romaneio ';
  sq := sq + ' from Tb_ROMA, TB_Notaf ';
  sq := sq + ' Where TB_ROMA.num = tb_Notaf.NROMA ';
  sq := sq + ' and LigCli = '+IntToStr(idC);
  sq := sq + ' and LigMot = '+IntToStr(idM);
  sq := sq + ' and CAST(dtRoma AS Date) between  '+QuotedStr(BD_Dia(dt1,3)) +' and '+ QuotedSTr(BD_Dia(dt2,3));  sq := sq + ' group by TB_ROMA.id,  dtRoma, num, Tb_roma.tipo_Pag ';

  DM2.Roda_SQL(DM3.sdsRomaC, DM3.cdsRomaC, sq);

end;

procedure TBco.FreteContratoDia_Romaneio(idC, idM: Integer; dt1,
  dt2: TDateTime);
begin
  sq := 'Select DISTINCT dtRoma, ligMot,  NUm, ligCli, num - extract(YEAR from dtRoma)* 1000000 as Romaneio ';
  sq := sq + ' from TB_ROMA, TB_NOTAF  ';
  sq := sq + ' Where TB_ROMA.num = tb_Notaf.NROMA ';
  sq := sq + ' and dtRoma between  '+QuotedStr(BD_Dia(dt1,3)) +' and '+ QuotedSTr(BD_Dia(dt2,3));
  sq := sq + ' and LigMot = '+IntToStr(idM);
  sq := sq + ' and LigCli = '+IntToStr(idC);
  sq := sq + ' ';

  DM2.Roda_SQL(DM3.sdsRomaC, DM3.cdsRomaC, sq);

end;

function TBco.Funcs_Ultimo: Integer;
begin
  sq := 'select First 2 * from TB_FUNCS order by id Desc';
  DM2.Roda_SQL(DM1.sdsFuncs, DM1.cdsFuncs, sq);

  DM1.cdsFuncs.First;

  Funcs_Ultimo := DM1.cdsFuncsID.Value;

end;



procedure TBco.FreteContrato_Grava(idNF, Tipo_Cob: Integer;
  vFrete: Double);
begin
  sq := 'Update TB_NOTAF Set ';
  sq := sq + '  Tipo_Cob = '+ IntToStr(Tipo_Cob);
  sq := sq + ', vFrete   = '+ Formata_Num(vFrete);;
  sq := sq + '  Where id = '+ IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Nota');
end;

procedure TBco.FreteContrato_Notas(nRoma: Integer);
begin
  sq := 'Select id, numNF, Valor, TipoLocal, Ponto from TB_Notaf where nRoma = '+IntToStr(nRoma);
  DM2.Roda_SQL(DM3.sdsFT5n, DM3.cdsFT5n, sq);
end;

procedure TBco.Credito2_Altera(id: Integer; descr: String; DataPrev: TdateTime; km:Integer; Hora:Double; vMensal, KmC, vKm, HoraC, vHora, SegNotas, vSeg, VCalc, Vdesp:Double; dt1,dt2:TDateTime);
begin
  sq := 'Update TB_FONTECRED2 Set ';
  sq := sq + '  Descr     = '+ QuotedStr(Descr);
  sq := sq + ', vCalc     = '+ Formata_Num(vCalc);
  sq := sq + ', dataPrev  = '+ QuotedStr(BD_Dia(dataPrev,3));
  sq := sq + ', vMensal   = '+ Formata_Num(vMensal);
  sq := sq + ', Km        = '+ IntToStr(Km);
  sq := sq + ', KmC       = '+ Formata_Num(KmC);
  sq := sq + ', vKm       = '+ Formata_Num(vKm);
  sq := sq + ', Hora      = '+ Formata_Num(Hora);
  sq := sq + ', HoraC     = '+ Formata_Num(HoraC);
  sq := sq + ', vHora     = '+ Formata_Num(vHora);
  sq := sq + ', SegNotas  = '+ Formata_Num(SegNotas);
  sq := sq + ', vSeg      = '+ Formata_Num(vSeg);
  sq := sq + ', vDespesas = '+ Formata_Num(vDesp);
  sq := sq + ', dt1       = '+ QuotedStr(BD_Dia(dt1,3));
  sq := sq + ', dt2       = '+ QuotedStr(BD_Dia(dt2,3));
  sq := sq + '  Where id  = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Crédito2');
end;

procedure TBco.Credito2_Apaga(id: integer);
begin
  sq := sq + 'Delete FROM TB_FONTECRED2 ';
  sq := sq + '  Where id  = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Crédito2');
end;

procedure TBco.Credito2_Insere(idC: Integer; descr: String; DataPrev: TdateTime; km:Integer; Hora:Double; vMensal, KmC, vKm, HoraC, vHora, SegNotas, vSeg, VCalc, Vdesp:Double; dt1,dt2:TDateTime);
begin
  sq := 'Insert into TB_FONTECRED2 (LigCli, Descr, vCalc, dataPrev, vMensal, Km,  ';
  sq := ' KmC, vKm, Hora, HoraC, vHora, SegNotas, vSeg, vDespesas, dt1, dt2, Status, vReal) Values ( ';
  sq := sq + '  '+ IntToStr(idC);
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ Formata_Num(vCalc);
  sq := sq + ', '+ QuotedStr(BD_Dia(dataPrev,3));
  sq := sq + ', '+ Formata_Num(vMensal);
  sq := sq + ', '+ IntToStr(Km);
  sq := sq + ', '+ Formata_Num(KmC);
  sq := sq + ', '+ Formata_Num(vKm);
  sq := sq + ', '+ Formata_Num(Hora);
  sq := sq + ', '+ Formata_Num(HoraC);
  sq := sq + ', '+ Formata_Num(vHora);
  sq := sq + ', '+ Formata_Num(SegNotas);
  sq := sq + ', '+ Formata_Num(vSeg);
  sq := sq + ', '+ Formata_Num(vDesp);
  sq := sq + ', '+ QuotedStr(BD_Dia(dt1,3));
  sq := sq + ', '+ QuotedStr(BD_Dia(dt2,3));
  sq := sq + ', 0, 0';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Crédito2');
end;

procedure TBco.Credito2_MostraAno(idC, ano: Integer);
begin
  sq := 'select TB_FONTECRED2.*, TB_CLIENTE.Nome from TB_FONTECRED2, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED2.LIGCLI ';
  sq := sq + ' and ligCli = '+IntToStr(idC)+ ' and extract(YEAR from dataPrev) = '+IntToStr(ano);
  DM2.Roda_SQL(DM3.sdsCred2, DM3.cdsCred2, sq);
end;

procedure TBco.Credito2_MostraId(id: integer);
begin
  sq := 'select TB_FONTECRED2.*, TB_CLIENTE.Nome from TB_FONTECRED2, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED2.LIGCLI ';
  sq := sq + ' and id = '+IntToStr(id);
  DM2.Roda_SQL(DM3.sdsCred2, DM3.cdsCred2, sq);
end;

procedure TBco.Credito2_Existe(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select TB_FONTECRED2.*, TB_CLIENTE.Nome from TB_FONTECRED2, TB_CLIENTE where TB_CLIENTE.id = TB_FONTECRED2.LIGCLI ';
  sq := sq + ' and ligCli = '+IntToStr(idC)+ ' and dt1 = '+QuotedStr(BD_Dia(dt1,3))+ ' and dt2 = '+QuotedStr(BD_Dia(dt2,3));
  DM2.Roda_SQL(DM3.sdsCred2, DM3.cdsCred2, sq);
end;

procedure TBco.Credito2_MarcaDias(id, idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'Update TB_FRETE5A Set ';
  sq := sq + '  LigCred2 = '+ IntToStr(id);
  sq := sq + '  Where ligCli = '+IntToStr(idC)+ ' and dia >= '+QuotedStr(BD_Dia(dt1,3))+ ' and dia <= '+QuotedStr(BD_Dia(dt2,3));
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Notaito');
end;

procedure TBco.Credito2_MostraItens(id: Integer);
begin
  sq := 'select TB_FRETE5A.*,nRoma - extract(YEAR from dia)* 1000000 as Romaneio from  TB_Frete5a Where ';
  sq := sq + ' ligCred2 = '+IntToStr(id);
  sq := sq + ' Order by ligMot, dia ';

  DM2.Roda_SQL(DM3.sdsFT5b, DM3.cdsFT5b, sq);
end;

procedure TBco.Credito2_AlteraD(id: Integer; descr: String;
  DataPrev: TdateTime);
begin
  sq := 'Update TB_FONTECRED2 Set ';
  sq := sq + '  Descr     = '+ QuotedStr(Descr);
  sq := sq + ', dataPrev  = '+ QuotedStr(BD_Dia(dataPrev,3));
  sq := sq + '  Where id  = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Crédito2');

end;

procedure TBco.Credito2_InsereD(idC: Integer; descr: String;
  DataPrev: TdateTime);
begin
  sq := 'Insert into TB_FONTECRED2 (LigCli, Descr,  dataPrev, Status) Values ( ';
  sq := sq + '  '+ IntToStr(idC);
  sq := sq + ', '+ QuotedStr(Descr);
  sq := sq + ', '+ QuotedStr(BD_Dia(dataPrev,3));
  sq := sq + ', 0';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Crédito2');

end;

procedure TBco.FreteContratoDia_Notas2(idCred2: Integer);
begin
  sq := 'select TB_Frete5a.dia, TB_Frete5a.nroma, TB_Frete5a.nroma - extract(YEAR from TB_Frete5a.dia)* 1000000 as Romaneio, hrextra, kmextra, vhr, vkm, ligCred2, numnf, locali, valor, vFrete from TB_NOTAF, TB_FRETE5A where TB_FRETE5A.NROMA = TB_NOTAF.NROMA ';
  sq := sq + ' and TB_NOTAF.NROMA > CAST( TB_NOTAF.NROMA/1000000 AS Integer)*1000000';
  sq := sq + ' and LigCred2 = ' + intToStr(idCred2);
  sq := sq + ' Order by dia ';
  DM2.Roda_SQL(DM3.sdsrelSeg, DM3.cdsRelSeg, sq);

end;

procedure TBco.Notas_Baixa(nNF, idCli: Integer);

var resp : String;

begin
  resp := '-';
  sq := 'select first 2 TB_NOTAF.id, descr, dtEnt, vFrete, nConh, Valor, Peso from TB_NOTAF, TB_Ocorre where ';
  sq := sq + ' numNF = '+ IntToStr(nNF);
  sq := sq + ' and ligCli= '+IntToStr(idCli);
  sq := sq + ' and nOcorr = num ';
  sq := sq + ' order by TB_NOTAF.id desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.Notas_BaixaGrupo(idCli, nfinicio, nffim : Integer);

begin
  sq := 'select nf.id, nf.NUMNF, nf.ENTREGUE, nf.STATUS_ENT, nf.NOCORR, nf.DTENT, nf.HRENT, ho.DESCR, nf.DTCRIA, nf.nRoma, nf.dtOcoren, nf.cep, nf.Recebedor  ';
  sq := sq + ' from tb_NOTAF nf, TB_OCORRE ho ';
  sq := sq + ' Where nf.NOCORR = ho.NUM  ';
  sq := sq + ' and nf.dtCria > '+ QuotedStr(BD_dia(Now-180,3));
  sq := sq + ' and nf.ligcli = '+ IntToStr(idCli);
  sq := sq + ' and nf.numnf between '+ IntToStr(nfinicio)+ ' and ' + IntToStr(nffim);;
  sq := sq + ' ORDER BY nf.NUMNF, nf.id desc ';
  DM2.Roda_SQL(DM4.sdsNFo, DM4.cdsNFo, sq);
end;

procedure TBco.Notas_BaixaGrupo2();
begin
  sq := 'Select numnf, numped, ligcli from Tb_Notaf ';
  sq := sq + ' where dtcria > CURRENT_DATE - 180 and  not (numped is null) ';
  sq := sq + ' order by numped desc  ';
  DM2.Roda_SQL(DM3.sdsPED, DM3.cdsPED, sq);
end;

procedure TBco.Romaneio_PesqDT(dt: TDateTime);
begin
  sq := 'Select Num, km, num - extract(YEAR from dtRoma)* 1000000 as Romaneio, Nome, Count(TB_Notaf.id) as SemBaixa, Sum(vFrete) as Frete, SUM(Peso) as pesoR ';
  sq := sq + ' from TB_Roma Left Join Tb_Notaf on ((num=nRoma)  and (Status_ENT=0)), TB_Funcs ';
  sq := sq + ' where (TB_ROMA.LIGMOT = TB_FUNCS.id) and  (dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';
  sq := sq + ' group by num, dtroma, Nome, km ';

  DM2.Roda_SQL(DM3.sdsRomaPQ, DM3.cdsRomaPQ, sq);
end;

procedure TBco.Romaneio_PesqDT2(dt: TDateTime);
begin
  sq := 'Select Num, km, num - extract(YEAR from dtRoma)* 1000000 as Romaneio, Nome, Count(TB_Notaf.id) as SemBaixa, Sum(vFrete) as Frete, SUM(Peso) as pesoR ';
  sq := sq + ' from TB_Roma Left Join Tb_Notaf on (num=nRoma), TB_Funcs ';
  sq := sq + ' where (TB_ROMA.LIGMOT = TB_FUNCS.id) and  (dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';
  sq := sq + ' group by num, dtroma, Nome, km ';

  DM2.Roda_SQL(DM3.sdsRomaPQ, DM3.cdsRomaPQ, sq);
end;

procedure TBco.Romaneio_PesqDT3(dt: TDateTime);
begin
  sq := 'Select cc.id as idCLI,  cc.NOME, count(nn.NUMNF)  ';
  sq := sq + ' from TB_Cliente cc, TB_Roma rr , Tb_Notaf nn ';
  sq := sq + ' where (rr.num=nn.nRoma)  and (nn.ligcli = cc.ID) ';
  sq := sq + ' and nn.NROMA > 0 ';
  sq := sq + ' and (rr.dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';
  sq := sq + ' group by cc.ID, cc.NOME ';

  DM2.Roda_SQL(DM3.sdsRomaPQ2, DM3.cdsRomaPQ2, sq);
end;

procedure TBco.Romaneio_PesqDT4(dt: TDateTime);
begin
  sq := 'Select cc.id as idCLI,  cc.NOME, count(nn.NUMNF)  ';
  sq := sq + ' from TB_Cliente cc, TB_Roma rr , Tb_Notaf nn ';
  sq := sq + ' where (rr.num=nn.nRoma)  and (nn.ligcli = cc.ID) ';
  sq := sq + ' and nn.NROMA > 0 ';
  sq := sq + ' and nn.STATUS_ENT = 0 ';
  sq := sq + ' and (rr.dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';
  sq := sq + ' group by cc.ID, cc.NOME ';

  DM2.Roda_SQL(DM3.sdsRomaPQ2, DM3.cdsRomaPQ2, sq);
end;

procedure TBco.Romaneio_PesqDT5(dt: TDateTime);
begin
  sq := 'Select NUM from TB_Roma ';
  sq := sq + ' where (dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

function  TBco.Romaneio_PesqDT_Total(dt: TDateTime):Integer;
begin
  sq := 'Select count(*) ';
  sq := sq + ' from TB_Roma Left Join Tb_Notaf on ((num=nRoma) ) ';
  sq := sq + ' where (dtRoma = '+ QuotedStr(BD_dia(dt,3))+') ';

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  Romaneio_PesqDT_Total := DM2.cdsTMP.Fields[0].Value;
end;


procedure TBco.Notas_ListaReent(dt: TDateTime);
begin
  sq := 'select dtRoma, NumNF, NRoma, ProxRoma, nRoma - Cast(nRoma/1000000 as integer)*1000000 as Atual, ';
  sq := sq + ' ProxRoma - Cast(ProxRoma/1000000 as integer)*1000000 as Prox, TB_NOTAF.id as idNF, ligCli, nocorr, dtBaixa ';
  sq := sq + ' from TB_Notaf, TB_Roma, TB_OCORRE ';
  sq := sq + ' where TB_Roma.Num = Tb_Notaf.NRoma ';
  sq := sq + ' and TB_Ocorre.NUM = TB_Notaf.NOCORR  ';
  sq := sq + ' and TB_Ocorre.uso = 2 ';
  sq := sq + ' and dtRoma = '+QuotedStr(BD_dia(dt,3))+' order by ProxRoma, NumNf ';
  DM2.Roda_SQL(DM3.sdsProx, DM3.cdsProx, sq);

end;

procedure TBco.Funcs_Lista;
begin
  sq := 'select TB_FUNCS.ID, Nome, CPF, RG, DtCad, DtNasc, ';
  sq := sq + ' Ch, CHvalidade, CHcategoria, seg, segValidade, ';
  sq := sq + ' TB_FUNCENDER.ender, TB_FUNCENDER.Numero, Complemento, ';
  sq := sq + ' Bairro, Cidade, Estado, CEP, ';
  sq := sq + ' TB_FUNCTEL.DESCRICAO, TB_FUNCTEL.NUMERO, ';
  sq := sq + ' TB_FUNCCAR.ANO, TB_FUNCCAR.VEICULO, TB_FUNCCAR.PLaca ';
  sq := sq + ' from TB_FUNCS LEFT JOIN TB_FUNCENDER on TB_FUNCS.id = TB_FUNCENDER.FUNC_ID  ';
  sq := sq + ' LEFT JOIN TB_FUNCTEL on TB_FUNCS.id = TB_FUNCTEL.FUNC_ID ';
  sq := sq + ' LEFT JOIN TB_FUNCCAR on TB_FUNCS.id = TB_FUNCCAR.LIGFUNC ';
  sq := sq + ' Order by Nome ';
  DM2.Roda_SQL(DM3.sdsFuncLi, DM3.cdsFuncLi, sq);
end;

procedure TBco.Funcs_ListaFat(ativo: Integer);
begin
  if ativo<>1 then DM4.cdsMot.Filtered := False
  else
  begin
    DM4.cdsMot.Filter := 'Ativo = 1';
    DM4.cdsMot.Filtered := True;
  end;
end;

procedure TBco.Notas_SemMarca(dta, dtb: TDateTime);
begin
  sq := 'select dtRoma, NumNF, NRoma, ProxRoma, nRoma - Cast(nRoma/1000000 as integer)*1000000 as Atual, ';
  sq := sq + ' ProxRoma - Cast(ProxRoma/1000000 as integer)*1000000 as Prox, TB_NOTAF.id as idNF, ligCli, nocorr, dtBaixa ';
  sq := sq + ' from TB_Notaf, TB_Roma, TB_OCORRE ';
  sq := sq + ' where TB_Roma.Num = Tb_Notaf.NRoma ';
  sq := sq + ' and Status_TKT = 0 ';
  sq := sq + ' and nOcorr IN (Select NUM from TB_OCORRE where USO = 1) ';
  sq := sq + ' and dtRoma >= '+QuotedStr(BD_dia(dta,3));
  sq := sq + ' and dtRoma <= '+QuotedStr(BD_dia(dtb,3));
  sq := sq + ' order by Nroma, NumNf ';
  DM2.Roda_SQL(DM3.sdsProx, DM3.cdsProx, sq);
end;

function TBco.Notas_semWEB: integer;
  var idPesq:integer;
begin
  //idPesq := Config_DTP_MostraN;
  sq := 'select COUNT(id) from TB_Notaf where  baixa_orig >10 and nocorr>0 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  idPesq := 0;
  idPesq := DM2.cdsTMP.Fields[0].AsInteger;

  result := idPesq;
end;

procedure TBco.ConhecNF_PesqData(dt1, dt2: TdateTime; idCli: Integer);
begin
  sq := 'select a.*, b.DTENT from TB_Conhec a, TB_Notaf b where a.LIGNOTA=b.id ';
  sq := sq + '  and a.dataC between '+ QuotedStr(BD_Dia(dt1,3))+ ' and '+QuotedStr(BD_Dia(dt2,3));
  //sq := sq + '  and StatusEnvio = 4 ';
  if (idCli > 0) then sq := sq + '  and a.LigCli = '+ IntToStr(idCli);
  //if (idCli = 0) then sq := sq + '  and CTeEmite = 1 ';
  sq := sq + '  ORder by a.NumC ';

  DM2.Roda_SQL(DM4.sdsConh2, DM4.cdsConh2, sq);

end;

procedure TBco.ConhecNF_PesqDOCCOB(nDOC: Integer);
begin

end;

procedure TBco.Conhec_AlteraCalc(idCte, NumNota, NumC, idNota: Integer; FretePeso,
  FreteValor, SecCat, Despacho, Pedagio, Outros, Total, Base, AliQ,
  ICMS, AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao: double; dtR : TDateTime; MotNome, MotPlaca, Motveiculo : String);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  FretePeso  = '+ Formata_Num(FretePeso);
  sq := sq + ', FreteValor = '+ Formata_Num(FreteValor);
  sq := sq + ', SecCat     = '+ Formata_Num(SecCat);
  sq := sq + ', Despacho   = '+ Formata_Num(Despacho);
  sq := sq + ', Pedagio    = '+ Formata_Num(Pedagio);
  sq := sq + ', Outros     = '+ Formata_Num(Outros);
  sq := sq + ', Total      = '+ Formata_Num(Total);
  sq := sq + ', Base       = '+ Formata_Num(Base);
  sq := sq + ', AliQ       = '+ Formata_Num(Aliq);
  sq := sq + ', ICMS       = '+ Formata_Num(ICMS);
  sq := sq + ', Status     = 0';
  sq := sq + ', Status_EDI = 0';
  sq := sq + ', DataC      = '+ QuotedStr(BD_Dia(dtR,3));
  sq := sq + ', MotNome    = '+ QuotedStr(MotNome);
  sq := sq + ', MotPlaca   = '+ QuotedStr(MotPlaca);
  sq := sq + ', MotVeiculo = '+ QuotedStr(MotVeiculo);
  sq := sq + ', AdicPeso   = '+ Formata_Num(AdicPeso);
  sq := sq + ', Gris       = '+ Formata_Num(Gris);
  sq := sq + ', TxCte      = '+ Formata_Num(TxCte);
  sq := sq + ', TDE        = '+ Formata_Num(TDE);
  sq := sq + ', Ponto      = '+ Formata_Num(Ponto);
  sq := sq + ', Devolucao  = '+ Formata_Num(Devolucao);
  sq := sq + ', NumNota    = '+ IntToStr(NumNota);
  sq := sq + ', LigNota    = '+ IntToStr(idNota);


  sq := sq + '  Where id = '+ IntToStr(idCTe);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Conhecimentos');
end;


procedure TBco.Conhec_AlteraEmissao(idC: integer; dt: TDateTime);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  DataC      = '+ QuotedStr(BD_Dia(dt,3));
  sq := sq + '  Where id = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Conhecimentos');

end;

procedure TBco.Conhec_AlteraValores(idCTe:integer; FretePeso, FreteValor, SecCat,
  Despacho, Pedagio, Outros, Total, Base, AliQ, ICMS, AdicPeso, Gris, TxCte,
  TDE, Ponto, Devolucao: double);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  FretePeso  = '+ Formata_Num(FretePeso);
  sq := sq + ', FreteValor = '+ Formata_Num(FreteValor);
  sq := sq + ', SecCat     = '+ Formata_Num(SecCat);
  sq := sq + ', Despacho   = '+ Formata_Num(Despacho);
  sq := sq + ', Pedagio    = '+ Formata_Num(Pedagio);
  sq := sq + ', Outros     = '+ Formata_Num(Outros);
  sq := sq + ', Total      = '+ Formata_Num(Total);
  sq := sq + ', Base       = '+ Formata_Num(Base);
  sq := sq + ', AliQ       = '+ Formata_Num(Aliq);
  sq := sq + ', ICMS       = '+ Formata_Num(ICMS);
  sq := sq + ', AdicPeso   = '+ Formata_Num(AdicPeso);
  sq := sq + ', Gris       = '+ Formata_Num(Gris);
  sq := sq + ', TxCte      = '+ Formata_Num(TxCte);
  sq := sq + ', TDE        = '+ Formata_Num(TDE);
  sq := sq + ', Ponto      = '+ Formata_Num(Ponto);
  sq := sq + ', Devolucao  = '+ Formata_Num(Devolucao);

  sq := sq + '  Where id = '+ IntToStr(idCTe);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Conhecimentos');

end;

procedure TBco.Conhec_InsereCalc(LigTransp, NumNota, LigCli, Serie: Integer; FretePeso,
  FreteValor, SecCat, Despacho, Pedagio, Outros, Total, Base, AliQ,
  ICMS, AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao: double; idNF, grupo : Integer; dtR : TDateTime; MotNome, MotPlaca, Motveiculo : String);
begin
  sq := 'Insert INTO TB_CONHEC (LigTransp, FretePeso, FreteValor, SecCat, ';
  sq := sq + ' Despacho, Pedagio, Outros, Total, Base, AliQ, ICMS, Status, Status_EDI, DataC, ';
  sq := sq + ' NumNota, LigCli, LigNota, MotNome, MotPlaca, MotVeiculo, ';
  sq := sq + ' Serie, StatusEnvio, StatusIMP, Arquivo, ';
  sq := sq + ' AdicPeso, Gris, TxCte, TDE, Ponto, Devolucao, Grupo, Tomador, Tomador_ie) values ( ';
  sq := sq + '  '+ IntToStr(LigTransp);
  sq := sq + ', '+ Formata_Num(FretePeso);
  sq := sq + ', '+ Formata_Num(FreteValor);
  sq := sq + ', '+ Formata_Num(SecCat);
  sq := sq + ', '+ Formata_Num(Despacho);
  sq := sq + ', '+ Formata_Num(Pedagio);
  sq := sq + ', '+ Formata_Num(Outros);
  sq := sq + ', '+ Formata_Num(Total);
  sq := sq + ', '+ Formata_Num(Base);
  sq := sq + ', '+ Formata_Num(Aliq);
  sq := sq + ', '+ Formata_Num(ICMS);
  sq := sq + ', 0';
  sq := sq + ', 0';
  sq := sq + ', '+ QuotedStr(BD_Dia(dtR,3));
  sq := sq + ', '+ IntToStr(NumNota);
  sq := sq + ', '+ IntToStr(LigCli);
  sq := sq + ', '+ IntToStr(idNF);
  sq := sq + ', '+ QuotedStr(MotNome);
  sq := sq + ', '+ QuotedStr(MotPlaca);
  sq := sq + ', '+ QuotedStr(MotVeiculo);
  sq := sq + ', '+ IntToStr(Serie);
  sq := sq + ',0';
  sq := sq + ',0';
  sq := sq + ', '+ QuotedStr('-');       // sem Arquivo
  sq := sq + ', '+ Formata_Num(AdicPeso);
  sq := sq + ', '+ Formata_Num(Gris);
  sq := sq + ', '+ Formata_Num(TxCte);
  sq := sq + ', '+ Formata_Num(TDE);
  sq := sq + ', '+ Formata_Num(Ponto);
  sq := sq + ', '+ Formata_Num(Devolucao);
  sq := sq + ', '+ IntToStr(grupo);
  sq := sq + ',0, 1'; // Tomador e TomaIe
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Conhecimentos');

end;

procedure TBco.Conhec_MostraData(idC: integer; dt1, dt2: TDateTime; todos:boolean);
  var ListaNaoGera : String;

begin

  ListaNaoGera := DM2.Lista('TB_OCORRE', 'geracte = 0', 'NUM', false );

  sq := 'select dtRoma, numnf, valor, nConh, TipoLocal, TB_NOTAF.id As idNota, ';
  sq := sq + ' CEP, TB_NOTAF.LigCli, nRoma, nRoma - extract(YEAR from dtRoma)* 1000000 as Romaneio, CteGrupo, Peso ';
  sq := sq + ' From TB_NOTAF, TB_ROMA ';
  sq := sq + ' where nRoma = num ';
  //sq := sq + ' and  nOcorr <> 20 and nOcorr <> 58 ';  // retira Prejudicado=20 e Veiculo Quebrado=58
  if not todos then sq := sq + ' and nconh = 0 ';
  sq := sq + ' and not (nocorr in ('+ListaNaoGera+')) ';
  sq := sq + ' and  Origem <> 2 '; // retira Coletas
  if (idC > 0) then sq := sq + ' and ligCli= '+ IntToStr(idC);
  //if (idC = 0) then sq := sq + ' and CTeEmite=1 ';

  sq := sq + ' and dtRoma between '+ QuotedStr(BD_Dia(dt1,3))+' and '+ QuotedStr(BD_Dia(dt2,3));
  //sq := sq + ' and nConh=0 ';

  sq := sq + ' order by TB_NOTAF.CEP, CteGrupo ';
  DM2.Roda_SQL(DM4.sdsCT, DM4.cdsCT, sq);
end;


procedure TBco.Conhec_MostraDataNaoGeradosGrupo(dt1, dt2: TDateTime);
  var ListaClientes, ListaNaoGera : String;

begin

  ListaNaoGera := DM2.Lista('TB_OCORRE', 'geracte = 0', 'NUM', false );
  ListaClientes := DM2.Lista('TB_CLIENTE', 'cteEmite = 1', 'ID', false );

  sq := 'select a.ligcli, b.NOME, COUNT(*) as QT from TB_NOTAF a, TB_CLIENTE b, TB_ROMA c where (a.LIGCLI = b.id)  and a.NCONH = 0 and a.nroma=c.num  ';
  sq := sq + ' and (LigCli in ('+ListaClientes+')) ';
  sq := sq + ' and not (nocorr in ('+ListaNaoGera+')) ';
  sq := sq + ' and  a.Origem <> 2 '; // retira Coletas
  sq := sq + ' and c.dtRoma between '+ QuotedStr(BD_Dia(dt1,3))+' and '+ QuotedStr(BD_Dia(dt2,3));

  sq := sq + ' group by a.ligCli, b.Nome ';
  sq := sq + ' order by  b.Nome ';
  DM2.Roda_SQL(DM4.sdsCTng, DM4.cdsCTng, sq);

end;

procedure TBco.Conhec_MostraGrupo(nGrupo: Integer);
begin
  sq := 'Select id, ligcli, numnf, valor, peso, volume FROM TB_Notaf WHERE ctegrupo = ' + nGrupo.ToString;
  DM2.Roda_SQL(DM4.sdsGrupo, DM4.cdsgrupo, sq);
end;

procedure TBco.Conhec_MostraID(idCte: Integer);
begin
  sq := 'Select * from TB_CONHEC where id = '+ IntToStr(idCte);
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Conhec_MostraTransp(idC: integer; dt: TDateTime; reg:Integer);
begin
  sq := 'select TB_NOTAF.id, numnf, valor, fantasia, ligtransp, TB_NOTAF.cep, CteGrupo ';
  sq := sq + ' from TB_NOTAF ,TB_Transp, TB_ROMA ';
  sq := sq + ' where nRoma = num ';
  sq := sq + ' and ligtransp=TB_TRANSP.id ';
  sq := sq + ' and  nOcorr <> 20 and nOcorr <> 58 ';  // retira Prejudicado=20 e Veiculo Quebrado=58
  sq := sq + ' and  Origem <> 2 '; // retira Coletas
  if (idC > 0) then sq := sq + ' and ligCli= '+ IntToStr(idC);
  sq := sq + ' and dtRoma= '+ QuotedStr(BD_Dia(dt,3));
  //sq := sq + ' and nConh=0 ';

  sq := sq + ' order by TB_NOTAF.cep ';
  DM2.Roda_SQL(DM4.sdsTr, DM4.cdsTr, sq);
end;

procedure TBco.Conhec_MarcaTransp(idNF, LigTransp: integer);
begin
  sq := 'Update TB_NOTAF Set ';
  sq := sq + '  LigTransp     = '+ IntToStr(ligTransp);
  sq := sq + '  Where id = '+ IntToStr(idNF)+' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Transp');
end;

procedure TBco.Conhec_Status(idC, NumNota, Status: Integer);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  Status     = '+ IntToStr(Status);
  sq := sq + '  Where NumNota = '+ IntToStr(NumNota)+' and LigCli = '+IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Status');
end;

procedure TBco.Conhec_StatusEDI(idC, NumNota, StatusEDI: integer);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  Status_EDI    = '+ IntToStr(StatusEDI);
  sq := sq + '  Where NumNota = '+ IntToStr(NumNota)+' and LigCli = '+IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');
end;

function TBco.Conhec_TomadorLe(idCte: Integer): Smallint;
  var resp : Smallint;
begin
  resp := 0;
  sq := 'select Tomador from TB_Conhec  ';
  sq := sq + ' Where id = '+IntToStr(idCte);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if DM2.cdsTMP.RecordCount>0 then
    if DM2.cdsTMP.Fields[0].Value<> null then
      resp := DM2.cdsTMP.Fields[0].Value;
  result := resp;
end;

function TBco.Conhec_TomadorLeIe(idCte: Integer): Smallint;
  var resp : Smallint;
begin
  // cb=0 // 9- Não Contribuinte
  // cb=1 // 1- Contribuinte ICMS
  // cb=2 // 2- Contribuinte ISENTO
  resp := 0;
  sq := 'select Tomador_Ie from TB_Conhec  ';
  sq := sq + ' Where id = '+IntToStr(idCte);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if DM2.cdsTMP.RecordCount>0 then
    if DM2.cdsTMP.Fields[0].Value<> null then
    begin
      if (DM2.cdsTMP.Fields[0].Value<>9) then
        resp := DM2.cdsTMP.Fields[0].Value;
    end;
  result := resp;
end;

procedure TBco.Conhec_TomadorSalva(idCTe, Toma, TomaIe: Integer);
begin
  sq := 'Update TB_CONHEC Set ';
  sq := sq + '  TOMADOR  = '+ IntToStr(Toma);
  sq := sq + ', TOMADOR_IE  = '+ IntToStr(TomaIe);
  sq := sq + '  Where id = '+ IntToStr(idCte)+' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Tomador');

end;

function TBco.Conhec_ExisteNF(idNF: integer): Boolean;

var b : Boolean;


begin
  sq := 'select id from TB_Conhec  ';
  sq := sq + ' Where LigNota = '+IntToStr(idNF);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  b := False;
  if (DM2.cdsTMP.RecordCount > 0) then b:= True;

  Conhec_ExisteNF := b;
end;

procedure TBco.Conhec_GrupoSoma(nGrupo: Integer; dia: TDateTime);
begin
  sq := 'select sum(Peso), sum(Valor) from TB_Notaf  ';
  sq := sq + ' Where CteGrupo = '+IntToStr(nGrupo);
  sq := sq + ' and dtnota > '+QuotedStr(BD_dia(dia-30,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

end;

procedure TBco.Conhec_PesqData(dt1,dt2: TdateTime; idCli:Integer);
begin
  sq := 'Select * from TB_CONHEC ';
  sq := sq + '  WHERE dataC between '+ QuotedStr(BD_Dia(dt1,3))+ ' and '+QuotedStr(BD_Dia(dt2,3));
  //sq := sq + '  and StatusEnvio = 4 ';
  if (idCli > 0) then sq := sq + '  and LigCli = '+ IntToStr(idCli);
  //if (idCli = 0) then sq := sq + '  and CTeEmite = 1 ';
  sq := sq + '  ORder by NumC ';

  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Conhec_PesqDocCob(numCob, idTransp: Integer);
begin
  sq := 'Select * from TB_CONHEC ';
  sq := sq + '  WHERE LigDCob = '+ numCob.ToString + ' and LigTransp = ' + idTransp.ToString;
  sq := sq + '  ORder by NumC ';
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);

end;

procedure TBco.Conhec_PesqNF(numNF: Integer);
begin
  sq := 'Select * from TB_CONHEC where numNota = '+ IntToStr(NumNF);
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Conhec_PesqNumC(numConhec, idTransp: Integer);
begin
  sq := 'Select First 30 * from TB_CONHEC ';
  sq := sq + '  WHERE numC >= '+ numConhec.ToString + ' and LigTransp = ' + idTransp.ToString;
  sq := sq + '  ORder by NumC ';
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Espelho_InsereCodMun(idE, codMun: Integer);
begin
  sq := 'Update TB_NOTAS Set ';
  sq := sq + '  CodMunicipio    = '+ QuotedStr(IntToStr(CodMun));
  sq := sq + '  Where id = '+ IntToStr(idE);
  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq , 'Alterar CodMunicipio');

end;

procedure TBco.Espelho_InsereDados(nNF, nCli: Integer);
begin
  sq := 'INSERT INTO TB_NOTAS (DCNPJ, CEP, NUMNF, LigCli) Values ( ';
  sq := sq + '  '+ QuotedStr('00');
  sq := sq + ', '+ QuotedStr('00');
  sq := sq + ', '+ IntToStr(nNF);
  sq := sq + ', '+ IntToStr(nCli);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq , 'Inserir');
end;

procedure TBco.Espelho_Mostra(idM, numNF: Integer);
begin
  // 25000 = 1500 notas / dia * 15 dias = 22500 ultimas notas
  sq := 'Select * from TB_NOTAS where id >= gen_id(GEN_NOTAS,1) - 25000 and numNF = '+ IntToStr(NumNF)+ ' and LigCli = '+IntToStr(idM);
  DM2.Roda_SQL(DM4.sdsEspelho, DM4.cdsEspelho, sq);

  if (DM4.cdsEspelho.RecordCount = 0) then
  begin
    sq := 'Select * from TB_NOTAS where numNF = '+ IntToStr(NumNF)+ ' and LigCli = '+IntToStr(idM);
    DM2.Roda_SQL(DM4.sdsEspelho, DM4.cdsEspelho, sq);
  end;
end;

procedure TBco.Conhec_Motor(idN: integer);
begin
  sq := 'select numNf, nRoma, TB_FUNCS.Nome, TB_FUNCCAR.PLACA, TB_FUNCCAR.VEICULO ';
  sq := sq + ' from tb_notaf, TB_ROMA, TB_FUNCS, TB_FUNCCAR ';
  sq := sq + ' where nRoma = num and TB_Roma.LIGMOT = TB_FUNCS.id and TB_FUNCS.id = TB_Funccar.LIGFUNC ';
  sq := sq + ' and TB_NotaF.id = '+intToStr(idN);

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

function TBco.Conhec_NotaCalculada(idNF: Integer): boolean;
begin
  sq := 'SELECT id from TB_Notaf ';
  sq := sq + '  Where id = '+ IntToStr(idNF) + ' and nconh>0 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  Conhec_NotaCalculada := (DM2.cdsTMP.RecordCount>0);
end;

procedure TBco.Conhec_Numera(idNota : integer);

var idCo : integer;
begin

  sq := 'SELECT id, numC from TB_CONHEC ';
  sq := sq + '  Where LigNota = '+ IntToStr(idNota);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 0) then
  begin
    idCo := DM2.cdsTMP.Fields[1].Value;
    sq := 'Update TB_NOTAF Set ';
    sq := sq + '  NCONH    = '+ IntToStr(idCo);
    sq := sq + '  Where ID = '+ IntToStr(idNota);
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Num Conhec 2');
  end;
end;

procedure TBco.Conhec_NumeraGrupo(idNota, nGrupo: integer);
var  nConhec:Integer;
begin
  sq := 'SELECT id, numC from TB_CONHEC ';
  sq := sq + '  Where LigNota = '+ IntToStr(idNota);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 0) then
  begin
    nConhec := DM2.cdsTMP.Fields[1].Value;
    sq := 'Update TB_NOTAF Set ';
    sq := sq + '  NCONH    = '+ IntToStr(nConhec);
    sq := sq + '  Where (Not (NCONH > 0)) and CteGrupo = '+ IntToStr(nGrupo);
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Num Conhec 2');
  end;

end;

procedure TBco.Conhec_UltimoNum(dt: TdateTime);
begin
  sq := 'select count(id), MAX(NUMC) ';
  sq := sq + ' from TB_CONHEC where DataC = ' + QuotedStr(BD_dia(dt,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;


// Pagamentos de Mot Personalizados
procedure TBco.PagFaixa_Alterar(idP1, tipolocal, inicio, fim: Integer;
  ValorMot, ValorAjud: Double);
begin
  sq := 'Update TB_FUNC_PG1 Set ';
  sq := sq + '  TipoLocal  = '+ IntToStr(tipoLocal);
  sq := sq + ', inicio     = '+ IntToStr(inicio);
  sq := sq + ', fim        = '+ IntToStr(fim);
  sq := sq + ', ValorMot   = '+ Formata_Num(ValorMot);
  sq := sq + ', ValorAjud  = '+ Formata_Num(valorAjud);
  sq := sq + '  Where   id = '+ IntToStr(idP1);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.PagFaixa_Apagar(idP1: Integer);
begin
  sq := 'Delete from TB_FUNC_PG1 ';
  sq := sq + '  Where   id = '+ IntToStr(idP1);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pagfaixa_Inserir(idMot, tipolocal, inicio, fim: Integer;
  ValorMot, ValorAjud: Double);
begin
  sq := 'Insert Into TB_FUNC_PG1 (LigFunc, tipolocal, inicio, fim, ';
  sq := sq + ' ValorMot, ValorAjud) Values ( ';
  sq := sq + ' '+ IntToStr(idMot);
  sq := sq + ','+ IntToStr(tipoLocal);
  sq := sq + ','+ IntToStr(inicio);
  sq := sq + ','+ IntToStr(fim);
  sq := sq + ','+ Formata_Num(ValorMot);
  sq := sq + ','+ Formata_Num(valorAjud);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.PagFaixa_Mostrar(idMot, tipolocal: Integer);
begin
  sq := 'Select * from TB_FUNC_PG1 where LigFunc = '+ IntToStr(idMot)+ ' and Tipolocal = '+IntToStr(tipolocal)+ ' ORDER BY Inicio ';
  DM2.Roda_SQL(DM3.sdsPag1, DM3.cdsPag1, sq);
end;

procedure TBco.PagFaixaMais_Alterar(idP2, tipolocal, acimade: Integer;
  ValorMot, ValorAjud, Nota_Extra, vMinimo: Double; usaPeso:Smallint);
begin
  sq := 'Update TB_FUNC_PG2 Set ';
  sq := sq + '  TipoLocal  = '+ IntToStr(tipoLocal);
  sq := sq + ', acimade    = '+ IntToStr(acimade);
  sq := sq + ', ValorMot   = '+ Formata_Num(ValorMot);
  sq := sq + ', ValorAjud  = '+ Formata_Num(valorAjud);
  sq := sq + ', Nota_Extra = '+ Formata_Num(Nota_Extra);
  sq := sq + ', vMinimo    = '+ Formata_Num(vMinimo);
  sq := sq + ', usaPeso    = '+ IntToStr(usaPeso);
  sq := sq + '  Where   id = '+ IntToStr(idP2);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.PagFaixaMais_Apagar(idP2: Integer);
begin
  sq := 'Delete from TB_FUNC_PG2 ';
  sq := sq + '  Where   id = '+ IntToStr(idP2);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.PagFaixaMais_Inserir(idMot, tipolocal, acimade: Integer;
  ValorMot, ValorAjud, Nota_Extra, vMinimo: Double; usaPeso:Smallint);
begin
  sq := 'Insert Into TB_FUNC_PG2 (LigFunc, tipolocal, acimade, ';
  sq := sq + ' ValorMot, ValorAjud, Nota_Extra, VMinimo, usaPeso) Values ( ';
  sq := sq + ' '+ IntToStr(idMot);
  sq := sq + ','+ IntToStr(tipoLocal);
  sq := sq + ','+ IntToStr(acimade);
  sq := sq + ','+ Formata_Num(ValorMot);
  sq := sq + ','+ Formata_Num(valorAjud);
  sq := sq + ','+ Formata_Num(Nota_Extra);
  sq := sq + ','+ Formata_Num(vMinimo);
  sq := sq + ','+ IntToStr(usaPeso);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.PagFaixaMais_Mostrar(idMot, tipolocal: Integer);


begin
  sq := 'Select * from TB_FUNC_PG2 where LigFunc = '+ IntToStr(idMot)+ ' and Tipolocal = '+IntToStr(tipolocal);
  DM2.Roda_SQL(DM3.sdsPag2, DM3.cdsPag2, sq);

end;

procedure TBco.PagFaixaPeso_Alterar(idP5, tipolocal: Integer; inicio, fim,
  Valor: Double);
begin
  sq := 'Update TB_FUNC_PG5 Set ';
  sq := sq + '  TipoLocal  = '+ IntToStr(tipoLocal);
  sq := sq + ', inicio     = '+ Formata_Num(inicio);
  sq := sq + ', fim        = '+ Formata_Num(fim);
  sq := sq + ', Valor      = '+ Formata_Num(Valor);
  sq := sq + '  Where   id = '+ IntToStr(idP5);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.PagFaixaPeso_Apagar(idP5: Integer);
begin
  sq := 'Delete from TB_FUNC_PG5 ';
  sq := sq + '  Where   id = '+ IntToStr(idP5);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');

end;

procedure TBco.PagfaixaPeso_Inserir(idMot, tipolocal:Integer; inicio, fim,
  Valor: Double);
begin
  sq := 'Insert Into TB_FUNC_PG5 (LigFunc, tipolocal, inicio, fim, ';
  sq := sq + ' Valor) Values ( ';
  sq := sq + ' '+ IntToStr(idMot);
  sq := sq + ','+ IntToStr(tipoLocal);
  sq := sq + ','+ Formata_Num(inicio);
  sq := sq + ','+ Formata_Num(fim);
  sq := sq + ','+ Formata_Num(Valor);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.PagFaixaPeso_Mostrar(idMot, tipolocal: Integer);
begin
  sq := 'Select * from TB_FUNC_PG5 where LigFunc = '+ IntToStr(idMot)+ ' and Tipolocal = '+IntToStr(tipolocal)+ ' ORDER BY Inicio ';
  DM2.Roda_SQL(DM3.sdsPag5, DM3.cdsPag5, sq);

end;

procedure TBco.Credito_SPtotal(idC: Integer);
begin
  sq := 'execute procedure SP_CRED_TOTAL(';
  sq := sq + ' '+ IntToStr(idC);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Stored procedure');
end;

function TBco.Func_Tel(idF: Integer): String;

var nTel : String;
begin
  sq := 'select FUNC_ID, Numero ';
  sq := sq + ' from Tb_Functel ';
  sq := sq + ' where Descricao = '+QuotedStr('Principal');
  sq := sq + ' and FUNC_Id = '+IntToStr(idF);

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP , sq);

  ntel := 'sem Tel';
  if (DM2.cdsTMP.RecordCount >0) then
    nTel := DM2.cdsTMP.Fields[1].Value;

  Func_Tel := nTel;

end;

procedure TBco.Ocorre_PesqMeio(inic: String);
begin
{
  select TB_OCORRE.*,
case autopende when 1 then 'Pendência' else '-' end as ap,
case autosms when 1 then 'SMS' else '-' end as asms,
case autosac when 1 then 'SMS' else '-' end as asac
from  TB_OCORRE
}
  sq := 'select TB_OCORRE.*, case autopende when 1 then '+QuotedStr('Pendência')+' else '+QuotedStr('-')+' end as ap, ';
  sq := sq + ' case autopende when 1 then '+QuotedStr('SMS')+ ' else '+QuotedStr('-')+' end as asms, ';
  sq := sq + ' case autosac when 1 then '+QuotedStr('SAC')+ ' else '+QuotedStr('-')+' end as asac, ';
  sq := sq + ' case geracte when 1 then '+QuotedStr('sim')+ ' else '+QuotedStr('NÃO PODE')+' end as gcte ';
  sq := sq + ' from  TB_OCORRE Where UPPER(DESCR) LIKE  '+QuotedStr('%'+UpperCase(inic)+'%');
  DM2.Roda_SQL(DM1.sdsOc, DM1.cdsOc, sq);

end;

procedure TBco.FreteTaxa_Altera(idC: Integer; cap_perc, cap_min, gsp_perc,
  gsp_min, int_perc, int_min, int2_perc, int2_min, oest_perc, oest_min, out_perc, out_min: double);
begin
  sq := 'update TB_FRETE2 set ';
  sq := sq + '   cap_porc    = '+ Formata_Num(cap_perc);
  sq := sq + ',  cap_minimo  = '+ Formata_Num(cap_min);
  sq := sq + ',  gsp_porc    = '+ Formata_Num(gsp_perc);
  sq := sq + ',  gsp_minimo  = '+ Formata_Num(gsp_min);
  sq := sq + ',  int_porc    = '+ Formata_Num(int_perc);
  sq := sq + ',  int_minimo  = '+ Formata_Num(int_min);
  sq := sq + ',  int2_porc    = '+ Formata_Num(int2_perc);
  sq := sq + ',  int2_minimo  = '+ Formata_Num(int2_min);
  sq := sq + ',  OESt_porc    = '+ Formata_Num(oest_perc);
  sq := sq + ',  OESt_minimo  = '+ Formata_Num(oest_min);
  sq := sq + ',  OUt_porc    = '+ Formata_Num(out_perc);
  sq := sq + ',  OUt_minimo  = '+ Formata_Num(out_min);
  sq := sq + 'WHERE ligcli = '+ intToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT2, sq , 'Alterar');

end;

procedure TBco.FreteTaxa_Insere(idC: Integer; cap_perc, cap_min, gsp_perc,
  gsp_min, int_perc, int_min, int2_perc, int2_min, oest_perc, oest_min, out_perc, out_min: double);
begin
  sq := 'INSERT INTO TB_FRETE2 (ligcli, CAP_PORC, CAP_MINIMO, CAP_PESO, ';
  sq := sq + '  GSP_PORC, GSP_MINIMO, GSP_PESO, ';
  sq := sq + '  OEST_PORC, OEST_MINIMO, OEST_PESO, ';
  sq := sq + '  OUT_PORC, OUT_MINIMO, OUT_PESO, ';
  sq := sq + '  INT_PORC, INT_MINIMO, INT_PESO) VALUES ( ';
  sq := sq + '  '+ IntToStr(idC);
  sq := sq + ', '+ Formata_Num(cap_perc);
  sq := sq + ', '+ Formata_Num(cap_min)+ ', 0';
  sq := sq + ', '+ Formata_Num(gsp_perc);
  sq := sq + ', '+ Formata_Num(gsp_min)+ ', 0';
  sq := sq + ', '+ Formata_Num(oest_perc);
  sq := sq + ', '+ Formata_Num(oest_min)+ ', 0';
  sq := sq + ', '+ Formata_Num(out_perc);
  sq := sq + ', '+ Formata_Num(out_min)+ ', 0';
  sq := sq + ', '+ Formata_Num(int_perc);
  sq := sq + ', '+ Formata_Num(int_min)+ ', 0';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM3.sdsFT2, sq , 'Alterar');

end;

procedure TBco.FreteTaxa_Mostra(idC: Integer);
begin
  sq := 'select * from TB_FRETE2 Where ligCli = '+IntToStr(idC);
  DM2.Roda_SQL(DM3.sdsFT2, DM3.cdsFT2, sq);

end;

procedure TBco.NotasFora_Altera(idEV, LigUser: Integer; EVnum: Smallint;
  EVdesc: String);
begin
  sq := 'update TB_NOTAF_OBS set ';
  sq := sq + '   LigUser     = '+ intToStr(LigUser);
  sq := sq + ',  EVnum       = '+ intToStr(EVnum);
  sq := sq + ',  EVdesc      = '+ QuotedStr(EVdesc);
  sq := sq + ',  EVdata      = '+ QuotedStr(BD_dia(Now, 3));
  sq := sq + ' WHERE id = '+ intToStr(idEV);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.NotasFora_Insere(LigNF, LigUser, NumNota: Integer;
  EVnum: Smallint; EVdesc: String);
begin
  sq := 'INSERT INTO TB_NOTAF_OBS (LigNF, ligUser, NumNota, EVnum, EVdesc, EVdata) ';
  sq := sq + ' VALUES ( ';
  sq := sq + '  '+ intToStr(LigNF);
  sq := sq + ', '+ intToStr(LigUser);
  sq := sq + ', '+ intToStr(NumNota);
  sq := sq + ', '+ intToStr(EVnum);
  sq := sq + ', '+ QuotedStr(EVdesc);
  sq := sq + ', '+ QuotedStr(BD_dia(Now, 3));
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.NotasFora_MostraId(idEV: Integer);
begin
  sq := 'select * from TB_NOTAF_OBS Where id  = '+IntToStr(idEV);
  DM2.Roda_SQL(DM3.sdsFora, DM3.cdsFora, sq);

end;

procedure TBco.NotasFora_PesqEV(numNF: Integer);
begin
  sq := 'select * from TB_NOTAF_OBS Where NumNota  = '+IntToStr(numNF);
  DM2.Roda_SQL(DM3.sdsFora, DM3.cdsFora, sq);
end;

procedure TBco.NotasFora_PesqNF(numNF, ligCli: Integer);
begin
  sq := 'select * from TB_NOTAF Where numNF  = '+IntToStr(numNF);
  sq := sq + ' and ligCli  = '+IntToStr(ligCli);
  sq := sq + ' and nRoma = 0 ';

  DM2.Roda_SQL(DM3.sdsNFora, DM3.cdsNFora, sq);

end;

procedure TBco.NotasFora_PesqNFid(idNF: Integer);
begin
  sq := 'select * from TB_NOTAF_OBS Where LigNF  = '+IntToStr(idNF);
  DM2.Roda_SQL(DM3.sdsFora, DM3.cdsFora, sq);
end;


procedure TBco.Notas_Apagar(idNF: Integer);
begin
  sq := 'delete from TB_NOTAF_obs where LigNF = '+ IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar obs');

  sq := 'delete from TB_NOTAF where (nRoma = 0) and id = '+ IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar notas');
end;

procedure TBco.Notas_Anotar(idNF, idUser: Integer);
begin
  sq := 'INSERT INTO TB_SEG_APAGAR (ligNF, ligUSer, dtApagou) Values (';
  sq := sq + '  '+ IntToStr(idNF);
  sq := sq + ', '+ IntToStr(idUser);
  sq := sq + ', '+ QuotedStr(BD_dia(Now,1));
  sq := sq + ') ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Anotar Apagar ');
end;




procedure TBco.Notas_ContaTipos(dt1, dt2: TdateTime);
begin
  sq := 'select origem, count(*) as Quant from TB_NOTAF, TB_ROMA  ';
  sq := sq + ' WHERE TB_NOTAF.NROMA = TB_ROMA.NUM ';
  sq := sq + ' AND  dtRoma >= '+QuotedStr(BD_dia(dt1,3)) +' and dtRoma <= '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' group by origem ';

  DM2.Roda_SQL(DM3.sdsCta, DM3.cdsCta, sq);
end;

procedure TBco.CliCob_Alterar(idC, ligCli: Integer; Servico: String);
begin
  sq := 'update TB_CLICOB set ';
  sq := sq + '   LigCli     = '+ intToStr(LigCli);
  sq := sq + ',  Servico    = '+ QuotedStr(Servico);
  sq := sq + ' WHERE id = '+ intToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.CliCob_Apagar(idC: Integer);
begin
  sq := 'delete from  TB_CLICOB ';
  sq := sq + ' WHERE id = '+ intToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
end;

procedure TBco.CliCob_Inserir(ligCli: Integer; Servico: String);
begin
  sq := 'insert into TB_CLICOB (LigCli, Servico) values( ';
  sq := sq + '  '+ intToStr(LigCli);
  sq := sq + ', '+ QuotedStr(Servico);
  sq := sq + ') ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.CliCob_Mostrar(idC: Integer);
begin
  sq := 'select * from  TB_CLICOB ';
  sq := sq + ' WHERE LigCli = 0 or LigCli = '+ intToStr(idC);
  DM2.Roda_SQL(DM3.sdsCliCob, DM3.cdsCliCob, sq);
end;

procedure TBco.CliCob_AlterarRomaneio(idCli, nRoma, Tipo: Integer);
begin
  sq := 'update TB_ROMA set ';
  sq := sq + '   EXTRANUM     = '+ intToStr(Tipo);
  sq := sq + ' WHERE NUM = '+ intToStr(nRoma);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

  sq := 'update TB_NOTAF set ';
  sq := sq + '   EXTRANUM     = '+ intToStr(Tipo);
  sq := sq + ' WHERE nRoma = '+ intToStr(nRoma);
  sq := sq + ' and LigCli = '+ intToStr(idCli);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_MostraDia(Tipo: Integer; dti, dtf: TDateTime);
begin
  sq := 'SELECT tb_notaf.id as idN, dtRoma, num, num -extract(YEAR from dtRoma)* 1000000 as Romaneio , numNF, Valor, Peso, Volume, Locali ';
  sq := sq + ' from tb_notaf, tb_roma ';
  sq := sq + ' WHERE nRoma = num';
  sq := sq + ' and origem = '+ intToStr(Tipo);
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  sq := sq + ' Order by numnf ';
  DM2.Roda_SQL(DM3.sdsNF, DM3.cdsNF, sq);
end;

function TBco.Notas_MostraDia_Rel(Tipo: Integer; dti, dtf: TDateTime):Integer;
begin
  sq := 'SELECT count(*) ';
  sq := sq + ' from tb_notaf, tb_roma ';
  sq := sq + ' WHERE nRoma = num';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  if (Tipo = 1) then sq := sq + ' and  (ligrel > 0) ';  // com REL
  if (Tipo = 2) then sq := sq + ' and  (ligrel = 0) ';  // sem Rel
  if (Tipo = 3) then sq := sq + ' and  (ligrel < 0) ';  //CTE

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  Notas_MostraDia_Rel := DM2.cdsTMP.Fields[0].Value;
end;

function TBco.Notas_MostraDia_Rel2(Tipo: Integer; dti, dtf: TDateTime):Integer;
begin
  sq := 'SELECT count(tb_notaf.id) ';
  sq := sq + ' from tb_notaf, tb_roma ';
  sq := sq + ' WHERE nRoma = num';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  if (Tipo = 1) then sq := sq + ' and  (cob_ok = 0) ';  // sem Rel
  if (Tipo = 2) then sq := sq + ' and  (cob_ok = 1) ';  // com REL
  if (Tipo = 3) then sq := sq + ' and  (cob_ok = 2) ';  // Cobrado Rel
  if (Tipo = 4) then sq := sq + ' and  (cob_ok = 3) ';  // CTe

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  Notas_MostraDia_Rel2 := DM2.cdsTMP.Fields[0].Value;
end;

procedure TBco.Notas_MostraDia_Partes(Tipo: Integer; dti, dtf: TDateTime);
begin
  sq := 'select cli.NOME, count(nf.id) as Notas, sum(vfrete) as Frete, cli.id ';
  sq := sq + ' from TB_NOTAF nf, TB_ROMA ro, TB_CLIENTE cli ';
  sq := sq + ' Where (nf.nRoma = ro.num) ';
  sq := sq + ' and (cli.id = nf.LIGCLI) ';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  if (Tipo = 1) then sq := sq + ' and  (nf.cob_ok = 0) and  (nf.ligrel=0) ';  // nao cobrada
  if (Tipo = 2) then sq := sq + ' and  (nf.cob_ok = 1) and  (nf.ligrel>0) ';  // com REL
  if (Tipo = 3) then sq := sq + ' and  (cob_ok = 2) ';  // Cobrado Rel
  if (Tipo = 4) then sq := sq + ' and  (cob_ok = 3) ';  // CTe
  sq := sq + ' group by cli.nome, cli.id ';
  sq := sq + ' Order by cli.nome ';
  DM2.Roda_SQL(DM4.sdsNum1, DM4.cdsNum1, sq);
end;

procedure TBco.Notas_MostraDia_Cli(dti: TDateTime);
begin
  sq := 'select cli.NOME, count(nf.id) as Notas,  ';
  sq := sq + ' case nf.origem when 1 then '+QuotedStr('Manual NF')+' when 2 then '+QuotedStr('Manual Coleta')+' when 3 then '+QuotedStr('Importada EDI')+' when 4 then '+QuotedStr('Copiada Reentrega')+' when 5 then '+QuotedStr('Importada XML')+' when 6 then '+QuotedStr('Importada Excel')+' else '+QuotedStr('Não Especificada')+' end as Orig ';
  sq := sq + ' from TB_NOTAF nf, TB_CLIENTE cli ';
  sq := sq + ' where (cli.id = nf.LIGCLI) ';
  sq := sq + ' and CAST(nf.DTcria as date) = '+ QuotedStr(BD_dia(dti,3));
  sq := sq + ' group by cli.nome, nf.origem';
  sq := sq + ' Order by cli.nome ';
  DM2.Roda_SQL(DM4.sdsOrig, DM4.cdsOrig, sq);
end;

procedure TBco.Notas_MostraDia_SemCob(dti, dtf: TDateTime);
begin
  sq := 'select nf.* ';
  sq := sq + ' from TB_NOTAF nf, TB_ROMA ro ';
  sq := sq + ' Where (nf.nRoma = ro.num) ';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  sq := sq + ' and  (nf.cob_ok = 0) ';  // nao cobrada
  sq := sq + ' Order by nf.NumNF ';
  DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
end;

function TBco.Notas_MostraDia_ContaTodas(dti, dtf: TDateTime): Integer;

var c : Integer;

begin
  sq := 'select Count(nf.id) ';
  sq := sq + ' from TB_NOTAF nf, TB_ROMA ro ';
  sq := sq + ' Where (nf.nRoma = ro.num) ';
  sq := sq + ' and dtRoma >= '+ QuotedStr(BD_dia(dti,3))+' and dtRoma <= '+QuotedStr(BD_dia(dtf,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  c := DM2.cdsTMP.Fields[0].Value;

  Notas_MostraDia_ContaTodas := c;

end;


function TBco.NotasVolta_ExisteColeta(LigCli, numNF: Integer):Integer;
begin

end;

function TBco.NotasVolta_ExisteDevol(LigCli, numNF: Integer):Integer;
begin

end;

procedure TBco.NotasVolta_Marca(idNF: Integer; StatusDev: Smallint);
begin
  // STATUS_DEV - set/12
  // = 0 não utilizada
  // = 1 devolucao com motorista
  // = 2 devolucao com Eduardo
  // = 3 devolucao com Cliente

  // = 7 coleta com motorista
  // = 8 coleta com Eduardo
  // = 9 coleta com Cliente

  sq := 'update TB_NOTAF set ';
  sq := sq + '   Status_DEV     = '+ intToStr(StatusDev);
  sq := sq + ' WHERE id = '+ intToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.NotasVolta_MostraColetas();
begin
  sq := 'select TB_Notaf.id as idNF, dtRoma, num, nRoma,TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, ';
  sq := sq + ' numnf, Valor, Nome, TB_NOTAF.obs, TB_NOTAF.STATUS_DEV ';
  sq := sq + ' from  TB_Notaf, TB_ROMA left join TB_FUNCS on TB_FUNCS.id = TB_ROMA.LIGMOT ';
  sq := sq + ' WHERE TB_NOTAF.nRoma = TB_ROMA.num ';
  sq := sq + ' and (TB_NOTAF.status_dev = 7 or TB_NOTAF.status_dev = 8) ';
  sq := sq + ' order by TB_NOTAF.status_dev desc, dtRoma desc ';

  DM2.Roda_SQL(DM4.sdsCol, DM4.cdsCol, sq);

end;

procedure TBco.NotasVolta_MostraDevol();
begin
  sq := 'select TB_Notaf.id as idNF, dtRoma, num, nRoma,TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, ';
  sq := sq + ' numnf, Valor, Nome, TB_NOTAF.obs, TB_NOTAF.STATUS_DEV ';
  sq := sq + ' from  TB_Notaf, TB_ROMA left join TB_FUNCS on TB_FUNCS.id = TB_ROMA.LIGMOT ';
  sq := sq + ' WHERE TB_NOTAF.nRoma = TB_ROMA.num ';
  sq := sq + ' and (TB_NOTAF.status_dev = 1 or TB_NOTAF.status_dev = 2) ';
  sq := sq + ' order by TB_NOTAF.status_dev desc, dtRoma desc ';

  DM2.Roda_SQL(DM3.sdsDev1, DM3.cdsDev1, sq);
end;

procedure TBco.NotasVolta_ClassDev(Tipo: Integer);
begin
  sq := 'update TB_NOTAF set ';
  sq := sq + ' Status_DEV     = 1';
  sq := sq + ' WHERE not(Status_DEV bettween 1 and 9) ';
  sq := sq + ' and ()';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Ticket_Devol_Marca(idNF, Status: Integer);
begin

end;

procedure TBco.Ticket_Devol_Mostra;
begin

end;

procedure TBco.Ticket_Devol_Seleciona;
begin
  sq := 'update tb_notaf set status_dev = 1 where TB_NOTAF.id in ( ';
  sq := sq + ' select TB_NOTAF.id from TB_NOTAF, TB_OCORRE ';
  sq := sq + ' where TB_OCORRE.num = TB_NOTAF.NOCORR ';
  sq := sq + ' and uso = 3 and (status_dev = 0 or status_dev is null) ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.NotasVolta_SelecionaDevol;
  var lista : string;
begin
  lista := Ocorre_uso(3);  // dev = 3
  sq := 'update tb_notaf set status_dev = 1 ' ;
  sq := sq + ' where TB_NOTAF.nOcorr  in (  '+lista + ' )';
  sq := sq + ' and (status_dev = 0 or status_dev is null) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.VoltaDev_MostraNota(idNF: integer);
begin
  sq := 'Select TB_NOTAF.id as idNF, Numdev, NumNF, Valor, RECDDATA, RECDNome, NUMRD, Obs, volume, Recebedor ';
  sq := sq + ' from TB_VOLTAD, TB_Notaf ';
  sq := sq + ' where numDEV = TB_VOLTAD.id  ';
  sq := sq + ' and TB_NOTAF.NUMNF = '+IntToStr(idNF);
  DM2.Roda_SQL(DM3.sdsDev2, DM3.cdsDev2, sq);
end;

procedure TBco.VoltaDev_AdicionaItem(num, idNF: Integer);
begin
  sq := 'update TB_NOTAF set numDEV = '+IntToStr(num)+' where id = '+intToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Adicionar Item');
end;

function TBco.VoltaDev_Inserir: Integer;
begin
  sq := 'insert into TB_VOLTAD (NUMRD) values(0) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'Select * from TB_VOLTAD  order by id desc  ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  DM2.cdsTMP.First;
  VoltaDev_Inserir := DM2.cdsTMP.Fields[0].Value;
end;

procedure TBco.VoltaDev_Receber(idDev:Integer; Nome: String);
begin
  sq := 'update TB_VOLTAD set ';
  sq := sq + '  RECdData = '+QuotedStr(BD_dia(Now,1));
  sq := sq + ', RECdNome = '+QuotedStr(Nome);
  sq := sq + 'where id = '+IntToStr(idDev);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'update TB_NOTAF set STATUS_TKT = 3';
  sq := sq + 'where NumDEV = '+IntToStr(idDev);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.VoltaDev_ReceberUM(idNF, idDev: Integer; Nome:String);
begin
  // TENTATIVA DE GRAVAR COM DOIS DIFERENTES
  // NÃO É POSSIVEL POR CAUSA DO NOME NO REL e não na NF
  {
  sq := 'update TB_VOLTAD set ';
  sq := sq + '  RECdData = '+QuotedStr(BD_dia(Now,1));
  sq := sq + ', RECdNome = '+QuotedStr(Nome);
  sq := sq + 'where id = '+IntToStr(idDev);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'update TB_NOTAF set STATUS_TKT = 3';
  sq := sq + 'where NumDEV = '+IntToStr(idDev);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
  }
end;


procedure TBco.VoltaDev_MostraNum(num: integer);
begin
  sq := 'Select TB_NOTAF.id as idNF, Numdev, NumNF, Valor, RECDDATA, RECDNome, NUMRD, Obs, volume, Recebedor ';
  sq := sq + ' from TB_VOLTAD, TB_Notaf ';
  sq := sq + ' where numDEV = TB_VOLTAD.id  ';
  sq := sq + ' and numDEV = '+IntToStr(num);
  sq := sq + ' order by TB_NOTAF.NumNF ';
  DM2.Roda_SQL(DM3.sdsDev2, DM3.cdsDev2, sq);
end;

procedure TBco.VoltaDev_MostraUlt(n:integer);

var i,f : Integer;

begin
  f := 0;
  i := 0;

  sq := 'Select First 1 * from TB_VOLTAD Order by id desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if (DM2.cdsTMP.RecordCount > 0) then
  begin
    f := DM2.cdsTMP.Fields[0].Value;
    i := f - n;
    if (i<1) then i := 1;
  end;

  sq := 'Select TB_NOTAF.id as idNF, Numdev, NumNF, Valor, RECDDATA, RECDNome, NUMRD, Obs, volume, Recebedor ';
  sq := sq + ' from TB_VOLTAD, TB_Notaf ';
  sq := sq + ' where numDEV = TB_VOLTAD.id  ';
  sq := sq + ' and numDEV between '+IntToStr(i)+' and '+IntToStr(f);
  sq := sq + ' order by numDEV desc, TB_NOTAF.NumNF ';
  DM2.Roda_SQL(DM3.sdsDev2, DM3.cdsDev2, sq);
end;

procedure TBco.VoltaDev_MostraTodos(tipo: integer);
begin
  sq := 'Select First 2 TB_NOTAF.id as idNF, Numdev, NumNF, Valor, RECDDATA, RECDNome, NUMRD, Obs, volume, Recebedor ';
  sq := sq + ' from TB_VOLTAD, TB_Notaf ';
  sq := sq + ' where numDEV = TB_VOLTAD.id  ';
  sq := sq + ' and NUMRD = '+IntToStr(tipo);
  sq := sq + ' order by numDEV desc, TB_NOTAF.NumNF';
  DM2.Roda_SQL(DM3.sdsDev2, DM3.cdsDev2, sq);
end;

procedure TBco.Pesq_Carro(veiculo: String);
begin
  sq := 'select TB_Funcs.ID,Veiculo , NOME, chvalidade,Placa, ano, dtFicha  from TB_funcs, TB_Funccar ';
  sq := sq + ' where TB_FUNCS.id = TB_FUNCCAR.LIGFUNC ';
  sq := sq + ' and UPPER(veiculo) like '+QuotedStr('%'+UpperCase(veiculo)+'%');
  sq := sq + ' Order by dtFicha, nome ';
  DM2.Roda_SQL(DM4.sdsCarro, DM4.cdsCarro, sq);
end;

procedure TBco.Pesq_TicketDatas(idcli: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select TB_NOTAF.id, nRoma, TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio,dtRoma, numnf, valor, nome ';
  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_FUNCS ';
  sq := sq + ' where (TB_NOTAF.nRoma = TB_ROMA.num) ';
  sq := sq + ' and (TB_ROMA.LIGMOT = TB_FUNCS.ID) ';
  sq := sq + ' and (STATUS_TKT <> 1) ';
  sq := sq + ' and NOCORR IN (Select num from Tb_OCORRE where uso < 2) ';
  sq := sq + ' and ligcli = '+IntToStr(idCli);
  sq := sq + ' and dtRoma between '+QuotedStr(BD_dia(dt1,3)) +' and '+QuotedStr(BD_dia(dt2,3)) +' ';
  sq := sq + ' Order by dtRoma, nRoma ';
  DM2.Roda_SQL(DM4.sdsTKpq, DM4.cdsTKpq, sq);
end;

function TBco.Cliente_ExisteNome(n: String): integer;
begin
  sq := 'select * from TB_CLIENTE where Nome = '+QuotedStr(n);
  DM2.Roda_SQL(DM1.sdsCli2, DM1.cdsCli2, sq);
  if (DM1.cdsCli2.RecordCount > 0) then Cliente_ExisteNome := DM1.cdsCli2ID.Value
    else Cliente_ExisteNome := 0;
end;


procedure TBco.VoltaCol_AdicionaItem(num, idNF: Integer);
begin
  sq := 'update TB_NOTAF set numCOL = '+IntToStr(num)+' where id = '+intToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Adicionar Item');
end;

function TBco.VoltaCol_Inserir: Integer;
begin
  sq := 'insert into TB_VOLTAC (NUMRC) values(0) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'Select * from TB_VOLTAC  order by id desc  ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  DM2.cdsTMP.First;
  VoltaCol_Inserir := DM2.cdsTMP.Fields[0].Value;

end;

procedure TBco.VoltaCol_MostraNota(idNF: integer);
begin
  sq := 'Select TB_NOTAF.id as idNF, NumCOL, NumNF, Valor, RECCDATA, ';
  sq := sq + ' case status_dev when 12 then '+QuotedStr('Coleta Incompleta')+' else RECCNOME END as NomeR,  NUMRC, Obs ';
  sq := sq + ' from TB_VOLTAC, TB_Notaf ';
  sq := sq + ' where numCOL = TB_VOLTAC.id  ';
  sq := sq + ' and TB_NOTAF.NUMNF = '+IntToStr(idNF);
  DM2.Roda_SQL(DM4.sdsCol2, DM4.cdsCol2, sq);

end;

procedure TBco.VoltaCol_MostraNum(num: integer);
begin
  sq := 'Select TB_NOTAF.id as idNF, NumCOL, NumNF, Valor, RECCDATA, ';
  sq := sq + ' case status_dev when 12 then '+QuotedStr('Coleta Incompleta')+' else RECCNOME END as NomeR,  NUMRC, Obs ';
  sq := sq + ' from TB_VOLTAC, TB_Notaf ';
  sq := sq + ' where numCOL = TB_VOLTAC.id  ';
  sq := sq + ' and numCOL = '+IntToStr(num);
  sq := sq + ' order by TB_NOTAF.NumNF ';
  DM2.Roda_SQL(DM4.sdsCol2, DM4.cdsCol2, sq);
end;

procedure TBco.VoltaCol_MostraTodos(tipo: integer);
begin
  sq := 'Select TB_NOTAF.id as idNF, NumCOL, NumNF, Valor, RECCDATA, ';
  sq := sq + ' case status_dev when 12 then '+QuotedStr('Coleta Incompleta')+' else RECCNOME END as NomeR,  NUMRC, Obs ';
  sq := sq + ' from TB_VOLTAC, TB_Notaf ';
  sq := sq + ' where numCOL = TB_VOLTAC.id  ';
  sq := sq + ' and NUMRC = '+IntToStr(tipo);
  sq := sq + ' order by numCOL desc, TB_NOTAF.NumNF ';
  DM2.Roda_SQL(DM4.sdsCol2, DM4.cdsCol2, sq);
end;

procedure TBco.VoltaCol_MostraUlt(n: integer);

var f, i : Integer;

begin
  f := 0;
  i := 0;
  sq := 'Select First 1 * from TB_VOLTAC Order by id desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if  (DM2.cdsTMP.recordCount > 0) then
  begin
    f := DM2.cdsTMP.Fields[0].Value;
    i := f - n;
    if (i<1) then i := 1;
  end;


  sq := 'Select TB_NOTAF.id as idNF, NumCOL, NumNF, Valor, RECCDATA, ';
  sq := sq + ' case status_dev when 12 then '+QuotedStr('Coleta Incompleta')+' else RECCNOME END as NomeR,  NUMRC, Obs ';
  sq := sq + ' from TB_VOLTAC, TB_Notaf ';
  sq := sq + ' where numCOL = TB_VOLTAC.id  ';
  sq := sq + ' and numCOL between '+IntToStr(i)+' and '+IntToStr(f);
  sq := sq + ' order by numCOL desc, TB_NOTAF.NumNF ';
  DM2.Roda_SQL(DM4.sdsCol2, DM4.cdsCol2, sq);
end;

procedure TBco.VoltaCol_Receber(idCol: Integer; Nome: String);
begin
  sq := 'update TB_VOLTAC set ';
  sq := sq + '  RECcData = '+QuotedStr(BD_dia(Now,1));
  sq := sq + ', RECcNome = '+QuotedStr(Nome);
  sq := sq + 'where id = '+IntToStr(idCol);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'update TB_NOTAF set STATUS_TKT = 9';
  sq := sq + 'where NumCOL = '+IntToStr(idCol);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.NotasVolta_SelecionaColeta;
begin
  sq := 'update tb_notaf set status_dev = 7 ';;
  sq := sq + ' where ORIGEM = 2 ';
  sq := sq + ' and nocorr <= 1 ';
  sq := sq + ' and (status_dev = 0 or status_dev is null) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;


procedure TBco.Gerencial_GanhoMot(idMot: integer; dta, dtb: TdateTime);
begin
  sq := 'select dtRoma, num ,TB_ROMA.num -extract(YEAR from dtRoma)* 1000000 as Romaneio, ';
  sq := sq + ' SUM(VFrete) as Receita, VPag as Despesa, SUM(VFrete) - VPag as Lucro, Count(TB_NOTAF.id) as Notas, ';
  sq := sq + ' CASE SUM(vFRETE) WHEN 0 THEN 0 ELSE 100*(SUM(VFrete) - Vpag)/(SUM(VFrete)) END as Porcento ';
  sq := sq + ' from  TB_Notaf, TB_ROMA ';
  sq := sq + ' WHERE TB_NOTAF.nRoma = TB_ROMA.num ';
  if idMot>0 then sq := sq + ' and TB_ROMA.LigMot = '+IntToStr(idMot);
  sq := sq + ' and dtRoma >= '+QuotedStr(BD_dia(dta,3));
  sq := sq + ' and dtRoma <= '+QuotedStr(BD_dia(dtb,3));
  sq := sq + ' GROUP BY dtRoma, num, vPag ';
  sq := sq + ' order by num ';
  DM2.Roda_SQL(DM4.sdsGerGM, DM4.cdsGerGM, sq);
end;




procedure TBco.PagLote_Alterar(idPG:Integer;Descr: String; Quant: Smallint;
  vTotal: Double);
begin
  sq := 'update tb_PAGLOTE set ';
  sq := sq + '  Descr   = ' + QuotedStr(Descr);
  sq := sq + ', Quant   = ' + IntToStr(Quant);
  sq := sq + ', vTotal  = ' + Formata_Num(vTotal);
  sq := sq + ' where id = ' + IntToStr(idPG);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.PagLote_Apagar(idPG: Integer);
begin
  sq := 'delete from TB_PAGLOTE ';
  sq := sq + ' where id = ' + IntToStr(idPG);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar');
end;

function TBco.PagLote_Inserir(Descr: String; Quant: Smallint;
  vTotal: Double): Integer;
begin
  // Insere
  sq := 'Insert Into tb_PAGLOTE (datacria, Descr, Quant, vTotal) Values ( ';
  sq := sq + '  '+QuotedStr(BD_dia(Now,3));
  sq := sq + ', ' + QuotedStr(Descr);
  sq := sq + ', ' + IntToStr(Quant);
  sq := sq + ', ' + Formata_Num(vTotal);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  // pega o ID
  sq := 'Select First 3 * from tb_PAGLOTE order by id desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  DM2.cdsTMP.First;
  PagLote_Inserir := DM2.cdsTMP.Fields[0].AsInteger;

end;

procedure TBco.PagLote_MostrarId(idPG: Integer);
begin
  sq := 'Select * FROM TB_PAGLOTE ';
  sq := sq + ' where id = '+IntToStr(idPG);
  DM2.Roda_SQL(DM4.sdsPlote, DM4.cdsPlote, sq);
end;

procedure TBco.PagLote_Mostrar(q: Integer);
begin
  sq := 'Select First '+IntToStr(q)+' *  FROM TB_PAGLOTE Order by id Desc ';
  DM2.Roda_SQL(DM4.sdsPlote, DM4.cdsPlote, sq);
end;

procedure TBco.PagLote_MostrarMot(idPG: Integer);
begin

  sq := 'Select * FROM TB_PAGLOTE ';
//  sq := sq + ' where numCOL = TB_VOLTAC.id  ';
  DM2.Roda_SQL(DM4.sdsPlote, DM4.cdsPlote, sq);

end;

procedure TBco.PagLote_AlterarTabs(idPG: Integer; dt1, dt2: TDateTime);
begin
  sq := 'update Tb_Roma set ';
  sq := sq + '     = ' + IntToStr(idPG);
  sq := sq + ' where CAST(dtRoma AS Date) between '+QuotedStr(BD_DIa(dt1,3))+' and '+QuotedStr(BD_DIa(dt2,3));
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.Romaneio_ListaServ(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'Select dtRoma, NUM, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000000 as Romaneio, servico ';
  sq := sq + ' from TB_ROMA, TB_CLICOB ';
  sq := sq + ' WHERE TB_ROMA.EXTRANUM = TB_CLICOB.id and ';
  sq := sq + ' TB_ROMA.EXTRANUM > 0 and ';
  if (idC > 0) then sq := sq + ' LigCli = '+IntToStr(idC)+ ' and ';
  sq := sq + ' dtRoma between '+QuotedStr(BD_Dia(dt1,3))+' and '+QuotedStr(BD_Dia(dt2,3));
  sq := sq + ' order by dtRoma ';
  DM2.Roda_SQL(DM4.sdsServ, DM4.cdsServ, sq);

end;

function TBco.Romaneio_PesoTotal(numR: Integer): double;

var p : double;

begin
  sq := 'Select SUM(Peso) from TB_NOTAF ';
  sq := sq + ' where nROMA = '+IntToStr(numR);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  p := DM2.cdsTMP.Fields[0].Value;

  Romaneio_PesoTotal := p;

end;

procedure TBco.Pag2Faixa_Alterar(idP3, tipolocal, inicio, fim: Integer;
  vpag,vcob: Double);
begin
  sq := 'Update TB_FUNC_PG3 Set ';
  sq := sq + '  TipoLocal  = '+ IntToStr(tipoLocal);
  sq := sq + ', inicio     = '+ IntToStr(inicio);
  sq := sq + ', fim        = '+ IntToStr(fim);
  sq := sq + ', vPag       = '+ Formata_Num(vpag);
  sq := sq + ', vCob       = '+ Formata_Num(vcob);
  sq := sq + '  Where   id = '+ IntToStr(idP3);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pag2Faixa_Apagar(idP3: Integer);
begin
  sq := 'Delete from TB_FUNC_PG3 ';
  sq := sq + '  Where   id = '+ IntToStr(idP3);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pag2Faixa_Inserir(idMot, tipolocal, inicio, fim: Integer;
  vpag,vcob: Double);
begin
  sq := 'Insert Into TB_FUNC_PG3 (LigFunc, tipolocal, inicio, fim, ';
  sq := sq + ' vpag,vcob) Values ( ';
  sq := sq + ' '+ IntToStr(idMot);
  sq := sq + ','+ IntToStr(tipoLocal);
  sq := sq + ','+ IntToStr(inicio);
  sq := sq + ','+ IntToStr(fim);
  sq := sq + ','+ Formata_Num(vpag);
  sq := sq + ','+ Formata_Num(vcob);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pag2Faixa_Mostrar(idMot, tipolocal: Integer);
begin
  sq := 'Select * from TB_FUNC_PG3 where LigFunc = '+ IntToStr(idMot)+ ' and Tipolocal = '+IntToStr(tipolocal)+ ' ORDER BY Inicio ';
  DM2.Roda_SQL(DM4.sdsPG3, DM4.cdsPG3, sq);
end;

procedure TBco.Pag2FaixaMais_Alterar(idP4, tipolocal:Integer; Minimo, AcimaDe: Double);
begin
  sq := 'Update TB_FUNC_PG4 Set ';
  sq := sq + '  TipoLocal  = '+ IntToStr(tipoLocal);
  sq := sq + ', Minimo    = '+ Formata_Num(Minimo);
  sq := sq + ', VLR_ACIMA    = '+ Formata_Num(AcimaDe);
  sq := sq + '  Where   id = '+ IntToStr(idP4);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pag2FaixaMais_Apagar(idP4: Integer);
begin
  sq := 'Delete from TB_FUNC_PG4 ';
  sq := sq + '  Where   id = '+ IntToStr(idP4);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar StatusEDI');

end;

procedure TBco.Pag2FaixaMais_Inserir(idMot, tipolocal:Integer; Minimo, AcimaDe: Double);
begin
  sq := 'Insert Into TB_FUNC_PG4 (LigFunc, tipolocal, Minimo, VLR_ACIMA) Values ( ';
  sq := sq + ' '+ IntToStr(idMot);
  sq := sq + ','+ IntToStr(tipoLocal);
  sq := sq + ','+ Formata_Num(Minimo);
  sq := sq + ','+ Formata_Num(AcimaDe);
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

end;

procedure TBco.Pag2FaixaMais_Mostrar(idMot, tipolocal: Integer);
begin
  sq := 'Select * from TB_FUNC_PG4 where LigFunc = '+ IntToStr(idMot)+ ' and Tipolocal = '+IntToStr(tipolocal);
  DM2.Roda_SQL(DM4.sdsPG4, DM4.cdsPG4, sq);
end;


procedure TBco.CarroF_Altera(idC: integer; Placa, Tipo, chassi, codLibera: String);
begin
  sq := 'Update TB_CARRO Set ';
  sq := sq + '  Placa   = '+ QuotedStr(Placa);
  sq := sq + ', Tipo    = '+ QuotedStr(Tipo);
  sq := sq + ', Chassi  = '+ QuotedStr(Chassi);
  sq := sq + ', CodLibera = '+ QuotedStr(codLibera);
  sq := sq + '  Where   id = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Carro');
end;

procedure TBco.CarroF_Apaga(idC: integer);
begin
  sq := 'Delete from TB_CARRO  ';
  sq := sq + '  Where   id = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Carro');
end;

procedure TBco.CarroF_Insere(Placa, Tipo, chassi, codLibera: String);
begin
  sq := 'Insert Into TB_CARRO (Placa, tipo, Chassi, codLibera) VALUES ( ';
  sq := sq + '  '+ QuotedStr(Placa);
  sq := sq + ', '+ QuotedStr(Tipo);
  sq := sq + ', '+ QuotedStr(Chassi);
  sq := sq + ', '+ QuotedStr(codLibera);
  sq := sq + ') ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Carro');
end;

procedure TBco.CarroF_Mostra;
begin
  sq := 'Select * from TB_CARRO ';
  DM2.Roda_SQL(DM4.sdsCar, DM4.cdsCar, sq);
end;

procedure TBco.CarroF_MostraId(idC: integer);
begin
  sq := 'Select * from TB_CARRO where id = '+ IntToStr(idC);
  DM2.Roda_SQL(DM4.sdsCar, DM4.cdsCar, sq);
end;

procedure TBco.CarroF_ProcuraPlaca(inic: String);
begin
  sq := 'Select * from TB_CARRO where Placa = '+ QuotedStr(inic);
  DM2.Roda_SQL(DM4.sdsCar, DM4.cdsCar, sq);
end;


procedure TBco.CarroF_PesqCarro(dt1, dt2: TdateTime; idCar: Integer);
begin
  sq := 'select ro.NUM, dtRoma,  ca.tipo, ca.placa, VPag, sum(vfrete) as frete,  ';
  sq := sq + ' sum(vfrete) - VPag as lucro, fu.NOME,';
  sq := sq + ' ro.num - CAST(ro.num / 1000000 AS INTEGER)* 1000000 as Romaneio ';
  sq := sq + ' from Tb_NOTAF nf, TB_ROMA ro, TB_CARRO ca, TB_FUNCS fu ';
  sq := sq + ' where TB_ROMA.NUM = TB_NOTAF.nroma  ';
  sq := sq + ' and TB_ROMA.LIGCARF = TB_CARRO.id  ';
  sq := sq + ' and TB_ROMA.LIGMOT = TB_Funcs.id  ';
  sq := sq + ' and LIGCARF = '+IntToStr(idCar);
  sq := sq + ' and dtRoma between '+QuotedStr(BD_DIA(dt1,3)) + ' and '+ QuotedStr(BD_DIA(dt2,3)) ;
  sq := sq + ' group by ro.NUM, ro.dtRoma, ca.tipo, placa, Vpag, Nome ';
  sq := sq + ' ORDER BY ro.dtRoma ';
  DM2.Roda_SQL(DM4.sdsPQcar, DM4.cdsPQcar, sq);
end;

procedure TBco.CarroF_PesqMotor(dt1, dt2: TdateTime; idMot: Integer);
begin
  sq := 'select NUM, dtRoma,  tipo, placa, VPag,sum(vfrete) as frete, ';
  sq := sq + ' sum(vfrete) - VPag as lucro, '+QuotedStr('sem')+ ' as Nome, ';
  sq := sq + ' num - CAST(num / 1000000 AS INTEGER)* 1000000 as Romaneio ';
  sq := sq + ' from Tb_NOTAF, TB_ROMA, TB_CARRO ';
  sq := sq + ' Where TB_ROMA.NUM = TB_NOTAF.nroma ';
  sq := sq + ' and TB_ROMA.LIGCARF = TB_CARRO.id ';
  sq := sq + ' and LIGMOT = '+IntToStr(idMot);
  sq := sq + ' and dtRoma between '+QuotedStr(BD_DIA(dt1,3)) + ' and '+ QuotedStr(BD_DIA(dt2,3)) ;
  sq := sq + ' group by NUM, dtRoma, tipo, placa, Vpag ';
  sq := sq + ' ORDER BY dtRoma ';
  DM2.Roda_SQL(DM4.sdsPQcar, DM4.cdsPQcar, sq);
end;

procedure TBco.Romaneio_SalvaCombinado(numR: Integer; vCombina: Double);

var fcomb, tipop : Smallint;

begin
  fComb := 0;
  tipop := 0;
  if vCombina > 0 then
  begin
    fComb := 1;
    tipop := 5;
  end;

  sq := 'Update TB_ROMA Set ';
  sq := sq + '  vCombina    = '+ Formata_Num(vCombina);
  sq := sq + ', fCombina    = '+ IntToStr(fComb);
  sq := sq + ', Tipo_Pag    = '+ IntToStr(tipop); // Tratado
  sq := sq + '  Where   num = '+ IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Pag Mot');
end;

procedure TBco.Romaneio_SalvaFreteCombinado(numR: Integer; vCombina: Double);

var fcomb : Smallint;

begin
  // COBRANCA
  fComb := 0;
  if vCombina > 0 then
  begin
    fComb := 1;
  end;

  sq := 'Update TB_ROMA Set ';
  sq := sq + '  vFreteComb  = '+ Formata_Num(vCombina);
  sq := sq + ', fFreteComb  = '+ IntToStr(fComb);
  sq := sq + '  Where   num = '+ IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar COB Roma ');

  sq := 'Update TB_NOTAF Set ';
  sq := sq + '  tipo_COB  = '+ IntToStr(fComb);
  sq := sq + '  Where   nRoma = '+ IntToStr(numR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Tipo COB notas');

end;

procedure TBco.Cliente_SalvaOutros(id, ImpRec, nfSerie, prazo: Integer; PagoExtra: Double; Armazenagem, usa_SMS, ctee, ctei, cteIE, OCcliente:Smallint);
begin
  sq := 'Update TB_CLIENTE Set ';
  sq := sq + '  PagoExtra    = '+ Formata_Num(PagoExtra);
  sq := sq + ', ImpRec       = '+ IntToStr(ImpRec);
  sq := sq + ', Armazenagem  = '+ IntToStr(Armazenagem);
  sq := sq + ', nfSerie      = '+ IntToStr(nfSerie);
  sq := sq + ', Prazo        = '+ IntToStr(prazo);
  sq := sq + ', usa_SMS      = '+ IntToStr(usa_SMS);
  if ctee=1 then sq := sq + ', CteEmite     = '+ IntToStr(ctee) else sq := sq + ', CteEmite = 0';
  if ctee=1 then sq := sq + ', CteImposto   = '+ IntToStr(ctei);
  if ctee=1 then sq := sq + ', Cte_Ie   = '+ IntToStr(cteIE);
  sq := sq + ', ocPropia     = '+ IntToStr(OCcliente);
  sq := sq + '  Where   id = '+ IntToStr(id);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Extra');
end;

function TBco.Pagamento_CalcOutrasNF(numR: Integer): Double;

var resp : Double;

begin
  // NOTAS FISCAIS
  sq := 'Select * from TB_NOTAF where nRoma = '+ IntToStr(numR);
  DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);

  resp := 0;

  DM1.cdsNotas.First;
  while not DM1.cdsNotas.Eof do
  begin
    // Cliente num 1 é a STAPLES = princ
    if (DM1.cdsNotasLIGCLI.Value <> 1) and (DM1.cdsNotasLIGCLI.Value <> 22) then
    begin
      sq := 'Select * from TB_CLIENTE where id = '+ DM1.cdsNotasLIGCLI.AsString;
      DM2.Roda_SQL(DM1.sdsCli, DM1.cdsCli, sq);
      resp := resp + DM1.cdsCliPAGOEXTRA.AsFloat;
    end;
    DM1.cdsNotas.Next;
  end;
  Pagamento_CalcOutrasNF := resp;
end;

function TBco.Pagamento_CalcPesoExc(numR, LimiteNF: Integer): Double;
  var resp, vlr : double;
      i, conta : integer;
      qtNF : integer;
      idMot, tLocal : Integer;
      achei : boolean;

begin
  // Procura ID do Motorista
  sq := 'Select ligMot from TB_Roma where num = '+ IntToStr(numR);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  if (DM2.cdsTMP.RecordCount>0) then
  begin
    idMot := DM2.cdsTMP.Fields[0].AsInteger;

    // Procura Notas
    sq := 'Select id, numnf, peso, nocorr, tipolocal from TB_NOTAF where nRoma = '+ IntToStr(numR);
    sq := sq + devolucoesNaoPagar(3);
    sq := sq + ' order by peso desc ';
    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

    qtNF := DM2.cdsTMP.RecordCount;

    if (qtNF>LimiteNF) then
    begin
      DM2.cdsTMP.Last;
      tLocal := DM2.cdsTMP.Fields[4].AsInteger;
      PagFaixaPeso_Mostrar(idMot,tLocal);
      i := 1;
      resp := 0;
      while not DM2.cdsTMP.Bof and (i<= qtNF - LimiteNF)  do
      begin
        // Se mudar de local
        if (tLocal <> DM2.cdsTMP.Fields[4].AsInteger) then
        begin
          tLocal :=  DM2.cdsTMP.Fields[4].AsInteger;
          PagFaixaPeso_Mostrar(idMot,tLocal);
        end;

        vlr := 0; conta := 0; achei := false;
        // procura valor na faixa
        DM3.cdsPag5.First;
        while not DM3.cdsPag5.Eof and not achei do
        begin
          if (DM2.cdsTMP.FieldByName('peso').AsFloat > DM3.cdsPag5INICIO.Value) and (DM2.cdsTMP.FieldByName('peso').AsFloat <= DM3.cdsPag5FIM.Value) then
          begin
            vlr := DM3.cdsPag5VALOR.AsFloat;
            conta := conta + 1;
            achei := true;
          end;
          DM3.cdsPag5.Next;
        end;
        i := i + 1;
        resp := resp + vlr;
        DM2.cdsTMP.Prior;
      end;

    end;
  end;

  result := resp;
end;

function TBco.Pagamento_CalcPontos(idM, Pontos: Integer): Double;

var resp : Double;

begin
  sq := 'Select * from TB_FUNCS where id = '+ IntToStr(idM);
  DM2.Roda_SQL(DM1.sdsFuncs, DM1.cdsFuncs, sq);

  resp := DM1.cdsFuncsVPONTO.AsFloat * Pontos;

  Pagamento_CalcPontos := resp;

end;

procedure TBco.Agenda_Alterar(idAg: Integer; dia: TDateTime; descr: String;
  valorPrev: double; reFlag, reVezes, reTipo, Aviso_Dias: Smallint);
begin
  sq := 'Update TB_AGENDA Set ';
  sq := sq + '  dia          = '+ QuotedStr(FormatDateTime('yyyy-mm-dd', dia));
  sq := sq + ', Descr        = '+ QuotedStr(descr);
  sq := sq + ', valorPrev    = '+ Formata_Num(valorPrev);
  sq := sq + ', Repetir_FLAG = '+ IntToStr(reFlag);
  sq := sq + ', Repetir_Vezes= '+ IntToStr(reVezes);
  sq := sq + ', Repetir_Tipo = '+ IntToStr(reTipo);
  sq := sq + ', Aviso_dias   = '+ IntToStr(Aviso_Dias);
  sq := sq + '  Where   id   = '+ IntToStr(idAg);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Agenda');
end;

procedure TBco.Agenda_AlterarStatus(idAg: Integer; Status: Smallint);
begin
  sq := 'Update TB_AGENDA Set ';
  sq := sq + '  Status      = '+ IntToStr(Status);
  sq := sq + '  Where   id  = '+ IntToStr(idAg);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Agenda Status');
end;

procedure TBco.Agenda_Apagar(idAg: Integer);
begin
  sq := 'Delete from TB_AGENDA  ';
  sq := sq + '  Where   id  = '+ IntToStr(idAg);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Agenda');
end;

function TBco.Agenda_Inserir(dia: TDateTime; descr: String;
  valorPrev: double; reFlag, reVezes, reTipo,
  Aviso_Dias: Smallint): Integer;
begin
  sq := 'Insert Into TB_AGENDA (dia, Descr, valorPrev, status, Repetir_FLAG, Repetir_Vezes, Repetir_Tipo,  Aviso_Dias) values ( ';
  sq := sq + '  '+ QuotedStr(FormatDateTime('yyyy-mm-dd', dia));
  sq := sq + ', '+ QuotedStr(descr);
  sq := sq + ', '+ Formata_Num(valorPrev);
  sq := sq + ', 0';
  sq := sq + ', '+ IntToStr(reFlag);
  sq := sq + ', '+ IntToStr(reVezes);
  sq := sq + ', '+ IntToStr(reTipo);
  sq := sq + ', '+ IntToStr(Aviso_Dias);
  sq := sq + '  )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserirr Agenda');
end;

procedure TBco.Agenda_MostrarDesc(parte: String);
begin
  sq := 'Select * from TB_AGENDA where Descr LIKE '+ QuotedStr(parte+'%');
  DM2.Roda_SQL(DM4.sdsAgenda, DM4.cdsAgenda, sq);
end;

procedure TBco.Agenda_MostrarID(idAg: Integer);
begin
  sq := 'Select * from TB_AGENDA where id = '+ IntToStr(idAg);
  DM2.Roda_SQL(DM4.sdsAgenda, DM4.cdsAgenda, sq);

end;

procedure TBco.Aviso_Alterar(idAv: Integer; DT: TdateTime);
begin
  sq := 'Update TB_AVISO Set ';
  sq := sq + '  DT         = '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DT));
  sq := sq + '  Where   id  = '+ IntToStr(idAv);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Aviso Data');
end;

procedure TBco.Aviso_Marcar(idAv: Integer; Status: Smallint);
begin
  sq := 'Update TB_AVISO Set ';
  sq := sq + '  Status      = '+ IntToStr(Status);
  sq := sq + '  Where   id  = '+ IntToStr(idAv);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Aviso Data');
end;

procedure TBco.Aviso_Apagar(idAv: Integer);
begin
  sq := 'Delete from TB_AVISO  ';
  sq := sq + '  Where   id  = '+ IntToStr(idAv);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Aviso');
end;

procedure TBco.Aviso_Inserir(ligAg: Integer; DT: TdateTime; Parte,
  Status: Smallint);
begin

  sq := 'Insert Into TB_AVISO (DT, LigAg, Parte, status) values ( ';
  sq := sq + '  '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DT));
  sq := sq + ', '+ IntToStr(LigAg);
  sq := sq + ', '+ IntToStr(Parte);
  sq := sq + ', '+ IntToStr(Status);
  sq := sq + '  )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserirr Aviso');
end;

procedure TBco.Aviso_Mostrar(ligAg: Integer);
begin
  sq := 'Select * from TB_AVISO where ligAg = '+ IntToStr(ligAg);
  DM2.Roda_SQL(DM4.sdsAviso, DM4.cdsAviso, sq);
end;

function TBco.Agenda_MostrarUlt: Integer;
begin
  sq := 'Select First 2 id from TB_AGENDA order by id desc';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 0) then
    Agenda_MostrarUlt := DM2.cdsTMP.Fields[0].AsInteger
  else
    Agenda_MostrarUlt := 0;
end;

procedure TBco.Aviso_ApagarTodos(idAg: Integer);
begin
  sq := 'Delete from TB_AVISO  ';
  sq := sq + '  Where   LigAg  = '+ IntToStr(idAg);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Apagar Avisos');
end;

procedure TBco.Aviso_PQdatas(dt1, dt2: TDateTime);
begin
  sq := 'select ag.ID as idAg, av.id as idAV, av.DT, ag.DESCR, av.PARTE,  ag.valorPrev, ';
  sq := sq + ' case av.Status when 0 then '+QuotedStr('não lido')+' when 1 then '+QuotedStr('lido')+' when 2 then '+QuotedStr('finalizado')+' when 3 then '+QuotedStr('cancelado')+' end as avST ';
  sq := sq + ' from TB_AGENDA ag, TB_AVISO av ';
  sq := sq + ' where av.LIGAG = ag.id ';
  sq := sq + ' and (av.DT between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3))+' ) ';

  DM2.Roda_SQL(DM4.sdsPQAv, DM4.cdsPQAv, sq);

end;

procedure TBco.Aviso_PQdescr(nome: String);
begin
  sq := 'select ag.ID as idAg, av.id as idAV, av.DT, ag.DESCR, av.PARTE,  ag.valorPrev, ';
  sq := sq + ' case av.Status when 0 then '+QuotedStr('não lido')+' when 1 then '+QuotedStr('lido')+' when 2 then '+QuotedStr('finalizado')+' when 3 then '+QuotedStr('cancelado')+' end as avST ';
  sq := sq + ' from TB_AGENDA ag, TB_AVISO av ';
  sq := sq + ' where av.LIGAG = ag.id ';
  sq := sq + ' and (UPPER(ag.DESCR) LIKE '+QuotedStr('%'+UpperCase(nome)+'%')+' ) ';

  DM2.Roda_SQL(DM4.sdsPQAv, DM4.cdsPQAv, sq);
end;

procedure TBco.WebAt_Pesq1(dt: TdateTime);
begin
  sq := 'select nf.id, ro.dtRoma, nf.numNF, ro.num - CAST(ro.num / 1000000 AS INTEGER)* 1000000 as Romaneio, ';
  sq := sq + ' nf.valor, nf.DTENT, nf.HRENT, nf.status_ent, nf.NOCORR, ro.LIGMOT, nf.DOCDEST, nf.Baixa_Orig, nf.flag_geral ';
  sq := sq + ' from tb_notaf nf, TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM ';
  sq := sq + ' and nf.status_ent > 0 ';
  sq := sq + ' and ro.dtRoma = '+QuotedStr(BD_dia(dt,3));
  sq := sq + ' order by ro.dtRoma, nf.numNF ';

  DM2.Roda_SQL(DM4.sdsWEBc, DM4.cdsWEBc, sq);

end;

procedure TBco.WebAt_Pesq2(numR: Integer);
begin
  sq := 'select nf.id, ro.dtRoma, nf.numNF, ro.num - CAST(ro.num / 1000000 AS INTEGER)* 1000000 as Romaneio, ';
  sq := sq + ' nf.valor, nf.DTENT, nf.HRENT, nf.status_ent, nf.NOCORR, ro.LIGMOT, nf.DOCDEST, nf.Baixa_Orig, nf.flag_geral ';
  sq := sq + ' from tb_notaf nf, TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM ';
  sq := sq + ' and nf.status_ent > 0 ';
  sq := sq + ' and ro.Num = '+IntToStr(numR);
  sq := sq + ' order by ro.dtRoma, nf.numNF ';

  DM2.Roda_SQL(DM4.sdsWEBc, DM4.cdsWEBc, sq);

end;

procedure TBco.WebAt_Pesq3(idNF: Integer);
begin
  sq := 'select nf.id, ro.dtRoma, nf.numNF, ro.num - CAST(ro.num / 1000000 AS INTEGER)* 1000000 as Romaneio, ';
  sq := sq + ' nf.valor, nf.DTENT, nf.HRENT, nf.status_ent, nf.NOCORR, ro.LIGMOT, nf.DOCDEST, nf.Baixa_Orig, nf.flag_geral ';
  sq := sq + ' from tb_notaf nf, TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM ';
  sq := sq + ' and nf.id = '+IntToStr(idNF);
  DM2.Roda_SQL(DM4.sdsWEBc, DM4.cdsWEBc, sq);

end;

procedure TBco.WebAt_Pesq4;
  var idPesq:integer;
begin
  // NAO USAR - MUITO LENTO
  idPesq := Config_DTP_MostraN;
  sq := 'select nf.id, ro.dtRoma, nf.numNF, ro.num - CAST(ro.num / 1000000 AS INTEGER)* 1000000 as Romaneio, ';
  sq := sq + ' nf.valor, nf.DTENT, nf.HRENT, nf.status_ent, nf.NOCORR, ro.LIGMOT, nf.DOCDEST, nf.Baixa_Orig, nf.flag_geral ';
  sq := sq + ' from tb_notaf nf, TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM ';
  sq := sq + ' and nf.id >  '+idPesq.ToString+' and Baixa_orig > 10 ';
  sq := sq + ' order by ro.dtRoma, nf.numNF ';
  DM2.Roda_SQL(DM4.sdsWEBc, DM4.cdsWEBc, sq);
end;

procedure TBco.WebAt_Pesq5a;

begin

  sq := ' select nf.ID, nf.NUMNF, clt.NOME,  nf.DTENT, nf.HRENT,  nf.NOCORR, nf.OBS, ';
  sq := sq + ' case baixa_orig when 11 then '+ QuotedStr('Alterou baixa Flaydel') + ' when 13 then '+ QuotedStr('Alterou baixa Motorista') + ' else '+ QuotedStr('Outras') + ' END as SBAIXA ';
  sq := sq + ' from TB_NOTAF nf, TB_CLIENTE clt  ';
  sq := sq + ' where TB_NOTAF.LigCli = TB_CLIENTE.id and  baixa_orig >10 and nocorr>0  ';
  sq := sq + ' order by clt.nome, nf.NUMNF ';
  DM2.Roda_SQL(DM5.sdsWebS, DM5.cdsWebS, sq);
end;

procedure TBco.Aviso_Agora;
begin
  sq := 'select av.ID, av.DT, ag.DESCR, av.PARTE, av.dt-ag.AVISO_DIAS as aviso, ag.ValorPrev ';
  sq := sq + ' from TB_AGENDA ag, TB_AVISO av ';
  sq := sq + ' where av.LIGAG = ag.id ';
  sq := sq + ' and av.dt-ag.AVISO_DIAS <= Current_date ';
  sq := sq + ' and av.STATUS < 1 ';

  DM2.Roda_SQL(DM4.sdsAvisoM, DM4.cdsAvisoM, sq);

end;

procedure TBco.NotasReent_MostraDia(dtRoma: TDateTime);
begin
  sq := 'select TB_NOTAF.id as idNF, TB_NOTAF.NUMNF, TB_NOTAF.PESO, TB_NOTAF.VALOR, TB_NOTAF.CONTAREENT, ';
  sq := sq + ' TB_ROMA.dtRoma, TB_CLIENTE.NOME ';
  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_CLIENTE ';
  sq := sq + ' WHERE TB_NOTAF.NROMA = TB_ROMA.NUM ';
  sq := sq + ' and TB_NOTAF.LIGCLI = TB_CLIENTE.id ';
  sq := sq + ' and dtRoma = '+QuotedStr(BD_dia(dtRoma, 3));
  sq := sq + ' and TB_NOTAF.CONTAREENT > 1 ';
  sq := sq + ' order by contareent desc, NUMNF ';
  DM2.Roda_SQL(DM4.sdsNFre, DM4.cdsNFre, sq);

  sq := 'select contareent, COUNT(*) as Qt ';
  sq := sq + ' from TB_NOTAF, TB_ROMA ';
  sq := sq + ' WHERE TB_NOTAF.NROMA = TB_ROMA.NUM ';
  sq := sq + ' and dtRoma = '+QuotedStr(BD_dia(dtRoma, 3));
  sq := sq + ' and contareent >1 ';
  sq := sq + ' group BY contareent ';
  sq := sq + ' Order BY contareent ';
  DM2.Roda_SQL(DM4.sdsNFre2, DM4.cdsNFre2, sq);
end;

procedure TBco.NotasReent_MostraNum(numNF, idCli: Integer);
begin
  sq := 'select numnf, valor, peso, volume, ligCli, count(*) as qt ';
  sq := sq + ' from Tb_Notaf ';
  sq := sq + ' where numNF = '+IntToStr(numNF)+' and ligCli = '+IntToStr(idCli);
  sq := sq + ' group by numnf, valor, peso, volume, ligCli ';
  sq := sq + ' having count(*) > 2 ';

  DM2.Roda_SQL(DM4.sdsNFre, DM4.cdsNFre, sq);
end;

procedure TBco.Ticket_DiaConta(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select status_tkt, count(*) as conta  ';
  sq := sq + ' from Tb_notaf, tb_Roma ';
  sq := sq + ' where TB_roma.num = TB_Notaf.nroma ';
  sq := sq + ' and ligCli = '+IntToStr(idC);
  sq := sq + ' and dtRoma between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' group by status_tkt ';
  sq := sq + ' order by status_tkt ';

  DM2.Roda_SQL(DM4.sdsTKc, DM4.cdsTKc, sq);

end;

procedure TBco.Ticket_DiaMostra(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select dtRoma, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000000 as Romaneio, num, numnf, obs, Status_tkt ';
  sq := sq + ' from Tb_notaf, tb_Roma ';
  sq := sq + ' where TB_roma.num = TB_Notaf.nroma ';
  sq := sq + ' and ligCli = '+IntToStr(idC);
  sq := sq + ' and dtRoma between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' order by dtRoma, num ';

  DM2.Roda_SQL(DM4.sdsTKm, DM4.cdsTKm, sq);
end;

procedure TBco.Notas_InserirFIG(idNF: Integer; fig: String);
begin
  sq := 'Update TB_NOTAF SET IMGREC = '+QuotedStr(fig)+'where id = '+IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
end;

procedure TBco.Notas_MostrarFIG(idNF: Integer);
begin
  sq := 'Select IMGREC from TB_NOTAF where id = '+IntToStr(idNF);
end;

procedure TBco.Ticket2_DiaConta(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select status_tkt, count(*) as conta  ';
  sq := sq + ' from Tb_notaf, tb_Roma ';
  sq := sq + ' where TB_roma.num = TB_Notaf.nroma ';
  sq := sq + ' and ligCli = '+IntToStr(idC);
  sq := sq + ' and dtTKT between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' group by status_tkt ';
  sq := sq + ' order by status_tkt ';

  DM2.Roda_SQL(DM4.sdsTKc, DM4.cdsTKc, sq);

end;

procedure TBco.Ticket2_DiaMostra(idC: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select dtTKT, TB_ROMA.NUM -extract(YEAR from dtRoma)* 1000000 as Romaneio, num, numnf, obs, Status_tkt ';
  sq := sq + ' from Tb_notaf, tb_Roma ';
  sq := sq + ' where TB_roma.num = TB_Notaf.nroma ';
  sq := sq + ' and ligCli = '+IntToStr(idC);
  sq := sq + ' and dtTKT between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' order by dtTKT, num ';

  DM2.Roda_SQL(DM4.sdsTKd, DM4.cdsTKd, sq);

end;

procedure TBco.Marca_Cobrado(idNF, st: Integer);
begin
  // 0 = Não cobrado
  // 1 = calculado
  // 2 = feito por relatorio
  // 3 = feito por Cte
  sq := 'Update TB_NOTAF SET COB_OK = '+IntToStr(st)+'where id = '+IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Cobrado');
end;

procedure TBco.Marca_Pago(idNF, st: Integer);
begin
  sq := 'Update TB_NOTAF SET PAG_OK = '+IntToStr(st)+'where id = '+IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Pago');
end;

procedure TBco.CTe_Padrao_EmitAlterar(idT: Integer; RazaoS, Fantasia, Tels,
  CNPJ, Ie, RNTRC: String);
begin
  sq := 'UPDATE TB_TRANSP  SET  ';
  sq := sq + '  RazaoS    = '+ QuotedStr(RazaoS);
  sq := sq + ', Fantasia  = '+ QuotedStr(Fantasia);
  sq := sq + ', Tels      = '+ QuotedStr(Tels);
  sq := sq + ', CNPJ      = '+ QuotedStr(CNPJ);
  sq := sq + ', Ie        = '+ QuotedStr(Ie);
  sq := sq + ', RNTRC     = '+ QuotedStr(RNTRC);
  sq := sq + '  WHERE id  = '+ IntToStr(idT);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserirr Transp');

end;

procedure TBco.CTe_Padrao_EmitInserir(RazaoS, Fantasia, Tels, CNPJ, Ie,
  RNTRC: String);
begin
  sq := 'Insert Into TB_TRANSP (RazaoS, Fantasia, Tels, CNPJ, Ie, RNTRC) values ( ';
  sq := sq + '  '+ QuotedStr(RazaoS);
  sq := sq + ', '+ QuotedStr(Fantasia);
  sq := sq + ', '+ QuotedStr(Tels);
  sq := sq + ', '+ QuotedStr(CNPJ);
  sq := sq + ', '+ QuotedStr(Ie);
  sq := sq + ', '+ QuotedStr(RNTRC);
  sq := sq + '  )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Transp');
end;

procedure TBco.CTe_Padrao_EnderAlterar(idT, LigTransp, Numero: Integer;
  CEP, Ender, Complemento, Bairro, Cidade, Estado, codMun: String);
begin
  sq := 'UPDATE TB_TRANSPENDER SET ';
  sq := sq + '  LigTransp    = '+ IntToStr(LigTransp);
  sq := sq + ', Numero       = '+ IntToStr(Numero);
  sq := sq + ', CEP          = '+ QuotedStr(CEP);
  sq := sq + ', Ender        = '+ QuotedStr(Ender);
  sq := sq + ', Complemento  = '+ QuotedStr(Complemento);
  sq := sq + ', Bairro       = '+ QuotedStr(Bairro);
  sq := sq + ', Cidade       = '+ QuotedStr(Cidade);
  sq := sq + ', Estado       = '+ QuotedStr(Estado);
  sq := sq + ', codMun       = '+ QuotedStr(codMun);
  sq := sq + '  WHERE LigTransp = '+IntToStr(idT);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Transp');
end;

procedure TBco.CTe_Padrao_EnderInserir(LigTransp,Numero: Integer; CEP, Ender,
  Complemento, Bairro, Cidade, Estado, codMun: String);
begin
  sq := 'Insert Into TB_TRANSPENDER (LigTransp, Numero, CEP, Ender, Complemento, Bairro, Cidade, Estado, codMun) values ( ';
  sq := sq + '  '+ IntToStr(LigTransp);
  sq := sq + ', '+ IntToStr(Numero);
  sq := sq + ', '+ QuotedStr(CEP);
  sq := sq + ', '+ QuotedStr(Ender);
  sq := sq + ', '+ QuotedStr(Complemento);
  sq := sq + ', '+ QuotedStr(Bairro);
  sq := sq + ', '+ QuotedStr(Cidade);
  sq := sq + ', '+ QuotedStr(Estado);
  sq := sq + ', '+ QuotedStr(codMun);
  sq := sq + '  )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir Endereço');
end;

procedure TBco.CTe_Padrao_Mostra(idT: Integer);
begin
  sq := 'Select * From TB_TRANSP ';
  sq := sq + '  WHERE id  = '+ IntToStr(idT);
  DM2.Roda_SQL(DM4.sdsCteP, DM4.cdsCTeP, sq);

  sq := 'Select * From TB_TRANSPENDER ';
  sq := sq + '  WHERE Ligtransp  = '+ IntToStr(idT);
  DM2.Roda_SQL(DM4.sdsCtePe, DM4.cdsCTePe, sq);

end;

procedure TBco.CTe_Padrao_EmitAlterar2(idT: Integer; PastaXML, PastaPDF,
  Predom, MedidaUnid, MedidaTipo, Mot, Veic, Placa: String; Ambiente, Imposto: Integer);
begin
  sq := 'UPDATE TB_TRANSP  SET  ';
  sq := sq + '  PastaXML    = '+ QuotedStr(PastaXML);
  sq := sq + ', PastaPDF    = '+ QuotedStr(PastaPDF);
  sq := sq + ', Predom      = '+ QuotedStr(Predom);
  sq := sq + ', MedidaUnid  = '+ QuotedStr(MedidaUnid);
  sq := sq + ', MedidaTipo  = '+ QuotedStr(MedidaTipo);
  sq := sq + ', Ambiente    = '+ IntToStr(Ambiente);
  sq := sq + ', Imposto     = '+ IntToStr(Imposto);
  sq := sq + ', pMotNome    = '+ QuotedStr(Mot);
  sq := sq + ', pMotVeiculo = '+ QuotedStr(Veic);
  sq := sq + ', pMotPlaca   = '+ QuotedStr(Placa);
  sq := sq + '  WHERE id    = '+ IntToStr(idT);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar Transp 2');

end;



procedure TBco.Cte_Ger_Mostrar(dt1, dt2: TDateTime; tipo, idC: Integer);
begin
  sq := 'select a.id, a.datac, a.numc, a.base, a.numNota, a.LigNota, ';
  sq := sq + ' a.LigCli, a.StatusEnvio, a.StatusImp, a.Arquivo, a.LigTransp, b.dtEnt, a.Status  ';
  sq := sq + ' from TB_CONHEC a, TB_NOTAF b ';
  sq := sq + ' WHERE (a.lignota=b.id) ';
  sq := sq + ' and a.datac between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  if (tipo = 1) then sq := sq + ' and a.StatusEnvio < 4 '; // não enviados
  if (tipo = 2) then sq := sq + ' and a.StatusEnvio = 4 '; // enviados
  if (tipo = 3) then sq := sq + ' and a.StatusEnvio > 4 '; // cancelados
  if (tipo = 4) then sq := sq + ' and a.StatusEnvio = 6 '; // anular numero
  if (idc > 0) then sq := sq + ' and a.LigCli = '+idC.ToString;
  sq := sq + ' order by a.dataC, a.numC ';

  sqlRoda(DM4.sdsCteG, DM4.cdsCteG, sq);

end;

procedure TBco.Cte_Ger_MostrarNao(dt1, dt2: TDateTime);
begin
//  sq := ' select a.ligcli, b.NOME, COUNT(*) as QT from TB_CONHEC a, TB_CLIENTE b, TB_NOTAF c   ';
//  sq := sq + ' WHERE (a.LIGCLI = b.id) and (a.LIGNOTA = c.id)  and (a.statusenvio < 4) ';
//  sq := sq + ' and a.datac between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
//  sq := sq + ' group by a.ligcli, b.NOME ';
//  sq := sq + ' order by b.Nome ';

  sq := ' select a.ligcli, b.NOME, COUNT(*) as QT from TB_CONHEC a, TB_CLIENTE b   ';
  sq := sq + ' WHERE (a.LIGCLI = b.id) and (a.statusenvio < 4) ';
  sq := sq + ' and a.datac between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' group by a.ligcli, b.NOME ';
  sq := sq + ' order by b.Nome ';

  DM2.Roda_SQL(DM4.sdsCTne, DM4.cdsCTne, sq);

end;

procedure TBco.Cte_Ger_MostrarNaoDet(dt1, dt2: TDateTime; idC: Integer);
begin
  sq := 'select a.id, a.datac, a.numc, a.base, a.numNota, a.LigNota, ';
  sq := sq + ' a.LigCli, a.StatusEnvio, a.StatusImp, a.Arquivo, a.LigTransp, b.dtEnt, a.Status  ';
  sq := sq + ' from TB_CONHEC a, TB_NOTAF b ';
  sq := sq + ' WHERE (a.lignota=b.id)  and (a.statusenvio < 4)  ';
  sq := sq + ' and a.datac between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' and a.LigCli = '+idC.ToString;
  sq := sq + ' order by b.dtEnt ';

  DM2.Roda_SQL(DM4.sdsCteG, DM4.cdsCteG, sq);

end;

procedure TBco.Cte_Ger_MostrarNaoDetf(idC: Integer);
begin
  DM4.cdsCteG.Filtered := false;
  DM4.cdsCteG.Filter := 'Ligcli = '+idC.ToString;
  DM4.cdsCteG.Filtered := true;
end;

procedure TBco.Cte_MarcarEDI(nCte, idCli, st: Integer);
begin
  sq := 'Update TB_CONHEC SET STATUS_EDI = '+IntToStr(st)+'where NumC = '+IntToStr(nCte) + ' and  LIGCLI = ' + IntToStr(idCli);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Pago');
end;

procedure TBco.Cte_MarcarEnvio(idCte, st: Integer);
begin
  sq := 'Update TB_CONHEC SET STATUSENVIO = '+IntToStr(st)+'where id = '+IntToStr(idCte);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Pago');
end;

procedure TBco.Cte_MarcarImpressao(idCte, st: Integer);
begin
  sq := 'Update TB_CONHEC SET STATUSIMP = '+IntToStr(st)+'where id = '+IntToStr(idCte);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Pago');
end;

procedure TBco.Cte_AlterarArq(idCte: Integer; Arq: String);
begin
  sq := 'Update TB_CONHEC SET ';
  sq := sq + ' ARQUIVO  = '+ QuotedStr(Arq);
  sq := sq + ',DATAC    = '+ QuotedStr(BD_dia(Now,3));
  sq := sq + ' where id = '+ IntToStr(idCte);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Pago');
end;


procedure TBco.Conhec_MostraNF(idNF: Integer);
begin
  sq := 'Select * from TB_CONHEC where LigNota = '+ IntToStr(idNF);
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Conhec_MostraNUM(nCte, nTransp: Integer);
begin
  sq := 'Select * from TB_CONHEC where LigTransp = '+nTransp.ToString + ' and numC = '+ IntToStr(nCte)+ ' ' ;
  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);
end;

procedure TBco.Cte_Ger_Pesq(numPQ:String);

var let1, n, onde : String;
begin
  n   := UpperCase(Trim(numPQ));
  let1:= '';

  let1 := copy (n, 1,1);
  if (let1 = 'N') then onde := ' numNota = '+ copy (n, 2,Length(n))
    else onde := ' numC = '+ n;
  sq := 'select a.id, a.datac, a.numc, a.base, a.numNota, a.LigNota, ';
  sq := sq + ' a.LigCli, a.StatusEnvio, a.StatusImp, a.Arquivo, a.LigTransp, b.dtEnt, a.Status  ';
  sq := sq + ' from TB_CONHEC a, TB_NOTAF b ';
  sq := sq + ' WHERE (a.lignota=b.id)  and ' + onde + ' ';

  DM2.Roda_SQL(DM4.sdsCteG, DM4.cdsCteG, sq);

end;


procedure TBco.Cte_Ger_PesqFaixa(Faixa: String);

begin
  sq := 'select a.id, a.datac, a.numc, a.base, a.numNota, a.LigNota, ';
  sq := sq + ' a.LigCli, a.StatusEnvio, a.StatusImp, a.Arquivo, a.LigTransp, b.dtEnt, a.Status  ';
  sq := sq + ' from TB_CONHEC a, TB_NOTAF b ';
  sq := sq + ' WHERE (a.lignota=b.id)  and ' + Faixa + ' ';
  sq := sq + ' order by a.numc ';

  DM2.Roda_SQL(DM4.sdsCteG, DM4.cdsCteG, sq);

end;

function TBco.NotasSC_ContaBaixa(dt1, dt2: TDateTime): Integer;

var cont : Integer;

begin
  cont := 0;
//  sq := 'Select count(*) from TB_CONHEC where LigNota = '+ IntToStr(idNF);
//  DM2.Roda_SQL(DM4.sdsConh, DM4.cdsConh, sq);

  NotasSC_ContaBaixa := 0;
end;

function TBco.NotasSC_ContaCob(dt1, dt2: TDateTime): Integer;

var cont : Integer;

begin
  cont := 0;
  NotasSC_ContaCob := 0;
end;
// Devoluções
function TBco.NotasSC_ContaDevol(dt1, dt2: TDateTime): Integer;

var cont : Integer;

begin
  cont := 0;
  sq := 'select count(*) from TB_NOTAF, TB_OCORRE, TB_ROMA ';
  sq := sq + ' where dtRoma between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' and TB_NOTAF.nRoma = TB_ROMA.Num  and TB_OCORRE.num = nocorr ';
  sq := sq + ' and uso =3 and COB_OK <> 1';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  cont := DM2.cdsTMP.Fields[0].Value;
  NotasSC_ContaDevol:= cont;
end;
// Sem Baixa
procedure TBco.NotasSC_MostraBaixa(dt1, dt2: TDateTime);
begin

end;

procedure TBco.NotasSC_MostraCob(dt1, dt2: TDateTime);
begin
  sq := 'select dtRoma, numnf, nocorr, TB_ocorre.DESCR ';
  sq := sq + ' from TB_NOTAF, TB_ROMA, TB_OCORRE ';
  sq := sq + ' where dtRoma between '+QuotedStr(BD_dia(dt1,3))+' and '+QuotedStr(BD_dia(dt2,3));
  sq := sq + ' and TB_NOTAF.nRoma = TB_ROMA.Num  and TB_OCORRE.num = nocorr ';
  sq := sq + ' and nocorr > 0 and uso <3 and COB_OK <> 1 ';
  sq := sq + ' order by dtRoma DESC ';
  DM2.Roda_SQL(DM4.sdsSCob, DM4.cdsSCob, sq);
end;

procedure TBco.NotasSC_MostraDevol(dt1, dt2: TDateTime);
begin

end;

procedure TBco.Notas_Alt_Altera(idNF: Integer; FretePeso, AdicPeso,
  AdValor, Gris, pedagio, Emissao, TDE, qtPontos, vPontos, Reent, Devol,
  Outros, Icms: Double);
begin
  sq := 'UPDATE TB_NOTAF_ALT  SET  ';
  sq := sq + '  aFretePeso     = '+ Formata_Num(FretePeso);
  sq := sq + ', aAdic          = '+ Formata_Num(AdicPeso);
  sq := sq + ', aAdValor       = '+ Formata_Num(AdValor);
  sq := sq + ', aGris          = '+ Formata_Num(Gris);
  sq := sq + ', aPedagio       = '+ Formata_Num(Pedagio);
  sq := sq + ', aEmissao       = '+ Formata_Num(Emissao);
  sq := sq + ', aTDE           = '+ Formata_Num(TDE);
  sq := sq + ', aQtPontos      = '+ Formata_Num(QtPontos);
  sq := sq + ', aVPontos       = '+ Formata_Num(vPontos);
  sq := sq + ', aReent         = '+ Formata_Num(Reent);
  sq := sq + ', aDevol         = '+ Formata_Num(Devol);
  sq := sq + ', aOutros        = '+ Formata_Num(Outros);
  sq := sq + ', aTxIcms        = '+ Formata_Num(Icms);
  sq := sq + '  WHERE LigNota  = '+ IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.Notas_Alt_Insere(idNF: Integer; FretePeso, AdicPeso,
  AdValor, Gris, pedagio, Emissao, TDE, qtPontos, vPontos, Reent, Devol,
  Outros, Icms: Double);
begin
  sq := 'INSERT INTO TB_NOTAF_ALT (aFretePeso, aAdic, aAdValor, aGris, aPedagio, ';
  sq := sq + '  aEmissao, aTDE, aQtPontos, aVPontos, aReent, aDevol, aOutros, ';
  sq := sq + '  aTxIcms, LigNota) VALUES ( ';
  sq := sq + '  '+ Formata_Num(FretePeso);
  sq := sq + ', '+ Formata_Num(AdicPeso);
  sq := sq + ', '+ Formata_Num(AdValor);
  sq := sq + ', '+ Formata_Num(Gris);
  sq := sq + ', '+ Formata_Num(Pedagio);
  sq := sq + ', '+ Formata_Num(Emissao);
  sq := sq + ', '+ Formata_Num(TDE);
  sq := sq + ', '+ Formata_Num(QtPontos);
  sq := sq + ', '+ Formata_Num(vPontos);
  sq := sq + ', '+ Formata_Num(Reent);
  sq := sq + ', '+ Formata_Num(Devol);
  sq := sq + ', '+ Formata_Num(Outros);
  sq := sq + ', '+ Formata_Num(Icms);
  sq := sq + ', '+ IntToStr(idNF);
  sq := sq + '  )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
end;

procedure TBco.Notas_Alt_MostraNF(idNF: integer);
begin
  sq := 'Select * from TB_NOTAF_ALT where LigNota = '+ IntToStr(idNF);
  DM2.Roda_SQL(DM4.sdsNFalt, DM4.cdsNFalt, sq);
end;

procedure TBco.Espelho_AlteraDados(idE:Integer; CNPJ, iE, Chave, Endereco: String;
  Numero: integer; Complemento, Bairro, Cidade, Estado, CEP, codMun: String);
begin
  sq := 'UPDATE TB_NOTAS  SET  ';
  sq := sq + '  DCNPJ       = '+ QuotedStr(CNPJ);
  sq := sq + ', DIE         = '+ QuotedStr(iE);
  sq := sq + ', ChaveNFe    = '+ QuotedStr(Chave);
  sq := sq + ', Endereco    = '+ QuotedStr(Endereco);
  sq := sq + ', Complemento = '+ QuotedStr(Complemento);
  sq := sq + ', Bairro      = '+ QuotedStr(Bairro);
  sq := sq + ', Cidade      = '+ QuotedStr(Cidade);
  sq := sq + ', Estado      = '+ QuotedStr(Estado);
  sq := sq + ', CEP         = '+ QuotedStr(CEP);
  sq := sq + ', CodMunicipio= '+ QuotedStr(CodMun);
  sq := sq + ', Numero      = '+ IntToStr(Numero);
  sq := sq + '  WHERE id    = '+ IntToStr(idE);
  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq , 'Alterar');
end;

procedure TBco.Espelho_AlteraCNPJ(idE:Integer; CNPJ: String);
begin
  sq := 'UPDATE TB_NOTAS  SET  ';
  sq := sq + '  DCNPJ       = '+ QuotedStr(CNPJ);
  sq := sq + '  WHERE id    = '+ IntToStr(idE);
  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq , 'Alterar');
end;


procedure TBco.Transp_SalAjud_Altera(Salario_Ajud: Double);
begin
  sq := 'UPDATE TB_Transp SET Salario_Ajud = '+Formata_Num(Salario_Ajud);
  sq := sq + '  WHERE id    = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP , sq , 'Alterar');
end;

function TBco.Transp_SalAjud_Mostra: Double;
begin
  sq := 'Select Salario_Ajud from TB_TRANSP where id = 1';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  Transp_SalAjud_Mostra := DM2.cdsTMP.Fields[0].AsFloat;
end;

procedure TBco.Cte_Entregue(numCTE, idNota: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET nConh = '+IntToStr(numCTE)+',  LigRel = -1, COB_OK = 2 WHERE id = '+IntToStr(idNota);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP , sq , 'Alterar');
end;

function TBco.Cte_Erros_Conta(dta, dtb: TDateTime): Integer;
begin
  sq := 'select Count(*) as qtErros ';
  sq := sq + ' from TB_CONHEC ';
  sq := sq + ' WHERE (status>80) and datac between '+QuotedStr(BD_dia(dta,3))+' and '+QuotedStr(BD_dia(dtb,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  result := DM2.cdsTMP.Fields[0].AsInteger;
end;

procedure TBco.Cte_erros_Itens(dta, dtb: TDateTime; erro: Integer);
begin
  if erro =0 then
  begin
    sq := 'select id, numc, status, ligcli, numnota, base, lignota ';
    sq := sq + ' from TB_CONHEC ';
    sq := sq + ' WHERE (status>80) ';
    sq := sq + ' and datac between '+QuotedStr(BD_dia(dta,3))+' and '+QuotedStr(BD_dia(dtb,3));
    DM2.Roda_SQL(DM5.sdsErro2, DM5.cdsErro2, sq);
  end
  else
  begin
    DM5.cdsErro2.Filtered := false;
    DM5.cdsErro2.Filter := 'status='+erro.ToString;
    DM5.cdsErro2.Filtered := true;
  end;

end;

procedure TBco.Cte_erros_Lista(dta, dtb: TDateTime);
begin
  sq := 'select STATUS, count(*) as Qt, case status ';
  sq := sq + ' when  90 then '+QuotedStr('Valor = zero');
  sq := sq + ' when  91 then '+QuotedStr('Valor acima 1000');
  sq := sq + ' when 204 then '+QuotedStr('Duplicado');
  sq := sq + ' when 208 then '+QuotedStr('CNPJ errado');
  sq := sq + ' when 238 then '+QuotedStr('Data atrasada');
  sq := sq + ' when 424 then '+QuotedStr('Cód Mun errado');
  sq := sq + ' else '+QuotedStr('Erro desconhecido')+ ' end as sErro ';
  sq := sq + ' from TB_CONHEC ';
  sq := sq + ' where (status > 80) ';
  sq := sq + ' and datac between '+QuotedStr(BD_dia(dta,3))+' and '+QuotedStr(BD_dia(dtb,3));
  sq := sq + ' group by status ';
  sq := sq + ' order by status ';
  DM2.Roda_SQL(DM5.sdsErro1, DM5.cdsErro1, sq);

end;

procedure TBco.Cte_erros_Mostra(dta, dtb: TDateTime);
begin
  sq := 'select  ';
  sq := sq + ' from TB_CONHEC ';
  sq := sq + ' WHERE datac between '+QuotedStr(BD_dia(dta,3))+' and '+QuotedStr(BD_dia(dtb,3));
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

end;

procedure TBco.Cte_NaoEntregue( idNota: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET nConh = 0,  LigRel = 0, COB_OK = 0 WHERE id = '+IntToStr(idNota);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP , sq , 'Alterar');
end;

procedure TBco.Cte_Notas(nCte, idTransp: Integer);

begin
  sq := 'select a.id, a.numnf, a.valor, a.nconh, b.NOME, a.ligcli, a.LIGDCOB, ';
  sq := sq + ' a.CteGrupo, a.PESO, a.SERIENF, a.CEP, a.NOMEDEST, a.PONTO, a.TIPOLOCAL, a.VLRCOMBINADO, a.TIPO_COB ';
  sq := sq + ' from TB_NOTAF a, TB_CLIENTE b ';
  sq := sq + ' WHERE a.ligTransp = '+idTransp.ToString+' and  a.nConh = '+ IntToStr(nCTe)+ ' and a.LIGCLI=b.id and dtCria > '+QuotedSTr('2019-05-01')+' order by numnf ';
  DM2.Roda_SQL(DM5.sdsNFcte, DM5.cdsNFcte, sq);
end;

procedure TBco.Cte_NotasNUM(nCte: Integer);
begin
  sq := 'select a.id, a.numnf, a.valor, a.nconh, b.NOME, a.ligcli, a.LIGDCOB, ';
  sq := sq + ' a.CteGrupo, a.PESO, a.SERIENF, a.CEP, a.NOMEDEST, a.PONTO, a.TIPOLOCAL, a.VLRCOMBINADO, a.TIPO_COB ';
  sq := sq + ' from TB_NOTAF a, TB_CLIENTE b ';
  sq := sq + ' WHERE a.LIGCLI=b.id and dtCria > '+QuotedSTr('2019-05-01')+' and a.nConh = '+ IntToStr(nCTe)+ ' order by a.numnf ';
  DM2.Roda_SQL(DM5.sdsNFcte, DM5.cdsNFcte, sq);
end;

procedure TBco.Cte_NotasTOT(nCte, idTransp: Integer);
begin
  sq := 'select sum(VALOR), SUM(Peso) from TB_Notaf  ';
  sq := sq + ' where ligtransp= '+idTransp.ToString;
  sq := sq + ' and nconh = '+nCTe.ToString;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.Notas_XML_Importa(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali: String; DtNotaF: TDateTime; tLocal: Integer;
  nomeDest,FoneDest, DocDest: String; serie:Integer);
begin
  sq := 'Insert Into TB_NOTAF (ligCli, numNF, Volume, Valor, Peso ';
  sq := sq + ', CEP, Locali, dtNOTA, tipoLocal, nRoma, nConh, Entregue, ProxRoma ';
  sq := sq + ', nOcorr, LigRel, Origem, extranum, nomedest, FoneDest ';
  sq := sq + ', status_edi, cob_ok, pag_ok, ligtransp, ligrel, ponto ';
  sq := sq + ', ContaReent, serieNF, dtCria, dtAlt, DocDest, Pende) VALUES ( ';
  sq := sq + IntToStr(LigCli) + ', ';
  sq := sq + IntToStr(numNF) + ', ';

  sq := sq + IntToStr(Volume) + ', ';
  sq := sq + Formata_Num(Valor) + ', ';
  sq := sq + Formata_Num(Peso) + ', ';

  sq := sq + QuotedStr(copy(CEP,1,9)) + ', ';
  sq := sq + QuotedStr(Trim(copy(Locali,1,25)))+ ', ';
  sq := sq + QuotedStr(BD_dia(DtNotaF, 3)) + ', ';
  sq := sq + IntToStr(tLocal) + ', ';

  sq := sq +  '0,0, ';
  sq := sq + QuotedStr('Nao')+', 0,0,0,5,0, ';
  sq := sq + QuotedStr(copy(nomeDest,1,50))+', ';
  sq := sq + QuotedStr(copy(FoneDest,1,14))+' ';
  sq := sq + ', 0,0,0,3,0,0,0, ';
  sq := sq + IntToStr(serie) + '  ';
  sq := sq + ', '+QuotedStr(BD_dia(Now, 1));
  sq := sq + ', '+QuotedStr(BD_dia(Now, 1));
  sq := sq + ', '+QuotedStr(copy(DocDest,1,18));
  sq := sq + ', 0 ';
  sq := sq + ' ) ';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

  {
  // origem DESCREVE
  0= Nao Marcada
  1= Manual
  2= Coleta
  3= Importada EDI
  4= Reentrega
  5= Importada XML
  6= Importada Excel
   }
  // Origem = 5
  begin
    sq := 'insert into TB_NFUNICA (ligCli, NumNota, Status, dtCriada) VALUES ';
    sq := sq + ' ('+IntToStr(ligCli);
    sq := sq + ', '+IntToStr(numNF);
    sq := sq + ', 0';
    sq := sq + ', '+QuotedStr(BD_dia(Now, 3));;
    sq := sq + ' ) ';

    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');
  end;

end;


procedure TBco.Notas_XML_Importa_Alt(ligCli, numNF, serieNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, nomeDest, foneDest, DocDest: String);
begin
  sq := 'Update TB_NOTAF SET  ';

  sq := sq + '  Volume   = ' + IntToStr(Volume);
  sq := sq + ', Valor    = ' + Formata_Num(Valor);
  sq := sq + ', Peso     = ' + Formata_Num(Peso);

  sq := sq + ', CEP      = ' + QuotedStr(CEP) + ' ';
  sq := sq + ', Locali   = ' + QuotedStr(Trim(Locali))+ ' ';

  sq := sq + ', nomeDest = ' + QuotedStr(copy(nomeDest,1,49))+'  ';
  sq := sq + ', foneDest = ' + QuotedStr(copy(FoneDest,1,15))+'  ';
  sq := sq + ', DocDest  = ' + QuotedStr(copy(DocDest,1,18))+'  ';
  sq := sq + ', dtAlt    = ' + QuotedStr(BD_dia(Now, 1));

  sq := sq + '  Where ';
  sq := sq + '   numNF   = ' + IntToStr(numNF);
  sq := sq + ' and  ligCli  = ' + IntToStr(ligCli);

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.Espelho_XML_Importa(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, trp_nome, trp_cnpj, RazaoS, Endereco,
  Complemento, Bairro, Cidade, CodMunicipio, Estado: String; Numero,
  NumConhec: Integer; CNPJ, IE, ChaveNFe: String);
begin
  sq := 'Insert Into TB_NOTAs (ligCli, numNF, Volume, Valor, Peso ';
  sq := sq + ', CEP, Locali, Transp_Nome, Transp_CNPJ, RazaoS, Endereco, Complemento, Cidade, Bairro, CodMunicipio, Estado, Numero, NumConhec, dCNPJ, dIE, ChaveNFe ) VALUES ( ';
  sq := sq + IntToStr(LigCli) + ', ';
  sq := sq + IntToStr(numNF) + ', ';

  sq := sq + IntToStr(Volume) + ', ';
  sq := sq + Formata_Num(Valor) + ', ';
  sq := sq + Formata_Num(Peso) + ', ';

  sq := sq + QuotedStr(copy(CEP,1,9)) + ', ';
  sq := sq + QuotedStr(Trim(copy(Locali,1,15)))+ ', ';

  sq := sq + QuotedStr(copy(trp_nome,1,25)) + ', ';
  sq := sq + QuotedStr(copy(trp_cnpj,1,18)) + ', ';

  sq := sq + QuotedStr(copy(RazaoS,1,40)) + ', ';
  sq := sq + QuotedStr(copy(Endereco,1,70)) + ', ';
  sq := sq + QuotedStr(copy(complemento,1,15)) + ', ';
  sq := sq + QuotedStr(copy(cidade,1,30)) + ', ';
  sq := sq + QuotedStr(copy(bairro,1,30)) + ', ';
  sq := sq + QuotedStr(copy(codMunicipio,1,7)) + ', ';
  sq := sq + QuotedStr(estado) + ', ';

  sq := sq + IntToStr(numero) + ', ';
  sq := sq + IntToStr(numConhec) + ', ' ;
  sq := sq + QuotedStr(copy(trim(CNPJ),1,18)) + ', ';
  sq := sq + QuotedStr(copy(trim(IE),1,18)) + ', ';
  sq := sq + QuotedStr(copy(trim(ChaveNFe),1,50));

  sq := sq + ' ) ';


  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq, 'Inserir');

end;

function TBco.Notas_Existe(ligCli, numNF, volume: Integer;
  valorNF: Double): Boolean;

var ok : Boolean;

begin
  if VarIsNull(ligCli)  then ligCli  := 0;
  if VarIsNull(numNF)   then numNF   := 0;
  if VarIsNull(valorNF) then valorNF := 0;
  if VarIsNull(volume)  then valorNF := 0;

  ok := false;
  sq := 'Select * from TB_NOTAF where LigCli = '+ IntToStr(ligCli);
  sq := sq + ' and  numNF  = '+ IntToStr(numNF) + ' ';
  //sq := sq + ' and  valor  = '+ Formata_Num(valorNF) + ' ';
  //sq := sq + ' and  volume = '+ IntToStr(volume)+ ' ';


  DM2.Roda_SQL(DM1.sdsNotas,DM1.cdsNotas, sq);

  if (DM1.cdsNotasID.Value <> null) and (DM1.cdsNotasid.Value > 0) then ok := true;

  Notas_Existe := ok;
end;



procedure TBco.Espelho_XML_Altera(ligCli, numNF, Volume: Integer; Valor,
  Peso: double; CEP, Locali, trp_nome, trp_cnpj, RazaoS, Endereco,
  Complemento, Bairro, Cidade, CodMunicipio, Estado: String; Numero,
  NumConhec: Integer; CNPJ, IE, ChaveNFe: String);
begin
  sq := 'Update TB_NOTAs SET ';
  sq := sq + ' Volume = '+ IntToStr(Volume);
  sq := sq + ', Valor = '+ Formata_Num(Valor) ;
  sq := sq + ', Peso = '+ Formata_Num(Peso) ;

  sq := sq + ', CEP = '+ QuotedStr(copy(CEP,1,9));
  sq := sq + ', Locali = '+ QuotedStr(copy(Trim(Locali),1,15));

  sq := sq + ', Transp_Nome = '+ QuotedStr(copy(trp_nome,1,25));
  sq := sq + ', Transp_CNPJ = '+ QuotedStr(copy(trp_cnpj,1,18));

  sq := sq + ', RazaoS = '+ QuotedStr(copy(RazaoS,1,40));
  sq := sq + ', Endereco = '+ QuotedStr(copy(Endereco,1,70));
  sq := sq + ', Complemento = '+ QuotedStr(copy(complemento,1,15));
  sq := sq + ', Cidade = '+ QuotedStr(copy(cidade,1,30));
  sq := sq + ', Bairro = '+ QuotedStr(copy(bairro,1,30));
  sq := sq + ', codMunicipio = '+ QuotedStr(copy(codMunicipio,1,7));
  sq := sq + ', Estado = '+ QuotedStr(estado);

  sq := sq + ', Numero = '+ IntToStr(numero);
  sq := sq + ', NumConhec = '+ IntToStr(numConhec);
  sq := sq + ', dCNPJ = '+ QuotedStr(copy(trim(CNPJ),1,18));
  sq := sq + ', dIE = '+ QuotedStr(copy(trim(IE),1,18));
  sq := sq + ', ChaveNFe = '+ QuotedStr(copy(trim(ChaveNFe),1,50));
  sq := sq + ' WHERE (ligCli = '+IntToStr(ligCli)+' and numNF = '+IntToStr(numNF)+') ';

  DM2.Executa_SQL(DM4.ConectaCONH, DM4.sdsEspelho, sq, 'Inserir');
end;

procedure TBco.Cte_Transp(ligTransp, idcli: integer; dt:TDateTime);
begin
  sq := 'Update TB_NOTAF SET ';
  sq := sq + ' ligTransp = '+ IntToStr(ligTransp) ;
  sq := sq + ' WHERE (dtNota between '+QuotedStr(BD_dia(dt-3,3))+' and '+QuotedStr(BD_dia(dt+4,3))+') and ((ligTransp is null) or (ligTransp=0)) ';
  if idCli>0 then sq := sq + ' and LigCli = ' + idCli.ToString;


  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Funcs_ListaMotoristas;
begin
  sq := 'Select id, nome, cpf, rg, segvalidade, chvalidade, id, ativo ';
  sq := sq + ' from tb_funcs ';
  sq := sq + ' where tipo = 1 ';
  sq := sq + ' order by Nome ';
  DM2.Roda_SQL(DM4.sdsMot, DM4.cdsMot, sq);
end;

Function  TBco.PagGrupo_Grupoinsere(ano: Integer; Descricao: String;
  dtInicio, dtFim: TDateTime) : Integer;
begin
  sq := 'INSERT INTO TB_PAGGRUPO (Ano, Descricao, dtInicio, dtFim, vCalc, vPag ) VALUES ( ';
  sq := sq + '  ' + IntToStr(ano);
  sq := sq + ', ' + QuotedStr(Descricao);
  sq := sq + ', ' + QuotedStr(BD_dia(dtInicio,3));
  sq := sq + ', ' + QuotedStr(BD_dia(dtFim, 3));
  sq := sq + ', 0,0 ';
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

  sq := 'Select first 3 id, ano from TB_PAGGRUPO order by id desc';
  DM2.Roda_SQL(DM2.sdsTMP,DM2.cdsTMP, sq);
  DM2.cdsTMP.First;

  PagGrupo_Grupoinsere := DM2.cdsTMP.Fields[0].Value;

end;

procedure TBco.PagGrupo_GrupoTotais(idPg:Integer; vCalc, vPago : Double ) ;
begin
  sq := 'Update TB_PAGGRUPO SET ';
  sq := sq + '  vCalc = '+ Formata_Num(vCalc);
  sq := sq + ', vPag  = '+ Formata_Num(vPago);
  sq := sq + ' WHERE id = '+IntToStr(idPg);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;


procedure TBco.PagGrupo_GrupoLista(AnoNum: Integer);
begin
  sq := 'Select * from TB_PAGGRUPO where Ano = '+IntToStr(AnoNum) + ' order by id desc';
  DM2.Roda_SQL(DM4.sdsPagG,DM4.cdsPagG, sq);
end;

procedure TBco.PagGrupo_GrupoMostraID(idPg: integer);
begin
  sq := 'Select * from TB_PAGGRUPO where id = ' + IntToStr(idPg);
  DM2.Roda_SQL(DM4.sdsPagG, DM4.cdsPagG, sq);
end;

procedure TBco.PagGrupo_ItensGravaVM(idIt: Integer; vMotorista: double);
begin
  sq := 'UPDATE TB_PAGDETALHES SET ';
  sq := sq + ' vCalcM   = '+Formata_Num(vMotorista);
  sq := sq + ' WHERE id = ' + IntToStr(idIt);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.PagGrupo_ItensGravaVP(idIt: Integer; vPago: Double; modo, banco, conta:String);
begin
  sq := 'UPDATE TB_PAGDETALHES SET   ';
  sq := sq + '  vpago  = '+Formata_Num(vPago);
  sq := sq + ', modo   = '+QuotedStr(modo);
  sq := sq + ', dtPagm = '+QuotedStr(BD_dia(Now,1));
  sq := sq + ', Banco  = '+QuotedStr(banco);
  sq := sq + ', Conta  = '+QuotedStr(conta);
  sq := sq + '  WHERE id = ' + IntToStr(idIt);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.PagGrupo_ItensInsere(ligPag, ligFunc: Integer; vServico,
  vCreditos, vVales, VcalcF: Double);
begin
  sq := 'INSERT INTO TB_PAGDETALHES (ligPag, ligFunc, vServico, vCreditos, vVales, vCalcF, ';
  sq := sq + ' vCalcM, vPago, modo ) VALUES ( ';
  sq := sq + '  ' + IntToStr(ligPag);
  sq := sq + ', ' + IntToStr(ligFunc);
  sq := sq + ', ' + Formata_Num(vServico);
  sq := sq + ', ' + Formata_Num(vCreditos);
  sq := sq + ', ' + Formata_Num(vVales);
  sq := sq + ', ' + Formata_Num(vCalcF);
  sq := sq + ', 0, 0 ';
  sq := sq + ', ' + QuotedStr('nao pago');
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.PagGrupo_ItensLista(idPg: integer);
begin
  sq := 'Select TB_PAGDETALHES.*, TB_FUNCS.Nome, TB_FUNCS.ID as idF  From TB_PAGDETALHES, TB_FUNCS ';
  sq := sq + ' where TB_Funcs.id = TB_PAGDETALHES.LIGFUNC ';
  sq := sq + ' and ligPag = ' + IntToStr(idPg);
  sq := sq + ' order by Nome ';
  DM2.Roda_SQL(DM4.sdsPagI, DM4.cdsPagI, sq);

end;

procedure TBco.PagGrupo_ItensMostraID(idIt: Integer);
begin
  sq := 'Select TB_PAGDETALHES.*  From TB_PAGDETALHES ';
  sq := sq + ' where id = ' + IntToStr(idIt);
  DM2.Roda_SQL(DM4.sdsPagI, DM4.cdsPagI, sq);
end;

procedure TBco.PagGrupo_ItensMotorista(idMot: integer);
begin
  sq := 'Select * From TB_PAGDETALHES ';
  sq := sq + ' where LigFunc = ' + IntToStr(idMot);
  sq := sq + ' Order by id desc';
  DM2.Roda_SQL(DM4.sdsPagI2, DM4.cdsPagI2, sq);
end;

procedure TBco.PagGrupo_ItensAltera(ligPag, ligFunc: Integer; vServico,
  vCreditos, vVales, VcalcF: Double);
begin
  sq := 'UPDATE TB_PAGDETALHES SET ';
  sq := sq + '  vServico = ' + Formata_Num(vServico);
  sq := sq + ', vCreditos= ' + Formata_Num(vCreditos);
  sq := sq + ', vVales   = ' + Formata_Num(vVales);
  sq := sq + ', vCalcF   = ' + Formata_Num(vCalcF);
  sq := sq + ' WHERE ligPag = '+ IntToStr(ligPag) + ' and ligFunc = '+ IntToStr(ligFunc);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.CliGrupo_Altera(idG: Integer; cliG: String);
begin
  sq := 'UPDATE TB_CLIGRUPO SET ';
  sq := sq + '  NomeG = ' + QuotedStr(cliG);
  sq := sq + ' WHERE id = '+ IntToStr(idG);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.CliGrupo_Apaga(idG: integer);
begin
  sq := 'DELETE FROM TB_CLIGRUPO ';
  sq := sq + ' WHERE id = '+ IntToStr(idG);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.CliGrupo_Insere(cliG: String);
begin
  sq := 'INSERT INTO TB_CLIGRUPO (NomeG) values ( ';
  sq := sq + '  ' + QuotedStr(cliG);
  sq := sq + ') ' ;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.CliGrupo_ListaCli(idG: integer);
begin
  sq := 'Select id, Nome, LigGrupo, CNPJ From TB_CLIENTE ';
  sq := sq + ' Where LigGrupo = '+IntToStr(idG);
  sq := sq + ' order by Nome ';
  DM2.Roda_SQL(DM4.sdsGRcli, DM4.cdsGRcli, sq);
end;

procedure TBco.Cligrupo_Mostra;
begin
  sq := 'Select First 20 id, NomeG From TB_CLIGRUPO ';
  sq := sq + ' order by NomeG ';
  DM2.Roda_SQL(DM4.sdsGR, DM4.cdsGR, sq);
end;

procedure TBco.Cligrupo_Pesquisa(cliG: String);
begin
  sq := 'Select First 20 id, NomeG From TB_CLIGRUPO ';
  sq := sq + ' where UPPER(NomeG) Like '+ QuotedStr(Uppercase(cliG)+'%');
  sq := sq + ' order by NomeG ';
  DM2.Roda_SQL(DM4.sdsGR, DM4.cdsGR, sq);
end;


procedure TBco.CliGrupo_InsereCli(idC, idG: Integer);
begin
  sq := 'UPDATE TB_CLIENTE SET ';
  sq := sq + '  LigGrupo = ' + IntToStr(idG);
  sq := sq + ' WHERE id = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Cotacao_Altera(idCot, ligCli, numNF, Volume, Status: Integer; Valor,
  Peso, med1, med2, med3, VlrCot: double; Nome, email, obs, Cep, DestNome, DestCNPJ, locali: String; dtServ:TDateTime);
begin
  sq := 'UPDATE TB_COTACAO SET ';
  sq := sq + '  LigCli = ' + IntToStr(ligCli);
  sq := sq + ', numNF  = ' + IntToStr(numNF);
  sq := sq + ', Volume = ' + IntToStr(Volume);
  sq := sq + ', Status = ' + IntToStr(Status);
  sq := sq + ', Valor  = ' + Formata_Num(Valor);;
  sq := sq + ', Peso   = ' + Formata_Num(Peso);;
  sq := sq + ', med1   = ' + Formata_Num(med1);;
  sq := sq + ', med2   = ' + Formata_Num(med2);;
  sq := sq + ', med3   = ' + Formata_Num(med3);;
  sq := sq + ', VlrCot = ' + Formata_Num(VlrCot);;
  sq := sq + ', Nome   = ' + QuotedStr(Nome);
  sq := sq + ', email  = ' + QuotedStr(email);
  sq := sq + ', obs    = ' + QuotedStr(obs);
  sq := sq + ', CEP    = ' + QuotedStr(CEP);
  sq := sq + ', DestNome = ' + QuotedStr(DestNome);
  sq := sq + ', DestCNPJ = ' + QuotedStr(DestCNPJ);
  sq := sq + ', Locali = ' + QuotedStr(locali);
  sq := sq + ', dtServ = ' + QuotedStr(BD_dia(dtServ, 3));
  sq := sq + ' WHERE id = '+ IntToStr(idCot);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Cotacao_AltStatus(idCot, status: Integer);
begin
  sq := 'UPDATE TB_COTACAO SET ';
  sq := sq + '  Status = ' + IntToStr(Status);
  sq := sq + ' WHERE id = '+ IntToStr(idCot);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Cotacao_Insere(ligCli, numNF, Volume, Status: Integer; Valor, Peso,
  med1, med2, med3, VlrCot: double; Nome, email, obs, Cep, DestNome, DestCNPJ, Locali: String; dtServ:TDateTime);
begin
  sq := 'INSERT INTO TB_COTACAO (ligCli, dtCOT, numNF, Volume, Status, ';
  sq := sq + '  Valor, Peso, med1, med2, med3, VlrCot, ';
  sq := sq + '  Nome, email, obs, CEP, DestNome, DestCNPJ, Locali, dtServ) Values ( ';
  sq := sq + '  ' + IntToStr(ligCli);
  sq := sq + ', ' + QuotedStr(BD_dia(Now, 3));
  sq := sq + ', ' + IntToStr(numNF);
  sq := sq + ', ' + IntToStr(Volume);
  sq := sq + ', ' + IntToStr(Status);
  sq := sq + ', ' + Formata_Num(Valor);
  sq := sq + ', ' + Formata_Num(Peso);;
  sq := sq + ', ' + Formata_Num(med1);;
  sq := sq + ', ' + Formata_Num(med2);;
  sq := sq + ', ' + Formata_Num(med3);;
  sq := sq + ', ' + Formata_Num(VlrCot);;
  sq := sq + ', ' + QuotedStr(Nome);
  sq := sq + ', ' + QuotedStr(email);
  sq := sq + ', ' + QuotedStr(obs);
  sq := sq + ', ' + QuotedStr(CEP);
  sq := sq + ', ' + QuotedStr(DestNome);
  sq := sq + ', ' + QuotedStr(DestCNPJ);
  sq := sq + ', ' + QuotedStr(Locali);
  sq := sq + ', ' + QuotedStr(BD_dia(dtServ, 3));
  sq := sq + ') ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Cotacao_MostraID(idCot: Integer);
begin
  sq := 'Select * From TB_COTACAO  ';
  sq := sq + ' Where id = '+IntToStr(idCot);
  DM2.Roda_SQL(DM4.sdsCot, DM4.cdsCot, sq);
end;

procedure TBco.Cotacao_Pesq(idCli, status: Integer);
begin
  sq := 'Select * From TB_COTACAO ';
  sq := sq + ' Where status = '+IntToStr(status);
  if (idCli>0) then sq := sq + ' and LigCli = '+IntToStr(idCli);
  sq := sq + ' order by dtCot desc ';
  DM2.Roda_SQL(DM4.sdsCot, DM4.cdsCot, sq);
end;

procedure TBco.Cotacao_PesqDEST(Dest: String);
begin
  sq := 'Select * From TB_COTACAO  ';
  sq := sq + ' Where DestNome Like '+QuotedStr('%'+Dest+'%')+' or DestCNPJ Like '+QuotedStr(Dest+'%');
  sq := sq + ' order by dtCot desc ';
  DM2.Roda_SQL(DM4.sdsCot, DM4.cdsCot, sq);
end;

procedure TBco.Cotacao_PesqDatas(dtA, dtB : TDateTime);
begin
  sq := 'Select * From TB_COTACAO  ';
  sq := sq + ' Where dtServ between ' + QuotedStr(BD_dia(dtA,3)) + ' and ' + QuotedStr(BD_dia(dtB,3)) + ' ';
  sq := sq + ' order by dtServ desc ';
  DM2.Roda_SQL(DM4.sdsCot, DM4.cdsCot, sq);
end;

procedure TBco.Stok_Central;
begin

end;


procedure TBco.Notas_Pesquisa(idCli, Origem: Integer; dt1, dt2: TDateTime);
begin
  sq := 'Select ro.dtRoma, ro.num -extract(YEAR from ro.dtRoma)* 1000000 as Romaneio , ';
  sq := sq + ' case TB_NOTAF.STATUS_ENT when 1 then ' + QuotedStr('Ok')+ '  when 2 then TB_NOTAF.Obs else ' + QuotedStr('-')+ ' END as Entregue, ';
  sq := sq + ' numnf, valor, volume, peso, vFrete, ';
  sq := sq + ' case origem when 2 then ' + QuotedStr('Coleta')+' ELSE ' + QuotedStr('Nota Fiscal') + ' end as DOC, ';
  sq := sq + ' nf.id as idNF, dtEnt, nomeDest, CEP, Locali, TipoLocal ';
  sq := sq + ' from TB_NOTAF nf , TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM   ';
  sq := sq + ' and ro.DTROMA between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  if (idCli  > 0) then sq := sq + ' and nf.LIGCLI = '+IntToStr(idCli);
  if (origem = 1) then sq := sq + ' and Origem <> 2 '; // Nota F
  if (origem > 2) then sq := sq + ' and Origem =  2 '; // coleta
  sq := sq + ' order by dtRoma ';
  DM2.Roda_SQL(DM4.sdsPesq, DM4.cdsPesq, sq);

end;

function TBco.Notas_PQcontaNF(tipo, idCli, Origem: Integer; dt1,
  dt2: TDateTime):Double;

var cont, frete, resp : Double;

begin
  sq := ' select count(nf.id), sum(nf.vfrete) ';
  sq := sq + ' from TB_NOTAF nf , TB_ROMA ro ';
  sq := sq + ' where nf.NROMA = ro.NUM   ';
  sq := sq + ' and ro.DTROMA between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  if (idCli  > 0) then sq := sq + ' and nf.LIGCLI = '+IntToStr(idCli);
  if (origem = 1) then sq := sq + ' and Origem <> 2 '; // Nota F
  if (origem > 2) then sq := sq + ' and Origem =  2 '; // coleta

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  cont  := DM2.cdsTMP.Fields[0].AsFloat;
  frete := DM2.cdsTMP.Fields[1].AsFloat;

  if (tipo = 1) then resp := cont;
  if (tipo = 2) then resp := frete;

  Notas_PQcontaNF := resp;
end;

function TBco.Notas_PQcontaSEM(idCli, Origem: Integer; dt1,
  dt2: TDateTime): integer;

var resp : integer;

begin
  sq := ' select count(*)   ';
  sq := sq + ' from TB_NOTAF ';
  sq := sq + ' where NROMA = 0 ';
  sq := sq + ' and dtNota between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  if (idCli  > 0) then sq := sq + ' and LIGCLI = '+IntToStr(idCli);
  if (origem = 1) then sq := sq + ' and Origem <> 2 '; // Nota F
  if (origem > 2) then sq := sq + ' and Origem =  2 '; // coleta

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  resp  := DM2.cdsTMP.Fields[0].AsInteger;

  Notas_PQcontaSEM := resp;
end;

procedure TBco.Notas_Prioridade(idNF, Prioridade: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET ';
  sq := sq + '  Prioridade = ' + IntToStr(Prioridade);
  sq := sq + ' WHERE id = '+ IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Graficos_ano(Ano: Integer);
begin
  sq := ' Select extract(MONTH from dtRoma) AS MES,  count(id) as Romaneios, Sum(vpag) as Pago, Sum(vpag)/count(id) as media from TB_ROMA ';
  sq := sq + ' Where extract(YEAR from dtRoma) = '+ IntToStr(ano);
  sq := sq + ' group by extract(MONTH from dtRoma) ';
  sq := sq + ' Order by  extract(MONTH from dtRoma)  ASC ';
  DM2.Roda_SQL(DM4.sdsG2, DM4.cdsG2, sq);

end;

procedure TBco.Graficos_frete(idCli, Ano: Integer);
begin
  sq := ' Select extract(MONTH from dtRoma) AS MES, count(TB_NOTAF.id) as Notas, Sum(vpag) as Pago, Sum(vfrete) As Recebido, Sum(vfrete)/count(TB_NOTAF.id) as Media from TB_ROMA, TB_NOTAF ';
  sq := sq + ' Where (TB_ROMA.NUM = TB_NOTAF.nRoma) and (extract(YEAR from dtRoma) = '+IntToStr(ano)+') ';
  if (idCli > 0) then sq := sq + ' and ligCli = '+IntToStr(idcli);
  sq := sq + ' group by extract(MONTH from dtRoma) ';
  sq := sq + ' Order by  extract(MONTH from dtRoma)  ASC ';
  DM2.Roda_SQL(DM4.sdsG3, DM4.cdsG3, sq);
end;

procedure TBco.Graficos_ocorrencias;
begin
  sq := ' Select First 10 dtRoma, TB_OCORRE.USO, Count(*) ';
  sq := sq + ' from TB_ROMA, TB_NOTAF, TB_OCORRE ';
  sq := sq + ' WHERE (TB_ROMA.NUM = TB_NOTAF.nRoma) and (TB_OCORRE.NUM = TB_NOTAF.NOCORR) ';
  sq := sq + ' group by dtRoma, TB_OCORRE.USO ';
  sq := sq + ' Order by  dtRoma  DESC  ';
  DM2.Roda_SQL(DM4.sdsG3, DM4.cdsG3, sq);
end;

procedure TBco.Graficos_ultimos();
begin
  sq := ' Select First 12 extract(YEAR from dtRoma) AS ANO,extract(MONTH from dtRoma) AS MES,  count(id) as Romaneios, Sum(vpag) as Pago, Sum(vpag)/count(id) as media ';
  sq := sq + ' from TB_ROMA ';
  sq := sq + ' group by extract(YEAR from dtRoma),extract(MONTH from dtRoma) ';
  sq := sq + ' Order by  extract(YEAR from dtRoma) desc, extract(MONTH from dtRoma)  desc ';
  DM2.Roda_SQL(DM4.sdsG1, DM4.cdsG1, sq);
end;

procedure TBco.Stok_Contrato_Altera(idCont, idUser: Integer; dtInic, dtFim,
  SegDia: TdateTime; aFatp, aFatm, aAreaVlr, aAreaExc, aAreaLim, mFatp,
  mFatmENT, mFatmSAI, mDIVn, mDIVd, mDIVsai, SegTx, SegMin, especm: double; mDIVnf, mDIVdf,
  af, nf, mDIVsaif: Smallint);
begin
  sq := 'UPDATE TB_STOK_CONTRATO SET ';
  sq := sq + '   LIGUSER = ' + IntToStr(idUser);
  sq := sq + ' , DTINICIO= ' + QuotedStr(BD_dia(dtInic , 3));
  sq := sq + ' , DTFIM   = ' + QuotedStr(BD_dia(dtFim  , 3));
  sq := sq + ' , ARM_FATURAPORC = ' + Formata_Num(aFatp);
  sq := sq + ' , ARM_FATURAMIN = ' + Formata_Num(aFatm);
  sq := sq + ' , ARM_AREAVALOR = ' + Formata_Num(aAreaVlr);
  sq := sq + ' , ARM_AREAEXCEDE = ' + Formata_Num(aAreaExc);
  sq := sq + ' , ARM_AREALIMITE = ' + Formata_Num(aAreaLim);
  sq := sq + ' , MOV_FATURAPORC = ' + Formata_Num(mFatp);
  sq := sq + ' , MOV_FATURAMIN_ENT = ' + Formata_Num(mFatmENT);
  sq := sq + ' , MOV_FATURAMIN_SAI = ' + Formata_Num(mFatmSAI);
  sq := sq + ' , MOV_DIVERSO_ENTNORMAIL_VLR = ' + Formata_Num(mDIVn);
  sq := sq + ' , MOV_DIVERSO_ENTDEVOL_VLR = ' + Formata_Num(mDIVd);
  sq := sq + ' , MOV_DIVERSO_SAIDA_VLR = ' + Formata_Num(mDIVsai);
  sq := sq + ' , MOV_DIVERSO_SAIDA_FLAG = ' + IntToStr(mDIVsaif);
  sq := sq + ' , MOV_DIVERSO_ENTNORMAIL_FLG = ' + IntToStr(mDIVnf);
  sq := sq + ' , MOV_DIVERSO_ENTDEVOL_FLG = ' + IntToStr(mDIVdf);
  sq := sq + ' , SEG_TAXA = ' + Formata_Num(SegTx);
  sq := sq + ' , SEG_MINIMO = ' + Formata_Num(SegMin);
  sq := sq + ' , SEG_DIA = ' + QuotedStr(BD_dia(SegDia , 3));
  sq := sq + ' , ESPECIAL_MINIMO = ' + Formata_Num(especM);
  sq := sq + ' , ARM_FLG = ' + IntToStr(af);
  sq := sq + ' , MOV_FLG = ' + IntToStr(nf);
  sq := sq + ' WHERE id = ' + IntToStr(idCont);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Stok_Contrato_Apaga(idCont: Integer);
begin
  sq := 'DELETE FROM TB_STOK_CONTRATO ';
  sq := sq + ' WHERE id = ' + IntToStr(idCont);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar');
end;

function TBco.Stok_Contrato_Insere(idUser, idCli: Integer; dtCad, dtInic,
  dtFim: TdateTime): Integer;
begin

  sq := 'INSERT INTO TB_STOK_CONTRATO ';
  sq := sq + ' ( LIGUSER, DTCAD, DTINICIO, DTFIM, LIGCLI, ARM_FATURAPORC, ARM_FATURAMIN, ARM_AREAVALOR, ';
  sq := sq + '  ARM_AREAEXCEDE, ARM_AREALIMITE, MOV_FATURAPORC, MOV_FATURAMIN_ENT, MOV_FATURAMIN_SAI, ';
  sq := sq + '  MOV_DIVERSO_ENTNORMAIL_VLR, MOV_DIVERSO_ENTDEVOL_VLR, MOV_DIVERSO_ENTNORMAIL_FLG, ';
  sq := sq + '  MOV_DIVERSO_ENTDEVOL_FLG, SEG_TAXA, SEG_MINIMO, ESPECIAL_MINIMO, ARM_FLG, ';
  sq := sq + '  MOV_FLG, CONTRATO_STATUS, MOV_DIVERSO_SAIDA_VLR, MOV_DIVERSO_SAIDA_FLAG  ';
  sq := sq + ' ) VALUES ( ';
  sq := sq + '   ' + IntToStr(idUser);
  sq := sq + ' , ' + QuotedStr(BD_dia(dtcad , 3));
  sq := sq + ' , ' + QuotedStr(BD_dia(dtInic , 3));
  sq := sq + ' , ' + QuotedStr(BD_dia(dtFim  , 3));
  sq := sq + ' , ' + IntToStr(idCli);
  sq := sq + ' , 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  0, 0, 0, 0, 0, 0, 0 )';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');
end;

procedure TBco.Stok_Contrato_MostraAtual(idCli: Integer);
begin
  sq := 'SELECT * FROM  TB_STOK_CONTRATO ';
  sq := sq + ' WHERE Ligcli = ' + IntToStr(idCli);
  sq := sq + ' and CONTRATO_STATUS = 2 ';
  sq := sq + ' order by id desc';
  DM2.Roda_SQL(DM4.sdsStokD, DM4.cdsStokD, sq);
end;

procedure TBco.Stok_Contrato_MostraID(idCont: Integer);
begin
  sq := 'SELECT * FROM  TB_STOK_CONTRATO ';
  sq := sq + ' WHERE id = ' + IntToStr(idCont);
  DM2.Roda_SQL(DM4.sdsStokD, DM4.cdsStokD, sq);
end;

procedure TBco.Stok_Contrato_MostraLista(idCli: Integer);
begin
  sq := 'SELECT * FROM  TB_STOK_CONTRATO ';
  sq := sq + ' WHERE Ligcli = ' + IntToStr(idCli);
  sq := sq + ' order by id desc';
  DM2.Roda_SQL(DM4.sdsStokD, DM4.cdsStokD, sq);
end;

procedure TBco.Stok_Contrato_AlteraStatus(idCont, st: Integer);
begin
  sq := 'UPDATE TB_STOK_CONTRATO SET Contrato_Status = '+IntToStr(st) + ' Where id  = '+IntToStr(idCont);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar Status');
end;

procedure TBco.Notas_Altera_Baixa(idN, nOc, nOrigem: Integer; Recebedor, dtE,
  hrE: String);
    var st: smallint;
begin
  sq := 'UPDATE TB_NOTAF SET ';
  sq := sq + ' NOCORR = '+IntToStr(nOc) ;
  sq := sq + ',ORIGEM = '+IntToStr(nOrigem) ;
  sq := sq + ',Recebedor = '+QuotedStr(Recebedor) ;
  sq := sq + ',DTENT = '+QuotedStr(DataBco(dtE)) ;
  sq := sq + ',HRENT = '+QuotedStr(hrE) ;
  sq := sq + ',STATUS_ENT = 1';
  st := 2;
  if nOc = 1 then
  begin
    sq := sq + ',ENTREGUE = '+QuotedStr('SIM') ;
    st := 1;
  end;
  sq := sq + ',STATUS_ENT = '+st.ToString;
  //sq := sq + ',OBS = '+Ocorre_fPesq(nOc);

  sq := sq + ' Where id = '+IntToStr(idN);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar Baixa');

end;

procedure TBco.Notas_Altera_numCham(nNota, nCli, nCham: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET NCHAM = '+IntToStr(nCham) + ' Where numNF  = '+IntToStr(nNota) + ' and ligcli = '+nCli.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar numChamada');
end;

procedure TBco.Notas_Altera_TipoCob(idNota, tipo: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET Tipo_Cob = '+IntToStr(tipo) + ' Where id  = '+IntToStr(idNota);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar Status');

end;

procedure TBco.GrupoProd_Grupos(idCli: integer);
begin
  sq := 'SELECT * FROM TB_GRUPO ';
  sq := sq + ' WHERE Ligcli = ' + IntToStr(idCli);
  sq := sq + ' order by Descricao ';
  DM2.Roda_SQL(DM1.sdsGrupo, DM1.cdsGrupo, sq);

end;

procedure TBco.GrupoProd_Produtos(idgrupo: Integer);
begin
  sq := 'SELECT * FROM  TB_PRODUTO ';
  sq := sq + ' WHERE LigGrupo = ' + IntToStr(idGrupo);
  sq := sq + ' order by descricao ';
  DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Mails_Alterar(idM: integer; Nome, Mil: String;
  Uso: Smallint);
begin
  sq := 'UPDATE TB_MAILS SET ';
  sq := sq + '   Nome  = ' + QuotedStr(Nome);
  sq := sq + ' , Mails = ' + QuotedStr(Mil);
  sq := sq + ' , Uso   = ' + IntToStr(Uso);
  sq := sq + ' WHERE id = ' + IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Mails_Apagar(idM: integer);
begin
  sq := 'DELETE FROM TB_MAILS ';
  sq := sq + ' WHERE id = ' + IntToStr(idM);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar');
end;

procedure TBco.Mails_Inserir(Nome, Mil: String; Uso: Smallint);
begin
  sq := 'INSERT INTO TB_MAILS ';
  sq := sq + ' ( Nome, Mil, uso ';
  sq := sq + ' ) VALUES ( ';
  sq := sq + '   ' + QuotedStr(Nome);
  sq := sq + ' , ' + QuotedStr(Mil);
  sq := sq + ' , ' + IntToStr(Uso);
  sq := sq + '   )';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.Mails_Mostrar;
begin
  sq := 'SELECT * FROM  TB_MAILS ';
  sq := sq + ' order by Nome ';
  //DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Mails_MostrarID(idM: integer);
begin
  sq := 'SELECT * FROM  TB_MAILS ';
  sq := sq + ' WHERE id = ' + IntToStr(idM);
  sq := sq + ' order by Nome ';
  //DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.MailSai_Inserir(LigCli, LigMail: Integer; Vezes: Smallint);
begin
  sq := 'INSERT INTO TB_MAILSAIDA ';
  sq := sq + ' ( ligCli, LigMail, Vezes, Enviado ';
  sq := sq + ' ) VALUES ( ';
  sq := sq + '   ' + IntToStr(LigCli);
  sq := sq + ' , ' + IntToStr(LigMail);
  sq := sq + ' , ' + IntToStr(Vezes);
  sq := sq + ' , 0  )';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.MailSai_Mostra;
begin
  sq := 'SELECT * FROM  VIEW_MAIL ';
  //DM2.Roda_SQL(DM1.sdsProd, DM1.cdsProd, sq);
end;

procedure TBco.Notas_PesquisaCLI(idCli: Integer; dt1, dt2: TDateTime);
begin
  sq := 'select nf.id, nf.numnf,  nf.DTNOTA, nf.locali, nf.CEP, nf.OBS, c.nome, nf.nroma, nf.ligcli, nf.nomedest, flag_imp, fonedest, nf.peso, nf.dtcria ';
  sq := sq + ' from tb_notaf nf, TB_CLIENTE c ';
  sq := sq + ' where nf.LIGCLI = c.id ';
  if (idCli > 0) then sq := sq + ' and nf.ligcli = ' + IntToStr(idCli);
  sq := sq + ' and nf.DTNOTA between  '+QuotedStr(BD_DIA(dt1,3)) + ' and '+QuotedStr(BD_DIA(dt2,3));
  sq := sq + ' order by flag_imp, numNF ';
  DM2.Roda_SQL(DM4.sdsNFp, DM4.cdsNFp, sq);
//    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.Notas_PesquisaNFI(idCli, numNF: Integer);
begin
  sq := 'select First 50 nf.id, nf.numnf,  nf.DTNOTA, nf.locali, nf.CEP, nf.OBS, c.nome, nf.nroma, nf.ligcli, nf.nomedest, flag_imp, fonedest, nf.peso, nf.dtcria ';
  sq := sq + ' from tb_notaf nf, TB_CLIENTE c ';
  sq := sq + ' where nf.LIGCLI = c.id ';
  if (idCli > 0) then sq := sq + ' and nf.ligcli = ' + IntToStr(idCli);
  sq := sq + ' and nf.numnf >= '+IntToStr(numNF);
  sq := sq + ' order by flag_imp, numNF ';
  DM2.Roda_SQL(DM4.sdsNFp, DM4.cdsNFp, sq);
//    DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.Notas_setIMP(idNF, imp: Integer);
begin
  sq := 'UPDATE TB_NOTAF SET ';
  sq := sq + ' FLAG_IMP   = ' + IntToStr(imp);
  sq := sq + ' WHERE id = ' + IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Config_DTP_Altera(dtPesq: TDateTime);

var idNota : integer;

begin
  sq := 'select first 2 id from TB_NOTAF ';
  sq := sq + ' WHERE dtNota >= ' + QuotedStr(BD_DIA(dtPesq,3));
  sq := sq + ' order by dtNota ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount >0) then
  begin
    idNota := DM2.cdsTMP.Fields[0].AsInteger;

    sq := 'UPDATE TB_CONFIG SET ';
    sq := sq + '  dtPESQ   = ' + QuotedStr(BD_DIA(dtPesq,3));
    sq := sq + ', idNF     = ' + IntToStr(idNota);
    sq := sq + ' WHERE id = 1 ';
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
  end;

end;

Function TBco.Config_DTP_MostraDT:TDateTime;

var dt : TDateTime;

begin

  sq := 'SELECT * FROM  TB_CONFIG ';
  sq := sq + ' WHERE id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  dt := DM2.cdsTMP.Fields[1].AsDateTime;

  Config_DTP_MostraDT := dt;
end;

Function TBco.Config_DTP_MostraN:Integer;

var num : Integer;

begin

  sq := 'SELECT * FROM  TB_CONFIG ';
  sq := sq + ' WHERE id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  num := DM2.cdsTMP.Fields[2].AsInteger;

  Config_DTP_MostraN := num;
end;

procedure TBco.Config_SAC_Ult_Altera(nCh: Integer);
begin
  sq := 'Update TB_Config set ';
  sq := sq + '  ULTIMOSAC = ' + IntToStr(nCH);
  sq := sq + ' WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

function TBco.Config_SAC_Ult_Mostra: Integer;
var resp : Integer;
begin
  resp := 0;
  sq := 'select UltimoSAC from TB_CONFIG ';
  sq := sq + '  where id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  resp := DM2.cdsTMP.Fields[0].AsInteger;

  Result := resp;
end;

procedure TBco.Config_SMS_Altera(SMSuser, SMSsen, SMSn1, SMSn2, SMSrel, SMSfrase, SMSurl:String);

begin
    sq := 'UPDATE TB_CONFIG SET ';
    sq := sq + '  SMS_user   = ' + QuotedStr(SMSuser);
    sq := sq + ', SMS_senha  = ' + QuotedStr(SMSsen);
    sq := sq + ', SMS_num1   = ' + QuotedStr(SMSn1);
    sq := sq + ', SMS_num2   = ' + QuotedStr(SMSn2);
    sq := sq + ', SMS_REL    = ' + QuotedStr(SMSrel);
    sq := sq + ', SMS_FRASE  = ' + QuotedStr(SMSfrase);
    sq := sq + ', SMS_URL    = ' + QuotedStr(SMSurl);
    sq := sq + '  WHERE id = 1 ';
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Config_SMS_Mostra();

begin
  sq := 'SELECT * FROM  TB_CONFIG ';
  sq := sq + ' WHERE id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.EstatC_NotasOk(dtA, dtB: TDateTime);
begin
  sq := 'select nocorr, count(*) as quant from TB_Notaf ';
  sq := sq + ' where nroma > 0 and ligcli > 0 ';
  sq := sq + ' and  dtnota between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by nocorr ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.EstatC_NotasErr1(dtA, dtB: TDateTime);
begin
  sq := 'select count(*) as quant from TB_Notaf ';
  sq := sq + ' where nroma = 0 and ligcli > 0 ';
  sq := sq + ' and  dtnota between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by nocorr ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure TBco.EstatC_NotasErr2(dtA, dtB: TDateTime);
begin
  sq := 'select count(*) as quant from TB_Notaf ';
  sq := sq + ' where ligcli = 0 ';
  sq := sq + ' and  dtcria between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by nocorr ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;


procedure TBco.EstatC_NotasCli(oco:Integer; dtA, dtB: TDateTime);

begin
  sq := 'select n.ligCli, count(*) as quant from TB_Notaf n  ';
  sq := sq + ' where nroma > 0 and ligcli > 0 ';
  if (Oco > 0) then sq := sq + ' and nocorr = '+IntToStr(Oco);
  sq := sq + ' and  dtcria between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by n.ligCli ';
  sq := sq + ' order by n.ligCli ';

  DM2.Roda_SQL(DM4.sdsEC, DM4.cdsEC, sq);
end;

procedure TBco.EstatC_NotasMot_Notas(oco:Integer; dtA, dtB: TDateTime);
begin
  sq := 'select r.ligmot as mot, count(*) as quant from  TB_NotaF n, TB_Roma r  ';
  sq := sq + ' where n.nroma = r.num and n.ligcli > 0 ';
  if (Oco > 0) then sq := sq + ' and nocorr = '+IntToStr(Oco);
  sq := sq + ' and dtRoma between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by r.ligMot ';
  sq := sq + ' order by r.ligMot ';

  DM2.Roda_SQL(DM4.sdsEM, DM4.cdsEM, sq);

end;

procedure TBco.EstatC_NotasMot_Roma(dtA, dtB: TDateTime);
begin
  sq := 'select r.ligmot as mot, count(*) as quant from   TB_Roma r  ';
  sq := sq + ' where dtRoma between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  sq := sq + ' group by r.ligMot ';
  sq := sq + ' order by r.ligMot ';
  DM2.Roda_SQL(DM4.sdsEM, DM4.cdsEM, sq);

end;

procedure TBco.EstatC_Entregas_Dias(idC:Integer; dtA, dtB: TDateTime);
begin
  sq := 'select numnf, ligcli as Cliente, MIN(dtcria) as Cria, MAX(dtent) as Entrega, ';
  sq := sq + ' MAX(dtent)-MIN(CAST(dtcria as DATE)) as Dias,  ';
  sq := sq + ' EXTRACT(WEEKDAY FROM dtcria) as dia1, EXTRACT(WEEKDAY FROM dtent) as dia2 ';
  sq := sq + ' from TB_Notaf ';
  sq := sq + ' where dtcria between '+ QuotedStr(BD_DIA(dtA,3)) + ' and '+ QuotedStr(BD_DIA(dtB,3));
  if (idC > 0 ) then   sq := sq + ' and ligcli = '+IntToStr(idC);
  sq := sq + ' group by numnf, ligcli, dtcria, dtent ';
  sq := sq + ' order by numnf ';
  DM2.Roda_SQL(DM4.sdsED, DM4.cdsED, sq);
end;

function TBco.Notas_SeriePadrao(idCli: Integer): Smallint;

var resp : Smallint;
begin
  resp := 1;
  sq := 'SELECT NFSerie FROM TB_CLIENTE ';
  sq := sq + ' WHERE id =  ' + IntToStr(idCli);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if (DM2.cdsTMP.RecordCount > 0) then
    if (DM2.cdsTMP.Fields[0].Value <> null) then  resp := DM2.cdsTMP.Fields[0].Value;

  Notas_SeriePadrao := resp;
end;

procedure TBco.Nota_Reenvia(idNF, idCli : Integer);
begin
  sq := 'Update TB_NOTAF set STATUS_EDI = 1 ';
  sq := sq + ' WHERE id = ' + IntToStr(idNF);
  sq := sq + ' and ligCli = '+IntToStr(idCli);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

function TBco.EstatC_NotasDia(dt: TDateTime):Integer;
var cont : Integer;
begin
  cont := 0;
  sq := 'select count(*) from TB_NOTAF nf, TB_Roma rm  ';
  sq := sq + ' where nf.NROMA = rm.NUM ';
  sq := sq + ' and dtRoma = '+ QuotedStr(BD_DIA(dt,3));
  sq := sq + ' ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  cont := DM2.cdsTMP.Fields[0].AsInteger;

  EstatC_NotasDia := cont;

end;

function TBco.EstatC_RomaDia(dt: TDateTime):Integer;
var cont : Integer;
begin
  cont := 0;
  sq := 'select count(*) from TB_Roma rm  ';
  sq := sq + ' where dtRoma = '+ QuotedStr(BD_DIA(dt,3));
  sq := sq + ' ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  cont := DM2.cdsTMP.Fields[0].AsInteger;

  EstatC_RomaDia := cont;
end;

procedure TBco.Notas_Fases_AlteraOC(Ligcli, NumNF, NumEvento,Envio_OC: Integer);
begin
  sq := 'Update TB_NFSTATUS set ';
  sq := sq + '  Envio_OC = ' + IntToStr(Envio_OC);
  sq := sq + ' WHERE LigCli = ' + IntToStr(ligCli);
  sq := sq + ' and NumNota = '+IntToStr(NumNF);
  sq := sq + ' and NumEvento = '+IntToStr(NumEvento);

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Notas_Fases_AlteraWEB(Ligcli, NumNF, NumEvento, Envio_WEB: Integer);
begin
  sq := 'Update TB_NFSTATUS set ';
  sq := sq + '  Envio_WEB = ' + IntToStr(Envio_WEB);
  sq := sq + ' WHERE LigCli = ' + IntToStr(ligCli);
  sq := sq + ' and NumNota = '+IntToStr(NumNF);
  sq := sq + ' and NumEvento = '+IntToStr(NumEvento);

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Notas_Fases_Insere(Ligcli, NumNF, NumEvento, LigUser, numRoma, Serie: Integer);
begin
  sq := 'INSERT INTO TB_NFSTATUS (LigCli, NumNota, NumEvento,  ';
  sq := sq + ' DTEV, Envio_OC, Envio_WEB, LigUser, numRoma, Serie) Values (  ';
  sq := sq + '  ' + IntToStr(LigCli);
  sq := sq + ', ' + IntToStr(NumNF);
  sq := sq + ', ' + IntToStr(NumEvento);
  sq := sq + ', ' + QuotedStr(BD_dia(Now,1));
  sq := sq + ',0';
  sq := sq + ',0';
  sq := sq + ', ' + IntToStr(LigUser);
  sq := sq + ', ' + IntToStr(numRoma);
  sq := sq + ', ' + IntToStr(Serie);
  sq := sq + ' )';

  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');
end;

procedure TBco.Notas_Fases_Lista(Evento: Smallint);
begin
  sq := 'select LigCli, NumNOta, NumEvento FROM TB_NFStatus  ';
  if (Evento = 1) then sq := sq + ' where Envio_OC = 0 '
  else sq := sq + ' where Envio_WEB = 0 ';
  sq := sq + ' ';
  DM2.Roda_SQL(DM4.sdsNFa, DM4.cdsNFa, sq);

end;

function TBco.Notas_Fases_Conta(Ligcli, NumNF: Integer): Integer;

var n : Integer;
begin
  n := 0;

  sq := 'select * FROM TB_NFStatus  ';
  sq := sq + ' where LigCli = ' + IntToStr(LigCli);
  sq := sq + ' and NumNota = '  + IntToStr(NumNF);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  n :=  DM2.cdsTMP.RecordCount;

end;

function TBco.Notas_Fases_Ultimo(Ligcli, NumNF: Integer): Integer;

var n : Integer;
begin
  n := 0;

  sq := 'select first 2 id, NUMEVENTO FROM TB_NFStatus  ';
  sq := sq + ' where LigCli = ' + IntToStr(LigCli);
  sq := sq + ' and NumNota = '  + IntToStr(NumNF);
  sq := sq + ' order by id desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if  (DM2.cdsTMP.RecordCount>0) then
  begin
    DM2.cdsTMP.First;
    n := DM2.cdsTMP.Fields[1].AsInteger;
  end;

  Notas_Fases_Ultimo := n;
end;

procedure TBco.Notas_fCli(idCli: Integer);
begin
  DM1.cdsNotas.Filtered := false;
  DM1.cdsNotas.Filter := 'ligCli = ' + idCli.ToString;
  DM1.cdsNotas.Filtered := True;
end;

procedure TBco.Notas_fID(idNF: Integer);
begin
  DM1.cdsNotas.Filtered := false;
  DM1.cdsNotas.Filter := 'id = ' + idNF.ToString;
  DM1.cdsNotas.Filtered := True;
end;

function TBco.Notas_Fases_NumSerie(Ligcli, NumNF: Integer): Integer;

var n : Integer;
begin
  n := 0;

  sq := 'select first 2 Serie FROM TB_NFStatus  ';
  sq := sq + ' where LigCli = ' + IntToStr(LigCli);
  sq := sq + ' and NumNota = '  + IntToStr(NumNF);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if  (DM2.cdsTMP.RecordCount>0) then n := DM2.cdsTMP.Fields[0].AsInteger;

  Notas_Fases_NumSerie := n;
end;


procedure TBco.Notas_Fases_Retiradas(dt: TDateTime);
begin
  sq := 'select a.numnota, a.DTEV, c.DESCR, b.Login, a.numroma ';
  sq := sq + ' from tb_NFstatus a, TB_Usuarios b, TB_INTERNO c, TB_NOTAF d ';
  sq := sq + ' where a.LIGUSER = b.ID and a.NUMEVENTO = c.CODINT ';
  sq := sq + ' and d.numnf=a.NUMNOTA and d.LIGCLI=a.LIGCLI ';
  sq := sq + ' and numevento=21 and d.nRoma=0 ';
  sq := sq + ' and a.dtev  >= ' + QuotedStr(BD_DIA(dt-30,3))+ ' and a.dtev  <= '+QuotedStr(BD_DIA(dt+1,3));
  sq := sq + ' order by a.DTEV desc ';

  DM2.Roda_SQL(DM5.sdsINT, DM5.cdsINT, sq );

end;

procedure TBco.EstatC_Prazo(dtA, dtB: TDateTime; idC : Integer);
begin
  sq := 'select numnf, MIN(CAST(dtcria as DATE)) as DTimporta,  ';
  sq := sq + ' MAX(dtent) as DTentrega, MAX(id) as idNF, MIN(NOCORR) as OCOR, MAX(DIASENT) as DIAS ';
  sq := sq + ' from tb_notaf  ';
  sq := sq + ' where ligcli=  ' + IntToStr(idC);
  sq := sq + ' and dtcria between '+ QuotedStr(BD_DIA(dtA,3)+ ' 00:00') + ' and '+ QuotedStr(BD_DIA(dtB,3)+' 23:59' );
  sq := sq + ' group by numnf ';
  sq := sq + ' having MIN(nocorr) > 0 ';
  DM2.Roda_SQL(DM5.sdsPrazo2, DM5.cdsPrazo2, sq);

end;

procedure TBco.EstatC_PrazoCLI;
begin
  sq := 'select * from TB_CLIENTE where Prazo > 0 ';
  DM2.Roda_SQL(DM1.sdsCli, DM1.cdsCli, sq);
end;


procedure TBco.EstatC_PrazoDet(dtA, dtB: TDateTime; idC: Integer);
begin
  sq := 'select a.numnf, COUNT(*) as qt, MIN(CAST(a.dtcria as DATE)) as DTimporta,  ';
  sq := sq + ' MIN(a.dtnota) as DTnota, MAX(a.dtent) as DTentrega,MAX(a.dtent)-MIN(CAST(a.dtcria as DATE)) as diasT,   ';
  sq := sq + ' MAX(a.dtent)-MIN(a.dtNota) as diasC, MAX(a.id) as idNF, min(a.nocorr) as nOcor, MAX(a.DIASENT) as DIASG ';
  sq := sq + ' from tb_notaf a  ';
  sq := sq + ' where ligcli=  ' + IntToStr(idC);
  sq := sq + ' and dtcria between '+ QuotedStr(BD_DIA(dtA,3) + ' 00:00') + ' and '+ QuotedStr(BD_DIA(dtB,3)+ ' 23:59') ;
  sq := sq + ' group by a.numnf ';
  sq := sq + ' having MIN(nocorr) > 0 ';
  DM2.Roda_SQL(DM4.sdsPrazo, DM4.cdsPrazo, sq);

end;

procedure TBco.Rotas_Altera(idR: Integer; Nome: String);
begin
  sq := 'Update TB_Rota set ';
  sq := sq + '  Rota = ' + QuotedStr(Nome);
  sq := sq + ' WHERE id = ' + IntToStr(idR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Rotas_Apaga(idR: Integer);
begin
  sq := 'Delete FROM TB_Rota ';
  sq := sq + ' WHERE id = ' + IntToStr(idR);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar');

end;

procedure TBco.Rotas_CEPs_Altera(idCEP, cep1, cep2: Integer);
begin
  sq := 'Update TB_RotaCEP set ';
  sq := sq + '  CEPINIC = ' + IntToStr(cep1);
  sq := sq + ', CEPFIM  = ' + IntToStr(cep2);
  sq := sq + ' WHERE id = ' + IntToStr(idCEP);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Rotas_CEPs_AlteraRota(idCEP, LigRota: Integer);
begin
  sq := 'Update TB_RotaCEP set ';
  sq := sq + '  LigRota = ' + IntToStr(LigRota);
  sq := sq + ' WHERE id = ' + IntToStr(idCEP);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Rotas_CEPs_Apaga(idCEP: Integer);
begin
  sq := 'DELETE FROM TB_RotaCEP ';
  sq := sq + ' WHERE id = ' + IntToStr(idCEP);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Rotas_CEPs_Insere(LigRota, cep1, cep2: Integer);
begin
  sq := 'INSERT INTO TB_RotaCEP (CEPINIC, CEPFIM, LIGROTA) Values ( ';
  sq := sq + '   ' + IntToStr(cep1);
  sq := sq + ',  ' + IntToStr(cep2);
  sq := sq + ',  ' + IntToStr(LigRota);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.Rotas_CEPs_Mostra;
begin
  sq := 'select * from TB_ROTACEP ';
  DM2.Roda_SQL(DM5.sdsRCEP, DM5.cdsRCEP, sq);

end;

procedure TBco.Rotas_CEPs_Mostra2;
begin
  sq := 'select * from TB_ROTACEP ';
  DM2.Roda_SQL(DM5.sdsRCEP2, DM5.cdsRCEP2, sq);

end;

procedure TBco.Rotas_CEPs_MostraID(idCEP: Integer);
begin
  sq := 'select * from TB_ROTACEP ';
  sq := sq + ' WHERE id = ' + IntToStr(idCEP);
  DM2.Roda_SQL(DM5.sdsRCEP, DM5.cdsRCEP, sq);

end;

procedure TBco.Rotas_CEPs_MostraRot(LigRota: Integer);
begin
  sq := 'select * from TB_ROTACEP ';
  sq := sq + ' WHERE LigRota = ' + IntToStr(LigRota);
  sq := sq + ' ORDER BY CEPINIC ' ;
  DM2.Roda_SQL(DM5.sdsRCEP, DM5.cdsRCEP, sq);

end;

procedure TBco.Rotas_Insere(Nome: String);
begin
  sq := 'INSERT INTO TB_Rota (ROTA) Values ( ';
  sq := sq + '   ' + QuotedStr(Nome);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');

end;

procedure TBco.Rotas_Mostra;
begin
  sq := 'select * from TB_ROTA WHERE id < 9900 Order by Rota ';
  DM2.Roda_SQL(DM5.sdsRota, DM5.cdsRota, sq);

end;

procedure TBco.Rotas_MostraID(idR: Integer);
begin
  sq := 'select * from TB_ROTA ';
  sq := sq + ' WHERE id = ' + IntToStr(idR);
  DM2.Roda_SQL(DM5.sdsRota, DM5.cdsRota, sq);

end;

procedure TBco.Rotas_adm_altCEP(idNF: Integer; CEP: String);
begin
  sq := 'Update TB_Notaf set ';
  sq := sq + '  CEP = ' + QuotedStr(CEP);
  sq := sq + ' WHERE id = ' + IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Rotas_adm_Conta;
begin
  sq := 'select a.ROTA, b.ligRoT, Count(*) as qt, sum(Volume) as Vol from TB_ROTA a, TB_NOTAF b ';
  sq := sq + ' WHERE (a.id = b.LIGROT) and (nRoma = 0) and (a.id >0) ';
  sq := sq + '  and b.dtCria >= '+QuotedStr(BD_dia(Now-35, 3));
  sq := sq + retirarPendencias;
  sq := sq + ' GROUP BY b.LIGROT, a.ROTA ';
  sq := sq + ' order by a.Rota ';
  DM2.Roda_SQL(DM5.sdsRconta, DM5.cdsRconta, sq);
end;

procedure TBco.Rotas_adm_Mostra(idRota: Integer);
begin

  sq := 'select a.ID, a.NUMNF, a.CEP, a.Locali, a.Volume, a.FLAG_IMP, a.ORIGEM, a.LigCli, b.dtCriada as dia  ';
  sq := sq + '  FROM TB_notaf a, TB_NFunica b ';
  sq := sq + '  WHERE (a.numnf = b.numnota and a.ligCli = b.ligCli) ';
  sq := sq + '  and b.dtCriada >= '+QuotedStr(BD_dia(Now-60, 3));
  sq := sq + '  and LigRot = '+IntToStr(idRota);
  //sq := sq + '  and a.id >= '+IntToStr(nNota);
  sq := sq + '  and (nRoma = 0) ';
  sq := sq + retirarPendencias;
  sq := sq + '  Order by dtCria, CEP ';


  DM2.Roda_SQL(DM5.sdsRmostra, DM5.cdsRmostra, sq);
end;


procedure TBco.Rotas_adm_passaRota(idNF, idRota: Integer);
begin
  sq := 'Update TB_Notaf set ';
  sq := sq + '  LigRot = '+IntToStr(idRota);
  sq := sq + '  WHERE id = '+IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.Rotas_adm_SEM(ListaCli : String);
begin
  sq := 'select id, NumNF, CEP, Nroma, LigRot, LigCli, SerieNF from TB_NOTAF ';
  sq := sq + '  where (nRoma = 0 or nRoma is Null) ';
  sq := sq + '  and (LigRot = 0 or LigRot is Null) ';
  sq := sq + retirarPendencias;
  if (ListaCli.Length > 2)  then sq := sq + '  and (Ligcli in (' + ListaCli + ') )';
  sq := sq + '  order by id ';
  DM2.Roda_SQL(DM5.sdsRsem, DM5.cdsRsem, sq);

end;

procedure TBco.Rotas_adm_SEM_Cli;
begin
  sq := 'select ligcli, cli.NOME, count(*) as qt from TB_NOTAF nf, tb_cliente cli ';
  sq := sq + '  where (cli.id = nf.ligcli) and (nRoma = 0 or nRoma is Null) ';
  sq := sq + '  and (LigRot = 0 or LigRot is Null) ';
  sq := sq + retirarPendencias;
  sq := sq + '  group by ligcli, cli.nome ';
  sq := sq + '  order by cli.nome ';
  DM2.Roda_SQL(DM5.sdsRcli, DM5.cdsRcli, sq);

end;

function TBco.Rotas_adm_SEM_Conta: Integer;
  var resp : integer;
begin
  resp := 0;
  sq := 'select  count(*) from TB_NOTAF  ';
  sq := sq + '  where (nRoma = 0 or nRoma is Null) ';
  sq := sq + ' and (LigRot = 0 or LigRot is Null) ';
  sq := sq + retirarPendencias;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  resp := DM2.cdsTMP.Fields[0].Value;

  result := resp;

end;

procedure TBco.Rotas_bip_CEP(onde: String);
begin
  sq := 'select CEP, SUM(volume), NUMNF, ORIGEM from TB_NOTAF ';
  sq := sq + '  where (nRoma = 0 or nRoma is Null) ';
  sq := sq + ' '  + onde;
  sq := sq + retirarPendencias;
  sq := sq + '  group by CEP, NUMNF, ORIGEM ';
  sq := sq + '  order by CEP ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;


function TBco.Romaneio_Existe(numBD: Integer): boolean;
var resp : boolean;
begin
  sq := 'select id from TB_Roma ';
  sq := sq + '  where NUM = '+IntToStr(numBD);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  resp := false;
  if (DM2.cdsTMP.RecordCount > 0) then resp := true;

  Romaneio_Existe := resp;
end;

procedure TBco.Notas_PesquisaRota(idRota: Integer);
begin
  sq := 'select nf.id, nf.numnf,  nf.DTNOTA, nf.locali, nf.CEP, nf.OBS, c.nome, nf.nroma, nf.ligcli, nf.nomedest, flag_imp, fonedest, nf.peso, nf.dtcria ';
  sq := sq + ' from tb_notaf nf, TB_CLIENTE c ';
  sq := sq + ' where nf.LIGCLI = c.id ';
  sq := sq + '  and (nf.nRoma = 0) ';
  sq := sq + '  and nf.LigRot = '+IntToStr(idRota);
  sq := sq + retirarPendencias;
  sq := sq + '  Order by nf.CEP ';
  DM2.Roda_SQL(DM4.sdsNFp, DM4.cdsNFp, sq);

end;

procedure TBco.Notas_AlteraDiasE(idNF, Dias: Integer);
begin
  sq := 'Update TB_Notaf set ';
  sq := sq + '  DIASENT = ' + IntToStr(Dias);
  sq := sq + ' WHERE id = ' + IntToStr(idNF);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;


procedure TBco.Notas_AlteraObs(idNota: Integer; Obs: String);
begin
  sq := 'Update TB_Notaf set ';
  sq := sq + ' OBS = ' + QuotedStr(Obs);
  sq := sq + ' WHERE id = ' + IntToStr(idNota);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Config_AMB_Altera(amb: Smallint);
begin
  sq := 'Update TB_Config set ';
  sq := sq + '  SEFAZAMB = ' + amb.ToString;
  sq := sq + ' WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

function TBco.Config_AMB_Mostra: Smallint;
var resp : Smallint;
begin
  sq := 'select SefazAmb from TB_CONFIG ';
  sq := sq + '  where id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  resp := 0;
  if (DM2.cdsTMP.RecordCount > 0) then resp := DM2.cdsTMP.Fields[0].Value;

  Config_AMB_Mostra := resp;

end;

procedure TBco.Config_BaixaQT_Altera(qt: Integer);

begin
  sq := 'Update TB_Config set ';
  sq := sq + '  BAIXADT = ' + QuotedStr(BD_dia(Now, 3));
  sq := sq + ', BAIXAQT = ' + IntToStr(qt);
  sq := sq + ' WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

function TBco.Config_BaixaQT_Mostra: Integer;
var resp : Integer;
begin
  resp := 0;
  sq := 'select BaixaQt, BaixaDT from TB_CONFIG ';
  sq := sq + '  where id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  if ( BD_dia(DM2.cdsTMP.Fields[1].AsDateTime,3) = BD_dia(Now,3) ) then
    resp := DM2.cdsTMP.Fields[0].AsInteger;

  Config_BaixaQT_Mostra := resp;

end;

procedure TBco.Config_BIP_Altera(dirb: String);
begin
  sq := 'Update TB_Config set ';
  sq := sq + '  DIRBIP = ' + QuotedStr(dirb);
  sq := sq + ' WHERE id = 1';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;


function TBco.Config_BIP_Mostra: String;
var resp : string;
begin
  sq := 'select dirbip from TB_CONFIG ';
  sq := sq + '  where id = 1 ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  resp := 'nada';
  if (DM2.cdsTMP.RecordCount > 0) then resp := DM2.cdsTMP.Fields[0].Value;

  Config_BIP_Mostra := resp;

end;

procedure TBco.Diario_MostraDias(idC, tipo: Integer);
begin
  sq := 'select dtnota, count(*) as NFquant from TB_NOTAF ';
  sq := sq + '  WHERE (dtNota>CURRENT_DATE - 20)  and (origem  > 0 and origem <>4) ';
  sq := sq + '  and  ligcli= '+ IntToStr(idC);
  sq := sq + '  group by dtnota ';
  if (tipo = 1) then sq := sq + '  HAVING MIN(nRoma)=0 '; //SRo
  if (tipo = 2) then sq := sq + '  HAVING MIN(nOcorr) <> 1 ';  //NEnt
  sq := sq + '  order by dtnota desc';
  DM2.Roda_SQL(DM5.sdsDiaC, DM5.cdsDiaC, sq);


end;

procedure TBco.Diario_MostraNotas(idC: Integer; dia: TDateTime);
begin
  sq := 'SELECT a.id, a.NUMNF, a.VALOR, b.USO, a.nRoma, a.DTENT, a.HRENT, a.CEP ';
  sq := sq + '  FROM TB_NOTAF a, TB_OCORRE b ';
  sq := sq + '  WHERE a.NOCORR = b.NUM ';
  sq := sq + '  and dtnota =  ' + QuotedStr(BD_dia(dia,3));
  sq := sq + '  and a.LIGCLI =  '+IntToStr(idC);
  sq := sq + '  and (origem  > 0 and origem <>4) ';
  sq := sq + '  order by a.NUMNF ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

end;

procedure TBco.Diario_Reentrega(idC, numNota: Integer; dia: TDateTime);
begin
  sq := 'SELECT a.ID, b.USO, a.nRoma, a.DTENT, a.HRENT, b.NUM, b.descr ';
  sq := sq + '  FROM TB_NOTAF a, TB_OCORRE b ';
  sq := sq + '  WHERE a.NOCORR = b.NUM ';
  sq := sq + '  and a.NUMNF =  '+IntToStr(numNota);
  sq := sq + '  and a.LIGCLI =  '+IntToStr(idC);
  sq := sq + '  and a.dtnota between '+QuotedStr(BD_dia(dia-1,3))+' and '+QuotedStr(BD_dia(dia+30,3));
  sq := sq + '  order by a.id ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

end;

procedure TBco.DOCCOB_Altera(idCob, idCC: Integer; dtEmissao, dtVenc: TDateTime;
  Obs: String);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  LigBanco = '+IntToStr(idCC);
  sq := sq + ', dtEmissao = '+QuotedStr(BD_dia(dtEmissao, 3));
  sq := sq + ', dtVenc = '+QuotedStr(BD_dia(dtVenc, 3));
  sq := sq + ', Obs = '+QuotedStr(Obs);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.DOCCOB_Altera_Desconto(idCob: Integer; vDesc: Double;
  dtLimite: TDateTime);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  DescValor = '+Formata_Num(vDesc);
  sq := sq + ', DescDtLimite = '+QuotedStr(BD_dia(dtLimite, 3));
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.DOCCOB_Altera_Juros(idCob: Integer; vJuros: Double);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  ValorJuros = '+Formata_Num(vJuros);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.DOCCOB_Altera_NFtransp(idCob, nNF: Integer);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  nfTransp = '+IntToStr(nNF);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.DOCCOB_Altera_Status(idCob, Status: Integer);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  Valida = '+IntToStr(status);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.DOCCOB_Altera_StatusENV(idCob, Status: Integer);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  Status_ENV = '+IntToStr(status);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

end;

procedure TBco.DOCCOB_Altera_Totais(idCob: Integer);
begin
  sq := 'select SUM(Total) as ValorF, SUM(icms) as ValorI, count(*) from TB_Conhec where LigDCob = '+idCob.ToString;
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);

  DOCCOB_Altera_Valor(idCob, DM2.cdsTMP.Fields[0].Value, DM2.cdsTMP.Fields[1].Value);
end;

procedure TBco.DOCCOB_Altera_Valor(idCob: Integer; vTotal, vICMS: Double);
begin
  sq := 'Update TB_DOCCOB  SET ';
  sq := sq + '  ValorCob = '+Formata_Num(vTotal);
  sq := sq + ', ValorICMS = '+Formata_Num(vICMS);
  sq := sq + ' WHERE id = '+IntToStr(idCob);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

procedure TBco.DOCCOB_Inclui_Conhec(idCob, NumConhec, idTransp: Integer);
begin
  sq := 'Update TB_CONHEC SET ';
  sq := sq + '  LigDCob = '+IntToStr(idCob);
  sq := sq + ' WHERE LigTransp = '+idTransp.ToString+ ' and NumC = '+IntToStr(NumConhec);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');

  sq := 'Update TB_NOTAF SET ';
  sq := sq + '  LigDCob = '+IntToStr(idCob);
  sq := sq + ' WHERE LigTransp = '+idTransp.ToString + ' and nConh = ' + NumConhec.ToString;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

function TBco.DOCCOB_Insere(idCli, idUser, idCC: Integer; dtVenc: TDateTime;
  Obs: String):Integer;
begin
  sq := 'insert into TB_DOCCOB (LigCli, LigUser, LigBanco, dtVenc, Obs, Valida, ';
  sq := sq + ' dtEmissao, descDtLimite, TipoCob, ';
  sq := sq + ' ValorCob, ValorICMS, ValorJuros, DescValor, nfTransp, Status_Env ';
  sq := sq + ' ) Values (';
  sq := sq + '  '+IntToStr(idCli);
  sq := sq + ', '+IntToStr(idUser);
  sq := sq + ', '+IntToStr(idCC);
  sq := sq + ', '+QuotedStr(BD_dia(dtVenc, 3));
  sq := sq + ', '+QuotedStr(Obs);
  sq := sq + ',1 ';
  sq := sq + ', '+QuotedStr(BD_dia(Now, 3));
  sq := sq + ', '+QuotedStr(BD_dia(dtVenc, 3));
  sq := sq + ', '+QuotedStr('B');
  sq := sq + ',0, 0, 0, 0, 0, 9 ';
  sq := sq + ' )';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Inserir');

  sq := 'Select first 2 * from TB_DOCCOB Where Ligcli = '+idCli.ToString+' order by id desc  ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
  DM2.cdsTMP.First;
  DOCCOB_Insere := DM2.cdsTMP.Fields[0].Value;

end;

procedure TBco.DOCCOB_Mostra(idCli, ult :Integer);
begin
  sq := 'select first '+ult.ToString+' * from TB_DOCCOB WHERE LigCli = '+idCli.ToString+' order by id desc ';
  DM2.Roda_SQL(DM5.sdsCob, DM5.cdsCob, sq);
end;

procedure TBco.DOCCOB_MostraID(idCob: Integer);
begin
  sq := 'select * from TB_DOCCOB WHERE id = '+idCob.ToString+' ';
  DM2.Roda_SQL(DM5.sdsCob, DM5.cdsCob2, sq);
end;

procedure TBco.DOCCOB_Mostra_Cte(idCli, idCob: Integer);
begin
  sq := 'select a.id, a.NUMC, a.DATAC, a.LIGTRANSP, a.NUMNOTA, a.TOTAL, b.nocorr as nOc ';
  sq := sq + ' from TB_Conhec a, TB_NOTAF b ';
  sq := sq + '  WHERE a.lignota = b.id and a.StatusEnvio = 4 ';
  if idCli >  0 then  sq := sq + ' and  a.LigCli = '+idCli.ToString;
  if idCob > 0 then sq := sq + ' and a.LigDCob = '+idCob.ToString
    else sq := sq + ' and (a.LigDCob is null or a.LigDCob = 0) ';
  sq := sq +'  order by a.NumC ';
  DM2.Roda_SQL(DM5.sdsCobCte, DM5.cdsCobCTe, sq);
end;


procedure TBco.DOCCOB_Mostra_NF(idCli, idCob: Integer);
begin
  sq := 'select * from TB_NOTAF WHERE LigCli = '+idCli.ToString;
  sq := sq + ' and LigDCob = '+idCob.ToString;
  sq := sq +'  order by NumNF ';
  DM2.Roda_SQL(DM5.sdsSemC, DM5.cdsSemC, sq);
end;

function TBco.Cob2_Marcar(dta, dtb: TDateTime; flag:Smallint): Integer;

var
    resp:Integer;
begin
  resp := 0;

  DM5.sspMarq.Active := false;
  DM5.sspMarq.StoredProcName := 'SP_COB2_MARCAR';
  DM5.sspMarq.ParamByName('DT1').AsDate := dta;
  DM5.sspMarq.ParamByName('DT2').AsDate := dtb;
  DM5.sspMarq.ParamByName('FLG').AsInteger := flag;

  DM2.Executa_SP(DM1.Conexao, DM5.sspMarq);

  resp := DM5.sspMarq.ParamByName('QUANTNF').AsInteger;

  Cob2_Marcar := resp;
end;

procedure TBco.Cob2_Zera(f1, f2: Smallint);
begin
  sq := 'SP_COB2_ZERAR';
  DM5.sspZero.Active := false;
  DM5.sspZero.StoredProcName := 'SP_COB2_ZERAR';
  DM5.sspZero.ParamByName('INICIO').AsInteger := f1;
  DM5.sspZero.ParamByName('FIM').AsInteger    := f2;
  //DM2.sspSP.ExecProc;
  DM2.Executa_SP(DM1.Conexao, DM5.sspZero);
end;

procedure TBco.Romaneio_NotasBaixa(numR: Integer);
begin
  sq := 'select a.id, a.numNF, a.valor, a.CEP, a.nocorr, a.dtent, ';
  sq := sq + ' a.hrent, a.recebedor, b.nome, a.origem, a.obs, a.ligcli, a.dtCria ';
  sq := sq + ' from tb_Notaf a, Tb_Cliente b';
  sq := sq + ' where a.ligcli=b.ID';
  sq := sq + ' and a.nRoma = ' + IntToStr(numR);
  sq := sq + ' order by a.nOcorr desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

end;

procedure TBco.Notas_AlteraRecebedor(idNota:Integer; Rec: String);
begin
  sq := 'Update TB_NOTAF set ';
  sq := sq + '  RECEBEDOR = ' + QuotedStr(Rec);
  sq := sq + ' WHERE id = ' + IntToStr(idNota);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Cob2_Clientes;
begin
  sq := 'SELECT a.ligCli,COUNT(*) as qtnotas ';
  sq := sq + ' from TB_NOTAF a ';
  sq := sq + ' where a.FLAG_GERAL = 10 ';
  sq := sq + ' group by a.ligcli';
  sq := sq + ' order by COUNT(*)  desc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

end;

function TBco.Ocorrencia_Traduz(tipo, nOc: Integer): String;

var s : String;

begin
  // tipo = 1 Descricao
  // tipo = 2 Entrega Reentrega ou Devolucao
  sq := 'SELECT * FROM TB_OCORRE ';
  sq := sq + ' where NUM = '+IntToStr(nOC);
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

  if (tipo = 1) then s := DM2.cdsTMP.FieldByName('DESCR').Value;
  if (tipo = 2) then
  begin
    if (DM2.cdsTMP.FieldByName('USO').Value = 1) then s := 'Entregue';
    if (DM2.cdsTMP.FieldByName('USO').Value = 2) then s := 'Reentrega';
    if (DM2.cdsTMP.FieldByName('USO').Value = 3) then s := 'Devolucao';
  end;

  Ocorrencia_Traduz := s;

end;

function TBco.Notas_Existe_Reentrega(idNF, nNF, idC: Integer): Boolean;

var resp : boolean;

begin
  sq := 'SELECT id FROM TB_NOTAF ';
  sq := sq + ' where id > '+IntToStr(idNF);
  sq := sq + ' and   numNF = '+IntToStr(nNF);
  sq := sq + ' and  ligcli = '+IntToStr(idC);

  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );

  resp := false;
  if (DM2.cdsTMP.RecordCount > 0) then resp := true;
  Notas_Existe_Reentrega := resp;
end;

procedure TBco.Notas_Unica_Acompanha(dtA, dtB: TDateTime; idCli:Integer);
begin
  sq := 'SELECT a.DTCRIADA as Entrada, b.NUMNF, b.Valor, b.VOLUME, b.PESO, b.NOMEDEST,  ';
  sq := sq + ' b.RECEBEDOR, b.CEP, b.LOCALI, b.NOCORR, b.obs, b.NROMA, ';
  sq := sq + ' b.DTENT, b.HRENT, b.id as idNF, b.VFRETE, b.DOCDEST  ';
  sq := sq + ' FROM TB_NFUNICA a, TB_NOTAF b ';
  sq := sq + ' where (a.LIGCLI = b.LIGCLI and a.NUMNOTA=b.NUMNF)  ';
  sq := sq + ' and a.dtcriada between '+QuotedStr(BD_DIa(dtA,3))+ ' and ' + QuotedStr(BD_DIa(dtB,3));
  sq := sq + ' and (b.LIGCLI = '+ idCli.ToString+' )  ';
  sq := sq + ' order by  a.DTCRIADA, a.NUMNOTA, b.dtcria desc ';
  DM2.Roda_SQL(DM5.sdsNFac, DM5.cdsNFac, sq );

end;

procedure TBco.Notas_Unica_AltCli(nNF, idCant, idCnovo: Integer);
begin
  sq := 'Update TB_NFUNICA set ';
  sq := sq + ' ligcli = ' + IntToStr(idCnovo);
  sq := sq + ' WHERE numnota = ' + IntToStr(nNF) + ' and ligcli = '+ IntToStr(idCant);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Notas_Unica_AltStatus(nNF, idC, st: Integer);
begin
{
   Status = 0 -- Não Mexida
   Status = 1 -- Entregues
   Status = 2 -- Devolvida
   Status = 3 -- Cancelada
   Status = 4 -- Pendente
   Status = 5 -- Perdida
   Status = 7 -- Perda por Roubo
   Status = 9 --  Marcada em Bloco
   Status = 11 -- Apagada

}
  sq := 'Update TB_NFUNICA set ';
  sq := sq + ' status = ' + intToStr(st);
  sq := sq + ' WHERE numnota = ' + IntToStr(nNF) + ' and ligcli = '+ IntToStr(idC);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Notas_Unica_Apagar(idU:Integer);
begin
  sq := 'Delete from TB_NFUNICA  ';
  sq := sq + ' WHERE id = '+ IntToStr(idU);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar');

end;

procedure TBco.Notas_Unica_BIPnotas(dt: TDateTime);
begin
  sq := 'Select distinct a.id, a.numnota, b.VOLUME, a.bipe, a.BIPVOL  ';
  sq := sq + ' from TB_NFUNICA a, TB_NOTAF b ';
  sq := sq + ' where a.NUMNOTA=b.NUMNF and a.ligcli=b.LIGCLI ';
  sq := sq + ' and a.dtcriada = '+QuotedStr( FormatDateTime('yyyy-MM-dd', dt) );
  sq := sq + ' order by a.numnota ';
  DM2.Roda_SQL(DM5.sdsBIPn, DM5.cdsBIPn, sq );

end;

procedure TBco.Notas_Unica_BIPtotais(dt: TDateTime);
var sDT : String;
begin
  sDT := FormatDateTime('yyyy-MM-dd', dt);
  sq := 'Select BIPe, sum(b.Volume) as qts from TB_NFUNICA a, TB_NOTAF b ';
  sq := sq + ' where a.NUMNOTA=b.NUMNF and a.ligcli=b.LIGCLI ';
  sq := sq + ' and a.DTCRIADA= '+QuotedStr( sDT );
  sq := sq + ' and b.DTCRIA> '+QuotedStr( sDT+' 00:00' );
  sq := sq + ' and b.DTCRIA< '+QuotedStr( sDT+' 23:59' );
  sq := sq + ' group by a.BIPe order by a.BIPe ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq );


end;

procedure TBco.Notas_Unica_DiasProcura(dt: TDateTime; idCli: Integer);
begin
  sq := 'select first 5 dtcriada, count(*) as nts from TB_NFUNICA  ';
  sq := sq + ' where dtcriada <=  '+ QuotedStr(BD_dia(dt,3));
  sq := sq + ' and ligcli=  ' + idCli.ToString;
  sq := sq + ' group by dtcriada order by dtcriada desc  ';
  DM2.Roda_SQL(DM5.sdsBIPt, DM5.cdsBIPt, sq );
end;

procedure TBco.Notas_Unica_MarcaVol(idU, volB, stB: Integer);
begin
  sq := 'Update TB_NFUNICA set ';
  sq := sq + ' BIPe = ' + intToStr(stB);
  sq := sq + ',BIPvol = ' + intToStr(volB);
  sq := sq + ' WHERE id = ' + IntToStr(idU);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.Notas_Unica_MostraQT(dias:Smallint);
begin
  if dias = 0 then
    sq := 'Select dtcriada, count(*) as nts from TB_NFUNICA  '
  else
    sq := 'Select First '+dias.ToString+' dtcriada, count(*) as nts from TB_NFUNICA  ';

  sq := sq + ' group by dtcriada order by dtcriada desc ';
  DM2.Roda_SQL(DM5.sdsBIPt, DM5.cdsBIPt, sq );
end;

procedure TBco.Notas_Unica_Rel(idCli: Integer);
begin
  sq := 'select b.ID, a.DTCRIADA, b.dtcria, b.numnf, b.locali, ';
  sq := sq + ' b.CEP, b.ligcli, b.NOCORR, b.nroma ';
  sq := sq + ' from tb_NFunica  a, TB_NOTAF b ';
  sq := sq + ' where (a.ligcli=b.LIGCLI and a.NUMNOTA=b.numnf and b.dtcria>a.dtcriada ) ';
  sq := sq + ' and (a.STATUS=0) ';
  if idCli > 0  then sq := sq + ' and (a.ligcli= '+idCli.ToString+ ' ) ';
  sq := sq + ' order by a.dtcriada, b.NUMNF, b.id desc ';

  DM2.Roda_SQL(DM5.sdsRcria, DM5.cdsRcria, sq );
end;

procedure TBco.Notas_VisualizaPendencias(pende: integer);

var idNFpesquisa : Integer;
begin
  idNFpesquisa := Config_DTP_MostraN;
  sq := 'select a.id, a.numnf, a.valor, b.NOME, a.obs, a.dtcria, a.ligcli ';
  sq := sq + ' from tb_notaf a, TB_Cliente b ';
  sq := sq + ' WHERE a.LIGCLI = b.id ';
  sq := sq + ' and a.id > ' + idNFpesquisa.ToString;
  sq := sq + ' and PENDE = ' + pende.ToString;
  sq := sq + ' order by a.dtcria ';

  DM2.Roda_SQL(DM5.sdsPende, DM5.cdsPende, sq );

end;

procedure TBco.BIP_Roma_Mostra;
begin
  sq := 'select dtroma, num, num -extract(YEAR from dtRoma)* 1000000 as Romaneio, ligMot, CONFERIDOPOR, confere  ';
  sq := sq + ' from TB_ROMA  ';
  //sq := sq + ' where dtroma >= CURRENT_DATE - 30 ';
  sq := sq + ' order by num desc ';
  DM2.Roda_SQL(DM5.sdsBipR, DM5.cdsBipR, sq );
end;

procedure TBco.BIP2_Altera_Notas(idB2, nts: Integer);
begin
  sq := 'Update TB_BIP set ';
  sq := sq + ' NotasEnt = ' + intToStr(nts);
  sq := sq + ' WHERE id = ' + IntToStr(idB2);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.BIP2_Altera_UltConfere(idB2: Integer; dtUlt: TDateTime);
begin
  sq := 'Update TB_BIP set ';
  sq := sq + ' dtUltConf = ' + QuotedStr(BD_Dia(dtUlt,1));
  sq := sq + ' WHERE id = ' + IntToStr(idB2);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.BIP2_Insere(dtEntrada: TDateTime);
begin
  sq := 'Insert Into TB_BIP (dtCria, dtEntrada, dtUltConf, NotasEnt) Values ( ';
  sq := sq + '  ' + QuotedStr(BD_Dia(Now,1));
  sq := sq + ', ' + QuotedStr(BD_Dia(dtEntrada,3));
  sq := sq + ', ' + QuotedStr(BD_Dia(Now,1));
  sq := sq + ', 0 ' ;
  sq := sq + ' ) ' ;
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Inserir');
end;

procedure TBco.BIP2_Mostra;
begin
  sq := 'Select First 100 * from TB_BIP ';
  sq := sq + ' order by dtEntrada desc ';
  DM2.Roda_SQL(DM5.sdsBip2, DM5.cdsBip2b, sq );
end;

procedure TBco.BIP2_MostraData(dtE: TDateTime);
begin
  sq := 'Select * from TB_BIP ';
  sq := sq + ' WHERE dtEntrada = '+ QuotedStr(BD_dia(dtE,3) );
  DM2.Roda_SQL(DM5.sdsBip2, DM5.cdsBip2, sq );
end;

procedure TBco.BIP2_NF_AlteraStatus(ligBip, nfnum, status: Integer);
begin
  sq := 'Update TB_BIP_NF set ';
  sq := sq + ' estatus = ' + IntToStr(status);;
  sq := sq + ' WHERE ligBip = ' + IntToStr(ligBip) + ' and enumnf = '+IntToStr(nfNum);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
end;

procedure TBco.BIP2_NF_AlteraVol(ligBip, nfnum, vol: Integer);
begin
  sq := 'Update TB_BIP_NF set ';
  sq := sq + ' evol = ' + IntToStr(vol);;
  sq := sq + ' WHERE ligBip = ' + IntToStr(ligBip) + ' and enumnf = '+IntToStr(nfNum);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.BIP2_NF_Apaga(ligBip, nfnum: Integer);
begin
  sq := 'DELETE FROM TB_BIP_NF ';
  sq := sq + ' WHERE ligBip = ' + IntToStr(ligBip) + ' and enumnf = '+IntToStr(nfNum);
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Apagar');
end;

procedure TBco.BIP2_NF_Insere(ligBip, nfnum, vol: Integer);
begin
  sq := 'Insert Into TB_BIP_NF (ligBip, edtCria, edtAltera, eNumNf, eVol, eStatus ) VALUES (  ';
  sq := sq + '  ' + IntToStr(ligBip);;
  sq := sq + ', ' + QuotedStr(BD_Dia(Now,1));
  sq := sq + ', ' + QuotedStr(BD_Dia(Now,1));
  sq := sq + ', ' + IntToStr(nfNum);
  sq := sq + ', ' + IntToStr(vol);
  sq := sq + ', 0 ';
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');

end;

procedure TBco.BIP2_NF_MostraID(idB2nf: Integer);
begin
  sq := 'Select * from TB_BIP_NF ';
  sq := sq + ' WHERE id = '+ IntToStr(idB2nf);
  DM2.Roda_SQL(DM5.sdsBip2nf, DM5.cdsBip2nf, sq );

end;

procedure TBco.BIP2_NF_MostraIdB2(idB2: Integer);
begin
  sq := 'Select * from TB_BIP_NF ';
  sq := sq + ' WHERE ligBip = '+ IntToStr(idB2);
  sq := sq + ' order by enumnf ';
  DM2.Roda_SQL(DM5.sdsBip2nf, DM5.cdsBip2nf, sq );
end;

procedure TBco.BIP2_NF_MostraNF(idB2, numnf: Integer);
begin
  sq := 'Select * from TB_BIP_NF ';
  sq := sq + ' WHERE ligBip = '+ idB2.ToString +' and enumnf = '+ IntToStr(numnf) ;
  DM2.Roda_SQL(DM5.sdsBip2nf, DM5.cdsBip2nf, sq );
end;

procedure TBco.BIP2_NF_MostraST(ligBip, St: Integer);
begin
  {
     Status
     0 = Não Conferido
     1 = ERRO desconhecido
     2 = ERRO + (volume BIP maior que Volume existente)
     3 = ERRO - (volume BIP menor que Volume existente)
     4 = ERRO não veio IMPORTAÇÃO, mas o prod sim
     5 = ERRO não veio o PRODUTO, mas a Importação sim

     10= ok
     11= Finalizado com erro
     12= Corrigido erro +
     13= Corrigido erro -
     14= Corrigido SEM importação
     15= Corrigido SEM produto
  }
  sq := 'Select * from TB_BIP_NF ';
  sq := sq + ' WHERE ligBip = '+ IntToStr(ligBip) + ' and eStatus = '+IntToStr(St);
  DM2.Roda_SQL(DM5.sdsBip2nf, DM5.cdsBip2nf, sq );
end;

function TBco.BIP_Roma_Confere(numR, status: Integer; nomeU, SenhaU: String):boolean;

var idU : Integer;
    ok : boolean;
begin
  // status
  // 0 = nao conferido
  // 1 = conferido
  // 2 = conferido com erros (incompleto)

  idU := Usuarios_Procura(nomeU, SenhaU);

  ok := false;
  if (idU > 0) then
  begin
    ok := true;
    sq := 'Update TB_ROMA set ';
    sq := sq + ' conferidopor = ' + intToStr(idU);
    sq := sq + ',confere = ' + intToStr(status);
    sq := sq + ' WHERE num = ' + IntToStr(numR);
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq, 'Alterar');
  end;
  BIP_Roma_Confere := ok;
end;

procedure TBco.NaoEntregues_Dia(dt: TDateTime; idC : integer);

begin
  sq := 'select a.dtCriada, a.numnota, a.ligcli, b.nome, a.id as idU  from TB_NFunica a, TB_Cliente b ';
  sq := sq + ' where a.ligcli=b.id and  a.status = 0 ';
  if (idC > -1) then sq := sq + ' and dtcriada = ' + QuotedStr( FormatDateTime('yyyy-MM-dd', dt) );
  if (idC > 0 ) then sq := sq + ' and ligcli = ' + IntToStr(idC);

  DM2.Roda_SQL(DM5.sdsCr2, DM5.cdsCr2, sq );
end;

procedure TBco.NaoEntregues_Notas(idC, numNF: Integer; dta:TDateTime);
begin
  sq := 'select nRoma, numnf, id, valor, obs  ';
  sq := sq + ' From  TB_NotaF  ';
  sq := sq + ' Where dtcria >=  ' + QuotedStr( FormatDateTime('yyyy-MM-dd', dta - 2) );
  sq := sq + ' and ligcli = ' + IntToStr(idC);
  sq := sq + ' and NUMNF =  ' + IntToStr(numNF);
  sq := sq + ' order by id ';
  DM2.Roda_SQL(DM5.sdsCr3, DM5.cdsCr3, sq );
end;

procedure TBco.NaoEntregues_Quant(idC: Integer);
begin
  sq := 'select dtcriada, count(*) as Qt from tb_NFunica ';
  sq := sq + ' where status = 0 ';
  if (idC > 0 ) then sq := sq + ' and ligcli = ' + IntToStr(idC);
  sq := sq + ' group by dtcriada ';
  sq := sq + ' order by dtcriada ';

  DM2.Roda_SQL(DM5.sdsCr1, DM5.cdsCr1, sq );

end;

procedure TBco.Notas_Fases_MostraNF(Ligcli, NumNF: Integer);
begin
  sq := 'select a.numnota, a.DTEV, c.DESCR, b.Login, a.numroma ';
  sq := sq + ' from tb_NFstatus a, TB_Usuarios b, TB_INTERNO c ';
  sq := sq + ' where a.LIGUSER = b.ID and a.NUMEVENTO = c.CODINT ';
  sq := sq + ' and a.NUMnota = ' + IntToStr(NumNF);
  sq := sq + ' and a.LigCli  = ' + IntToStr(LigCli);
  sq := sq + ' order by a.DTEV ';

  DM2.Roda_SQL(DM5.sdsINT, DM5.cdsINT, sq );
end;

end.
