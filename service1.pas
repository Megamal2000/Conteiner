// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.flaydel.srv.br/wsflaydel/service1.asmx?wsdl
// Encoding : utf-8
// Version  : 1.0
// (21/08/2011 11:11:16 - 1.33.2.5)
// ************************************************************************ //

unit service1;

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


  // ************************************************************************ //
  // Namespace : http://www.flaydel.srv.br/
  // soapAction: http://www.flaydel.srv.br/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : Service1Soap
  // service   : Service1
  // port      : Service1Soap
  // URL       : http://www.flaydel.srv.br/wsflaydel/service1.asmx
  // ************************************************************************ //
  Service1Soap = interface(IInvokable)
  ['{11111570-C992-14C2-C7FE-D5584137E7A2}']
    function  Registra_Entrega(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer): Integer; stdcall;
    function  Registra_Entrega2(const romaneio: Integer; const nota: Integer; const status: Integer; const dt: WideString; const hora: WideString; const motivo: Integer; const permissao: WideString): Integer; stdcall;
    function  Entrada_Notas(const nCli: Integer; const nNota: Integer; const nRoma: Integer; const dtR: WideString; const vNota: Double; const tipo: Integer; const permissao: WideString): Integer; stdcall;
    function  Sistema_XML(const dtR: WideString; const permissao: WideString): WideString; stdcall;
  end;

function GetService1Soap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): Service1Soap;


implementation

function GetService1Soap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): Service1Soap;
const
  defWSDL = 'http://www.flaydel.srv.br/wsflaydel/service1.asmx?wsdl';
  defURL  = 'http://www.flaydel.srv.br/wsflaydel/service1.asmx';
  defSvc  = 'Service1';
  defPrt  = 'Service1Soap';
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
    Result := (RIO as Service1Soap);
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
  InvRegistry.RegisterInterface(TypeInfo(Service1Soap), 'http://www.flaydel.srv.br/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(Service1Soap), 'http://www.flaydel.srv.br/%operationName%');

  InvRegistry.RegisterInvokeOptions(TypeInfo(Service1Soap),ioDocument);
end. 