unit ucadPlaca;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, CheckLst;

type
  TcadPlaca = class(TForm)
    Label1: TLabel;
    lbPlaca: TLabel;
    lbModelo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbCor: TLabel;
    lstCor: TListBox;
    btGravar: TBitBtn;
    btCancel: TBitBtn;
    lstModelo: TListBox;
    cbModelo: TComboBox;
    cbCor: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure lstModeloClick(Sender: TObject);
    procedure lstCorClick(Sender: TObject);
  private
    { Private declarations }
    Placa : String;
  public
    { Public declarations }
    procedure set_Placa(S : String);
  end;

var
  cadPlaca: TcadPlaca;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco;

procedure Limpar();
begin
  cadPlaca.lbPlaca.Caption  := cadPlaca.Placa;
  cadPlaca.lbModelo.Caption := '';
  cadPlaca.lbCor.Caption    := '';
end;


procedure Carregar();

begin
  with cadPlaca do
  begin
    DM2.DBCb_Preenche(cbModelo, 'TB_MODELOS', 'MODELO', '');
    DM2.DBCb_Preenche(cbCor, 'TB_CORES', 'COR', '');

    lstModelo.Items := cbModelo.Items;
    lstCor.Items    := cbCor.Items;
  end;
end;


{ TcadPlaca }

procedure TcadPlaca.set_Placa(S: String);
begin
  Placa := S;
end;

procedure TcadPlaca.FormActivate(Sender: TObject);
begin
  Limpar;
  Carregar;
end;

procedure TcadPlaca.lstModeloClick(Sender: TObject);
begin
  lbModelo.Caption := lstModelo.Items[lstModelo.itemindex];
end;

procedure TcadPlaca.lstCorClick(Sender: TObject);
begin
  lbCor.Caption := lstCor.Items[lstCor.itemindex];

end;

procedure Salvar();
begin
  with cadPlaca do
  begin
    if (lbModelo.Caption <> '') and (lbCor.Caption <> '') then
    begin

    end
    else ShowMessage('Não posso salvar. Faltam dados !');
  end;
end;


end.
