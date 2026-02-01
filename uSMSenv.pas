unit uSMSenv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, uSMSclasse;

type
  TSMSenv = class(TForm)
    Panel1: TPanel;
    btEnviar: TBitBtn;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel2: TPanel;
    btTel: TBitBtn;
    btReenvia: TBitBtn;
    tNF: TLabel;
    tNum: TLabel;
    edTel: TEdit;
    btSalva: TBitBtn;
    Shape1: TShape;
    ckTipo: TCheckBox;
    dt: TDateTimePicker;
    btMostrar: TSpeedButton;
    btAnula: TBitBtn;
    procedure btEnviarClick(Sender: TObject);
    procedure btTelClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure edTelKeyPress(Sender: TObject; var Key: Char);
    procedure btMostrarClick(Sender: TObject);
    procedure btReenviaClick(Sender: TObject);
    procedure btAnulaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  SMSenv: TSMSenv;
  sms : TSMS;

implementation

{$R *.dfm}

uses uDM4, uMailmz;

procedure Lista();

var tp:Smallint;
    d : TDateTime;
    n : Integer;

begin
  d  := SMSenv.dt.DateTime;
  tp := 0;
  if (SMSenv.ckTipo.Checked) then tp := 1;

  sms := TSMS.Create;
  sms.Mostra_Lista(d,tp);
  sms.Verifica_Nulos;
  sms.Verifica_lista(DM4.cdsSMS);
  sms.Mostra_Lista(d, tp);
  sms.Destroy;

  DM4.cdsSMS.First;

end;

procedure Mostra_tel(b:boolean);
begin
  with SMSenv do
  begin
    Shape1.Visible := b;
    tNF.Visible    := b;
    tNum.Visible   := b;
    edTel.Visible  := b;
    btSalva.Visible:= b;
  end;
end;


procedure TSMSenv.Entrar;
begin
//  SMSserv.
  Lista();
  Mostra_tel(false);
end;


procedure Enviar_Mail(mens:String);

var mail: TMailmz;

begin
  mail := TMailmz.Create;
  mail.Inicia;
  mail.remetente('tecnologia@flaydel.srv.br', 'Marco Antonio');
  mail.contaSMTP('smtp.flaydel.srv.br', 'tecnologia@flaydel.srv.br', 'fdtransp7', 587);
  mail.mensagem('FLAYDEL LOG ', mens,'', '');
  mail.enviar('mlodi@mzi.com.br');
  mail.Destroy;
end;


procedure TSMSenv.btEnviarClick(Sender: TObject);

var fr, tels :String;
    conta : Integer;


begin
  conta := 0;
  StatusBar1.Panels[1].Text := IntToStr(DM4.cdsSMS.RecordCount);
  DM4.cdsSMS.First;
  while not DM4.cdsSMS.Eof do
  begin
    if (Length(DM4.cdsSMSFONEDEST.Value) > 9) and (DM4.cdsSMSSTATUS.Value <> 'NULO') then
    begin
      //if (DM4.cdsSMSSTATUS.Value = 'Não Enviado') then
      begin
        sms := TSMS.Create;
        fr := sms.Monta_FraseCLI(DM4.cdsSMSNOME.Value,DM4.cdsSMSNUMNF.Value, DM4.cdsSMSNUMPED.Value);
        sms.Alterar_Status(DM4.cdsSMSID.Value, 1);
        sms.Enviar(fr, DM4.cdsSMSFONEDEST.Value);
        sms.MailEnvia(fr, 'Lista SMS');
        sms.Destroy;
        conta := conta + 1;
      end;
    end;
    DM4.cdsSMS.Next;
  end;

  if (conta > 0) then
  begin
    sms := TSMS.Create;
    fr := sms.Monta_FraseTRANSP(conta);
    sms.Mostrar_Config;
    if (length(trim(sms.get_Num1)) > 8) then
    begin
      if (length(trim(sms.get_Num2)) > 8) then tels := trim(sms.get_Num1)+'/'+trim(sms.get_Num2)
        else tels := trim(sms.get_Num1);
      sms.Enviar(fr, tels);
    end;
    Enviar_Mail(fr);
    sms.Destroy;
  end;

end;

procedure TSMSenv.btTelClick(Sender: TObject);
begin
  if (DM4.cdsSMS.RecordCount > 0) then
  begin
    tNum.Caption   := DM4.cdsSMSNUMNF.AsString;
    edTel.Text     := DM4.cdsSMSFONEDEST.Value;
    Mostra_tel(true);
  end;
end;

procedure Salva_tel();
begin
  if (DM4.cdsSMS.RecordCount > 0) then
  begin
    sms := TSMS.Create;
    sms.Alterar_Fone(DM4.cdsSMSID.Value, SMSenv.edTel.Text);
    sms.Destroy;
  end;
  Mostra_tel(false);
  Lista;
end;



procedure TSMSenv.btSalvaClick(Sender: TObject);
begin
  Salva_tel;
end;

procedure TSMSenv.edTelKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then Salva_tel;
end;

procedure TSMSenv.btMostrarClick(Sender: TObject);
begin
  Lista;
end;

procedure TSMSenv.btReenviaClick(Sender: TObject);

var fr : String;

begin
  sms := TSMS.Create;
  fr := sms.Monta_FraseCLI(DM4.cdsSMSNOME.Value,DM4.cdsSMSNUMNF.Value, DM4.cdsSMSNUMPED.Value);
  sms.Enviar(fr, DM4.cdsSMSFONEDEST.Value);
  Enviar_Mail(fr);
  sms.Destroy;
end;

procedure TSMSenv.btAnulaClick(Sender: TObject);

var n:Smallint;

begin
  // Verifica
  n := 2;
  if (Trim(DM4.cdsSMSSTATUS.Value) = 'NULO') then n := 0;
  // Altera
  sms := TSMS.Create;
  sms.Alterar_Status(DM4.cdsSMSID.Value, n);
  sms.Destroy;
end;

end.
