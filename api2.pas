// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://api.tiny.com.br/api2.php?wsdl
// Encoding : ISO-8859-1
// Version  : 1.0
// (25/8/2019 07:44:28 - 1.33.2.5)
// ************************************************************************ //

unit api2;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:integer         - "http://www.w3.org/2001/XMLSchema"
  // !:string - deprecated - "http://www.w3.org/2001/XMLSchema"


  // ************************************************************************ //
  // Namespace : urn:tinywsdl
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // binding   : tinywsdlBinding
  // service   : tinywsdl
  // port      : tinywsdlPort
  // URL       : https://api.tiny.com.br:443/api2.php
  // ************************************************************************ //
  tinywsdlPortType = interface(IInvokable)
  ['{08C41213-F41C-DA25-FB12-B952E5D02165}']
    function  pesquisarVendedoresService(const token: WideString; const pesquisa: WideString; const formato: WideString; const situacao: WideString; const pagina: WideString; const ordem: WideString): WideString; stdcall;
    function  pesquisarContatosService(const token: WideString; const pesquisa: WideString; const formato: WideString; const situacao: WideString; const pagina: WideString; const ordem: WideString; const idVendedor: Integer; const nomeVendedor: WideString; const dataCriacao: WideString): WideString; stdcall;
    function  obterContatoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirContatoService(const token: WideString; const contato: WideString; const formato: WideString): WideString; stdcall;
    function  alterarContatoService(const token: WideString; const contato: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarGruposTagService(const token: WideString; const pesquisa: WideString; const formato: WideString; const pagina: WideString; const ordem: WideString): WideString; stdcall;
    function  incluirGrupoTagService(const token: WideString; const grupo: WideString; const formato: WideString): WideString; stdcall;
    function  alterarGrupoTagService(const token: WideString; const grupo: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarTagService(const token: WideString; const pesquisa: WideString; const idGrupo: Integer; const formato: WideString; const pagina: WideString; const ordem: WideString): WideString; stdcall;
    function  incluirTagService(const token: WideString; const tag: WideString; const formato: WideString): WideString; stdcall;
    function  alterarTagService(const token: WideString; const tag: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarListasPrecosService(const token: WideString; const pesquisa: WideString; const formato: WideString; const pagina: WideString): WideString; stdcall;
    function  obterListasPrecosExcecoesService(const token: WideString; const idListaPreco: integer; const idProduto: integer; const formato: WideString; const pagina: WideString): WideString; stdcall;
    function  pesquisarProdutosService(const token: WideString; const pesquisa: WideString; const formato: WideString; const pagina: WideString; const ordem: WideString; const idTag: WideString; const idListaPreco: integer): WideString; stdcall;
    function  obterProdutoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirProdutoService(const token: WideString; const produto: WideString; const formato: WideString): WideString; stdcall;
    function  alterarProdutoService(const token: WideString; const produto: WideString; const formato: WideString): WideString; stdcall;
    function  atualizarEstoqueProdutoService(const token: WideString; const estoque: WideString; const formato: WideString): WideString; stdcall;
    function  obterEstoqueProdutoService(const token: WideString; const id: WideString; const formato: WideString): WideString; stdcall;
    function  obterEstruturaProdutoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  obterTagsProdutoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  listaAtualizacoesProdutosService(const token: WideString; const dataAlteracao: WideString; const formato: WideString; const pagina: WideString): WideString; stdcall;
    function  listaAtualizacoesEstoqueService(const token: WideString; const dataAlteracao: WideString; const formato: WideString; const pagina: WideString): WideString; stdcall;
    function  pesquisarPedidosService(const token: WideString; const numero: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const numeroEcommerce: WideString; const idVendedor: WideString; const nomeVendedor: WideString; 
                                      const dataInicialOcorrencia: WideString; const dataFinalOcorrencia: WideString; const situacaoOcorrencia: WideString; const formato: WideString; const pagina: WideString; const ordem: WideString; const sort: WideString): WideString; stdcall;
    function  obterPedidoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirPedidoService(const token: WideString; const pedido: WideString; const formato: WideString): WideString; stdcall;
    function  alterarSituacaoPedidoService(const token: WideString; const id: integer; const situacao: WideString; const formato: WideString): WideString; stdcall;
    function  incluirMarcadoresPedidoService(const token: WideString; const idPedido: integer; const marcadores: WideString; const formato: WideString): WideString; stdcall;
    function  removerMarcadoresPedidoService(const token: WideString; const idPedido: integer; const marcadores: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarNotasFiscaisService(const token: WideString; const serie: WideString; const numero: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const numeroEcommerce: WideString; const idVendedor: WideString; 
                                           const nomeVendedor: WideString; const formato: WideString; const pagina: WideString; const ordem: WideString; const tipoNota: WideString): WideString; stdcall;
    function  obterNotaFiscalService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirNotaFiscalService(const token: WideString; const nota: WideString; const formato: WideString; const preValidarNota: WideString): WideString; stdcall;
    function  obterXMLNotaFiscal(const token: WideString; const id: integer): WideString; stdcall;
    function  obterXMLNotaFiscalService(const token: WideString; const id: integer): WideString; stdcall;
    function  obterLinkNotaFiscalService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  emitirNotaFiscalService(const token: WideString; const id: integer; const serie: WideString; const numero: WideString; const enviarEmail: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarNotasServicoService(const token: WideString; const serie: WideString; const numero: WideString; const numeroRPS: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const idVendedor: WideString; 
                                           const nomeVendedor: WideString; const formato: WideString; const pagina: WideString; const ordem: WideString): WideString; stdcall;
    function  obterNotaServicoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirNotaServicoService(const token: WideString; const nota: WideString; const formato: WideString): WideString; stdcall;
    function  enviarNotaServicoService(const token: WideString; const id: integer; const formato: WideString; const enviarEmail: WideString): WideString; stdcall;
    function  consultarNotaServicoService(const token: WideString; const id: integer; const formato: WideString; const enviarEmail: WideString): WideString; stdcall;
    function  pesquisarContratosService(const token: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const idVendedor: WideString; const nomeVendedor: WideString; const formato: WideString; const pagina: WideString; 
                                        const ordem: WideString): WideString; stdcall;
    function  obterContratoService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  incluirContratoService(const token: WideString; const contrato: WideString; const formato: WideString): WideString; stdcall;
    function  alterarContratoService(const token: WideString; const contrato: WideString; const formato: WideString): WideString; stdcall;
    function  incluirContratoAdicionalService(const token: WideString; const adicional: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarContratoAdicionalService(const token: WideString; const idContrato: integer; const formato: WideString): WideString; stdcall;
    function  excluirContratoAdicionalService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  gerarOrdemProducaPedidoService(const token: WideString; const id: integer; const lancarEstoque: WideString; const formato: WideString): WideString; stdcall;
    function  gerarNotaFiscalPedidoService(const token: WideString; const id: integer; const modelo: WideString; const formato: WideString): WideString; stdcall;
    function  cadastrarCodigoRastreamentoPedidoService(const token: WideString; const id: integer; const codigoRastreamento: WideString; const urlRastreamento: WideString; const formaEnvio: WideString; const transportadora: WideString; const volumes: WideString; const pesoBruto: WideString; const pesoLiquido: WideString; const dataPrevista: WideString;
                                                       const observacoes: WideString; const formato: WideString): WideString; stdcall;
    function  cadastrarCodigoRastreamentoNotaFiscalService(const token: WideString; const notafiscal: WideString; const formato: WideString): WideString; stdcall;
    function  listarEstagiosAssuntos(const token: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarAssuntosCRM(const token: WideString; const pesquisa: WideString; const estagioCliente: WideString; const estagioAssunto: WideString; const situacaoAssunto: WideString; const filtroPor: WideString; const dataInicial: WideString; const dataFinal: WideString; const idVendedor: WideString; const nomeVendedor: WideString;
                                   const pagina: WideString; const formato: WideString): WideString; stdcall;
    function  obterAssuntoCRM(const token: WideString; const id: WideString; const formato: WideString): WideString; stdcall;
    function  incluirAssuntoCRM(const token: WideString; const assunto: WideString; const formato: WideString): WideString; stdcall;
    function  incluirAcaoAssuntoCRM(const token: WideString; const acao: WideString; const formato: WideString): WideString; stdcall;
    function  alterarEstagioAssuntoCRM(const token: WideString; const idAssunto: WideString; const estagioAssunto: WideString; const formato: WideString): WideString; stdcall;
    function  alterarSituacaoAcaoCRM(const token: WideString; const idAcao: WideString; const situacaoAcao: WideString; const formato: WideString): WideString; stdcall;
    function  incluirContaReceberService(const token: WideString; const conta: WideString; const formato: WideString): WideString; stdcall;
    function  obterContaReceberService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  pesquisarContasReceberService(const token: WideString; const numero_doc: WideString; const numero_banco: WideString; const nome_cliente: WideString; const data_ini_emissao: WideString; const data_fim_emissao: WideString; const data_ini_vencimento: WideString; const data_fim_vencimento: WideString; const situacao: WideString; const pagina: integer;
                                            const formato: WideString): WideString; stdcall;
    function  baixarContaReceberService(const token: WideString; const conta: WideString; const formato: WideString): WideString; stdcall;
    function  incluirContaPagarService(const token: WideString; const conta: WideString; const formato: WideString): WideString; stdcall;
    function  obterContaPagarService(const token: WideString; const id: integer; const formato: WideString): WideString; stdcall;
    function  pesquisarContasPagarService(const token: WideString; const numero_doc: WideString; const nome_cliente: WideString; const data_ini_emissao: WideString; const data_fim_emissao: WideString; const data_ini_vencimento: WideString; const data_fim_vencimento: WideString; const situacao: WideString; const pagina: integer; const formato: WideString
                                          ): WideString; stdcall;
    function  baixarContaPagarService(const token: WideString; const conta: WideString; const formato: WideString): WideString; stdcall;
    function  pesquisarContatosXML(const token: WideString; const pesquisa: WideString; const formato: WideString; const apiKey: string): WideString; stdcall;
    function  obterContatoXML(const token: WideString; const id: integer; const formato: WideString; const apiKey: string): WideString; stdcall;
    function  incluirContatoXML(const token: WideString; const contatoXML: WideString; const apiKey: string): WideString; stdcall;
    function  alterarContatoXML(const token: WideString; const contatoXML: WideString; const apiKey: string): WideString; stdcall;
    function  pesquisarGruposTagXML(const token: WideString; const pesquisa: WideString): WideString; stdcall;
    function  incluirGrupoTagXML(const token: WideString; const grupoXML: WideString): WideString; stdcall;
    function  alterarGrupoTagXML(const token: WideString; const grupoXML: WideString): WideString; stdcall;
    function  pesquisarTagXML(const token: WideString; const pesquisa: WideString; const idGrupo: Integer): WideString; stdcall;
    function  incluirTagXML(const token: WideString; const tagXML: WideString): WideString; stdcall;
    function  alterarTagXML(const token: WideString; const tagXML: WideString): WideString; stdcall;
    function  pesquisarProdutosXML(const token: WideString; const pesquisa: WideString; const apiKey: string ): WideString; stdcall;
    function  obterProdutoXML(const token: WideString; const id: integer; const apiKey: string): WideString; stdcall;
    function  incluirProdutoXML(const token: WideString; const produtoXML: WideString; const apiKey: string): WideString; stdcall;
    function  alterarProdutoXML(const token: WideString; const produtoXML: WideString; const apiKey: string): WideString; stdcall;
    function  obterEstoqueProdutoXML(const token: WideString; const id: WideString; const apiKey: string; const codigo: WideString): WideString; stdcall;
    function  obterEstruturaProdutoXML(const token: WideString; const id: integer): WideString; stdcall;
    function  obterTagsProdutoXML(const token: WideString; const id: integer): WideString; stdcall;
    function  listaAtualizacoesProdutosXML(const token: WideString; const dataAlteracao: WideString; const apiKey: string): WideString; stdcall;
    function  listaAtualizacoesEstoqueXML(const token: WideString; const dataAlteracao: WideString; const apiKey: string ): WideString; stdcall;
    function  pesquisarPedidosXML(const token: WideString; const numero: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const numeroEcommerce: WideString): WideString; stdcall;
    function  obterPedidoXML(const token: WideString; const id: integer): WideString; stdcall;
    function  incluirPedidoXML(const token: WideString; const pedidoXML: WideString): WideString; stdcall;
    function  pesquisarNotasFiscaisXML(const token: WideString; const serie: WideString; const numero: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString; const numeroEcommerce: WideString): WideString; stdcall;
    function  obterNotaFiscalXML(const token: WideString; const id: integer): WideString; stdcall;
    function  incluirNotaFiscalXML(const token: WideString; const notaXML: WideString): WideString; stdcall;
    function  pesquisarNotasServicoXML(const token: WideString; const serie: WideString; const numero: WideString; const numeroRPS: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString): WideString; stdcall;
    function  obterNotaServicoXML(const token: WideString; const id: integer): WideString; stdcall;
    function  incluirNotaServicoXML(const token: WideString; const notaXML: WideString): WideString; stdcall;
    function  pesquisarContratosXML(const token: WideString; const cliente: WideString; const cpf_cnpj: WideString; const dataInicial: WideString; const dataFinal: WideString; const situacao: WideString): WideString; stdcall;
    function  obterContratoXML(const token: WideString; const id: integer): WideString; stdcall;
    function  incluirContratoXML(const token: WideString; const contratoXML: WideString): WideString; stdcall;
    function  expedicaoLiberarObjetosService(const token: WideString; const idObjetos: WideString; const tipoObjetos: WideString; const formato: WideString): WideString; stdcall;
  end;

function GettinywsdlPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): tinywsdlPortType;


implementation

function GettinywsdlPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): tinywsdlPortType;
const
  defWSDL = 'https://api.tiny.com.br/api2.php?wsdl';
  defURL  = 'https://api.tiny.com.br:443/api2.php';
  defSvc  = 'tinywsdl';
  defPrt  = 'tinywsdlPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as tinywsdlPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(tinywsdlPortType), 'urn:tinywsdl', 'ISO-8859-1');
  InvRegistry.RegisterAllSOAPActions(TypeInfo(tinywsdlPortType), '|urn:tinywsdl#pesquisarVendedoresService'
                                                                +'|urn:tinywsdl#pesquisarContatosService'
                                                                +'|urn:tinywsdl#obterContatoService'
                                                                +'|urn:tinywsdl#incluirContatoService'
                                                                +'|urn:tinywsdl#alterarContatoService'
                                                                +'|urn:tinywsdl#pesquisarGruposTagService'
                                                                +'|urn:tinywsdl#incluirGrupoTagService'
                                                                +'|urn:tinywsdl#alterarGrupoTagService'
                                                                +'|urn:tinywsdl#pesquisarTagService'
                                                                +'|urn:tinywsdl#incluirTagService'
                                                                +'|urn:tinywsdl#alterarTagService'
                                                                +'|urn:tinywsdl#pesquisarListasPrecosService'
                                                                +'|urn:tinywsdl#obterListasPrecosExcecoesService'
                                                                +'|urn:tinywsdl#pesquisarProdutosService'
                                                                +'|urn:tinywsdl#obterProdutoService'
                                                                +'|urn:tinywsdl#incluirProdutoService'
                                                                +'|urn:tinywsdl#alterarProdutoService'
                                                                +'|urn:tinywsdl#atualizarEstoqueProdutoService'
                                                                +'|urn:tinywsdl#obterEstoqueProdutoService'
                                                                +'|urn:tinywsdl#obterEstruturaProdutoService'
                                                                +'|urn:tinywsdl#obterTagsProdutoService'
                                                                +'|urn:tinywsdl#listaAtualizacoesProdutosService'
                                                                +'|urn:tinywsdl#listaAtualizacoesEstoqueService'
                                                                +'|urn:tinywsdl#pesquisarPedidosService'
                                                                +'|urn:tinywsdl#obterPedidoService'
                                                                +'|urn:tinywsdl#incluirPedidoService'
                                                                +'|urn:tinywsdl#alterarSituacaoPedidoService'
                                                                +'|urn:tinywsdl#incluirMarcadoresPedidoService'
                                                                +'|urn:tinywsdl#removerMarcadoresPedidoService'
                                                                +'|urn:tinywsdl#pesquisarNotasFiscaisService'
                                                                +'|urn:tinywsdl#obterNotaFiscalService'
                                                                +'|urn:tinywsdl#incluirNotaFiscalService'
                                                                +'|urn:tinywsdl#obterXMLNotaFiscal'
                                                                +'|urn:tinywsdl#obterXMLNotaFiscalService'
                                                                +'|urn:tinywsdl#obterLinkNotaFiscalService'
                                                                +'|urn:tinywsdl#emitirNotaFiscalService'
                                                                +'|urn:tinywsdl#pesquisarNotasServicoService'
                                                                +'|urn:tinywsdl#obterNotaServicoService'
                                                                +'|urn:tinywsdl#incluirNotaServicoService'
                                                                +'|urn:tinywsdl#enviarNotaServicoService'
                                                                +'|urn:tinywsdl#consultarNotaServicoService'
                                                                +'|urn:tinywsdl#pesquisarContratosService'
                                                                +'|urn:tinywsdl#obterContratoService'
                                                                +'|urn:tinywsdl#incluirContratoService'
                                                                +'|urn:tinywsdl#alterarContratoService'
                                                                +'|urn:tinywsdl#incluirContratoAdicionalService'
                                                                +'|urn:tinywsdl#pesquisarContratoAdicionalService'
                                                                +'|urn:tinywsdl#excluirContratoAdicionalService'
                                                                +'|urn:tinywsdl#gerarOrdemProducaPedidoService'
                                                                +'|urn:tinywsdl#gerarNotaFiscalPedidoService'
                                                                +'|urn:tinywsdl#cadastrarCodigoRastreamentoPedidoService'
                                                                +'|urn:tinywsdl#cadastrarCodigoRastreamentoNotaFiscalService'
                                                                +'|urn:tinywsdl#listarEstagiosAssuntos'
                                                                +'|urn:tinywsdl#pesquisarAssuntosCRM'
                                                                +'|urn:tinywsdl#obterAssuntoCRM'
                                                                +'|urn:tinywsdl#incluirAssuntoCRM'
                                                                +'|urn:tinywsdl#incluirAcaoAssuntoCRM'
                                                                +'|urn:tinywsdl#alterarEstagioAssuntoCRM'
                                                                +'|urn:tinywsdl#alterarSituacaoAcaoCRM'
                                                                +'|urn:tinywsdl#incluirContaReceberService'
                                                                +'|urn:tinywsdl#obterContaReceberService'
                                                                +'|urn:tinywsdl#pesquisarContasReceberService'
                                                                +'|urn:tinywsdl#baixarContaReceberService'
                                                                +'|urn:tinywsdl#incluirContaPagarService'
                                                                +'|urn:tinywsdl#obterContaPagarService'
                                                                +'|urn:tinywsdl#pesquisarContasPagarService'
                                                                +'|urn:tinywsdl#baixarContaPagarService'
                                                                +'|urn:tinywsdl#pesquisarContatosXML'
                                                                +'|urn:tinywsdl#obterContatoXML'
                                                                +'|urn:tinywsdl#incluirContatoXML'
                                                                +'|urn:tinywsdl#alterarContatoXML'
                                                                +'|urn:tinywsdl#pesquisarGruposTagXML'
                                                                +'|urn:tinywsdl#incluirGrupoTagXML'
                                                                +'|urn:tinywsdl#alterarGrupoTagXML'
                                                                +'|urn:tinywsdl#pesquisarTagXML'
                                                                +'|urn:tinywsdl#incluirTagXML'
                                                                +'|urn:tinywsdl#alterarTagXML'
                                                                +'|urn:tinywsdl#pesquisarProdutosXML'
                                                                +'|urn:tinywsdl#obterProdutoXML'
                                                                +'|urn:tinywsdl#incluirProdutoXML'
                                                                +'|urn:tinywsdl#alterarProdutoXML'
                                                                +'|urn:tinywsdl#obterEstoqueProdutoXML'
                                                                +'|urn:tinywsdl#obterEstruturaProdutoXML'
                                                                +'|urn:tinywsdl#obterTagsProdutoXML'
                                                                +'|urn:tinywsdl#listaAtualizacoesProdutosXML'
                                                                +'|urn:tinywsdl#listaAtualizacoesEstoqueXML'
                                                                +'|urn:tinywsdl#pesquisarPedidosXML'
                                                                +'|urn:tinywsdl#obterPedidoXML'
                                                                +'|urn:tinywsdl#incluirPedidoXML'
                                                                +'|urn:tinywsdl#pesquisarNotasFiscaisXML'
                                                                +'|urn:tinywsdl#obterNotaFiscalXML'
                                                                +'|urn:tinywsdl#incluirNotaFiscalXML'
                                                                +'|urn:tinywsdl#obterNotaServicoXML'
                                                                +'|urn:tinywsdl#incluirNotaServicoXML'
                                                                +'|urn:tinywsdl#pesquisarContratosXML'
                                                                +'|urn:tinywsdl#obterContratoXML'
                                                                +'|urn:tinywsdl#incluirContratoXML'
                                                                +'|urn:tinywsdl#expedicaoLiberarObjetosService'
                                                                );

   InvRegistry.RegisterInvokeOptions(TypeInfo(tinywsdlPortType),ioDocument);
end.