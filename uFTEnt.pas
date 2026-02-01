unit uFTEnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit,
  ExtCtrls;

type
  TFTEnt = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    vCap: TJvValidateEdit;
    vGSP: TJvValidateEdit;
    vINT: TJvValidateEdit;
    btSalvar: TBitBtn;
    Label5: TLabel;
    vINT2: TJvValidateEdit;
    Label6: TLabel;
    vOEST: TJvValidateEdit;
    Label7: TLabel;
    vOUT: TJvValidateEdit;
    procedure btSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
  end;

var
  FTEnt: TFTEnt;
  idCli : Integer;


implementation

{$R *.dfm}

uses uDM3, uBanco;


procedure Limpar();
begin
  FTent.vCap.Value := 0;
  FTent.vGSP.Value := 0;
  FTent.vINT.Value := 0;
end;

procedure Preencher();

var Bco : TBco;

begin
  if (idCli > 0) then
  begin
    Bco := TBco.Create;
    Bco.FreteEntrega_Mostra(idCli);

    if (DM3.cdsFT3.RecordCount >0) then
    begin
      FTent.vCap.Value := DM3.cdsFT3CAP_VALOR.AsFloat;
      FTent.vGSP.Value := DM3.cdsFT3GSP_VALOR.AsFloat;
      FTent.vINT.Value := DM3.cdsFT3INT_VALOR.AsFloat;
    end;
    Bco.Destroy;
  end;
end;



procedure TFTEnt.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.FreteEntrega_Mostra(idCli);
  if (DM3.cdsFT3.RecordCount > 0) then
    Bco.FreteEntrega_Altera(idCli, vcap.Value, vgsp.Value, vInt.Value, vInt2.Value, vOest.Value, vOut.Value)
  else
    Bco.FreteEntrega_Insere(idCli, vcap.Value, vgsp.Value, vint.value, vInt2.Value, vOest.Value, vOut.Value);

end;

procedure TFTEnt.set_idCli(i: Integer);
begin
  idcli := i;
end;

procedure TFTEnt.FormActivate(Sender: TObject);
begin
  Limpar;
  Preencher;
end;

end.
