unit uMailmz;

interface

uses  SysUtils,
      IdPOP3, IdTCPConnection, IdTCPClient, IdAttachmentFile,
      IdMessageClient, IdSMTP, IdMessage;

type
  TMailmz = class
    IdSMTP: TIdSMTP;
    IdPOP31: TIdPOP3;
    IdMessage1: TIdMessage;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Inicia();
    destructor  Finaliza;
    procedure enviar(mailDest:String);
    procedure remetente(Rmail, Rnome : String);
    procedure contaPOP(host,user,pw:String; porta:Integer);
    procedure contaSMTP(host,user,pw:String; porta:Integer);
    procedure mensagem(Assunto, corpo, anexo, anexo1: String);
    procedure desconectar;
    destructor Destroy; override;

  end;



implementation


{ TMailmz }



procedure TMailmz.contaPOP(host, user, pw: String; porta: Integer);
begin
  IdPOP31.Host     := host;
  IdPOP31.Password := pw;
  IdPOP31.Username := user;
  IdPOP31.Port     := porta;

  IdPOP31.Connect;
end;

procedure TMailmz.contaSMTP(host, user, pw: String; porta: Integer);
begin
//  IdSMTP.AuthenticationType := atLogin;
  IdSMTP.AuthType := satDefault;
  IdSMTP.Username := user;
  IdSMTP.Password := pw;
  // Dados do Servidor
  IdSMTP.Host := host;
  IdSMTP.Port := porta;

  IdSMTP.Connect;
end;

procedure TMailmz.desconectar;
begin
  IdSMTP.Disconnect;
  IdPOP31.Disconnect;
end;

destructor TMailmz.Destroy;
begin

  inherited;
  IdPOP31.Destroy;
  IdSMTP.Destroy;
  IdMessage1.Destroy;
end;

procedure TMailmz.enviar(mailDest: String);
begin
  IdMessage1.Recipients.EMailAddresses := mailDest;

  try
      IdSMTP.Send(IdMessage1);
  finally
      IdSMTP.Disconnect;
  end;

end;

destructor TMailmz.Finaliza;
begin
  IdPOP31.Destroy;
  IdSMTP.Destroy;
  IdMessage1.Destroy;
end;

constructor TMailmz.Inicia;
begin
  IdPOP31 := TIdPOP3.Create(IdPOP31);
  IDSMTP  := TIdSMTP.Create(IDSMTP);
  IdMessage1 :=  TIdMessage.Create(IdMessage1); 
end;

procedure TMailmz.mensagem(assunto, corpo, anexo, anexo1: String);
begin
  // Mensagem
  IdMessage1.Subject   := assunto;
  IdMessage1.Body.Text := corpo;
  // Anexo

  IdMessage1.MessageParts.Clear;
  if (Length(anexo) > 0) then TIdAttachmentFile.create(idmessage1.MessageParts, TFileName(anexo));
  if (Length(anexo1)> 0) then TIdAttachmentFile.create(idmessage1.MessageParts, TFileName(anexo1));

end;

procedure TMailmz.remetente(Rmail, Rnome: String);
begin
  // Remetente

  IdMessage1.From.Address := Rmail;
  IdMessage1.From.Name    := Rnome;
end;

end.
