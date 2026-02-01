unit uCteEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TCteEdit = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCTe: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbNF: TLabel;
    lbCli: TLabel;
    Label6: TLabel;
    lbDest: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Panel2: TPanel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    cbTpCte: TComboBox;
    Label7: TLabel;
    cbTpEmiss: TComboBox;
    Label8: TLabel;
    cbTpServ: TComboBox;
    Label9: TLabel;
    nCFOP: TJvValidateEdit;
    Label10: TLabel;
    Panel3: TPanel;
    Label11: TLabel;
    Bevel2: TBevel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    cbRem: TComboBox;
    cbDest: TComboBox;
    cbToma: TComboBox;
    Label15: TLabel;
    edNatOp: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CteEdit: TCteEdit;
  idCT, idNF, idCli, idDest: integer;

implementation

{$R *.dfm}

uses uDM4;

{ TCteEdit }

procedure Padrao;

begin
  with CteEdit do
  begin
    idCT := 0; idNF := 0; idCli := 0; idDest := 0;
    lbCTe.Caption := '';
    lbNF.Caption  := '';
    lbCli.Caption := '';
    lbDest.Caption:= '';

    cbTpCte.ItemIndex    := 0;
    cbTpEmiss.ItemIndex  := 0;
    cbTpServ.ItemIndex   := 0;
    cbRem.ItemIndex      := 0;
    cbDest.ItemIndex     := 1;
    cbToma.ItemIndex     := 0;

    nCFOP.Value := 5353;
  end;
end;

procedure Preenche;

begin
  with CteEdit do
  begin
    idCT := DM4.cdsCteGID.Value;
    idNF := DM4.cdsCteGLIGNOTA.Value;
    idCli := DM4.cdsCteGLIGCLI.Value;

    lbCTe.Caption := DM4.cdsCteGNUMC.AsString;
    lbNF.Caption  := DM4.cdsCteGNUMNOTA.AsString;
    lbCli.Caption := '';
    lbDest.Caption:= '';

    cbTpCte.ItemIndex    := 0;
    cbTpEmiss.ItemIndex  := 0;
    cbTpServ.ItemIndex   := 0;
    cbRem.ItemIndex      := 0;
    cbDest.ItemIndex     := 1;
    cbToma.ItemIndex     := 0;

    nCFOP.Value := 5353;
  end;
end;

procedure TCteEdit.Entrar;
begin
  Padrao;
  Preenche;
end;

end.
