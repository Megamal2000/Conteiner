unit uFotoT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons;

type
  TFotoT = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    figura: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    btMail: TBitBtn;
    edMail: TEdit;
    procedure btMailClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrega(nR:Integer; sArq, nomeCli:String);
  end;

var
  FotoT: TFotoT;
  ArqNome : String;
  dirIMG : String;

implementation

{$R *.dfm}

uses uScanner, uMailmz, uLib;

procedure TFotoT.Entrega(nR: Integer; sArq, nomeCli: String);
var scan: TScan;

begin
  btMail.Enabled := True;
  scan := TScan.Create;
  scan.Iniciar;
  dirIMG := scan.Mostra_Imagem(nR, sArq);
  scan.Destroy;

  //Label1.Caption := dirIMG;

  figura.Visible := false;
  if (dirIMG<>'nada') then
  begin
    figura.Visible := true;
    figura.Picture.LoadFromFile(dirIMG);
    StatusBar1.Panels[0].Text := 'Arquivo: '+sArq;
    StatusBar1.Panels[1].Text := nomeCli;
    ArqNome := sArq;
  end;

end;

procedure Enviar_Mail(dest : String);

var correio: TMailmz;
    usa : TMarco;
    AnexoF : String;

begin
  usa := TMarco.Create;
  usa.Le_INI;

  correio := TMailmz.Inicia;

  correio.contaSMTP(usa.get_mailsmtp,usa.get_mailrem, 'fdtransp7', 587);
  correio.remetente(usa.get_mailrem, 'FLAYDEL log');
  correio.mensagem('Recibo de Nota '+ArqNome, 'FLAYDEL log '+#13+'e-Mail automático- Envio de recibo de NF-e'+#13+#13+'Não Responder - Contato: 3644-6351',dirIMG, '');

  correio.enviar(dest);

  correio.desconectar;
  correio.Finaliza;
  usa.Destroy;


end;

procedure TFotoT.btMailClick(Sender: TObject);
begin
  if (Pos('@',edMail.Text)>0) and (dirIMG<>'nada') then
  begin
    btMail.Enabled := False;
    Enviar_Mail(edMail.Text);
    btMail.Enabled := True;
    edMail.Text := '';
    FotoT.Hide;
  end
  else ShowMessage('Não foi possível enviar o e-mail');
end;

end.
