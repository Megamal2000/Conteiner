unit uCteDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JvExStdCtrls, JvEdit,
  JvValidateEdit, ComCtrls;

type
  TCteDet = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    tb1: TTabSheet;
    tb2: TTabSheet;
    lbDest: TLabel;
    Label12: TLabel;
    edCEP: TEdit;
    procCEP: TSpeedButton;
    edEnder: TEdit;
    Label9: TLabel;
    Label19: TLabel;
    edNum: TJvValidateEdit;
    Label21: TLabel;
    edComp: TEdit;
    Label10: TLabel;
    edBairro: TEdit;
    Label11: TLabel;
    edCidade: TEdit;
    Label13: TLabel;
    cbUF: TComboBox;
    Label34: TLabel;
    edCmun: TJvValidateEdit;
    btCodM: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    lbNF: TLabel;
    lbCli: TLabel;
    Label1: TLabel;
    btProcurar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    edCNPJ: TEdit;
    edIE: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edChave: TEdit;
    btSalvar: TBitBtn;
    btNovo: TBitBtn;
    lbTomador: TLabel;
    cbToma: TComboBox;
    Panel2: TPanel;
    Label8: TLabel;
    cbIEtoma: TComboBox;
    procedure procCEPClick(Sender: TObject);
    procedure btCodMClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar(nNF, idC : Integer); Overload;
    procedure Entrar(nNF, idC, idCte : Integer); Overload;

  end;

var
  CteDet: TCteDet;
  idCli, numNF, idEsp, idCT : Integer;
implementation

{$R *.dfm}

uses uBanco, uDM1, uDM4, uLib, DB, uIBGE;

procedure Preencher();

var usa : TMarco;


begin
  with CteDet do
  begin
    // Dados Principais
    idEsp := DM4.cdsEspelhoID.Value;
    lbDest.Caption := DM4.cdsEspelhoRAZAOS.Value;
    edCNPJ.Text    := DM4.cdsEspelhoDCNPJ.Value;
    edIE.Text      := DM4.cdsEspelhoDIE.Value;
    edChave.Text   := DM4.cdsEspelhoCHAVENFE.Value;
    // Endereço
    edCEP.Text     := DM4.cdsEspelhoCEP.Value;
    edEnder.Text   := DM4.cdsEspelhoENDERECO.Value;
    if Length(DM4.cdsEspelhoNUMERO.AsString) > 0 then
      edNum.Value    := DM4.cdsEspelhoNUMERO.Value;
    edComp.Text    := DM4.cdsEspelhoCOMPLEMENTO.Value;
    edBairro.Text  := DM4.cdsEspelhoBAIRRO.Value;
    edCidade.Text  := DM4.cdsEspelhoCIDADE.Value;
    if Length(DM4.cdsEspelhoCODMUNICIPIO.AsString) > 0  then
      edCmun.Value    := DM4.cdsEspelhoCODMUNICIPIO.AsInteger;

    usa := TMarco.Create;
    usa.Combo_Pos(cbUF, DM4.cdsEspelhoESTADO.Value);
    usa.Destroy;

  end;
end;

procedure Entrada(nNF, idC : Integer);

var Bco : TBco;
    usa : TMarco;
    ok  : Boolean;

begin
  idCli := idC;
  numNF := nNF;
  with CteDet do
  begin
    if (cbUF.Items.Count = 0) then
    begin
      cbUF.Clear;
      usa := TMarco.Create;
      usa.Combo_Preenche(cbUF, 'mluf.mzi');
      usa.Destroy;
    end;

    usa := TMarco.Create;
    usa.Le_INI;
    ok := usa.TestaCon(DM4.ConectaCONH, usa.get_EspelhoServ);
    usa.Destroy;

    Bco := TBco.Create;
    Bco.Cliente_MostraId(idCli);
    Bco.Espelho_Mostra(idCli, numNF);
    Bco.Destroy;

    // Cabecalho
    lbNF.Caption  := intToStr(numNF);
    lbCli.Caption := DM1.cdsCliNOME.Value;

    // Dados
    PageControl1.Visible := true;
    btSalvar.Visible     := true;

    if (DM4.cdsEspelho.RecordCount > 0) then Preencher()
    else
    begin
      idEsp := 0;
      PageControl1.Visible := false;
      btSalvar.Visible     := false;
    end;
  end;

end;

procedure Pesquisa_CEP;

var bco : Tbco;
    usa : TMarco;

begin
  bco := TBco.Create;
  bco.CEP_Procura(CteDet.edCEP.Text);
  usa := TMarco.Create;

  if (DM1.cdsCEP.RecordCount > 0) then
  begin
    with CteDet do
    begin
      edEnder.Text     := DM1.cdsCEPTIPO.Value + ' '+ DM1.cdsCEPLOGRADOURO.Value;
      edBairro.Text    := DM1.cdsCEPBAIRRO.Value;
      edCidade.Text    := DM1.cdsCEPLOCALIDADE.Value;
      usa.Combo_Pos(cbUF, DM1.cdsCEPUF.Value);
      if (edNum.Value = 0) then edNum.SetFocus
        else cbUF.SetFocus;
    end;
  end
  else
  CteDet.edEnder.SetFocus;

  bco.Destroy;

end;

procedure TCteDet.procCEPClick(Sender: TObject);
begin
  Pesquisa_CEP;
end;

procedure TCteDet.btCodMClick(Sender: TObject);
var cid, uf : String;

begin
  cid := edCidade.Text;
  uf  := cbUF.Items[cbUF.ItemIndex];

  IBGE.set_cid(cid);
  IBGE.set_uf(uf);
  IBGE.set_saida(4);
  IBGE.PesquisaFORA;
end;

procedure TCteDet.btNovoClick(Sender: TObject);
  var Bco : Tbco;

begin
  // novo
  if (idEsp = 0) then
  begin
    Bco := Tbco .Create;
    Bco.Espelho_InsereDados(numNF, idCli);
    Bco.Espelho_Mostra(idCli, numNF);
    Bco.Destroy;
    idEsp := DM4.cdsEspelhoID.Value;
    PageControl1.Visible := true;
    btSalvar.Visible     := true;
    Preencher();
  end;
end;

procedure TCteDet.btSalvarClick(Sender: TObject);

var Bco : Tbco;
    ie : integer;

begin
  Bco := Tbco.Create;
  if cbIeToma.itemIndex = 0 then ie := 9
    else ie := cbIeToma.itemIndex;

  if idCT > 0 then Bco.Conhec_TomadorSalva(idCt, cbToma.ItemIndex, ie);
  // Isento
  if (ie=2) then edIE.Text := 'ISENTO';


  if (idEsp > 0) then
  begin
    Bco.Espelho_AlteraDados(idEsp, edCNPJ.Text, edIE.Text, edChavE.Text, edEnder.Text,
    edNum.Value, edComp.Text , edBairro.Text, edCidade.Text,
    cbUF.Items[cbUF.ItemIndex], edCEP.Text, IntToStr(edCmun.Value));
  end;
  Bco.Destroy;
end;

procedure TCteDet.Entrar(nNF, idC, idCte: Integer);
  var Bco : TBco;
begin
  Entrada(nNF, idC);

  Bco := TBco.Create;
  cbToma.ItemIndex := Bco.Conhec_TomadorLe(idCte);
  cbIeToma.ItemIndex := Bco.Conhec_TomadorLeIe(idCte);
  Bco.Destroy;

  idCT := idCTe;
  Panel2.Visible := true;

end;

procedure TCteDet.Entrar(nNF, idC: Integer);
begin
  Entrada(nNF, idC);
  idCT := 0;
  Panel2.Visible := false;
end;

end.
