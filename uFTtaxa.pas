unit uFTtaxa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  Buttons;

type
  TFTtaxa = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Panel2: TPanel;
    btSalvar: TBitBtn;
    Label2: TLabel;
    cap_p: TJvValidateEdit;
    Label3: TLabel;
    cap_m: TJvValidateEdit;
    Bevel1: TBevel;
    Label4: TLabel;
    gsp_p: TJvValidateEdit;
    Label5: TLabel;
    gsp_m: TJvValidateEdit;
    Bevel2: TBevel;
    Label6: TLabel;
    int_p: TJvValidateEdit;
    Label7: TLabel;
    int_m: TJvValidateEdit;
    Bevel3: TBevel;
    lbmsg: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    int2_p: TJvValidateEdit;
    int2_m: TJvValidateEdit;
    Label10: TLabel;
    Label11: TLabel;
    oest_p: TJvValidateEdit;
    oest_m: TJvValidateEdit;
    Label12: TLabel;
    Label13: TLabel;
    out_p: TJvValidateEdit;
    out_m: TJvValidateEdit;
    procedure btSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cap_pEnter(Sender: TObject);
    procedure cap_mEnter(Sender: TObject);
    procedure gsp_pEnter(Sender: TObject);
    procedure gsp_mEnter(Sender: TObject);
    procedure int_pEnter(Sender: TObject);
    procedure int_mEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);    
  end;

var
  FTtaxa: TFTtaxa;
  idcli : Integer;


implementation

{$R *.dfm}

uses uBanco, uDM3;


procedure Limpar;

begin
  FTtaxa.cap_p.Value := 0;
  FTtaxa.cap_m.Value := 0;

  FTtaxa.gsp_p.Value := 0;
  FTtaxa.gsp_m.Value := 0;

  FTtaxa.int_p.Value := 0;
  FTtaxa.int_m.Value := 0;

end;

procedure Preencher;

var Bco : TBco;

begin
  if (idCli > 0) then
  begin
    Bco := TBco.Create;
    Bco.FreteTaxa_Mostra(idCli);


    if (DM3.cdsFT2.RecordCount >0) then
    begin
      FTtaxa.cap_p.Value := DM3.cdsFT2CAP_PORC.AsFloat;
      FTtaxa.cap_m.Value := DM3.cdsFT2CAP_MINIMO.AsFloat;

      FTtaxa.gsp_p.Value := DM3.cdsFT2GSP_PORC.AsFloat;
      FTtaxa.gsp_m.Value := DM3.cdsFT2GSP_MINIMO.AsFloat;

      FTtaxa.int_p.Value := DM3.cdsFT2INT_PORC.AsFloat;
      FTtaxa.int_m.Value := DM3.cdsFT2INT_MINIMO.AsFloat;
    end;
    Bco.Destroy;
  end;



end;
procedure TFTtaxa.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.FreteTaxa_Mostra(idCli);
  if (DM3.cdsFT2.RecordCount > 0) then
    Bco.FreteTaxa_Altera(idCli, cap_p.Value, cap_m.Value, gsp_p.Value, gsp_m.Value, int_p.Value, int_m.Value, int2_p.Value, int2_m.Value, oest_p.Value, oest_m.Value, out_p.Value, out_m.Value)
  else
    Bco.FreteTaxa_Insere(idCli, cap_p.Value, cap_m.Value, gsp_p.Value, gsp_m.Value, int_p.Value, int_m.Value, int2_p.Value, int2_m.Value, oest_p.Value, oest_m.Value, out_p.Value, out_m.Value);
  lbmsg.Caption := 'Registro Salvo ';
end;

procedure TFTtaxa.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure TFTtaxa.FormActivate(Sender: TObject);
begin
  Limpar;
  Preencher;
end;

procedure TFTtaxa.cap_pEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

procedure TFTtaxa.cap_mEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

procedure TFTtaxa.gsp_pEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

procedure TFTtaxa.gsp_mEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

procedure TFTtaxa.int_pEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

procedure TFTtaxa.int_mEnter(Sender: TObject);
begin
  lbmsg.Caption := '';
end;

end.
