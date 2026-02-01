unit uFTSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  Buttons;

type
  TFTSaida = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    vCobINT1: TJvValidateEdit;
    vPagINT1: TJvValidateEdit;
    vCobOUT1: TJvValidateEdit;
    vPagOUT1: TJvValidateEdit;
    Bevel1: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Bevel3: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label19: TLabel;
    Bevel6: TBevel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Bevel7: TBevel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    vCobSp1: TJvValidateEdit;
    vPagSp1: TJvValidateEdit;
    vCobG1: TJvValidateEdit;
    vPagG1: TJvValidateEdit;
    vCobINT2: TJvValidateEdit;
    vPagINT2: TJvValidateEdit;
    vCobOUT2: TJvValidateEdit;
    vPagOUT2: TJvValidateEdit;
    Label4: TLabel;
    vCobSp2: TJvValidateEdit;
    vPagSp2: TJvValidateEdit;
    vCobG2: TJvValidateEdit;
    vPagG2: TJvValidateEdit;
    vCobINT3: TJvValidateEdit;
    vPagINT3: TJvValidateEdit;
    vCobOUT3: TJvValidateEdit;
    vPagOUT3: TJvValidateEdit;
    Label7: TLabel;
    vCobSp3: TJvValidateEdit;
    vPagSp3: TJvValidateEdit;
    vCobG3: TJvValidateEdit;
    vPagG3: TJvValidateEdit;
    vCobINT4: TJvValidateEdit;
    vPagINT4: TJvValidateEdit;
    vCobOUT4: TJvValidateEdit;
    vPagOUT4: TJvValidateEdit;
    Label8: TLabel;
    vCobSp4: TJvValidateEdit;
    vPagSp4: TJvValidateEdit;
    vCobG4: TJvValidateEdit;
    vPagG4: TJvValidateEdit;
    vCobINT5: TJvValidateEdit;
    vPagINT5: TJvValidateEdit;
    vCobOUT5: TJvValidateEdit;
    vPagOUT5: TJvValidateEdit;
    Label9: TLabel;
    vCobSp5: TJvValidateEdit;
    vPagSp5: TJvValidateEdit;
    vCobG5: TJvValidateEdit;
    vPagG5: TJvValidateEdit;
    vCobINT6: TJvValidateEdit;
    vPagINT6: TJvValidateEdit;
    vCobOUT6: TJvValidateEdit;
    vPagOUT6: TJvValidateEdit;
    Label13: TLabel;
    vCobSp6: TJvValidateEdit;
    vPagSp6: TJvValidateEdit;
    vCobG6: TJvValidateEdit;
    vPagG6: TJvValidateEdit;
    btSalvar: TBitBtn;
    vCobOEST1: TJvValidateEdit;
    vPagOEST1: TJvValidateEdit;
    vCobOEST2: TJvValidateEdit;
    vPagOEST2: TJvValidateEdit;
    vCobOEST3: TJvValidateEdit;
    vPagOEST3: TJvValidateEdit;
    vCobOEST4: TJvValidateEdit;
    vPagOEST4: TJvValidateEdit;
    vCobOEST5: TJvValidateEdit;
    vPagOEST5: TJvValidateEdit;
    vCobOEST6: TJvValidateEdit;
    vPagOEST6: TJvValidateEdit;
    vCobINT21: TJvValidateEdit;
    vPagINT21: TJvValidateEdit;
    vCobINT22: TJvValidateEdit;
    vPagINT22: TJvValidateEdit;
    vCobINT23: TJvValidateEdit;
    vPagINT23: TJvValidateEdit;
    vCobINT24: TJvValidateEdit;
    vPagINT24: TJvValidateEdit;
    vCobINT25: TJvValidateEdit;
    vPagINT25: TJvValidateEdit;
    vCobINT26: TJvValidateEdit;
    vPagINT26: TJvValidateEdit;
    Label14: TLabel;
    Bevel2: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    procedure btSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
  end;

var
  FTSaida: TFTSaida;
  idCli : Integer;

implementation

{$R *.dfm}

{ TFTSaida }

uses uDM3, uDM2, uBanco;

procedure TFTSaida.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure InserirSaida();

var i : Integer;
    Bco : TBco;

begin
  if (idCli > 0) then
  with FTSaida do
  begin
    for i := 1 to 6 do
    begin
      Bco := TBco.Create;
      Bco.FreteSaida_Insere(idCli, i);
      Bco.Destroy;
    end;
  end;
end;

procedure AlterarSaida();

var n : Integer;
    Bco : TBco;

begin
  if (idCli > 0) then
  with FTSaida do
  begin
    n := DM2.Conta('TB_FRETE4', 'ligCli = '+IntToStr(idCli) +' ');
    if (n > 0) then
    begin
      Bco := TBco.Create;
      Bco.FreteSaida_Altera(idCli, 1,
        vCobSp1.Value, vPagSp1.Value, vCobG1.Value,vPagG1.Value,
        vCobINT1.Value,vPagINT1.Value,vCobINT21.Value,vPagINT21.Value,
        vCobOEST1.Value,vPagOEST1.Value,vCobOUT1.Value,vPagOUT1.Value);

      Bco.FreteSaida_Altera(idCli, 2,
        vCobSp2.Value, vPagSp2.Value, vCobG2.Value,vPagG2.Value,
        vCobINT2.Value,vPagINT2.Value,vCobINT22.Value,vPagINT22.Value,
        vCobOEST2.Value,vPagOEST2.Value,vCobOUT2.Value,vPagOUT2.Value);

      Bco.FreteSaida_Altera(idCli, 3,
        vCobSp3.Value, vPagSp3.Value, vCobG3.Value,vPagG3.Value,
        vCobINT3.Value,vPagINT3.Value,vCobINT23.Value,vPagINT23.Value,
        vCobOEST3.Value,vPagOEST3.Value,vCobOUT3.Value,vPagOUT3.Value);

      Bco.FreteSaida_Altera(idCli, 4,
        vCobSp4.Value, vPagSp4.Value, vCobG4.Value,vPagG4.Value,
        vCobINT4.Value,vPagINT4.Value,vCobINT24.Value,vPagINT24.Value,
        vCobOEST4.Value,vPagOEST4.Value,vCobOUT4.Value,vPagOUT4.Value);

      Bco.FreteSaida_Altera(idCli, 5,
        vCobSp5.Value, vPagSp5.Value, vCobG5.Value,vPagG5.Value,
        vCobINT5.Value,vPagINT5.Value,vCobINT25.Value,vPagINT25.Value,
        vCobOEST5.Value,vPagOEST5.Value,vCobOUT5.Value,vPagOUT5.Value);

      Bco.FreteSaida_Altera(idCli, 6,
        vCobSp6.Value, vPagSp6.Value, vCobG6.Value,vPagG6.Value,
        vCobINT6.Value,vPagINT6.Value,vCobINT26.Value,vPagINT26.Value,
        vCobOEST6.Value,vPagOEST6.Value,vCobOUT6.Value,vPagOUT6.Value);

      Bco.Destroy;
    end;
  end;
end;

procedure MostraSaida();

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 1);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp1.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp1.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG1.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG1.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT1.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT1.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT1.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT1.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;

  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 2);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp2.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp2.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG2.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG2.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT2.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT2.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT2.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT2.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;

  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 3);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp3.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp3.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG3.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG3.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT3.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT3.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT3.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT3.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;

  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 4);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp4.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp4.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG4.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG4.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT4.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT4.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT4.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT4.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;

  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 5);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp5.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp5.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG5.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG5.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT5.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT5.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT5.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT5.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;

  Bco := TBco.Create;
  Bco.FreteSaida_Mostra(idCli, 6);
  Bco.Destroy;

  if (DM3.cdsFT4.RecordCount > 0) then
  with FTSaida do
  begin
    vCobSp6.Value  := DM3.cdsFT4COB_SP.AsFloat;
    vPagSp6.Value  := DM3.cdsFT4PAG_SP.AsFloat;
    vCobG6.Value   := DM3.cdsFT4COB_GSP.AsFloat;
    vPagG6.Value   := DM3.cdsFT4PAG_GSP.AsFloat;
    vCobINT6.Value := DM3.cdsFT4COB_INT.AsFloat;
    vPagINT6.Value := DM3.cdsFT4PAG_INT.AsFloat;
    vCobOUT6.Value := DM3.cdsFT4COB_OUT.AsFloat;
    vPagOUT6.Value := DM3.cdsFT4PAG_OUT.AsFloat;
  end;


end;



procedure TFTSaida.btSalvarClick(Sender: TObject);

var n : Integer;

begin
  n := DM2.Conta('TB_FRETE4', 'ligCli = '+IntToStr(idCli) +' ');
  if (n = 0) then InserirSaida;
  AlterarSaida;
end;

procedure TFTSaida.FormActivate(Sender: TObject);
begin
  MostraSaida;
  vCobSp1.SetFocus;
end;

end.
