unit servTiny;

interface

uses api2, SysUtils, uBanco, uDM1;

type
  TTiny = class(TObject)
    Private
      sToken : String;
      sFormato : String;
      iCli : Integer;
      transpNome, transpCNPJ:String;



    Protected

    Public
      Constructor Create; overload;   // This constructor uses defaults
      procedure setToken(t:string);
      procedure setFormato(s:string);
      procedure setCli(i:Integer);
      function Nota_PesqNum(numnf:Integer):String;
      function Nota_PesqData(dia:string):String;
      function Nota_PesqDatas(dInic, dFim:String):String;
      function Nota_MostrarID(id:Integer):String;
      function nota_rastreio(idPed, numNF:Integer; sTransp:String):String;
      function Pedido_Pesquisar(numEcommerce:Integer):String;

      function Nota_Salvar(numNF, serie, vol, iNum:Integer;  vValor, vPeso:Double; sCEP, sLocal,  sDest, sFone, sDocs, sEnder, sComplem, sCidade, sCMun, sUF, sIE, sChave:String):Integer;


  end;

implementation



{ TNeg }

constructor TTiny.Create;
begin
  // Execute the parent (TObject) constructor first
  inherited;  // Call the parent Create method

  // Now set a default fruit name
  self.sToken := '864922a7fd8733930231f3344006b9e893e89204';
  self.sFormato := 'XML';
  self.iCli := 176;
  self.transpNome := 'flaydel:485';
  self.transpCNPJ := '';
end;

function TTiny.Nota_MostrarID(id: Integer): String;
 var resp:String;
begin
  resp := GettinywsdlPortType.obterNotaFiscalService(sToken,id,sFormato);
  result := resp;
end;

function TTiny.Nota_PesqData(dia: string): String;
 var resp:String;
begin
  resp := GettinywsdlPortType.pesquisarNotasFiscaisService(sToken,'','','','', dia, dia,'','','','',sFormato,'','','S');
  result := resp;
end;

function TTiny.Nota_PesqDatas(dInic, dFim: String): String;
 var resp:String;
begin
  resp := GettinywsdlPortType.pesquisarNotasFiscaisService(sToken,'','','','', dInic, dfim,'','','','',sFormato,'','','S');
  result := resp;
end;

function TTiny.Nota_PesqNum(numnf: Integer): String;
 var resp:String;
begin
  resp := GettinywsdlPortType.pesquisarNotasFiscaisService(sToken,'',numnf.ToString,'','','' , '','','','','',sFormato,'','','S');
  result := resp;
end;

function TTiny.nota_rastreio(idPed, numNF: Integer; sTransp: String): String;
 var resp, rCod, rUrl:String;
begin
  rCod := 'C176352.'+numNf.ToString;
  rUrl := 'http://www.flaydel.srv.br/Rastrear/Notas.aspx?cod='+rCod;
  if sTransp = Self.transpNome then
    resp := GettinywsdlPortType.cadastrarCodigoRastreamentoPedidoService(sToken,idPed,rCod, rUrl, 'T','','','','','','', sFormato);
  result := resp;

end;

function TTiny.Nota_Salvar(numNF, serie, vol, iNum:Integer;  vValor, vPeso:Double; sCEP, sLocal,  sDest, sFone, sDocs, sEnder, sComplem, sCidade, sCMun, sUF, sIE, sChave:String): Integer;
  var Bco : tBco;
      resp : integer;
      cnpjEmb:String;
begin
  // CNPJ EMbarcadora
  cnpjEMb := '';

  resp := 0;
  Bco := TBco.Create;
  if (not Bco.Notas_Existe(iCli, numNF,0,0)) then
  begin
    resp := 1;
    Bco.Notas_Inserir(icli, numNF, vol, vValor, vPeso, sCEP, sLocal, 0, 9, 0, sDest, sFone, sDocs,cnpjEmb,  serie,0 );
    BCo.Espelho_XML_Importa(icli, numNf, vol, vValor, vPeso, sCEP, sLocal, transpNome, transpCNPJ, sDest, sEnder, sComplem,  sLocal, sCidade, sCMun, sUF, iNum, 0, sDocs, sIE, sChave );
  end
  else
  begin
    resp := 2;
    if DM1.cdsNotasORIGEM.Value <> 9 then
    begin
      resp := 3;
      Bco.Notas_Alterar(DM1.cdsNotasID.Value, numNF, vol, vValor, vPeso, sCEP, sLocal, 0,icli, 9, sDest, sFone, sDocs, 0);
      BCo.Espelho_XML_Importa(icli, numNf, vol, vValor, vPeso, sCEP, sLocal, transpNome, transpCNPJ, sDest, sEnder, sComplem,  sLocal, sCidade, sCMun, sUF, iNum, 0, sDocs, sIE, sChave );
    end;
  end;
  Bco.Destroy;

  result := resp;
end;

function TTiny.Pedido_Pesquisar(numEcommerce: Integer): String;
 var resp:String;
begin
  resp := GettinywsdlPortType.pesquisarPedidosService(sToken,'','','','','' , '',numEcommerce.ToString,'','','','','','','', '','');
  result := resp;
end;

procedure TTiny.setCli(i: Integer);
begin
  iCli := i;
end;

procedure TTiny.setFormato(s: string);
begin
  sFormato := s;
end;

procedure TTiny.setToken(t: string);
begin
  sToken := t;
end;


end.
