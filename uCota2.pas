unit uCota2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  Buttons, JvExControls, JvEnterTab, ComCtrls, JvComponentBase;

type
  TCota2 = class(TForm)
    Panel1: TPanel;
    lbDT: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lbNUM: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    vlNF: TJvValidateEdit;
    Label4: TLabel;
    vlValorNF: TJvValidateEdit;
    Label5: TLabel;
    vlPeso: TJvValidateEdit;
    Label6: TLabel;
    vlVol: TJvValidateEdit;
    Label7: TLabel;
    edCEP: TEdit;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    vlMed1: TJvValidateEdit;
    vlMed2: TJvValidateEdit;
    vlMed3: TJvValidateEdit;
    lbVol: TLabel;
    Panel3: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Panel4: TPanel;
    vlValorC: TJvValidateEdit;
    cbStatus: TComboBox;
    Label14: TLabel;
    edNome: TEdit;
    Label15: TLabel;
    edMail: TEdit;
    Label16: TLabel;
    edObs: TEdit;
    btSalvar: TBitBtn;
    Label17: TLabel;
    cbCli: TComboBox;
    JvEnterAsTab1: TJvEnterAsTab;
    Label18: TLabel;
    Label19: TLabel;
    edDest: TEdit;
    edCNPJ: TEdit;
    Label20: TLabel;
    edLocal: TEdit;
    Label21: TLabel;
    dtS: TDateTimePicker;
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar(t:integer);
  end;

var
  Cota2: TCota2;
  idCot : integer;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco, DB, uCota1;

procedure Limpar;

begin
  with Cota2 do
  begin
    lbDT.Caption   := '';
    lbNUM.Caption  := '';
    lbVol.Caption  := '';
    edLocal.Text   := '';
    
    edCEP.Text     := '';
    edNome.Text    := '';
    edMail.Text    := '';
    edObs.Text     := '';
    edDest.Text    := '';
    edCNPJ.Text    := '';

    vlNF.Value     := 0;
    vlValorNF.Value:= 0;
    vlPeso.Value   := 0;
    vlVol.Value    := 0;
    vlMed1.Value   := 0;
    vlMed2.Value   := 0;
    vlMed3.Value   := 0;
    vlValorC.Value := 0;

    dtS.DateTime   := Now + 1;

    cbCli.ItemIndex := 0;
    cbStatus.ItemIndex := 0;
  end;
end;

procedure Preencher;

begin
  with Cota2 do
  begin
    lbDT.Caption   := FormatDateTime('dd/MM/yyyy ddd', DM4.cdsCotDTCOT.Value);
    lbNUM.Caption  := DM4.cdsCotID.AsString;
    lbVol.Caption  := DM4.cdsCotVOLUME.AsString;
    edLocal.Text   := DM4.cdsCotLOCALI.Value;

    edCEP.Text     := DM4.cdsCotCEP.Value;
    edNome.Text    := DM4.cdsCotNOME.Value;
    edMail.Text    := DM4.cdsCotEMAIL.Value;
    edObs.Text     := DM4.cdsCotOBS.Value;
    edDest.Text    := DM4.cdsCotDESTNOME.Value;
    edCNPJ.Text    := DM4.cdsCotDESTCNPJ.Value;

    vlNF.Value     := DM4.cdsCotNUMNF.AsInteger;
    vlValorNF.Value:= DM4.cdsCotVALOR.AsFloat;
    vlPeso.Value   := DM4.cdsCotPESO.AsFloat;
    vlVol.Value    := DM4.cdsCotVOLUME.AsFloat;
    vlMed1.Value   := DM4.cdsCotMED1.AsFloat;
    vlMed2.Value   := DM4.cdsCotMED2.AsFloat;
    vlMed3.Value   := DM4.cdsCotMED3.AsFloat;
    vlValorC.Value := DM4.cdsCotVLRCOT.AsFloat;

    dtS.DateTime   := Now + 1;
    if (DM4.cdsCotDTSERV.Value<> null) then
      dtS.DateTime   := DM4.cdsCotDTSERV.AsDateTime;

    DM2.DBCp_Pos(cbCli, 'TB_CLIENTE',DM4.cdsCotLIGCLI.AsString,'NOME');
    cbStatus.ItemIndex := DM4.cdsCotSTATUS.Value;
  end;
end;

procedure TCota2.Entrar(t: integer);
begin
  cbCli.Clear;
  cbCli.Items.Append('[ não é Cliente ]');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  // Novo T=1
  if (t = 1) then
  begin
    Limpar;
    idCot := 0;
  end;

  if (t = 2) then
  begin
    Limpar;
    Preencher;
    idCot := DM4.cdsCotID.Value;
  end;

end;

procedure Salvar;

var Bco   : TBco;
    idCli : Integer;

begin
  with Cota2 do
  begin
    idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');
    Bco := TBco.Create;
    if (idCot = 0) then
    begin
      Bco.Cotacao_Insere(idCli, vlNF.Value, vlVol.Value,cbStatus.ItemIndex , vlValorNF.Value, vlPeso.Value, vlMed1.Value,vlMed2.Value,vlMed3.Value,vlValorC.Value,edNome.Text,edMail.Text, edObs.Text, edCEP.Text, edDest.Text, edCNPJ.Text, edLocal.Text, dtS.DateTime );
    end
    else
    begin
      Bco.Cotacao_Altera(idCot, idCli, vlNF.Value, vlVol.Value, cbStatus.ItemIndex ,vlValorNF.Value, vlPeso.Value, vlMed1.Value,vlMed2.Value,vlMed3.Value,vlValorC.Value,edNome.Text,edMail.Text, edObs.Text, edCEP.Text, edDest.Text, edCNPJ.Text, edLocal.Text, dtS.DateTime);
    end;
    Bco.Destroy;

  end;
end;

procedure TCota2.btSalvarClick(Sender: TObject);
begin
  Salvar;
  Cota1.Pesquisar;
  Cota1.Show;
  Cota2.Hide;
end;

end.
