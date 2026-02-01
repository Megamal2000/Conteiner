unit ucliEscolhe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TcliEscolhe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    btOK: TBitBtn;
    btCancela: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btCancelaClick(Sender: TObject);
    procedure btOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cliEscolhe: TcliEscolhe;

implementation

{$R *.dfm}

uses uDM1, uDM2, ULib , uPrinc, Global;

procedure TcliEscolhe.FormActivate(Sender: TObject);
begin
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  idCli := DM2.get_cliNum;
  
  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli),'Nome');
end;

procedure TcliEscolhe.btCancelaClick(Sender: TObject);
begin
  cliEscolhe.Hide;
end;

procedure TcliEscolhe.btOKClick(Sender: TObject);

var usa : TMarco;
    id : integer;

begin
  usa := TMarco.Create;
  id := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');
  btOK.Enabled := false;
  btCancela.Enabled := false;

  if (idCli <> id) then
  begin
    DM2.set_cliNum(id);
    idCli := id;
    usa.set_cliNome(cbCli.Items[cbCli.ItemIndex]);
    usa.set_cliNumero(idCli);
    usa.Grava_INI(3);
    Princ.NomeUser.LabelCaption := 'Cliente: '+cbCli.Items[cbCli.ItemIndex];

  end;

  btOK.Enabled := true;
  btCancela.Enabled := true;


  cliEscolhe.Hide;
  usa.Destroy;



end;

end.
