unit ucadFuncs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, ExtCtrls, Grids, DBGrids, JvExStdCtrls, JvEdit,
  JvValidateEdit, StdCtrls, Buttons, Mask, ComCtrls, JvSpeedbar,
  JvExExtCtrls, JvExtComponent, jpeg, System.ImageList, IPPeerClient,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TcadFuncs = class(TForm)
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
    edNome: TEdit;
    edRG: TEdit;
    edCPF: TMaskEdit;
    tsEnder: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procCEP: TSpeedButton;
    Label19: TLabel;
    Label21: TLabel;
    edEnder: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edCEP: TEdit;
    cbUF: TComboBox;
    edNum: TJvValidateEdit;
    edComp: TEdit;
    tsTels: TTabSheet;
    Label13: TLabel;
    lbTels: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    edTel: TEdit;
    cbDesc: TComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label24: TLabel;
    btSubNovo: TSpeedButton;
    btSubSalvar: TSpeedButton;
    btSubApagar: TSpeedButton;
    tsTelefone: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    cbDesc2: TComboBox;
    edTel2: TEdit;
    edObs: TEdit;
    ImageList1: TImageList;
    dsBco: TDataSource;
    Panel3: TPanel;
    lbAtual: TLabel;
    edDetalhes: TEdit;
    tsCarro: TTabSheet;
    tsBanco: TTabSheet;
    Label3: TLabel;
    edPlaca: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    edDTnasc: TDateTimePicker;
    Label7: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edCH: TEdit;
    edCHvalid: TDateTimePicker;
    edCHcateg: TEdit;
    Label17: TLabel;
    edVeiculo: TEdit;
    Label18: TLabel;
    edAno: TJvValidateEdit;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label25: TLabel;
    btCar1: TSpeedButton;
    btCar2: TSpeedButton;
    btCar3: TSpeedButton;
    Panel4: TPanel;
    Label26: TLabel;
    btBco1: TSpeedButton;
    btBco2: TSpeedButton;
    btBco3: TSpeedButton;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edBconum: TEdit;
    edAgencia: TEdit;
    edFavorecido: TEdit;
    edCPFfavor: TMaskEdit;
    DBGrid3: TDBGrid;
    edBcoNome: TEdit;
    edConta: TEdit;
    dsCar: TDataSource;
    dsTel: TDataSource;
    Label33: TLabel;
    ListBancos: TListBox;
    cbSeguro: TCheckBox;
    Label34: TLabel;
    dtValSeguro: TDateTimePicker;
    cbConta: TComboBox;
    tsOutros: TTabSheet;
    Label35: TLabel;
    btPag: TBitBtn;
    Label36: TLabel;
    edDTficha: TDateTimePicker;
    Label37: TLabel;
    btPag2: TBitBtn;
    vPonto: TJvValidateEdit;
    Label38: TLabel;
    tsDigito: TTabSheet;
    Label39: TLabel;
    btDig1: TButton;
    Image1: TImage;
    imgDig1: TImage;
    Bevel1: TBevel;
    Label40: TLabel;
    btDig2: TButton;
    Image3: TImage;
    imgDig2: TImage;
    Bevel2: TBevel;
    Label41: TLabel;
    Label42: TLabel;
    vSalario: TJvValidateEdit;
    Label43: TLabel;
    edDTajuste: TDateTimePicker;
    lbid: TLabel;
    ckAtivo: TCheckBox;
    Label44: TLabel;
    edLibera: TEdit;
    Label45: TLabel;
    edRNTRC: TEdit;
    btRest: TBitBtn;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    LbREST: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edRGKeyDown(Sender: TObject; var Key: Word;
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
    procedure cbDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTelKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSubNovoClick(Sender: TObject);
    procedure btSubSalvarClick(Sender: TObject);
    procedure btSubApagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edDTnascKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCHvalidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCHcategKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBconumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edBcoNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAgenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFavorecidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPlacaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edVeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAnoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCPFfavorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btBco1Click(Sender: TObject);
    procedure btCar1Click(Sender: TObject);
    procedure btBco2Click(Sender: TObject);
    procedure btBco3Click(Sender: TObject);
    procedure btCar2Click(Sender: TObject);
    procedure btCar3Click(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure cbSeguroClick(Sender: TObject);
    procedure edDetalhesKeyPress(Sender: TObject; var Key: Char);
    procedure btPagClick(Sender: TObject);
    procedure btPag2Click(Sender: TObject);
    procedure btRestClick(Sender: TObject);
  private
    { Private declarations }
    idFuncs, idUser, idTel, idBco, idCar : integer;
  public
    { Public declarations }
    procedure set_idUser(i : integer);
    procedure set_idFuncs(i : integer);
    procedure set_tipo(i : Smallint);
  end;

var
  cadFuncs: TcadFuncs;
  Tab : String;
  tipo : Smallint;

implementation

{$R *.dfm}

{ TcadFuncs }

uses uDM1, uDM2, uBanco, uLib, upsqFuncs, uPagFunc, uPagFunc2;

procedure TcadFuncs.set_idUser(i: integer);
begin
  idUser := i;
end;


procedure Limpar_Tels();

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Tels_MostraId('F', 0);
  with cadFuncs do
  begin
    lbTels.Caption  := '';
    edDetalhes.Text := '';

    edTel.Text      := '';
  end;
end;

procedure Limpar_Carro();

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Tels_MostraId('F', 0);
  with cadFuncs do
  begin
    edPlaca.Text     := '';
    edVeiculo.Text   := '';
    edAno.Value      := 0;
    edLibera.Text    := '';
  end;
end;


procedure Limpar_Banco();

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Banco_MostraId(0);
  with cadFuncs do
  begin
    edBconum.Text     := '';
    edBcoNome.Text    := '';
    edAgencia.Text    := '';
    edconta.Text      := '';
    edFavorecido.Text := '';
    edCPFfavor.Text   := '___.___.___-__';
    cbConta.ItemIndex := 0;
  end;
end;

procedure Limpar;

begin
  with cadFuncs do
  begin
    PageControl1.ActivePage := tsContato;

    lbid.Caption   := '0';

    edNome.Text    := '';
    edCPF.Text     := '';
    edRG.Text      := '';
    edCPF.Text     := '   .   .   -  ';
    edDTnasc.DateTime := Now - 360*20;
    edDTFicha.DateTime := Now;
    edDTajuste.DateTime := Now;

    edCH.Text      := '';
    edCHcateg.Text := '';
    edCHvalid.DateTime := Now + 360;

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
    edRNTRC.Text := '';

    Limpar_Carro;
    Limpar_Banco;

    tsTels.TabVisible := false;

    edNome.SetFocus;
  end;
end;

procedure Carregar;

var usa : TMarco;
    bco : TBco;

begin
  usa := TMarco.Create;

  with cadFuncs do
  begin
    PageControl1.ActivePage := tsContato;

    edNome.Text    := DM1.cdsFuncsNOME.Value;
    edCPF.Text     := usa.Monta_DOC( DM1.cdsFuncsCPF.Value);
    edRG.Text      := DM1.cdsFuncsRG.Value;
    edDTnasc.DateTime := DM1.cdsFuncsDTNASC.AsDateTime;
    edDTFicha.DateTime:= DM1.cdsFuncsDTFICHA.AsDateTime;
    edDTAjuste.DateTime := DM1.cdsFuncsDTAJUSTE.AsDateTime;

    edCH.Text      := DM1.cdsFuncsCH.Value;
    edCHvalid.DateTime := DM1.cdsFuncsCHVALIDADE.AsDateTime;
    edCHcateg.Text := DM1.cdsFuncsCHCATEGORIA.Value;


    edCEP.Text     := DM1.cdsEnderCEP.Value;
    edEnder.Text   := DM1.cdsEnderENDER.Value;
    edNum.Value    := DM1.cdsEnderNUMERO.Value;
    edComp.Text    := DM1.cdsEnderCOMPLEMENTO.Value;
    edCidade.Text  := DM1.cdsEnderCIDADE.Value;
    edBairro.Text  := DM1.cdsEnderBAIRRO.Value;
    usa.Combo_Pos(cbUF, DM1.cdsEnderESTADO.Value);

    cbDesc.ItemIndex := 0;
    edTel.Text    := '';

    tsTels.TabVisible := true;
    tsTelefone.TabVisible := false;

    edObs.Text       := DM1.cdsFuncsOBS.Value;
    cbSeguro.Checked := (DM1.cdsFuncsSEG.Value=1);
    vPonto.Value     := DM1.cdsFUNCSvPONTO.AsFloat;
    vSalario.Value   := DM1.cdsFUNCsSalario.AsFloat;

    edRNTRC.Text     := DM1.cdsFuncsRNTRC.Value;

    lbid.Caption := DM1.cdsFuncsID.AsString;
    ckAtivo.Checked := (DM1.cdsFuncsATIVO.Value = 1);


    if (cbSeguro.Checked) then
    begin
      Label34.Visible := true;
      dtValSeguro.Visible := true;
      if (DM1.cdsFuncsSEGVALIDADE.Value<>null) then
        dtValSeguro.DateTime := DM1.cdsFuncsSEGVALIDADE.Value
      else
        dtValSeguro.DateTime := StrToDateTime('01/01/2010');
    end
    else
    begin
      Label34.Visible := false;
      dtValSeguro.Visible := false;
    end;
    Limpar_banco;
    Limpar_Carro;
    Limpar_tels;

    bco := TBco.Create;
    bco.Banco_MostraTodos(cadFuncs.idFuncs);
    bco.Tels_MostraTodos(Tab,cadFuncs.idFuncs);
    bco.Carro_MostraTodos(cadFuncs.idFuncs);
    bco.Destroy;
    
    edNome.SetFocus;
  end;
end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  if (cadFuncs.idFuncs > 0) then
  begin
    bco.Funcs_MostraId(cadFuncs.idFuncs);
    bco.Enderecos_MostraId(Tab, cadFuncs.idFuncs);
    bco.Tels_MostraTodos(Tab,cadFuncs.idFuncs);
    bco.Banco_MostraTodos(cadFuncs.idFuncs);
    if (tipo = 1) then bco.Carro_MostraTodos(cadFuncs.idFuncs);
  end;

  Carregar;
  bco.Destroy;
end;

procedure Guia_Tels;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Tels_MostraTodos(Tab,cadFuncs.idFuncs);
  cadFuncs.PageControl1.ActivePage := cadFuncs.tsTels;

  if (DM1.cdsTel.RecordCount > 0) then
  begin
    if (DM1.cdsTel.RecordCount = 1) then cadFuncs.lbTels.Caption := '1 telefone'
      else
      cadFuncs.lbTels.Caption := IntToStr(DM1.cdsTel.RecordCount) + ' telefones';
  end;
  bco.Destroy;
end;

procedure Salvar;

var bco : Tbco;
    usa : TMarco;
    seg, atv : Smallint;

begin
  bco := TBco.Create;
  usa := TMarco.Create;

  with cadFuncs do
  begin
    Seg := 0;
    atv := 1;
    if not ckAtivo.Checked  then atv := 0;
    

    // Altera
    if (idFuncs > 0) then
    begin
      if (cbSeguro.Checked) then Seg := 1;
      bco.Funcs_Altera(idFuncs, edNome.Text, usa.Formata_DOC(edcpf.Text), edrg.Text, edObs.Text, edch.Text, edCHcateg.Text,idUser,Seg, dtValSeguro.DateTime, edCHvalid.DateTime, edDTNasc.DateTime, edDTficha.DateTime,edDTAjuste.DateTime, vPonto.Value, vSalario.Value, edRNTRC.Text, atv );
      bco.Enderecos_MostraId(Tab, idFuncs);
      if (DM1.cdsEnder.RecordCount = 0) then bco.Enderecos_Insere(Tab, idFuncs);
      bco.Enderecos_Altera(Tab, idFuncs, edEnder.Text, edNum.Value, edComp.Text,edBairro.Text, edCidade.Text, cbUF.Items[cbUF.itemindex],edCEP.Text, '3550308');
    end;

    // Novo
    if (idFuncs = 0) then
    begin
      if (cbSeguro.Checked) then Seg := 1;
      bco.Funcs_Insere(edNome.Text,usa.Formata_DOC( edcpf.Text), edrg.Text, edObs.Text,  idUser,  edDTnasc.DateTime, edDTficha.DateTime, tipo,  edCH.Text,  edCHcateg.Text,edCHvalid.DateTime,Seg, dtValSeguro.DateTime,edDTAjuste.DateTime,edRNTRC.Text, vPonto.Value);
      idFuncs := bco.Funcs_Ultimo;
      bco.Enderecos_Insere(Tab, idFuncs);
      bco.Tels_Insere(Tab,idFuncs,cbDesc2.Items[cbDesc2.itemindex],edTel2.Text, edDetalhes.Text);
      tsTelefone.TabVisible := false;
      tsTels.TabVisible     := true;
    end;


  end;
  bco.Destroy;
  Atualiza;
  Guia_tels;
end;





procedure TcadFuncs.FormActivate(Sender: TObject);
var usa : TMarco;

begin
  usa := TMarco.Create;
  Tab := 'F';
  usa.Combo_Preenche(cbUF, 'mluf.mzi');
  usa.Combo_Preenche(cbDesc,'mltel.mzi' );
  usa.Combo_Preenche(cbDesc2,'mltel.mzi' );
  if (idFuncs = 0) then
  begin
    Limpar;
    lbAtual.Caption := 'nenhum Funcionário escolhido';
  end
  else
  begin
    Guia_Tels;
    Atualiza;

    lbAtual.Caption := DM1.cdsFuncsNOME.Value;
  end;

end;

procedure TcadFuncs.set_idFuncs(i: integer);
begin
  idFuncs := i;
end;

procedure TcadFuncs.btNovoClick(Sender: TObject);
begin
  Limpar;
  idFuncs := 0;
  
end;

procedure TcadFuncs.btSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TcadFuncs.btApagarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if (idFuncs > 0 ) then
  begin
    if MessageDlg('Tem certeza que deseja apagar o Funcionário?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        bco.Funcs_Apaga(idFuncs);
      end;

    Limpar;
    idFuncs := 0;
  end
  else ShowMessage('Não há o que apagar!');

  bco.Destroy;
end;

procedure TcadFuncs.btPesqClick(Sender: TObject);
begin
  psqFuncs.set_tipo(tipo);
  psqFuncs.set_saida(1); 
  psqFuncs.Show;
end;

procedure TcadFuncs.btRestClick(Sender: TObject);
  var base, dados, resp, msg : string;
      usa : TMarco;
begin
  usa := TMarco.Create;
  usa.Le_INI;
  base := usa.get_RestServ2+'/api/Motorista';
  usa.Destroy;

  dados := 'numero='+DM1.cdsFuncsID.AsString+'&nome='+DM1.cdsFuncsNOME.Value+'&permissao=778526969';
  // Usando GET para Gravar
  lbREST.Caption :=  base;
  RESTClient1.BaseURL := base +'?'+ dados;
  RESTRequest1.Execute;
  resp := RESTResponse1.Content;
  if resp = '1' then msg := 'Permissão não confere!  ';
  if resp = '2' then msg := 'O motorista '+DM1.cdsFuncsNOME.Value+' já está cadastrado ';
  if resp = '3' then msg := 'Erro ao gravar na WEB! ';
  if resp = '4' then msg := 'O motorista '+DM1.cdsFuncsNOME.Value+' foi cadastrado com sucesso! ';
  if resp = '0' then msg := 'ERRO Desconhecido, operação não efetuada! ';
  ShowMessage(msg);



end;

procedure TcadFuncs.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=13) then edCPF.SetFocus;
end;

procedure TcadFuncs.edCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=13) then edRG.SetFocus;
end;

procedure TcadFuncs.edRGKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(key=13) then
  begin
    //PageControl1.ActivePage := tsEnder;
    edDTnasc.SetFocus;

  end;
end;

procedure Pesquisa_CEP;

var bco : Tbco;
    usa : TMarco;

begin
  bco := TBco.Create;
  bco.CEP_Procura(cadFuncs.edCEP.Text);
  usa := TMarco.Create;

  if (DM1.cdsCEP.RecordCount > 0) then
  begin
    with cadFuncs do
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
  cadFuncs.edEnder.SetFocus;

  bco.Destroy;

end;

procedure TcadFuncs.edCEPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Length(edCEP.Text) = 8) then Pesquisa_CEP;
end;

procedure TcadFuncs.procCEPClick(Sender: TObject);
begin
  if (Length(edCEP.Text) = 8) then Pesquisa_CEP;
end;

procedure TcadFuncs.edEnderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edNum.SetFocus;

end;

procedure TcadFuncs.edNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edComp.SetFocus;
end;

procedure TcadFuncs.edCompKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edBairro.SetFocus;
end;

procedure TcadFuncs.edBairroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (key = 13) then edCidade.SetFocus;
end;

procedure TcadFuncs.edCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then cbUF.SetFocus;
end;

procedure TcadFuncs.cbUFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
  if (tsTelefone.TabVisible) then  PageControl1.ActivePage := tsTelefone
    else if (tsTels.TabVisible) then  PageControl1.ActivePage := tsTels;
  end;
end;

procedure TcadFuncs.cbDesc2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edTel2.SetFocus;

end;

procedure TcadFuncs.edTel2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    PageControl1.ActivePage := tsBanco;
    edBconum.SetFocus;
  end;
end;

procedure TcadFuncs.edObsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then Salvar;
end;

procedure TcadFuncs.cbDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edTel.SetFocus;
end;

procedure TcadFuncs.edTelKeyDown(Sender: TObject; var Key: Word;
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
        bco.Tels_Insere(Tab,idFuncs,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
        bco.Tels_MostraTodos(Tab, idFuncs);
        edTel.Text := '';
      end
      else
      begin
        bco.Tels_Altera(Tab,idTel,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
        bco.Tels_MostraTodos(Tab, idFuncs);
        edTel.Text := '';
      end;
    Guia_tels;
    end;
    cbDesc.SetFocus;
    idTel := 0;
  end;
  bco.Destroy;
end;

procedure TcadFuncs.btSubNovoClick(Sender: TObject);
begin

  idTel := 0;
  Limpar_Tels;
  cbDesc.SetFocus;
end;

procedure TcadFuncs.btSubSalvarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if (edTel.Text <> '') then
  begin
    if (idTel=0) then
    begin
      bco.Tels_Insere(Tab,idFuncs,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
      bco.Tels_MostraTodos(Tab, idFuncs);
      edTel.Text := '';
    end
    else
    begin
      bco.Tels_Altera(Tab,idTel,cbDesc.Items[cbDesc.Itemindex], edTel.Text, edDetalhes.Text);
      bco.Tels_MostraTodos(Tab, idFuncs);
      edTel.Text := '';
    end;
    Guia_tels;
  end;
  cbDesc.SetFocus;
  idTel := 0;
end;

procedure TcadFuncs.btSubApagarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if MessageDlg('Tem certeza que deseja apagar o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idTel := DM1.cdsTelID.Value;
      bco.Tels_Apaga(Tab,idtel);
      Guia_tels;
    end;
  bco.Destroy;
end;

procedure TcadFuncs.DBGrid1DblClick(Sender: TObject);
var usa : TMarco;

begin
  usa := TMarco.Create;

  idTel           := DM1.cdsTelID.Value;
  edTel.Text      := DM1.cdsTelNUMERO.Value;
  usa.Combo_Pos(cbDesc, DM1.cdsTelDESCRICAO.Value);
  edDetalhes.Text := DM1.cdsTelDETALHE.Value;
end;

procedure TcadFuncs.edDTnascKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edCH.SetFocus;
end;

procedure TcadFuncs.edCHvalidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edCHcateg.SetFocus;

end;

procedure TcadFuncs.edCHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edCHvalid.SetFocus;

end;

procedure TcadFuncs.edCHcategKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    PageControl1.ActivePage := tsEnder;
    edCEP.SetFocus;
  end;
end;

procedure TcadFuncs.edBconumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var i : Integer;
    S : String;

begin
  if (key = 13) then
  begin
    getDir(0, S);
    ListBancos.Clear;
    ListBancos.Items.LoadFromFile(S+'\Listas\MBCOS.MZI');
    for i := 0 to  ListBancos.Items.Count - 1 do
    if (copy(ListBancos.Items[i], 1, 3) = edBconum.Text) then edBcoNome.Text := copy(ListBancos.Items[i], 5, Length(ListBancos.Items[i]));
    edBconome.SetFocus;
  end;
end;

procedure banco_Salvar();
var bco : Tbco;

begin
  with cadFuncs do
  begin
    bco := TBco.Create;
    if (edAgencia.Text <> '') and (edConta.Text <> '') then
    begin
      if (idBco=0) then
      begin
        bco.Banco_Insere(idFuncs,edBconum.Text, copy(edBcoNome.Text,1,20),edAgencia.Text , edConta.Text, edCPFfavor.Text,edFavorecido.Text, cbConta.ItemIndex);
      end
      else
      begin
        bco.Banco_Altera(idBco,edBconum.Text, copy(edBcoNome.Text,1,20),edAgencia.Text , edConta.Text, edCPFfavor.Text,edFavorecido.Text, cbConta.ItemIndex);
      end;

      Limpar_Banco;
      edBconum.SetFocus;
      bco.Banco_MostraTodos(cadFuncs.idFuncs);
      DM1.cdsFBco.Refresh;
      DBGrid1.Refresh;

    end;
    bco.Destroy;
  end;  
end;


procedure TcadFuncs.edBcoNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edAgencia.SetFocus;
end;

procedure TcadFuncs.edAgenciaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edConta.SetFocus;
end;

procedure TcadFuncs.edContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edFavorecido.SetFocus;
end;

procedure TcadFuncs.edFavorecidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edCPFfavor.SetFocus;

end;

procedure TcadFuncs.edPlacaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edVeiculo.SetFocus;

end;

procedure TcadFuncs.edVeiculoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edAno.SetFocus;

end;

procedure carro_Salvar();

var bco : Tbco;

begin
  with cadFuncs do
  begin
    bco := TBco.Create;
    if (edplaca.Text <> '') then
    begin
      if (idCar=0) then
      begin
        bco.Carro_Insere(idFuncs, edPlaca.Text, edVeiculo.Text, edLibera.Text, StrToInt(edAno.Text));
        bco.Carro_MostraTodos(idFuncs);
      end
      else
      begin
        bco.Carro_Altera(idCar, edPlaca.Text, edVeiculo.Text, edLibera.Text,StrToInt(edAno.Text));
        bco.Carro_MostraTodos(idFuncs);
      end;

    end;
    Limpar_Carro;
    edPlaca.SetFocus;
  end;  
end;


procedure TcadFuncs.edAnoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    carro_Salvar;
    edObs.SetFocus;
  end;

end;

procedure TcadFuncs.edCPFfavorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
    banco_Salvar;
    PageControl1.ActivePage := tsCarro;
    edPlaca.SetFocus;
  end;
end;

procedure TcadFuncs.btBco1Click(Sender: TObject);
begin
  idBco := 0;
  Limpar_Banco;
  edBconum.SetFocus;
end;

procedure TcadFuncs.btCar1Click(Sender: TObject);
begin
  idcar := 0;
  Limpar_Carro;
  edPlaca.SetFocus;
end;



procedure TcadFuncs.btBco2Click(Sender: TObject);

begin
  banco_Salvar;
end;

procedure TcadFuncs.btBco3Click(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if MessageDlg('Tem certeza que deseja apagar o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idBco := DM1.cdsFBcoID.Value;
      bco.Banco_Apaga(idBco);
      bco.Banco_MostraTodos(idFuncs);
    end;
  bco.Destroy;
end;

procedure TcadFuncs.btCar2Click(Sender: TObject);
var bco : Tbco;

begin
  carro_Salvar;

end;

procedure TcadFuncs.btCar3Click(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  if MessageDlg('Tem certeza que deseja apagar o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idCar := DM1.cdsFCarID.Value;
      bco.Carro_Apaga(idCar);
    end;
  bco.Destroy;

end;

procedure TcadFuncs.DBGrid3DblClick(Sender: TObject);

var usa : TMarco;

begin
  usa := TMarco.Create;

  idBco             := DM1.cdsFBcoID.Value;
  edBconum.Text     := DM1.cdsFBcoBCONUM.Value;
  edBcoNome.Text    := DM1.cdsFBcoBCONOME.Value;
  edAgencia.Text    := DM1.cdsFBcoAGENCIA.Value;
  edConta.Text      := DM1.cdsFBcoCONTA.Value;
  edFavorecido.Text := DM1.cdsFBcoFAVORECIDO.Value;
  edCPFfavor.Text   := DM1.cdsFBcoCPF.Value;
  cbConta.ItemIndex := DM1.cdsFBcoTIPOCC.Value;

  usa.Destroy;
end;

procedure TcadFuncs.DBGrid2DblClick(Sender: TObject);
begin
  idCar          := DM1.cdsFCarID.Value;
  edPlaca.Text   := DM1.cdsFCarPLACA.Value;
  edVeiculo.Text := DM1.cdsFCarVEICULO.Value;
  edAno.Text     := DM1.cdsFCarANO.AsString;
  edLibera.Text  := DM1.cdsFCarCODLIBERA.AsString;
end;

procedure TcadFuncs.set_tipo(i: Smallint);

var s: String;

begin
  tipo := i;
  if (tipo = 0) then S := 'Funcionários';
  if (tipo = 1) then S := 'Motoristas';
  if (tipo = 2) then S := 'Ajudantes';

  CadFuncs.Caption := 'Cadastro de ' + S;

  tsCarro.TabVisible  := false;
  btPag.Enabled       := false;
  Label45.Visible     := false;
  edRNTRC.Visible     := false;

  if (tipo = 1) then
  begin
    tsCarro.TabVisible  := true;
    btPag.Enabled       := true;
    Label45.Visible     := true;
    edRNTRC.Visible     := true;

  end;  

end;

procedure TcadFuncs.cbSeguroClick(Sender: TObject);
begin
  if (cbSeguro.Checked) then
  begin
    Label34.Visible := true;
    dtValSeguro.Visible := true;
    if (DM1.cdsFuncsSEGVALIDADE.Value<>null) then
      dtValSeguro.DateTime := DM1.cdsFuncsSEGVALIDADE.Value
    else
      dtValSeguro.DateTime := StrToDateTime('01/01/2010');

  end
  else
  begin
    Label34.Visible := false;
    dtValSeguro.Visible := false;
  end;

end;

procedure TcadFuncs.edDetalhesKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edTel.SetFocus;
end;

procedure TcadFuncs.btPagClick(Sender: TObject);
begin
  if (idFuncs > 0) then
  begin
    PagFunc.set_idMot(idFuncs);
    PagFunc.lbMot.Caption := lbAtual.Caption;
    if (PagFunc.cbLocal.ItemIndex = -1) then
      PagFunc.cbLocal.ItemIndex := 0;
    PagFunc.Show;
  end
  else
  ShowMessage('É ncessário escolher um Motorista');

end;

procedure TcadFuncs.btPag2Click(Sender: TObject);
begin
  if (idFuncs > 0) then
  begin
    PagFunc2.set_idMot(idFuncs);
    PagFunc2.lbMot.Caption := lbAtual.Caption;
    if (PagFunc2.cbLocal.ItemIndex = -1) then
      PagFunc2.cbLocal.ItemIndex := 0;
    PagFunc2.Show;
  end
  else
  ShowMessage('É ncessário escolher um Motorista');

end;

end.
