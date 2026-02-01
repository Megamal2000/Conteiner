// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://flaydel.log.br/portalauto/wsfda/Service.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (6/7/2021 13:16:49 - 1.33.2.5)
// ************************************************************************ //

unit ServiceLW;

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

  Sistema_DSResult     = class;                 { "http://www.flaydel.log.br/" }
  Notas_ListaResult    = class;                 { "http://www.flaydel.log.br/" }



  // ************************************************************************ //
  // Namespace : http://www.flaydel.log.br/
  // ************************************************************************ //
  Sistema_DSResult = class(TRemotable)
  private
    Fschema: WideString;
  published
    property schema: WideString read Fschema write Fschema;
  end;



  // ************************************************************************ //
  // Namespace : http://www.flaydel.log.br/
  // ************************************************************************ //
  Notas_ListaResult = class(TRemotable)
  private
    Fschema: WideString;
  published
    property schema: WideString read Fschema write Fschema;
  end;


  // ************************************************************************ //
  // Namespace : http://www.flaydel.log.br/
  // soapAction: http://www.flaydel.log.br/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : ServiceSoap
  // service   : Service
  // port      : ServiceSoap
  // URL       : http://flaydel.log.br/portalauto/wsfda/Service.asmx
  // ************************************************************************ //
  ServiceLWSoap = interface(IInvokable)
  ['{47B73CC4-6A4A-2AEF-D822-2B835319AED8}']
    function  Registra_Entrega(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer): Integer; stdcall;
    function  Registra_Entrega2(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer; const permissao: WideString; const idmot: Integer; const destdoc: WideString): Integer; stdcall;
    function  Registra_Entrega3(const idnota: Integer; const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer; const permissao: WideString; const idmot: Integer; const destdoc: WideString
                                ): Integer; stdcall;
    function  Entrada_Notas(const nCli: Integer; const nNota: Integer; const nRoma: Integer; const dtR: WideString; const vNota: Double; const tipo: Integer; const permissao: WideString; const destdoc: WideString; const idmot: Integer): Integer; stdcall;
    function  Sistema_DS(const dtR: WideString; const permissao: WideString): Sistema_DSResult; stdcall;
    function  Sistema_XML(const dtR: WideString; const permissao: WideString): WideString; stdcall;
    function  Notas_Lista(const numR: WideString; const dtR: WideString): Notas_ListaResult; stdcall;
    function  Entrada_Notas_ID(const nCli: Integer; const nNota: Integer; const nRoma: Integer; const dtR: WideString; const vNota: Double; const tipo: Integer; const permissao: WideString; const destdoc: WideString; const idmot: Integer; const idnota: Integer
                               ): Integer; stdcall;
    function  Lista_semBaixa(const dta: WideString; const dtb: WideString; const permissao: WideString): WideString; stdcall;
    function  Apaga_Notas_ID(const idNota: Integer; const permissao: WideString): Integer; stdcall;
  end;

function GetServiceLWSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServiceLWSoap;


implementation

function GetServiceLWSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServiceLWSoap;
const
  defWSDL = 'http://flaydel.log.br/portalauto/wsfda/Service.asmx?wsdl';
  defURL  = 'http://flaydel.log.br/portalauto/wsfda/Service.asmx';
  defSvc  = 'ServiceLW';
  defPrt  = 'ServiceSoapLW';
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
    Result := (RIO as ServiceLWSoap);
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
  InvRegistry.RegisterInterface(TypeInfo(ServiceLWSoap), 'http://www.flaydel.log.br/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServiceLWSoap), 'http://www.flaydel.log.br/%operationName%');
  RemClassRegistry.RegisterXSClass(Sistema_DSResult, 'http://www.flaydel.log.br/', 'Sistema_DSResult');
  RemClassRegistry.RegisterXSClass(Notas_ListaResult, 'http://www.flaydel.log.br/', 'Notas_ListaResult');

  InvRegistry.RegisterInvokeOptions(TypeInfo(ServiceLWSoap),ioDocument);
end.