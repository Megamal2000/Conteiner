unit uReet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TReet = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btSim: TBitBtn;
    btNao: TBitBtn;
    lbNota: TLabel;
    lbRoma: TLabel;
    lbTipo: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btNaoClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idNota(i : integer);
  end;

var
  Reet: TReet;
  idNota, Baixa, Tick : Integer;

implementation

{$R *.dfm}

{ TReet }

uses uDM1, uBanco, DB, uRoma;

procedure TReet.set_idNota(i: integer);
begin
  idNota := i;
end;

procedure Limpar;

begin
  reet.lbNota.Caption := '';
  reet.lbRoma.Caption := '';
  reet.lbTipo.Caption := '';
end;

procedure Preencher;

var Bco : TBco;
    Rm  : TRoma;
    nr : Integer;
begin
  Bco := TBco.Create;
  Rm  := TRoma.Create;

  if (idNota > 0) then
  begin
    Bco.Notas_MostraId(idNota);
    Bco.Ocorre_PesqNum(DM1.cdsNotasNOCORR.Value);
    Baixa := DM1.cdsOcUSO.Value;

    Rm := TRoma.Create;
    nr := Rm.Converte_BDNum(DM1.cdsNotasNROMA.Value);
    Rm.Destroy;

    reet.lbNota.Caption := DM1.cdsNotasNUMNF.AsString;
    reet.lbRoma.Caption := IntToStr(nr);


    if (Baixa = 2) then
      reet.lbTipo.Caption := 'Reentrega'
    else if (Baixa = 3) then
      reet.lbTipo.Caption := 'Devolução'
    else if (Baixa = 0) then
      reet.lbTipo.Caption := 'Sem BAIXA'
    else reet.lbTipo.Caption := 'Entrega realizada';

    Tick := DM1.cdsNotasSTATUS_TKT.Value;
  end;
  if (reet.lbTipo.Caption = 'Entrega realizada') then reet.btNao.SetFocus;
  Bco.Destroy;
end;


procedure TReet.FormActivate(Sender: TObject);
begin
  Limpar;
  Preencher;
end;

procedure TReet.btNaoClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TReet.btSimClick(Sender: TObject);

var Bco : TBco;
    idn : Integer;

begin
  if (Baixa <> 2) and (Tick = 0) then
  begin
    // Alterar Motivo
    Bco := TBco.Create;
    Bco.Notas_Alterar_Motivo(idNota, 99);
    Bco.Destroy;
  end;

  // Criar Reentrega
  Bco := TBco.Create;
  Bco.Notas_Reentrega(idNota);
  Bco.Notas_MarcarProxRoma(idNota , DM1.cdsRomaNUM.Value);
  idn := Bco.Notas_RecuperaId(DM1.cdsNotasNUMNF.Value);
  Bco.Notas_MostraId(idn);
  
  Bco.Destroy;

  ModalResult := mrOK;
end;

end.
