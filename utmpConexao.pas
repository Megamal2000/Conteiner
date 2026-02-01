unit utmpConexao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uLib;

type
  TtmpConexao = class(TForm)
    lbCon: TLabel;
    Label1: TLabel;
    lbConexao: TLabel;
    edServ: TEdit;
    btTestar: TBitBtn;
    btCancelar: TBitBtn;
    Label2: TLabel;
    procedure btCancelarClick(Sender: TObject);
    procedure btTestarClick(Sender: TObject);
    procedure edServKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    tipoCone : smallint;


  public
    { Public declarations }
    procedure set_tipo(i : smallint);
  end;

var
  tmpConexao: TtmpConexao;


implementation

{$R *.dfm}

uses uDM1, uDM2, utmpAcesso;

{ TtmpConexao }

procedure TtmpConexao.set_tipo(i: smallint);

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;

  tipoCone := i;
  if (i = 1) then
  begin
    lbConexao.Caption := 'Banco Principal: LavaRap';
    edServ.Text       := usa.get_bdserver;
  end;
  if (i = 2) then lbConexao.Caption := 'Banco CEP: CEPS2';
end;

procedure TtmpConexao.btCancelarClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  if (usa.TestaCon(DM1.Conexao, usa.get_bdserver)) then tmpConexao.Hide
    else Application.Terminate;

end;

procedure TtmpConexao.btTestarClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;

  if (usa.TestaCon(DM1.Conexao, edServ.Text)) then
  begin
    ShowMessage('Banco Conectado!');
    usa.set_bdserver(edServ.Text);
    usa.Grava_INI(1); 
    tmpConexao.Hide;
  end
  else ShowMessage('Não foi possível encontrar o Servidor.');

end;

procedure TtmpConexao.edServKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12) then tmpAcesso.show;
end;

end.
