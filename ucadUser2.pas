unit ucadUser2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TcadUser2 = class(TForm)
    Label1: TLabel;
    lbUser: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    idU : integer;
  public
    { Public declarations }
    procedure set_id(i : integer);
  end;

var
  cadUser2: TcadUser2;

implementation

{$R *.dfm}

uses uBanco;

procedure TcadUser2.BitBtn2Click(Sender: TObject);
begin
  self.hide;
end;

procedure TcadUser2.BitBtn1Click(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (edit1.Text = edit2.Text) then
  begin
    bco.Usuarios_AlteraSenha(idU, edit1.Text);
    self.Hide;
  end
  else ShowMessage('As senhas digitadas são diferentes');
end;

procedure TcadUser2.set_id(i: integer);
begin
  idU := i;
end;

end.
