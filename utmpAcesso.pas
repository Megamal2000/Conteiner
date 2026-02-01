unit utmpAcesso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TtmpAcesso = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edChave: TEdit;
    edAcesso: TEdit;
    btOk: TBitBtn;
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tmpAcesso: TtmpAcesso;

implementation

{$R *.dfm}

uses uDM1, uLib;

procedure TtmpAcesso.btOkClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;

  if (edChave.Text<>'') and (edAcesso.Text<> '') then
  begin
    usa.set_bduser(edChave.Text);
    usa.set_bdpass(edAcesso.Text);
    if (usa.TestaCon(DM1.Conexao, usa.get_bdserver)) then
    begin
      usa.Grava_INI(1);
      ShowMessage('Acesso ao servidor liberado');
      tmpAcesso.Hide;
    end
    else ShowMessage('Sem acesso');
  end;
end;

procedure TtmpAcesso.FormActivate(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  edChave.Text := usa.get_bduser;
  edAcesso.Text:= usa.get_bdpass;
end;

end.
