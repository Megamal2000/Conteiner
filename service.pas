// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.flaydel.srv.br/wsfda/service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (18/09/2016 08:23:47 - 1.33.2.5)
// ************************************************************************ //

unit service;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:double          - "http://www.w3.org/2001/XMLSchema"

  Sistema_DSResult     = class;                 { "http://www.flaydel.srv.br/" }
  Notas_ListaResult    = class;                 { "http://www.flaydel.srv.br/" }



  // ************************************************************************ //
  // Namespace : http://www.flaydel.srv.br/
  // ************************************************************************ //
  Sistema_DSResult = class(TRemotable)
  private
    Fschema: WideString;
  published
    property schema: WideString read Fschema write Fschema;
  end;



  // ************************************************************************ //
  // Namespace : http://www.flaydel.srv.br/
  // ************************************************************************ //
  Notas_ListaResult = class(TRemotable)
  private
    Fschema: WideString;
  published
    property schema: WideString read Fschema write Fschema;
  end;


  // ************************************************************************ //
  // Namespace : http://www.flaydel.srv.br/
  // soapAction: http://www.flaydel.srv.br/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : ServiceSoap
  // service   : Service
  // port      : ServiceSoap
  // URL       : http://www.flaydel.srv.br/wsfda/service.asmx
  // ************************************************************************ //
  ServiceSoap = interface(IInvokable)
  ['{C9955549-52DF-147C-1546-9B1839836B2E}']
    function  Registra_Entrega(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer): Integer; stdcall;
    function  Registra_Entrega2(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer; const permissao: WideString; const idmot: Integer; const destdoc: WideString): Integer; stdcall;
    function  Entrada_Notas(const nCli: Integer; const nNota: Integer; const nRoma: Integer; const dtR: WideString; const vNota: Double; const tipo: Integer; const permissao: WideString; const destdoc: WideString; const idmot: Integer): Integer; stdcall;
    function  Sistema_DS(const dtR: WideString; const permissao: WideString): Sistema_DSResult; stdcall;
    function  Sistema_XML(const dtR: WideString; const permissao: WideString): WideString; stdcall;
    function  Notas_Lista(const numR: WideString; const dtR: WideString): Notas_ListaResult; stdcall;
    function  Entrada_Notas_ID(const nCli: Integer; const nNota: Integer; const nRoma: Integer; const dtR: WideString; const vNota: Double; const tipo: Integer; const permissao: WideString; const destdoc: WideString; const idmot: Integer; const idnota: Integer): Integer; stdcall;
    function  Lista_semBaixa(const dta: WideString; const dtb: WideString; const permissao: WideString): WideString; stdcall;
    function  Registra_Entrega3(const idnota: Integer; const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer; const permissao: WideString; const idmot: Integer; const destdoc: WideString): Integer; stdcall;
    function  Apaga_Notas_ID(const idNota: Integer; const permissao: WideString): Integer; stdcall;
  end;

function GetServiceSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceSoap;


implementation

function GetServiceSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceSoap;
const
  defWSDL = 'http://www.flaydel.srv.br/wsfda/service.asmx?wsdl';
  defURL  = 'http://www.flaydel.srv.br/wsfda/service.asmx';
  defSvc  = 'Service';
  defPrt  = 'ServiceSoap';
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
    Result := (RIO as ServiceSoap);
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
  InvRegistry.RegisterInterface(TypeInfo(ServiceSoap), 'http://www.flaydel.srv.br/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceSoap), 'http://www.flaydel.srv.br/%operationName%');
  RemClassRegistry.RegisterXSClass(Sistema_DSResult, 'http://www.flaydel.srv.br/', 'Sistema_DSResult');
  RemClassRegistry.RegisterXSClass(Notas_ListaResult, 'http://www.flaydel.srv.br/', 'Notas_ListaResult');

  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceSoap),ioDocument);
end.