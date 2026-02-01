unit ucadCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ImgList, Buttons, ComCtrls,
  JvSpeedbar, ExtCtrls, JvExExtCtrls, JvExtComponent, JvExStdCtrls, JvEdit,
  JvValidateEdit, Mask, DB, System.ImageList;

type
  TcadCli = class(TForm)
    Label18: TLabel;
    JvSpeedBar1: TJvSpeedBar;
    Label14: TLabel;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    btPesq: TJvSpeedItem;
    btped: TJvSpeedItem;
    bthist: TJvSpeedItem;
    PageControl1: TPageControl;
    tsContato: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    edRG: TEdit;
    tsEnder: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procCEP: TSpeedButton;
    edEnder: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edCEP: TEdit;
    cbUF: TComboBox;
    tsTels: TTabSheet;
    Label13: TLabel;
    lbTels: TLabel;
    Label20: TLabel;
    edTel: TEdit;
    cbDesc: TComboBox;
    edObs: TEdit;
    ImageList1: TImageList;
    rbFisica: TRadioButton;
    rbJuridica: TRadioButton;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Label19: TLabel;
    edNum: TJvValidateEdit;
    Label21: TLabel;
    edComp: TEdit;
    tsTelefone: TTabSheet;
    Label22: TLabel;
    cbDesc2: TComboBox;
    Label23: TLabel;
    edTel2: TEdit;
    edCNPJ: TMaskEdit;
    edCPF: TMaskEdit;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label24: TLabel;
    btSubNovo: TSpeedButton;
    btSubSalvar: TSpeedButton;
    btSubApagar: TSpeedButton;
    Panel3: TPanel;
    lbAtual: TLabel;
    Label26: TLabel;
    edDetalhes: TEdit;
    lbDTcad: TLabel;
    tsWeb: TTabSheet;
    lbQtweb: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    edDescricao: TEdit;
    Label25: TLabel;
    edWEB: TEdit;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label27: TLabel;
    btiWEB: TSpeedButton;
    btsWEB: TSpeedButton;
    btaWEB: TSpeedButton;
    DataSource2: TDataSource;
    TabSheet1: TTabSheet;
    btPeso: TBitBtn;
    Label3: TLabel;
    Label16: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    GroupBox1: TGroupBox;
    sp1: TRadioButton;
    sp2: TRadioButton;
    sp3: TRadioButton;
    sp4: TRadioButton;
    sp5: TRadioButton;
    GroupBox2: TGroupBox;
    gsp1: TRadioButton;
    gsp2: TRadioButton;
    gsp3: TRadioButton;
    gsp4: TRadioButton;
    gsp5: TRadioButton;
    GroupBox3: TGroupBox;
    int1: TRadioButton;
    int2: TRadioButton;
    int3: TRadioButton;
    int4: TRadioButton;
    int5: TRadioButton;
    btTaxa: TBitBtn;
    btEnt: TBitBtn;
    btSaida: TBitBtn;
    btContrato: TBitBtn;
    btSalvCo: TBitBtn;
    Label31: TLabel;
    edIE: TEdit;
    ckSaida: TCheckBox;
    Label32: TLabel;
    vCarroExtra: TJvValidateEdit;
    btOutras: TBitBtn;
    lbID: TLabel;
    tsOutros: TTabSheet;
    Label33: TLabel;
    btSalvaOut: TBitBtn;
    vExtra: TJvValidateEdit;
    Label34: TLabel;
    edCmun: TJvValidateEdit;
    btCodM: TSpeedButton;
    ckRecibos: TCheckBox;
    ckEstoque: TCheckBox;
    btEstoqueC: TBitBtn;
    ckAtivo: TCheckBox;
    Label35: TLabel;
    vSerie: TJvValidateEdit;
    ckSMS: TCheckBox;
    Label36: TLabel;
    vPrazo: TJvValidateEdit;
    ckCTe: TCheckBox;
    cbCte: TComboBox;
    cbIE: TComboBox;
    ckOCcli: TCheckBox;
    btOC: TBitBtn;
    btEnviaFrete: TBitBtn;
    procedure rbFisicaClick(Sender: TObject);
    procedure rbJuridicaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRGKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCEPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure procCEPClick(Sender: TObject);
    procedure edEnderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCompKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbDesc2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTel2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edObsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSalvarClick(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure cbDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSubNovoClick(Sender: TObject);
    procedure btSubSalvarClick(Sender: TObject);
    procedure btSubApagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btiWEBClick(Sender: TObject);
    procedure btsWEBClick(Sender: TObject);
    procedure btaWEBClick(Sender: TObject);
    procedure edDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure edWEBKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure btSalvCoClick(Sender: TObject);
    procedure btPesoClick(Sender: TObject);
    procedure btTaxaClick(Sender: TObject);
    procedure btEntClick(Sender: TObject);
    procedure btSaidaClick(Sender: TObject);
    procedure btContratoClick(Sender: TObject);
    procedure btOutrasClick(Sender: TObject);
    procedure btSalvaOutClick(Sender: TObject);
    procedure btCodMClick(Sender: TObject);
    procedure ckEstoqueClick(Sender: TObject);
    procedure btEstoqueCClick(Sender: TObject);
    procedure ckCTeClick(Sender: TObject);
    procedure btOCClick(Sender: TObject);
    procedure ckOCcliClick(Sender: TObject);
    procedure btEnviaFreteClick(Sender: TObject);
  private
    { Private declarations }
  idCli, idUser, idTel, idWEB : integer;
  public
    { Public declarations }
    procedure set_idUser(i : integer);
    procedure set_idCli(i : integer);
  end;

var
  cadCli: TcadCli;
  Tab : String;

  
implementation

{$R *.dfm}

{ TcadCli }

uses uDM1, uDM2, uLib, uBanco, upsqCli, uFrete1, uCobOut, uIBGE,
  uStokContrato, uOcorreCli, uEnviaRest3;

procedure TcadCli.set_idUser(i: integer);
begin
  idUser := i;
end;

procedure Pessoa(tipo : String);

begin
  with cadCli do
  begin
   { edCPF.Text    := '';
    edRG.Text     := '';
    edCNPJ.Text   := '';
   }
  if (tipo = 'Juridica') then
  begin
    edCNPJ.Color     := clWhite;
    edCNPJ.Enabled   := true;
    edIE.Color       := clWhite;
    edIE.Enabled     := true;
    edCPF.Color      := clGray;
    edCPF.Enabled    := False;
    edRG.Color       := clGray;
    edRG.Enabled     := false;
    edCNPJ.SetFocus;

  end
  else
  begin
    edCNPJ.Color     := clGray;
    edCNPJ.Enabled   := false;
    edIE.Color       := clGray;
    edIE.Enabled     := false;
    edCPF.Color      := clWhite;
    edCPF.Enabled    := true;
    edRG.Color       := clWhite;
    edRG.Enabled     := True;
    edCPF.SetFocus;
  end;

  end;
end;
procedure Limpar;

begin
  with cadCli do
  begin
    PageControl1.ActivePage := tsContato;

    edNome.Text    := '';
    edCPF.Text     := '';
    edRG.Text      := '';
    edCNPJ.Text    := '';

    edCEP.Text     := '';
    edEnder.Text   := '';
    edNum.Text     := '';
    edComp.Text    := '';
    edCidade.Text  := '';
    edBairro.Text  := '';
    cbUF.ItemIndex := 25;

    lbTels.Caption := '-';
    edTel.Text     := '';

    cbDesc.ItemIndex := 0;
    edTel.Text    := '';

    cbDesc2.ItemIndex := 0;
    edTel2.Text    := '';
    idTel := 0;

    edObs.Text     := '';
    lbDTcad.Caption:= '';

    tsTels.TabVisible := false;
    tsWeb.TabVisible  := false;

    rbJuridica.Checked := true;
    Pessoa('Juridica');

    ckEstoque.Checked := false;
    btEstoqueC.Visible:= false;
    ckAtivo.Checked   := true;

    ckCte.Checked := false;
    cbCte.Visible := false;
    cbIE.Visible  := false;

    edNome.SetFocus;
  end;
end;

procedure Preenche_Cob(a,b,c : Smallint);
begin
  with cadCli do
  begin
    if (a = 1) then sp1.Checked := True
    else if (a = 2) then sp2.Checked := True
    else if (a = 3) then sp3.Checked := True
    else if (a = 4) then sp4.Checked := True
    else if (a = 5) then sp5.Checked := True;

    if (b = 1) then gsp1.Checked := True
    else if (b = 2) then gsp2.Checked := True
    else if (b = 3) then gsp3.Checked := True
    else if (b = 4) then gsp4.Checked := True
    else if (b = 5) then gsp5.Checked := True;

    if (c = 1) then int1.Checked := True
    else if (c = 2) then int2.Checked := True
    else if (c = 3) then int3.Checked := True
    else if (c = 4) then int4.Checked := True
    else if (c = 5) then int5.Checked := True;
  end;
end;


procedure Carregar;

var usa : TMarco;
    codMun : String;

begin
  usa := TMarco.Create;

  with cadCli do
  begin
    PageControl1.ActivePage := tsContato;

    edNome.Text    := DM1.cdsCliNOME.Value;
    edCPF.Text     := usa.Monta_DOC(DM1.cdsCliCPF.Value);
    edRG.Text      := DM1.cdsCliRG.Value;
    edCNPJ.Text    := usa.Monta_DOC(DM1.cdsCliCNPJ.Value);
    edIE.Text      := DM1.cdsCliIE.Text;
    ckAtivo.Checked := (DM1.cdsCliATIVO.Value = 1);


    edCEP.Text     := DM1.cdsEnderCEP.Value;
    edEnder.Text   := DM1.cdsEnderENDER.Value;
    edNum.Value    := DM1.cdsEnderNUMERO.Value;
    edComp.Text    := DM1.cdsEnderCOMPLEMENTO.Value;
    edCidade.Text  := DM1.cdsEnderCIDADE.Value;
    edBairro.Text  := DM1.cdsEnderBAIRRO.Value;
    usa.Combo_Pos(cbUF, DM1.cdsEnderESTADO.Value);
    codMun := DM1.cdsENDERCodMUN.AsString;
    if (length(codMun) > 0) then
      edCMun.Value := StrToInt(codMun);

    cbDesc.ItemIndex := 0;
    edTel.Text       := '';
    edDetalhes.Text  := '';

    tsTels.TabVisible := true;
    tsTelefone.TabVisible := false;

    edDescricao.Text := '';
    edWeb.Text       := '';
    tsWEB.TabVisible := true;

    rbJuridica.Checked := true;
    Pessoa('Juridica');
    if (DM1.cdsCliPESSOA.Value = 0) then
    begin
      rbFisica.Checked := true;
      Pessoa('Fisica');
    end;

    if (DM1.cdsCliSAIDANAO.Value = 1) then ckSaida.Checked := true else ckSaida.Checked := False;


    lbDTcad.Caption := 'cadastrado em '+FormatDateTime('dd/mm/yyyy',DM1.cdsCliDTCAD.AsDateTime);
    edObs.Text := DM1.cdsCliOBS.Value;

    Preenche_Cob(DM1.cdsCliPADRAO_SP.Value,DM1.cdsCliPADRAO_GSP.Value,DM1.cdsCliPADRAO_INT.Value);

    // Carro a mais (Cobrança)
    vCarroExtra.Value := DM1.cdsCliCARROEXTRA.AsFloat;
    // ---- OUTROS --------
    // Valor pago ao motorista por nota alienigena
    vExtra.Value := DM1.cdsCliPAGOEXTRA.AsFloat;
    vSerie.Value := 1;
    if (DM1.cdsCliNFSERIE.Value <> null) then
      vSerie.Value := DM1.cdsCliNFSERIE.AsInteger;
    ckRecibos.Checked := (DM1.cdsCliIMPREC.Value = 1);
    if (DM1.cdsCliARMAZENAGEM.Value = 1) then
    begin
         ckEstoque.Checked := true;
         btEstoqueC.Visible:= true;
    end;
    ckSMS.Checked :=  (DM1.cdsCliUSA_SMS.Value = 1);

    vPrazo.Value := 2;
    if (DM1.cdsCliNFSERIE.Value <> null) then vPrazo.Value :=  DM1.cdsCliPRAZO.Value;

    ckCte.Checked := (DM1.cdsCliCTEEMITE.Value = 1);
    cbCte.Visible := ckCte.Checked;
    cbCte.ItemIndex := DM1.cdsCliCTEIMPOSTO.Value;
    cbIE.Visible := ckCte.Checked;
    cbIE.ItemIndex := DM1.cdsCliCTE_IE.Value;

    // OCOREN personalizado
    ckOCcli.Checked := (DM1.cdsCliOCPROPIA.Value=1);
    btOC.Visible := (ckOCcli.Checked);

    edNome.SetFocus;
  end;
end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  if (cadCli.idCli > 0) then
  begin
    bco.Cliente_MostraId(cadCli.idCli);
    bco.Enderecos_MostraId(Tab, cadCli.idCli);

    if (bco.Tels_Conta(Tab,cadCli.idCli)=1) then
      cadCli.lbTels.Caption := '1 telefone';
    if (bco.Tels_Conta(Tab,cadCli.idCli)>1) then
      cadCli.lbTels.Caption := IntToStr(bco.Tels_Conta(Tab,cadCli.idCli))+' telefones';
    bco.Tels_MostraTodos(Tab,cadCli.idCli);

    if (bco.Web_Conta(Tab,cadCli.idCli)=1) then
      cadCli.lbQtweb.Caption := '1 registro';
    if (bco.Web_Conta(Tab,cadCli.idCli)>1) then
      cadCli.lbQtweb.Caption := IntToStr(bco.Web_Conta(Tab,cadCli.idCli))+' registros';
    bco.Web_MostraTodos(Tab,cadCli.idCli);
  end;

  Carregar;
  bco.Destroy;
end;

procedure Guia_Tels;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Tels_MostraTodos(Tab,cadCli.idCli);
  cadCli.PageControl1.ActivePage := cadCli.tsTels;

  if (DM1.cdsTel.RecordCount > 0) then
  begin
    if (DM1.cdsTel.RecordCount = 1) then cadCli.lbTels.Caption := '1 telefone'
      else
      cadCli.lbTels.Caption := IntToStr(DM1.cdsTel.RecordCount) + ' telefones';
  end;
  bco.Destroy;
end;

procedure Guia_Veic;

begin
 {
  bco := TBco.Create;
  bco._MostraTodos(Tab,cadCli.idCli);
  if (DM1.cdsTel.RecordCount > 0) then
  begin
    cadCli.PageControl1.ActivePage := cadCli.tsTels;
    cadCli.lbTels.Caption := IntToStr(DM1.cdsTel.RecordCount) + ' telefones';
  end;
  }
end;

procedure Salvar;

var bco : Tbco;
    p, at : smallint;
    usa : TMarco;


begin
  bco := TBco.Create;
  usa := TMarco.Create;

  with cadCli do
  begin
    p := 0;
    if (rbJuridica.Checked) then p := 1;
    at := 0;
    if (ckAtivo.Checked) then at := 1;

    if (Trim(edNome.Text)<>'') then
    begin

      if (cadCli.idCli > 0) then
      begin
        bco.Cliente_Altera(cadCli.idCli, edNome.Text, usa.Formata_DOC(edcpf.Text), edrg.Text, usa.Formata_DOC(edcnpj.Text),edIE.Text , edObs.Text, p , idUser, at);
        if (DM2.Conta('TB_CLIENDER', 'FUNC_ID = '+IntToStr(idCli))=0) then         bco.Enderecos_Insere(Tab, cadCli.idCli);
        bco.Enderecos_Altera(Tab, cadCli.idCli, edEnder.Text, edNum.Value, edComp.Text,edBairro.Text, edCidade.Text, cbUF.Items[cbUF.itemindex],edCEP.Text, IntToStr(edCMun.Value));

      end;

      // Novo
      if (cadCli.idCli = 0) then
      begin
        bco.Cliente_Insere(edNome.Text,usa.Formata_DOC( edcpf.Text), edrg.Text, usa.Formata_DOC(edcnpj.Text), edIE.Text, edObs.Text, p , idUser);
        // procura por doc
        if (p = 0) and (edCPF.Text <> '') then idCli := bco.Cliente_Existe(usa.Formata_DOC(edCPF.Text));
        if (p = 1) and (edCNPJ.Text<> '') then idCli := bco.Cliente_Existe(usa.Formata_DOC(edCNPJ.Text));
        if (idCli = 0) then idCli := bco.Cliente_ExisteNome(edNome.Text);
        bco.Enderecos_Insere(Tab, idCli);
        bco.Tels_Insere(Tab,idCli,cbDesc2.Items[cbDesc2.itemindex],edTel2.Text,edDetalhes.Text );
        tsTelefone.TabVisible := false;
        tsTels.TabVisible     := true;
        tsWeb.TabVisible      := true;
      end;
    end
    else ShowMessage('Preencha o Nome do Cliente');

  end;
  bco.Destroy;
  Atualiza;
  Guia_tels;
end;

procedure TcadCli.rbFisicaClick(Sender: TObject);
begin
  Pessoa('Fisica');
end;

procedure TcadCli.rbJuridicaClick(Sender: TObject);
begin
  Pessoa('Juridica');
end;

//procedure Salvar(

procedure TcadCli.FormActivate(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  Tab := 'C';
  usa.Combo_Preenche(cbUF, 'mluf.mzi');
  usa.Combo_Preenche(cbDesc,'mltel.mzi' );
  usa.Combo_Preenche(cbDesc2,'mltel.mzi' );

  if (idCli = 0) then
  begin
    Limpar;
    lbAtual.Caption := 'nenhum Cliente escolhido';
  end
  else
  begin
    Atualiza;
    Guia_Tels;
    lbAtual.Caption := DM1.cdsCliNOME.Value;
  end;
end;

procedure TcadCli.btNovoClick(Sender: TObject);
begin
  Limpar;
  idCli:= 0;
  lbID.Caption := IntToStr(idCli);
end;

procedure TcadCli.set_idCli(i: integer);
begin
  cadCli.idCli := i;
  lbID.Caption := IntToStr(cadCli.idCli);
end;

procedure TcadCli.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then
  begin
    if (rbFisica.Checked) then edCPF.SetFocus;
    if (rbJuridica.Checked) then edCNPJ.SetFocus;
  end;
end;

procedure TcadCli.edCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edRG.SetFocus;

end;

procedure TcadCli.edRGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    PageControl1.ActivePage := tsEnder;
    edCEP.SetFocus;
  end;
end;

procedure TcadCli.edCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    PageControl1.ActivePage := tsEnder;
    edCEP.SetFocus;
  end;
end;

procedure Pesquisa_CEP;

var bco : Tbco;
    usa : TMarco;

begin
  bco := TBco.Create;
  bco.CEP_Procura(cadCli.edCEP.Text);
  usa := TMarco.Create;

  if (DM1.cdsCEP.RecordCount > 0) then
  begin
    with cadCli do
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
  cadCli.edEnder.SetFocus;

  bco.Destroy;

end;

procedure TcadCli.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Length(edCEP.Text) = 8) then Pesquisa_CEP;
end;

procedure TcadCli.procCEPClick(Sender: TObject);
begin
  Pesquisa_CEP;
end;

procedure TcadCli.edEnderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then edNum.SetFocus;

end;

procedure TcadCli.edNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then edComp.SetFocus;

end;

procedure TcadCli.edCompKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then edBairro.SetFocus;

end;

procedure TcadCli.edBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then edCidade.SetFocus;
end;

procedure TcadCli.edCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=13) then cbUF.SetFocus;

end;

procedure TcadCli.cbUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
  if (tsTelefone.TabVisible) then  PageControl1.ActivePage := tsTelefone
    else if (tsTels.TabVisible) then  PageControl1.ActivePage := tsTels;
  end;
end;

procedure TcadCli.cbDesc2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edTel2.SetFocus;
end;

procedure TcadCli.edTel2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edObs.SetFocus;
end;

procedure TcadCli.edObsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then Salvar;;
end;

procedure TcadCli.btSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TcadCli.btPesqClick(Sender: TObject);
begin
  psqCli.set_Saida(1);
  psqCli.Show;
end;

procedure TcadCli.cbDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edTel.SetFocus;
end;

procedure TcadCli.edTelKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (key = 13) then
  begin
    if (edTel.Text <> '') then
    begin
      if (idTel=0) then
      begin
        bco.Tels_Insere(Tab,idCli,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
        bco.Tels_MostraTodos(Tab, idCli);
        edTel.Text := '';
      end
      else
      begin
        bco.Tels_Altera(Tab,idTel,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
        bco.Tels_MostraTodos(Tab, idCli);
        edTel.Text := '';
      end;
    end;
    cbDesc.SetFocus;
    idTel := 0;
  end;
  bco.Destroy;
end;

procedure TcadCli.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_F2) then Salvar;
end;


procedure TcadCli.btSubNovoClick(Sender: TObject);
begin
  idTel := 0;
  cbDesc.ItemIndex := 0;
  edTel.Text       := '';
  edDetalhes.Text  := '';
  cbDesc.SetFocus;
end;

procedure Atualiza_Tel;

var bco : Tbco;

begin
  bco := TBco.Create;
    if (bco.Tels_Conta(Tab,cadCli.idCli)=1) then
      cadCli.lbTels.Caption := '1 telefone';
    if (bco.Tels_Conta(Tab,cadCli.idCli)>1) then
      cadCli.lbTels.Caption := IntToStr(bco.Tels_Conta(Tab,cadCli.idCli))+' telefones';
    bco.Tels_MostraTodos(Tab,cadCli.idCli);

end;

procedure TcadCli.btSubSalvarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if (edTel.Text <> '') then
  begin
    if (idTel=0) then
    begin
      bco.Tels_Insere(Tab,idCli,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
      bco.Tels_MostraTodos(Tab, idCli);
      edTel.Text := '';
      edDetalhes.Text  := '';
    end
    else
    begin
      bco.Tels_Altera(Tab,idTel,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
      bco.Tels_MostraTodos(Tab, idCli);
      edTel.Text := '';
      edDetalhes.Text  := '';
    end;
    Guia_tels;
  end;
  cbDesc.SetFocus;
  idTel := 0;
  Atualiza_tel;
end;

procedure TcadCli.btSubApagarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if MessageDlg('Tem certeza que deseja apagar o Telefone?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idTel := DM1.cdsTelID.Value;
      bco.Tels_Apaga(Tab,idtel);
      Guia_tels;
    end;
  bco.Destroy;
  Atualiza_tel;
end;

procedure TcadCli.DBGrid1DblClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;
  idTel := DM1.cdsTelID.Value;
  edTel.Text := DM1.cdsTelNUMERO.Value;
  edDetalhes.Text := DM1.cdsTelDETALHE.Value;
  usa.Combo_Pos(cbDesc, DM1.cdsTelDESCRICAO.Value);
end;

procedure TcadCli.btEnviaFreteClick(Sender: TObject);
begin

  EnviaRest3.set_idGrupo(DM1.cdsCliLIGGRUPO.Value);
  EnviaRest3.set_idCli(DM1.cdsCliID.Value);

  EnviaRest3.set_nomeCli(edNome.Text);
  EnviaRest3.set_Tabelas(TTabelas.taFretes);
  EnviaRest3.Entrar;

  EnviaRest3.Show;
end;

procedure TcadCli.btApagarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if MessageDlg('Tem certeza que deseja apagar o CLIENTE?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      bco.Cliente_Apaga(idCli);
    end;

  Limpar;  
  idCli := 0;

  bco.Destroy;
end;

procedure Limpar_WEB;

begin
  cadCli.lbQtweb.Caption := '0';
  cadCli.edDescricao.Text:= '';
  cadCli.edWEB.Text      := '';
  cadCli.idWEB := 0;
end;

procedure TcadCli.btiWEBClick(Sender: TObject);
begin
  Limpar_WEB;
  edDescricao.SetFocus;
end;

procedure Atualiza_WEB;

var bco : Tbco;

begin
  bco := TBco.Create;
    if (bco.Web_Conta(Tab,cadCli.idCli)=1) then
      cadCli.lbQtweb.Caption := '1 registro';
    if (bco.Web_Conta(Tab,cadCli.idCli)>1) then
      cadCli.lbQtweb.Caption := IntToStr(bco.Web_Conta(Tab,cadCli.idCli))+' registros';
    bco.Web_MostraTodos(Tab,cadCli.idCli);
end;


procedure Salvar_WEB;

var bco : Tbco;

begin
  with cadCli do
  begin
  bco := TBco.Create;
  if (edWEB.Text <> '') and (edDescricao.Text <> '') then
  begin
    if (idWEB=0) then
    begin
      bco.WEB_Insere(Tab,idCli, copy(edDescricao.Text,1,40), copy(edWeb.Text,1,50));
      bco.WEB_MostraTodos(Tab, idCli);
      edWEB.Text := '';
      edDescricao.Text  := '';
    end
    else
    begin
      bco.WEB_Altera(Tab,idWEB,copy(edDescricao.Text,1,40), copy(edWeb.Text,1,50));
      bco.WEB_MostraTodos(Tab, idCli);
      edWEB.Text := '';
      edDescricao.Text  := '';
    end;
  end;
    Atualiza_WEB;
  idWEB := 0;
  edDescricao.SetFocus;
  end; // with
end;


procedure TcadCli.btsWEBClick(Sender: TObject);

begin
  Salvar_WEB;
end;

procedure TcadCli.btaWEBClick(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (idWEB > 0) then
  if MessageDlg('Tem certeza que deseja apagar o WEB selecionado?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      bco.Web_Apaga(Tab, idWEB);
    end;
  Limpar_WEB;
  Atualiza_WEB;
end;

procedure TcadCli.edDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if(key = #13) then edWeb.SetFocus;
end;

procedure TcadCli.edWEBKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then  Salvar_WEB;


end;

procedure TcadCli.DBGrid2DblClick(Sender: TObject);

begin
  idWEB            := DM1.cdsWEBID.Value;
  edDescricao.Text := DM1.cdsWEBDESCRICAO.Value;
  edWeb.Text       := DM1.cdsWEBWEB.Value;
end;

procedure TcadCli.btSalvCoClick(Sender: TObject);

var a,b,c, naoSai : Integer;
    Bco : TBco;

begin
  if (sp1.Checked) then a := 1
  else if (sp2.Checked) then a := 2
  else if (sp3.Checked) then a := 3
  else if (sp4.Checked) then a := 4
  else if (sp5.Checked) then a := 5;

  if (gsp1.Checked) then b := 1
  else if (gsp2.Checked) then b := 2
  else if (gsp3.Checked) then b := 3
  else if (gsp4.Checked) then b := 4
  else if (gsp5.Checked) then b := 5;

  if (int1.Checked) then c := 1
  else if (int2.Checked) then c := 2
  else if (int3.Checked) then c := 3
  else if (int4.Checked) then c := 4
  else if (int5.Checked) then c := 5;

  if (ckSaida.Checked) then naoSai := 1 else naoSai := 0;

  Bco := TBco.Create;
  Bco.Cliente_AlteraPadrao(idCli, a, b, c, naoSai);
  Bco.Cliente_AlteraCarroEXTRA(idCli, vCarroExtra.Value);
  Bco.Destroy;

end;




procedure TcadCli.btPesoClick(Sender: TObject);
begin
  if (idCli > 0) then
  begin
    Frete1.set_Tipo(1);
    Frete1.set_idCli(idCli);
    Frete1.lbCli.Caption := lbAtual.Caption;
    Frete1.Show;
  end;
end;

procedure TcadCli.btTaxaClick(Sender: TObject);
begin
  if (idCli > 0) then
  begin
    Frete1.set_Tipo(2);
    Frete1.set_idCli(idCli);
    Frete1.lbCli.Caption := lbAtual.Caption;
    Frete1.Show;
  end;
end;

procedure TcadCli.btEntClick(Sender: TObject);
begin
  if (idCli > 0) then
  begin
    Frete1.set_Tipo(3);
    Frete1.set_idCli(idCli);
    Frete1.lbCli.Caption := lbAtual.Caption;
    Frete1.Show;
  end;
end;

procedure TcadCli.btSaidaClick(Sender: TObject);
begin
  if (idCli > 0) then
  begin
    Frete1.set_Tipo(4);
    Frete1.set_idCli(idCli);
    Frete1.lbCli.Caption := lbAtual.Caption;
    Frete1.Show;
  end;
end;

procedure TcadCli.btContratoClick(Sender: TObject);
begin
  if (idCli > 0) then
  begin
    Frete1.set_Tipo(5);
    Frete1.set_idCli(idCli);
    Frete1.lbCli.Caption := lbAtual.Caption;
    Frete1.Show;
  end;
end;

procedure TcadCli.btOCClick(Sender: TObject);
begin
  if (DM1.cdsCliLIGGRUPO.Value > 0) then
  begin
    OcorreCli.Entrar(DM1.cdsCliNOME.Value+ ' - grupo: '+ DM1.cdsCliLIGGRUPO.AsString , DM1.cdsCliLIGGRUPO.Value);
    OcorreCli.Show;
  end
  else ShowMessage('Cliente não possui Grupo');
end;

procedure TcadCli.btOutrasClick(Sender: TObject);
begin
  CobOut.set_idCli(idCli);
  CobOut.Show;
end;

procedure TcadCli.btSalvaOutClick(Sender: TObject);

var Bco : TBco;
    impR : Integer;
    estoq, iSMS, ct1, ct2, ct3, ocp : Smallint;

begin
  if (idCli > 0) then
  begin
    ct1 := 0;
    ct2 := 0;
    impR  := 0;
    estoq := 0;
    iSMS := 0;
    ocp := 0;
    if (ckSMS.Checked) then iSMS := 1;
    if (ckRecibos.Checked) then impR  := 1;
    if (ckEstoque.Checked) then estoq := 1;
    if (ckCte.Checked) then
    begin
      ct1 := 1;
      ct2 := cbCte.ItemIndex;
      ct3 := cbIE.ItemIndex;
    end;
    if (ckOCcli.Checked) then ocp := 1;
    
    Bco :=TBco.Create;
    Bco.Cliente_SalvaOutros(idCli, impR,vSerie.Value, vPrazo.Value, vExtra.Value, estoq,iSMS, ct1,ct2, ct3, ocp);
    Bco.Destroy;
  end
  else ShowMessage('Escolha um Cliente');  
end;

procedure TcadCli.btCodMClick(Sender: TObject);

var cid, uf : String;

begin
  cid := edCidade.Text;
  uf  := cbUF.Items[cbUF.ItemIndex];

  IBGE.set_cid(cid);
  IBGE.set_uf(uf);
  IBGE.set_saida(1);
  IBGE.PesquisaFORA;
end;

procedure TcadCli.ckCTeClick(Sender: TObject);
begin
  cbCte.Visible := ckCTe.Checked;
  cbIE.Visible := ckCTe.Checked;
end;

procedure TcadCli.ckEstoqueClick(Sender: TObject);
begin
  btEstoqueC.Visible := (ckEstoque.Checked);
end;

procedure TcadCli.ckOCcliClick(Sender: TObject);
begin
  btOC.Visible := (ckOCcli.Checked);
end;

procedure TcadCli.btEstoqueCClick(Sender: TObject);
begin
  StokContrato.set_idCli(idCli);
  StokContrato.lbCli.Caption :=  lbAtual.Caption;
  stokContrato.Entrar;
  StokContrato.Show;
end;

end.
