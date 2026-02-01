unit uPagCont;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit,
  ExtCtrls;

type
  TPagCont = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    lbCli: TLabel;
    vMensal: TJvValidateEdit;
    vKM: TJvValidateEdit;
    vHora: TJvValidateEdit;
    btSalvar: TBitBtn;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagCont: TPagCont;

implementation

{$R *.dfm}

uses uDM3, uBanco;

procedure TPagCont.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.PagContrato_Mostra;
  Bco.Destroy;

  vMensal.Value := DM3.cdsPGContVMENSAL.AsFloat;
  vKm.Value     := DM3.cdsPGContVAVULSO_KM.AsFloat;
  vHora.Value   := DM3.cdsPGContVAVULSO_HORA.AsFloat;
  label1.Caption := '';
end;

procedure TPagCont.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.PagContrato_Altera(vMensal.Value, vKm.Value, vHora.Value);
  Bco.Destroy;
  label1.Caption := 'Valores Salvos';
end;

end.
