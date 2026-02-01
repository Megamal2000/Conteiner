unit uSMSclasse;

interface

uses
  uDM2, uDM4, uBanco, SysUtils, Variants,  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, Classes, JvComponentBase,
  JvLogFile, DBClient, uDM1, uMailmz;

type
  TSMS = class


  private
    // variáveis
    Conta_RomaHoje, Conta_Roma, Conta_ok, Conta_Nao : Smallint;
    sLogin, sSenha, sN1, sN2, sPastaRel, sFrase, sURLcli : String;
    Bco : TBco;
    mail:TMailmz;

  public
    // procedure
    procedure Mostra_Lista(dt:TdateTime; ti:Smallint);

    function get_romaHoje():Smallint;
    function get_Roma():Smallint;
    function get_Ok():Smallint;
    function get_Nao():Smallint;

    function get_User():String;
    function get_Senha():String;
    function get_Num1():String;
    function get_Num2():String;
    function get_Rel():String;

    procedure Mostrar_Config;
    procedure Alterar_Fone(idN:integer; Fone:String);
    procedure Alterar_Status(idN, st : Integer);
    procedure Enviar(Frase, Fone:String);
    procedure MailEnvia(mens, origem:String);
    function EnviarID(idNF:Integer):Smallint;
    procedure Inicio();
    function Monta_FraseCLI(nomeCli:String; numNF:Integer; sPED:string):String;
    function Monta_FraseTRANSP(qtNotas:Integer):String;
    function Verifica_numero(telNUM:String):Integer;
    procedure Verifica_lista(Lista:TClientDataSet);
    procedure Verifica_Nulos();


  end;


implementation

CONST FRASE_CLI = 'O seu pedido de CCC com NFXXX saiu para entrega(ate 19h). Caso NAO possa recebe-lo entre em contato com FLAYDEL pelo WhatsApp:11 99982-8329';
CONST FRASE_RETORNO = 'FLAYDEL LOG - Foram enviadas XXX SMS de notas no dia DDD';
// Loca user 11984167173  senh 806111
CONST FRASE_LOCASMS = 'http://54.173.24.177/painel/api.ashx?action=sendsms&lgn=LOGIN&pwd=SENHA&msg=KKKK&numbers=GGGG';
// Allcance user Flaydel sen 9ltTwTb6
CONST FRASE_ALLCANCE = 'http://api.allcancesms.com.br/sms/1/text/query?username=LOGIN&password=SENHA&to=55GGGG&text=KKKK';
{ TSMS }

procedure TSMS.Alterar_Fone(idN: integer; Fone: String);

begin
  Bco := TBco.Create;
  Bco.Notas_Alterarfone(idN, Fone);
  Bco.Destroy;
end;

procedure TSMS.Alterar_Status(idN, st: Integer);
begin
  Bco := TBco.Create;
  Bco.Notas_AlterarSMS(idN, st);
  Bco.Destroy;
end;



procedure TSMS.Enviar(Frase, Fone: String);

var lURL, lg, sn : String;
    lResponse : TStringStream;
    IdHTTP1:TIdHTTP;
    Rel:TJvLogFile;
    Arq : String;
begin
  // Obtendo configuações
  Mostrar_Config;

  lg := sLogin;
  sn := sSenha;



  IdHTTp1 := TIDHTTP.Create(nil);
  lResponse := TStringStream.Create('');

  try
    lURL := sURLcli;
    lURL := StringReplace(lURL, 'LOGIN' , lg , []);
    lURL := StringReplace(lURL, 'SENHA' , sn , []);
    lURL := StringReplace(lURL, 'KKKK'  , Frase , []);
    lURL := StringReplace(lURL, 'GGGG'  , Fone , []);
    lURL := StringReplace(lURL, ' ' , '%20' , []);


    idHttp1.Get(lURL, lResponse);
    lResponse.Position := 0;
    Rel := TJvLogFile.Create(nil);
    Arq := sPastaRel+'\MLOG.txt';
    if (FileExists(Arq)) then Rel.LoadFromFile(Arq);
    Rel.Add('EnviaSMS', lURL);
    Rel.Add('RetornoSMS', lResponse.DataString);
    Rel.SaveToFile(Arq);
    Rel.Destroy;


  finally
    lResponse.Free();
    IdHTTP1.Destroy;
  end;
end;

function TSMS.EnviarID(idNF: Integer):Smallint;

var fr : String;
    n : Integer;
    resp : Smallint;

begin
  resp := 0;
  Bco := TBco.Create;
  Bco.Notas_MostraId(idNF);
  Bco.Cliente_MostraId(DM1.cdsNotasLIGCLI.Value);
  Bco.Destroy;
    if not(length(DM4.cdsSMSENVIASMS.AsString) > 0) then
    Alterar_Status(idNF, 0);

  if (DM1.cdsNotas.RecordCount>0) then
  if (DM1.cdsNotasENVIASMS.Value = 0) then
  if (DM1.cdsCliUSA_SMS.Value = 1) then
  begin
    n := Verifica_numero(DM1.cdsNotasFONEDEST.Value);
    if (n = 0) then
    begin
      resp := 1;
      fr := Monta_FraseCLI(DM1.cdsCliNOME.Value, DM1.cdsNotasNUMNF.Value, DM1.cdsNotasNUMPED.Value);
      Enviar(fr, DM1.cdsNotasFONEDEST.Value);
      MailEnvia(fr, 'Automática WEB envia');
      Alterar_Status(idNF, 1);
    end
    else Alterar_Status(idNF, n);
  end;

  EnviarID := resp;
end;

function TSMS.get_Nao: Smallint;
begin
  get_Nao := Conta_Nao;
end;

function TSMS.get_Num1: String;
begin
  get_Num1 := sN1;
end;

function TSMS.get_Num2: String;
begin
  get_Num2 := sN2;
end;

function TSMS.get_Ok: Smallint;
begin
  get_Ok := Conta_ok;
end;

function TSMS.get_Rel: String;
begin
  get_Rel := sPastaRel;
end;

function TSMS.get_Roma: Smallint;
begin
  get_Roma := Conta_Roma;
end;

function TSMS.get_romaHoje: Smallint;
begin
  get_romaHoje := Conta_RomaHoje;
end;

function TSMS.get_Senha: String;
begin
  get_Senha := sSenha;
end;

function TSMS.get_User: String;
begin
  get_User := sLogin;
end;

procedure TSMS.Inicio;

begin


end;

procedure TSMS.MailEnvia(mens, origem: String);

var corpo, m2 : string;

begin
  corpo := '';
  m2    := StringReplace(mens,  '%20' ,' ' , [rfReplaceAll] );
  corpo := 'SMS enviado em '+FormatDateTime('dd/MM/yyyy, ddd HH:mm', Now)+#13+#13+m2;
  mail := TMailmz.Create;
  mail.Inicia;
  mail.remetente('tecnologia@flaydel.srv.br', 'Sistema Conteiner');
  mail.contaSMTP('smtp.flaydel.srv.br', 'tecnologia@flaydel.srv.br', 'fdtransp7', 587);
  mail.mensagem('FLAYDEL LOG cópia SMS '+origem, corpo,'', '');
  mail.enviar('web@flaydel.srv.br');
  mail.Destroy;
end;

function TSMS.Monta_FraseCLI(nomeCli: String; numNF: Integer; sPED:string): String;

var F, c, p, nf : String;

begin
  Mostrar_Config;
  F := sFrase;
  c := nomeCli;
  if (pos('AMBEV', c)>0) then c := 'EMPORIO CERVE';
  if (pos('INFRAC',c)>0) then c := copy(c, 7, length(c));
  if (pos('INFRA', c)>0) then c := copy(c, 6, length(c));

  c := copy(c, 0, 12);
  p := '';
  if (Length(sPED)>2) then p := copy(sPED.Trim, 0, 14);


  nf:= IntToStr(numNF);
  //F := StringReplace(FRASE_CLI, 'CCC' , c  , []);
  F := StringReplace(F, 'PPP' , p  , []);
  F := StringReplace(F, 'CCC' , c  , []);
  F := StringReplace(F, 'XXX' , nf , []);
  F := StringReplace(F, ' ' , '%20' , [rfReplaceAll]);
  Monta_FraseCLI := F;
end;

function TSMS.Monta_FraseTRANSP(qtNotas: Integer): String;

var F, n, d : String;

begin
  n := IntToStr(qtNotas);
  d := FormatDateTime('dd/MM ddd', Now );

  F := StringReplace(FRASE_RETORNO, 'XXX' , n , [] );
  F := StringReplace(F, 'DDD' , d , [] );
  F := StringReplace(F, ' ' , '%20' , [rfReplaceAll] );
  Monta_FraseTRANSP := F;

end;

procedure TSMS.Mostrar_Config;
begin
  // Obtendo configuações
  Bco := TBco.Create;
  Bco.Config_SMS_Mostra;
  Bco.Destroy;

  sLogin    := DM2.cdsTMP.Fields[3].AsString;
  sSenha    := DM2.cdsTMP.Fields[4].AsString;
  sN1       := DM2.cdsTMP.Fields[5].AsString;
  sN2       := DM2.cdsTMP.Fields[6].AsString;
  sPastaRel := DM2.cdsTMP.Fields[7].AsString;
  sFrase    := DM2.cdsTMP.Fields[8].AsString;
  sURLcli   := DM2.cdsTMP.Fields[9].AsString;

end;

procedure TSMS.Mostra_Lista(dt: TdateTime; ti:Smallint);
begin
  Bco := TBco.Create;
  Bco.Notas_MostraSMS(dt,ti);
  Bco.Destroy;
end;

procedure TSMS.Verifica_lista(Lista: TClientDataSet);

var n: Integer;

begin
  Lista.First;
  while not Lista.Eof do
  begin
    if (Lista.FieldByName('EnviaSMS').Value = 0) then
    begin
      n := Verifica_numero(Lista.FieldByName('FoneDest').Value);
      if (n > 0) then Alterar_Status(Lista.FieldByName('id').Value, n);
    end;
    Lista.Next;
  end;
  Lista.First;
end;

procedure TSMS.Verifica_Nulos;
begin
  DM4.cdsSMS.First;
  while not DM4.cdsSMS.Eof do
  begin
    if not(length(DM4.cdsSMSENVIASMS.AsString) > 0) then
      Alterar_Status(DM4.cdsSMSID.Value, 0);
    DM4.cdsSMS.Next;
  end;
  DM4.cdsSMS.First;
end;

function TSMS.Verifica_numero(telNUM: String): Integer;

var tam, num3, resp : Integer;

begin
  resp := 0;
  tam  := length(trim(telNUM));
  num3 := 0;
  if (tam > 3) then num3 := StrToInt(copy(telNUM, 3,1));

  // teste de tamanhos
  if (tam < 10) then resp := 31; // muito pequeno
  if (tam > 13) then resp := 32; // muito grande
  if (resp = 0) then
  begin
    if (tam=10) and (num3 <> 7) then resp := 33; // FIXO
    if (tam=11) and (num3 <> 9) then resp := 34; // Digito errado
    if (tam = 12) then resp := 35; // Numero a mais
    if (tam = 13) and (copy(telNUM,0,2)='55') then resp := 36; // usou 55
  end;

  Verifica_numero := resp;

end;

end.
