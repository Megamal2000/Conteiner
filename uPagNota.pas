unit uPagNota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls,
  Buttons;

type
  TPagNota = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qN1: TJvValidateEdit;
    vM1: TJvValidateEdit;
    vA1: TJvValidateEdit;
    Label5: TLabel;
    qN2: TJvValidateEdit;
    vM2: TJvValidateEdit;
    vA2: TJvValidateEdit;
    Label6: TLabel;
    vEx: TJvValidateEdit;
    vM3: TJvValidateEdit;
    vA3: TJvValidateEdit;
    Label7: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    Bevel2: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    gN1: TJvValidateEdit;
    gM1: TJvValidateEdit;
    gA1: TJvValidateEdit;
    gN2: TJvValidateEdit;
    gM2: TJvValidateEdit;
    gA2: TJvValidateEdit;
    gEx: TJvValidateEdit;
    gM3: TJvValidateEdit;
    gA3: TJvValidateEdit;
    Panel3: TPanel;
    Label15: TLabel;
    Bevel3: TBevel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    iN1: TJvValidateEdit;
    iM1: TJvValidateEdit;
    iA1: TJvValidateEdit;
    iN2: TJvValidateEdit;
    iM2: TJvValidateEdit;
    iA2: TJvValidateEdit;
    iEx: TJvValidateEdit;
    iM3: TJvValidateEdit;
    iA3: TJvValidateEdit;
    btSalvar: TBitBtn;
    procedure qN2Exit(Sender: TObject);
    procedure qN1Exit(Sender: TObject);
    procedure iN2Exit(Sender: TObject);
    procedure gN2Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagNota: TPagNota;

implementation

{$R *.dfm}

uses uDm3, uBanco;

procedure TPagNota.qN2Exit(Sender: TObject);
begin
  gN2.Value := qN2.Value;
  iN2.Value := qN2.Value;
  Label6.Caption  := 'acima de '+IntToStr(qN2.Value);
  Label13.Caption := 'acima de '+IntToStr(gN2.Value);
  Label20.Caption := 'acima de '+IntToStr(iN2.Value);
end;

procedure TPagNota.qN1Exit(Sender: TObject);
begin
  gN1.Value := qN1.Value;
  iN1.Value := qN1.Value;
end;

procedure TPagNota.iN2Exit(Sender: TObject);
begin
  Label20.Caption := 'acima de '+IntToStr(iN2.Value);
end;

procedure TPagNota.gN2Exit(Sender: TObject);
begin
  Label13.Caption := 'acima de '+IntToStr(gN2.Value);
end;

procedure TPagNota.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.PagNotas_Mostra;
  Bco.Destroy;

  qN1.Value  := DM3.cdsPGnotaSP_NT1.Value;
  qN2.Value  := DM3.cdsPGnotaSP_NT2.Value;
  vM1.Value  := DM3.cdsPGnotaSP_MOT1.AsFloat;
  vM2.Value  := DM3.cdsPGnotaSP_MOT2.AsFloat;
  vM3.Value  := DM3.cdsPGnotaSP_MOT3.AsFloat;
  vA1.Value  := DM3.cdsPGnotaSP_AJUD1.AsFloat;
  vA2.Value  := DM3.cdsPGnotaSP_AJUD2.AsFloat;
  vA3.Value  := DM3.cdsPGnotaSP_AJUD3.AsFloat;
  vEx.Value  := DM3.cdsPGnotaSP_EXTRA.AsFloat;

  gN1.Value  := DM3.cdsPGnotaGSP_NT1.Value;
  gN2.Value  := DM3.cdsPGnotaGSP_NT2.Value;
  gM1.Value  := DM3.cdsPGnotaGSP_MOT1.AsFloat;
  gM2.Value  := DM3.cdsPGnotaGSP_MOT2.AsFloat;
  gM3.Value  := DM3.cdsPGnotaGSP_MOT3.AsFloat;
  gA1.Value  := DM3.cdsPGnotaGSP_AJUD1.AsFloat;
  gA2.Value  := DM3.cdsPGnotaGSP_AJUD2.AsFloat;
  gA3.Value  := DM3.cdsPGnotaGSP_AJUD3.AsFloat;
  gEx.Value  := DM3.cdsPGnotaGSP_EXTRA.AsFloat;

  iN1.Value  := DM3.cdsPGnotaINT_NT1.Value;
  iN2.Value  := DM3.cdsPGnotaINT_NT2.Value;
  iM1.Value  := DM3.cdsPGnotaINT_MOT1.AsFloat;
  iM2.Value  := DM3.cdsPGnotaINT_MOT2.AsFloat;
  iM3.Value  := DM3.cdsPGnotaINT_MOT3.AsFloat;
  iA1.Value  := DM3.cdsPGnotaINT_AJUD1.AsFloat;
  iA2.Value  := DM3.cdsPGnotaINT_AJUD2.AsFloat;
  iA3.Value  := DM3.cdsPGnotaINT_AJUD3.AsFloat;
  iEx.Value  := DM3.cdsPGnotaINT_EXTRA.AsFloat;

end;

procedure TPagNota.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.PagNotas_Altera(qN1.Value, qN2.Value, gN1.Value, gN2.Value, iN1.Value, iN2.Value,
    vM1.Value, vM2.Value,vM3.Value,vA1.Value,vA2.Value,vA3.Value,vEx.Value,
    gM1.Value, gM2.Value,gM3.Value,gA1.Value,gA2.Value,gA3.Value,gEx.Value,
    iM1.Value, iM2.Value,iM3.Value,iA1.Value,iA2.Value,iA3.Value,iEx.Value);

  Bco.Destroy;
end;

end.
