unit veCadatro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.CategoryButtons, Vcl.WinXCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Data.DB,
  Vcl.Buttons, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Mask, JvMemoryDataset;

type
  TeCadastro = class(TForm)
    ActionList1: TActionList;
    actCli: TAction;
    actProd: TAction;
    actKits: TAction;
    imlIcons: TImageList;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    PageControl1: TPageControl;
    tsCli: TTabSheet;
    tsProd: TTabSheet;
    TabSheet3: TTabSheet;
    Action1: TAction;
    Label1: TLabel;
    JvDBGrid1: TJvDBGrid;
    dsCli: TJvDataSource;
    Label2: TLabel;
    cbcPadrao: TComboBox;
    btNovo: TBitBtn;
    CliPanel: TPanel;
    cbcCli: TComboBox;
    Label3: TLabel;
    btcInserir: TBitBtn;
    btGravar: TBitBtn;
    JvDBGrid2: TJvDBGrid;
    dsProd: TJvDataSource;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    Label4: TLabel;
    lbPadrao: TLabel;
    ProdPanel1: TPanel;
    Panel2: TPanel;
    JvDBGrid3: TJvDBGrid;
    JvDBGrid4: TJvDBGrid;
    Panel1: TPanel;
    Panel3: TPanel;
    ProdPanel2: TPanel;
    pbtInsere: TBitBtn;
    pbtAlterar: TBitBtn;
    Label6: TLabel;
    pedLongo: TEdit;
    Label7: TLabel;
    pedCurto: TEdit;
    Label8: TLabel;
    pckValidade: TCheckBox;
    pckFIFO: TCheckBox;
    Label9: TLabel;
    pedClass1: TEdit;
    Label10: TLabel;
    pedClass2: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    pedClass3: TEdit;
    pedClass4: TEdit;
    piMinP: TJvValidateEdit;
    piPalete: TJvValidateEdit;
    Label13: TLabel;
    Bevel1: TBevel;
    pbtSalvar1: TBitBtn;
    Label14: TLabel;
    pedCodB: TEdit;
    Label15: TLabel;
    pedCodC: TEdit;
    Label16: TLabel;
    pedCodT: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    pedUnid: TEdit;
    piItens: TJvValidateEdit;
    piMinU: TJvValidateEdit;
    JvDBGrid5: TJvDBGrid;
    pbtSalvarP: TSpeedButton;
    pbtSalvarU: TSpeedButton;
    pbtVoltar: TSpeedButton;
    pbtNovoU: TSpeedButton;
    plbContaL: TLabel;
    plbContaC: TLabel;
    pLbSalvo1: TLabel;
    dsProdS2: TDataSource;
    plbSalvo2: TLabel;
    pckAtivo: TCheckBox;
    dsProdS: TJvDataSource;
    pLbSel: TLabel;
    ckEmite: TCheckBox;
    edCNPJ: TMaskEdit;
    Label5: TLabel;
    cli_altera: TPanel;
    Label20: TLabel;
    cli_ID: TLabel;
    cli_nome: TLabel;
    cli_ckalt: TCheckBox;
    Label21: TLabel;
    cli_ckaltativo: TCheckBox;
    cli_altcnpj: TMaskEdit;
    cli_btcvoltar: TSpeedButton;
    cli_btcsalvar: TSpeedButton;
    tsKit: TTabSheet;
    Label22: TLabel;
    pbtImporta: TBitBtn;
    Label23: TLabel;
    pedNome: TEdit;
    Label24: TLabel;
    pedQtEstoque: TLabel;
    pedBtQt: TSpeedButton;
    Label25: TLabel;
    pedLbTot: TLabel;
    Panel4: TPanel;
    Label26: TLabel;
    edPesq: TEdit;
    btPesq: TSpeedButton;
    ProdTemp: TJvMemoryData;
    dsProdTemp: TJvDataSource;
    JvDBGrid6: TJvDBGrid;
    ProdTempid: TIntegerField;
    ProdTempProduto: TStringField;
    ProdTempNomeCurto: TStringField;
    ProdTempMinima: TIntegerField;
    ProdTempQuant: TIntegerField;
    ProdTempCodCli: TStringField;
    lbErro: TLabel;
    pbApagar: TSpeedButton;
    procedure imgMenuClick(Sender: TObject);
    procedure actCliExecute(Sender: TObject);
    procedure actProdExecute(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btcInserirClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure pedLongoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pedCurtoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pbtSalvar1Click(Sender: TObject);
    procedure pbtSalvarUClick(Sender: TObject);
    procedure pbtNovoUClick(Sender: TObject);
    procedure pbtInsereClick(Sender: TObject);
    procedure pbtAlterarClick(Sender: TObject);
    procedure pbtVoltarClick(Sender: TObject);
    procedure JvDBGrid3CellClick(Column: TColumn);
    procedure pbtSalvarPClick(Sender: TObject);
    procedure JvDBGrid5DblClick(Sender: TObject);
    procedure cli_ckaltClick(Sender: TObject);
    procedure ckEmiteClick(Sender: TObject);
    procedure cli_btcvoltarClick(Sender: TObject);
    procedure cli_btcsalvarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure actKitsExecute(Sender: TObject);
    procedure pbtImportaClick(Sender: TObject);
    procedure pedBtQtClick(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure edPesqKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid6CellClick(Column: TColumn);
    procedure pbApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure ProdutoTempMostrar();
    procedure SelecionarProduto;
  end;

var
  eCadastro: TeCadastro;
  idProd, idPs : Integer;

implementation

{$R *.dfm}

uses veDM, veBanco, gBanco, uDM2, uLib, Global, veImportaP, vejAltQUant;

function ckI(b:boolean):Smallint;
  var resp : Smallint;
begin
  resp := 0;
  if b then resp := 1;
  result := resp;
end;

procedure MostraSubs(idP : integer);
begin
  Bce := TBce.Create;
  Bce.Prod_fSubIDP(idP);
  Bce.Destroy;
end;

procedure CBClientes;

begin
  eCadastro.cbcCli.Clear;
  DM2.DBCb_Preenche(eCadastro.cbcCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  eCadastro.cbcCli.ItemIndex := 0;
end;

procedure Atualiza;
  var Bce : TBce;
      Bcg : TBcg;
begin
  Bce := TBce.Create;
  Bce.Cli_fMostrarF(2,0);

  if eDM.cdsCli.RecordCount> 0 then
  begin
    eCadastro.cbcPadrao.Clear;
    Bce.Cli_PreencheCB(eCadastro.cbcPadrao);
    Bce.Cli_PadraoCB(eCadastro.cbcPadrao);
    //eCadastro.Label2.Caption := Bce.Cli_Padrao;
  end;
  Bce.destroy;

end;

procedure InsereCliente;
  var idc : Integer;
    s : String;
begin

  s := '0';
  if eCadastro.ckEmite.Checked  then  s := eCadastro.edCNPJ.Text;

  idc := DM2.DBCp_leid(eCadastro.cbcCli.Items[eCadastro.cbcCli.ItemIndex], 'TB_CLIENTE', 'NOME');
  if (idc > 0) then
  begin
    Bce := TBce.Create;
    if not (Bce.Cli_existe(idc)) then
      Bce.Cli_Inserir(idc, eCadastro.cbcCli.Items[eCadastro.cbcCli.ItemIndex], s);
    Bce.Destroy;
  end;
end;

procedure Grava_Padrao;

var idc : Integer;
    usa : TMarco;
begin
  Bcg := TBcg.Create;
  idc := Bcg.oiCp_leid(eCadastro.cbcPadrao.Items[eCadastro.cbcPadrao.Itemindex], 'TBE_CLIENTE', 'NOME', eDM.sdsTMPe, eDM.cdsTMPe);
  Bcg.Destroy;

  if idc > 0 then
  begin
    usa := TMarco.Create;
    usa.set_cliStok(idc);
    usa.Grava_INI(6);
    usa.Destroy;

    eCli := idc;
  end;
end;


procedure TeCadastro.actCliExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TeCadastro.actKitsExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 2;
end;

procedure TeCadastro.actProdExecute(Sender: TObject);
begin
    PageControl1.TabIndex := 1;
end;

procedure TeCadastro.BitBtn1Click(Sender: TObject);
begin
  Bcg := TBcg.Create;
  Bcg.sqlPuro(Edit1.Text);
  Bcg.Destroy;
end;

procedure TeCadastro.btcInserirClick(Sender: TObject);
begin
  InsereCliente;
  Atualiza;
  CliPanel.Visible := false;
end;

procedure TeCadastro.btGravarClick(Sender: TObject);
begin
  Grava_Padrao;
end;

procedure TeCadastro.btNovoClick(Sender: TObject);
begin
  CBClientes;
  CliPanel.Visible := true;
end;

procedure Pesquisar();
  var prim : String;
      sAlvo: String;
      idP  : Integer;
      achou : Boolean;
begin

  if (length(eCadastro.edPesq.Text)>1) then
  with eCadastro do
  begin
    eCadastro.lbErro.Caption := '';
    sAlvo := edPesq.Text;
    prim := copy(sAlvo,1,1);

    if (prim='#') or (prim='@') then
    begin
      sAlvo := copy(sAlvo,2, length(sAlvo)-1);
      eDM.cdsProdS.Filtered := false;
      eDM.cdsProdS.First;
      if (prim='#') then achou := eDM.cdsProdS.Locate('CODTRANSP',StrToInt(sAlvo), [] );
      if (prim='@') then achou := eDM.cdsProdS.Locate('CODCLI',StrToInt(sAlvo), [] );
      if (achou)  then
      begin
        eDM.cdsProd.Locate('id',eDM.cdsProdSLIGPROD.Value, [] );
        ProdTemp.Locate('id',eDM.cdsProdSLIGPROD.Value, [] );
      end
      else eCadastro.lbErro.Caption := 'x '+ sAlvo;

      MostraSubs(eDM.cdsProdSLIGPROD.Value);
      pbtAlterar.Visible := true;
    end
    else
      ProdTemp.Locate('Produto',sAlvo, [loCaseInsensitive, loPartialKey] );
      eDM.cdsProd.Locate('NomeLongo',sAlvo, [loCaseInsensitive, loPartialKey] );
      idProd :=  ProdTempID.Value;
      MostraSubs(idProd);
    end;
end;



procedure TeCadastro.btPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TeCadastro.ckEmiteClick(Sender: TObject);
begin
  Label5.Visible := ckEmite.Checked;
  edCNPJ.Visible := ckEmite.Checked;
end;

procedure TeCadastro.cli_btcsalvarClick(Sender: TObject);
  var Bce : TBce;
      s : String;
begin
  s := '0';
  if cli_ckalt.Checked then s := cli_altcnpj.Text;

  Bce := TBce.Create;
  Bce.Cli_Alterar(eDM.cdsCliID.Value, ckI(cli_ckaltativo.Checked), s);
  Bce.Destroy;
  cli_altera.Visible := false;
end;

procedure TeCadastro.cli_btcvoltarClick(Sender: TObject);
begin
  cli_altera.Visible := false;
  pLbSel.Caption := '';
end;

procedure TeCadastro.cli_ckaltClick(Sender: TObject);
begin
  Label21.Visible := cli_ckalt.Checked;
  cli_altcnpj.Visible := cli_ckalt.Checked;
end;

procedure TeCadastro.edPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13)  then Pesquisar;

end;

procedure TeCadastro.Entrar;
begin
  lbPadrao.Caption := '-';
  if eCli > 0 then
  begin
    Bce := TBce.Create;
    lbPadrao.Caption := Bce.Cli_Padrao;
    Bce.Prod_Mostrar(eCli);
    Bce.Prod_SubMostrar(eCli);
    Bce.Destroy;
    ProdutoTempMostrar;
    pLbSel.Caption := '';

  end;
  Atualiza;
  CliPanel.Visible := false;
  ProdPanel2.Visible := false;
end;

procedure TeCadastro.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;


////// PRODUTOS
// ================================================

procedure Produtos_Modo(n:Smallint);

begin
  with eCadastro do
  begin
    if n=1 then
    begin
      pbtSalvarP.Visible := false;
      pbtSalvarU.Visible := false;
      pbtNovoU.Visible := false;
      JvDBGrid5.Visible := false;
      pbtAlterar.Visible := false;
    end;

    if n=2 then
    begin
      pbtSalvarP.Visible := true;
      pbtSalvarU.Visible := true;
      pbtNovoU.Visible := true;
      JvDBGrid5.Visible := true;
    end;

  end;

end;

procedure Produtos_LimparP();
begin
  with eCadastro do
  begin
    pedLongo.Text := '';
    pedCurto.Text := '';
    pedClass1.Text := '';
    pedClass2.Text := '';
    pedClass3.Text := '';
    pedClass4.Text := '';
    piMinP.Value := 0;
    piPalete.Value := 100;
    pckValidade.Checked := false;
    pckFIFO.Checked := false;
    plbContaL.Caption := '';
    plbContaC.Caption := '';
    pLbSalvo1.Caption := '';

    pckAtivo.Checked := true;
  end;
end;

procedure Produtos_PreencheP();
begin
  with eCadastro do
  begin
    idProd := eDM.cdsProdID.Value;
    pedLongo.Text := eDM.cdsProdNOMELONGO.Value;
    pedCurto.Text := eDM.cdsProdNOMECURTO.Value;
    pedClass1.Text := eDM.cdsProdCLASSIF1LOCAL.Value;
    pedClass2.Text := eDM.cdsProdCLASSIF2.Value;
    pedClass3.Text := eDM.cdsProdCLASSIF3.Value;
    pedClass4.Text := eDM.cdsProdCLASSIF4.Value;
    piMinP.Value := eDM.cdsProdQUANTMIN.Value;
    piPalete.Value := eDM.cdsProdQTPALETE.Value;
    pckValidade.Checked := (eDM.cdsProdBVALIDADE.Value = 1);
    pckFIFO.Checked := (eDM.cdsProdBFIFO.Value = 1);
    pckAtivo.Checked := (eDM.cdsProdATIVO.Value = 1);
    pedLbTot.Caption := eDM.cdsProdQUANTIDADE.AsString;
  end;
end;

procedure Produtos_LimparU();
begin
  with eCadastro do
  begin
    pedNome.Text := '';
    pedUnid.Text := '';
    pedCodB.Text := '';
    pedCodC.Text := '';
    pedCodT.Text := '';
    piMinU.Value := 0;
    piItens.Value := 1;
    pLbSalvo2.Caption := '';
  end;
end;

procedure Produtos_PreencheU();
  var  parte:TArray<string>;
begin
  with eCadastro do
  begin
    parte := eDM.cdsProdSNOMESUB.AsString.Split(['|']);
    pedNome.Text := parte[1];
    pedUnid.Text := eDM.cdsProdSUNIDADE.Value;
    pedCodB.Text := eDM.cdsProdSCODBARRAS.Value;
    pedCodC.Text := eDM.cdsProdSCODCLI.Value;
    pedCodT.Text := eDM.cdsProdSCODTRANSP.Value;
    piMinU.Value := eDM.cdsProdSQUANTSUBMIN.Value;
    piItens.Value := eDM.cdsProdSQUANTUM.Value;
    pedQtEstoque.Caption := eDM.cdsProdSQUANTSUB.AsString;
  end;
end;

procedure Produtos_Iniciar;

begin
  Produtos_LimparP;
  Produtos_LimparU;
end;

procedure AtualizaU(idproduto:Integer);
  var Bce : TBce;
begin
  Bce := TBce.Create;
  Bce.Prod_SubMostrar(eCli);
  Bce.Prod_fSubIDP(idProduto);
  Bce.Destroy;
end;

procedure TeCadastro.pbtAlterarClick(Sender: TObject);
begin
  idProd := eDM.cdsProdID.Value;
  Produtos_Iniciar;
  Produtos_PreencheP;

  Produtos_Modo(2);
  ProdPanel1.Visible := false;
  ProdPanel2.Visible := true;
end;

procedure TeCadastro.pbtImportaClick(Sender: TObject);
begin
  eImportaPr.Entrar;
  eImportaPr.Show;
end;

procedure TeCadastro.pbtInsereClick(Sender: TObject);
begin
  idProd := 0;
  Produtos_Iniciar;
  Produtos_Modo(1);
  ProdPanel1.Visible := false;
  ProdPanel2.Visible := true;
  JvDBGrid5.Visible := false;
end;

procedure TeCadastro.pbtNovoUClick(Sender: TObject);
begin
  // Novo Unidades
  Produtos_LimparU;
  idPs := 0;
  pedNome.SetFocus;
end;

procedure TeCadastro.pbtSalvar1Click(Sender: TObject);
var Bce : TBce;
    at, vali, fifo : Smallint;
begin
  Bce := TBce.Create;

  // Salvar NOVO item completo
  if eCli > 0 then
  begin
    Bce.Prod_Mostrar(eCli);
    // verifica se já existe o Nome Longo
    if Bce.Prod_fID(pedLongo.Text) = 0 then
    begin

      at := 1; vali := 0; fifo := 0;
      if not pckAtivo.Checked  then at := 0;
      if pckFIFO.Checked then fifo := 1;
      if pckValidade.Checked then
      begin
        fifo := 1;
        vali := 1;
      end;
      Bce.Prod_Inserir(pedLongo.Text, pedCurto.Text, pedClass1.Text, pedClass2.Text,
        pedClass3.Text,pedClass4.Text, at, vali,fifo, piMinP.Value, piPalete.Value, eCli );
      idProd := Bce.Prod_fID(pedLongo.Text);
      Bce.Prod_SubInserir(eCli, idProd, pedCurto.Text +'|'+ pedNome.Text, pedCodB.Text, pedCodC.Text,
        pedCodT.Text, pedUnid.Text, at, piMinU.Value, piItens.Value);

    end
    else ShowMessage('Já existe o produto '+#13+ pedLongo.Text);
    Bce.Prod_fMostrarTodos;
    Bce.Prod_SubMostrar(eCli);
    Bce.Prod_fSubIDP(idProd);
    Bce.Destroy;
    ProdutoTempMostrar;
    Produtos_Modo(1);
    ProdPanel1.Visible := true;
    ProdPanel2.Visible := false;
  end;
end;

procedure TeCadastro.pbtSalvarPClick(Sender: TObject);

var nm : string;
    Bce : TBce;
    at, vali, fifo : Smallint;

begin
  at := 1; vali := 0; fifo := 0;
  if not pckAtivo.Checked  then at := 0;
  if pckFIFO.Checked then fifo := 1;
  if pckValidade.Checked then
  begin
    fifo := 1;
    vali := 1;
  end;

  // Salvar produto
  if idProd>0 then
  begin

    // Salva o produto
    nm := eDM.cdsProdNOMECURTO.Value;;
    Bce := tBce.Create;
    Bce.Prod_Alterar(idProd, pedLongo.Text, pedCurto.Text, pedClass1.Text, pedClass2.Text,
        pedClass3.Text,pedClass4.Text, at, vali,fifo, piMinP.Value, piPalete.Value );
    if nm <> pedCurto.Text  then
    begin
      Bce.Prod_AlterarNmCurto(idProd, pedCurto.Text);
    end;
    Bce.Prod_Mostrar(eCli);

    Bce.Destroy;
    ProdutoTempMostrar;
  end;

end;

procedure TeCadastro.pbtSalvarUClick(Sender: TObject);
var Bce : TBce;
begin
  // SALVAR unidades
  if idProd> 0 then
  begin
    Bce := TBce.Create ;
    if idPs >0 then
      Bce.Prod_SubAlterar(idPs,eDM.cdsProdNOMECURTO.Value + '|'+ pedNome.Text, pedCodB.Text,pedCodC.Text, pedCodT.Text, pedUnid.Text,  eDM.cdsProdATIVO.Value, piMinU.Value, piItens.Value)
    else
      Bce.Prod_SubInserir(eCli, idProd, eDM.cdsProdNOMECURTO.Value + '|'+ pedNome.Text, pedCodB.Text,pedCodC.Text, pedCodT.Text, pedUnid.Text,eDM.cdsProdATIVO.Value, piMinU.Value, piItens.Value);
    Bce.Destroy;
  end;
  AtualizaU(idProd);
end;

procedure TeCadastro.pbtVoltarClick(Sender: TObject);
begin
  ProdPanel1.Visible := true;
  ProdPanel2.Visible := false;
end;

procedure TeCadastro.pedBtQtClick(Sender: TObject);
begin
  if (idPs > 0)  then
  begin
    // Altera Quantidade sem lançamentos
    ejAltQuant.Entrar(idProd, idPs, eDM.cdsProdLIGCLI.Value);
    ejAltQuant.lbCli.Caption := Bce.Cli_Padrao;
    ejAltQuant.lbProd.Caption := pedCurto.Text + ' ' + pedNome.Text;
    ejAltQuant.lbQt.Caption := pedQtEstoque.Caption;
    if (pedQtEstoque.Caption <> '0') then  ejAltQuant.cbObs.ItemIndex := 3;

    ejAltQuant.Show;
  end
  else ShowMessage('Precisa escolher um SubProduto');

end;

procedure TeCadastro.pedCurtoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  plbContaC.Caption := IntToStr( 15 - Length(pedCurto.Text));
end;

procedure TeCadastro.pedLongoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  plbContaL.Caption := IntToStr( 40 - Length(pedLongo.Text));

end;

procedure TeCadastro.ProdutoTempMostrar;
  var Bce : TBce;
      codCli : String;
begin
  ProdTemp.Close;
  ProdTemp.EmptyTable;
  ProdTemp.Open;

  while not eDM.cdsProd.Eof do
  begin
    Bce := TBce.Create;
    Bce.Prod_fSubIDP(eDM.cdsProdId.Value);
    codCli := eDM.cdsProdSCODCLI.Value;
    Bce.Destroy;

    ProdTemp.Insert;
    ProdTempid.Value := eDM.cdsProdId.Value;
    ProdTempProduto.Value := eDM.cdsProdNOMELONGO.Value;
    ProdTempNomeCurto.Value := eDM.cdsProdNOMECURTO.Value;
    ProdTempMinima.Value := eDM.cdsProdQUANTMIN.Value;
    ProdTempQuant.Value := eDM.cdsProdQUANTIDADE.Value;

    ProdTempCodCli.Value := codCli;

    ProdTemp.Post;

    eDM.cdsProd.Next;
  end;
end;

procedure TeCadastro.SelecionarProduto;
begin
  if eDM.cdsProd.RecordCount>0 then
  begin
    plbSel.Caption := ProdTempNOMECURTO.Value;
    idProd :=  ProdTempID.Value;
    eDM.cdsProd.Locate('id', idProd, [loCaseInsensitive]);
    MostraSubs(idProd);
    pbtAlterar.Visible := true;
  end;
end;

procedure TeCadastro.pbApagarClick(Sender: TObject);
  var Bce : TBce;
begin
    if MessageDlg('Tem certeza que deseja APAGAR o produto ' +eDM.cdsProdSCODCLI.Value+ ' '+eDM.cdsProdNOMECURTO.Value+ '?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bce := TBce.Create;
      Bce.Prod_Apagar(idProd);
      Bce.Destroy;
      ProdTemp.Delete;
      if (ProdTemp.RecordCount>0) then
      begin
        ProdTemp.First;
        SelecionarProduto;
      end;

      ProdPanel1.Visible := true;
      ProdPanel2.Visible := false;

    end;
end;

procedure TeCadastro.JvDBGrid1DblClick(Sender: TObject);
begin
  cli_ID.Caption := eDM.cdsCliID.AsString;
  cli_nome.Caption := eDM.cdsCliNOME.Value;
  cli_ckaltativo.Checked := (eDM.cdsCliATIVO.Value = 1);
  cli_ckalt.Checked := (eDM.cdsCliNOTACNPJ.Value <> '0');
  cli_altcnpj.Text :=  eDM.cdsCliNOTACNPJ.Value;

  cli_altera.Visible := true;
end;

procedure TeCadastro.JvDBGrid3CellClick(Column: TColumn);

begin
  if eDM.cdsProd.RecordCount>0 then
  begin
    plbSel.Caption := eDM.cdsProdNOMECURTO.Value;
    idProd :=  eDM.cdsProdID.Value;
    MostraSubs(idProd);
    pbtAlterar.Visible := true;
  end;

end;

procedure TeCadastro.JvDBGrid5DblClick(Sender: TObject);
begin
  Produtos_LimparU;
  Produtos_PreencheU;
  idPs := eDM.cdsProdSID.Value;
  pedNome.SetFocus;
end;

procedure TeCadastro.JvDBGrid6CellClick(Column: TColumn);

begin
  SelecionarProduto;

end;

end.
