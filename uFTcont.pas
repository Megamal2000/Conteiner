unit uFTcont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, JvExStdCtrls, JvEdit,
  JvValidateEdit;

type
  TFTCont = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    vMensal: TJvValidateEdit;
    vKM: TJvValidateEdit;
    vHora: TJvValidateEdit;
    btSalvar: TBitBtn;
    Label5: TLabel;
    Label6: TLabel;
    nKM: TJvValidateEdit;
    nHora: TJvValidateEdit;
    Label7: TLabel;
    rbMens: TRadioButton;
    rbDia: TRadioButton;
    procedure btSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);

  end;

var
  FTCont: TFTCont;
  idCli : Integer;

implementation

{$R *.dfm}

uses uDM2, uDM3, uBanco;

procedure TFTCont.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure InserirContrato();

var i,tc : Integer;
    Bco : TBco;

begin
  if (idCli > 0) then
  with FTcont do
  begin
      tc := 0;
      if (rbDia.Checked) then tc := 1;
      Bco := TBco.Create;
      Bco.FreteContrato_Insere(idCli, vMensal.Value, vKM.Value,vHora.Value, nKm.Value, nHora.Value, tc);
      Bco.Destroy;
  end;
end;


procedure AlterarContrato();

var i,tc :Integer;
    Bco : TBco;

begin
  if (idCli > 0) then
  with FTcont do
  begin
      tc := 0;
      if (rbDia.Checked) then tc := 1;
      Bco := TBco.Create;
      Bco.FreteContrato_Altera(idCli, vMensal.Value, vKM.Value,vHora.Value, nKm.Value, nHora.Value,tc);
      Bco.Destroy;
  end;
end;


procedure TFTCont.btSalvarClick(Sender: TObject);

var n : Integer;

begin
  n := DM2.Conta('TB_FRETE5', 'ligCli = '+ InttOstr(idCli));
  if (n = 0) then InserirContrato()
    else AlterarContrato();
  Label7.Visible := true;
end;

procedure TFTCont.FormActivate(Sender: TObject);

var n : Integer;
    Bco : TBco;

begin
  Label7.Visible := false;

  vMensal.Value := 0;
  vKM.Value     := 0;
  vHora.Value   := 0;

  n := DM2.Conta('TB_FRETE5', 'ligCli = '+ IntToStr(idCli));
  if (n > 0) then
  begin
    Bco := TBco.Create;
    Bco.FreteContrato_Mostra(idCli);
    Bco.Destroy;

    vMensal.Value := DM3.cdsFT5VMENSAL.AsFloat;
    vKM.Value     := DM3.cdsFT5VAVULSO_KM.AsFloat;
    vHora.Value   := DM3.cdsFT5VAVULSO_HORA.AsFloat;
    nKm.Value     := DM3.cdsFT5KM.AsFloat;
    nHora.Value   := DM3.cdsFT5HORAS.AsFloat;

    rbMens.Checked := True;
    if (DM3.cdsFT5TIPOCOB.Value = 1) then
    begin
      rbDia.Checked := True;
      rbMens.Checked:= False;
    end;

  end;
end;

end.

