unit uReenviarOco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TReenviaOco = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    dta: TDateTimePicker;
    dtb: TDateTimePicker;
    btReenviar: TBitBtn;
    lbResp: TLabel;
    procedure btReenviarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  ReenviaOco: TReenviaOco;

implementation

{$R *.dfm}

uses uDM2, uBanco;

procedure TReenviaOco.btReenviarClick(Sender: TObject);
var Bco : TBco;
    st, idC : Integer;

begin
  lbresp.Caption := '';
  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
  Bco := TBco.Create;
  st := Bco.Edi_Reenvia(idC, dta.DateTime, dtb.DateTime);
  Bco.Destroy;
  lbResp.Caption := 'Alteradas para envio OCOREN: '+IntToStr(st)+' notas ';


end;

procedure TReenviaOco.Entrar;
begin
  // Iniciar os objetos
  lbResp.Caption := '';
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  dta.DateTime := Now - 7;
  dtb.DateTime := Now;
end;

end.
