 unit veNFs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Data.DB,
  Vcl.Buttons, JvMemoryDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.ButtonGroup, JvExStdCtrls, JvEdit, JvValidateEdit, JvExDBGrids, JvDBGrid,
  JvDataSource, Vcl.Menus, JvMaskEdit, JvCheckedMaskEdit, JvDatePickerEdit, ComObj,
  Vcl.Mask, JvExMask, JvToolEdit, JvExComCtrls, JvDateTimePicker;

type
  TeNFs = class(TForm)
    ActionList1: TActionList;
    actEnt: TAction;
    actSaida: TAction;
    actEndere: TAction;
    Action1: TAction;
    imlIcons: TImageList;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    Label4: TLabel;
    lbPadrao: TLabel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    PageControl1: TPageControl;
    tsEntrada: TTabSheet;
    enPanel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label2: TLabel;
    en_CodB: TEdit;
    en_Class1: TComboBox;
    Panel3: TPanel;
    en_Memo: TMemo;
    en_DBGrid: TDBGrid;
    tab: TJvMemoryData;
    dsTab: TDataSource;
    en_btConf: TBitBtn;
    Label3: TLabel;
    en_lbTot: TLabel;
    en_btInicio: TBitBtn;
    tsCria: TTabSheet;
    tsListaNF: TTabSheet;
    nfPanel1: TPanel;
    Panel1: TPanel;
    nf_btNovo: TBitBtn;
    nf_DBGrid1: TDBGrid;
    nf_PanelEdita: TPanel;
    Número: TLabel;
    nf_nNum: TJvValidateEdit;
    Tipo: TLabel;
    nf_cbTipo: TComboBox;
    Label5: TLabel;
    nf_dtNota: TDateTimePicker;
    Valor: TLabel;
    nf_nValor: TJvValidateEdit;
    Label6: TLabel;
    nf_edDoc: TEdit;
    Bevel1: TBevel;
    Label7: TLabel;
    Panel4: TPanel;
    nf_edPesq: TSearchBox;
    nf_DBGridPesq: TDBGrid;
    nf_DBGridItens: TJvDBGrid;
    dsPPesq: TDataSource;
    tabnf: TJvMemoryData;
    dsTabNF: TDataSource;
    tabnfProdS: TStringField;
    tabnfidNF: TIntegerField;
    tabnfidC: TIntegerField;
    tabnfidPr: TIntegerField;
    tabnfidSub: TIntegerField;
    tabnfQt: TIntegerField;
    tabnfValorU: TFloatField;
    tabnfdtValidade: TDateField;
    tabnfOrdem: TIntegerField;
    tabnfTotal: TFloatField;
    Label8: TLabel;
    Label9: TLabel;
    nf_lbItens: TLabel;
    nf_btSalvar: TBitBtn;
    nf_ckArm: TCheckBox;
    nf_ckMov: TCheckBox;
    nf_ckSeg: TCheckBox;
    nf_ckPack: TCheckBox;
    nf_ckExp: TCheckBox;
    Label10: TLabel;
    nf_nVol: TJvValidateEdit;
    tabnfsubt: TFloatField;
    tabnfiditem: TIntegerField;
    liEnt: TPanel;
    liCli: TPanel;
    Panel7: TPanel;
    liSai: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    lilbTot: TLabel;
    liBtVer: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    JvDataSource3: TJvDataSource;
    Label13: TLabel;
    Label14: TLabel;
    lilbEnt: TLabel;
    lilbSai: TLabel;
    PopupMenu1: TPopupMenu;
    Alterar1: TMenuItem;
    Cancelar1: TMenuItem;
    Excluir1: TMenuItem;
    N1: TMenuItem;
    InserirnoEstoque1: TMenuItem;
    cfRbTodas: TRadioButton;
    enRbUma: TRadioButton;
    en_NF: TJvValidateEdit;
    enCbTipo: TComboBox;
    tabProdS: TStringField;
    tabQ1: TIntegerField;
    tabQ2: TIntegerField;
    tabVer: TSmallintField;
    tabMens: TStringField;
    tabidC: TIntegerField;
    tabidSub: TIntegerField;
    tabst: TIntegerField;
    en_ckQ2: TCheckBox;
    Label1: TLabel;
    nf_peso: TJvValidateEdit;
    Label15: TLabel;
    nf_RbNota: TRadioButton;
    nf_RbPed: TRadioButton;
    nf_LbPed: TLabel;
    nf_Dim: TEdit;
    tsImportar: TTabSheet;
    Label16: TLabel;
    imp_btNotas: TBitBtn;
    Label17: TLabel;
    imp_btPedidos: TBitBtn;
    Imp_btAvanti: TBitBtn;
    SpeedButton1: TSpeedButton;
    li_btMarcarP: TSpeedButton;
    lbContaProds: TLabel;
    tabnfcodcli: TStringField;
    tbFin: TTabSheet;
    Panel5: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    fin_lbQtNf: TLabel;
    fin_btVerNotas: TBitBtn;
    JvDBGrid4: TJvDBGrid;
    Label21: TLabel;
    fin_DtInic: TJvDateTimePicker;
    fin_DtFim: TJvDateTimePicker;
    JvDataSource4: TJvDataSource;
    fin_btExcel: TBitBtn;
    procedure imgMenuClick(Sender: TObject);
    procedure actEntExecute(Sender: TObject);
    procedure actSaidaExecute(Sender: TObject);
    procedure actEndereExecute(Sender: TObject);
    procedure en_CodBKeyPress(Sender: TObject; var Key: Char);
    procedure en_btConfClick(Sender: TObject);
    procedure en_btInicioClick(Sender: TObject);
    procedure nf_edPesqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvValidateEdit1Change(Sender: TObject);
    procedure tabnfCalcFields(DataSet: TDataSet);
    procedure nf_DBGridItensKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nf_cbTipoChange(Sender: TObject);
    procedure nf_btSalvarClick(Sender: TObject);
    procedure nf_DBGridPesqKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure liBtVerClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure JvDBGrid3DblClick(Sender: TObject);
    procedure Cancelar1Click(Sender: TObject);
    procedure InserirnoEstoque1Click(Sender: TObject);
    procedure JvDBGrid1Enter(Sender: TObject);
    procedure JvDBGrid2Enter(Sender: TObject);
    procedure JvDBGrid3Enter(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure Alterar1Click(Sender: TObject);
    procedure imp_btNotasClick(Sender: TObject);
    procedure Imp_btAvantiClick(Sender: TObject);
    procedure nf_DBGridItensCanEditCell(Grid: TJvDBGrid; Field: TField;
      var AllowEdit: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure li_btMarcarPClick(Sender: TObject);
    procedure nf_nNumKeyPress(Sender: TObject; var Key: Char);
    procedure nf_edDocKeyPress(Sender: TObject; var Key: Char);
    procedure nf_nValorKeyPress(Sender: TObject; var Key: Char);
    procedure nf_nVolKeyPress(Sender: TObject; var Key: Char);
    procedure nf_pesoKeyPress(Sender: TObject; var Key: Char);
    procedure nf_DimKeyPress(Sender: TObject; var Key: Char);
    procedure nf_DBGridPesqDblClick(Sender: TObject);
    procedure fin_btVerNotasClick(Sender: TObject);
    procedure fin_btExcelClick(Sender: TObject);
    procedure JvDBGrid4DblClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure en_IniciarTab;
    procedure nf_Limpar;
    procedure nf_Preencher(tip, Num, vol, arm, mov, seg, Pack, exp, nPed:Integer; dt:TDatetime; doc, Dim:String; Val,Peso:double);
    procedure liVer(tipo:Smallint);
    procedure Confere();
  end;

var
  eNFs: TeNFs;
  nConfere : Smallint;
  nTot1, nTot2, GridOrdem , idNF, nfItens: integer;
  nfvProds : double;
  sObj : String;
  itensModificados : boolean;

implementation

{$R *.dfm}

uses veDM, Global, veBanco, veDocVer, veEstoque, veImportaNF, veImportaAvanti, uLib;

function ckI(b:boolean):Smallint;
  var resp : Smallint;
begin
  resp := 0;
  if b then resp := 1;
  result := resp;
end;

procedure TeNFs.actEndereExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 2;
end;

procedure TeNFs.actEntExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TeNFs.actSaidaExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
end;





procedure TeNFs.Entrar;

var Bce : TBce;
begin
  en_CodB.Enabled := false;
  en_Memo.Clear;
  en_Memo.Lines.Append('Clique em INICIAR');
  en_DBGrid.Visible := false;
  nf_lbItens.Caption := '0';
  nfItens := 0;

  fin_DtInic.Date := Now - 7;
  fin_DtFim.Date := Now;

  lbContaProds.Caption := '';
  lbPadrao.Caption := '-';
  if eCli > 0 then
  begin
    Bce := TBce.Create;
    lbPadrao.Caption := Bce.Cli_Padrao;
    Bce.Prod_Pesquisado(eCli);
    Bce.Prod_Class(en_Class1, 1, eCli);
    en_CodB.Text := '';
    Bce.Destroy;
    lbContaProds.Caption := eDM.cdsPPesq.RecordCount.ToString;
  end;

  en_IniciarTab;
  nf_Limpar;
end;

procedure en_EscreveMemo(texto:String);
begin
  eNFs.en_Memo.Lines.Append(' ['+FormatDateTime('dd/MM/yy HH:mm',Now)+']-'+  texto);
end;

procedure en_Verifica_CodB(cbar, Class1:String);
var s : String;
    Bce : TBce;
    achei, existe : boolean;
    ok : Smallint;
    qt : Integer;

begin
  // Status
  // 0 = Não conferido
  // 1 = Conferido e Ok
  // 2 = Não encontrado
  // 3 = existe e é de outra class1
  // 4 = quantidade diferente

   ok := 0;

  s := cbar.Trim;
  Bce := TBce.Create;
  achei := Bce.Prod_fPesqBar(s);
  Bce.Destroy;
  if achei then
  begin
     ok := 1;
    if Class1 <> '<Todos>' then
    if (eDM.cdsPPesqCLASSIF1LOCAL.Value <> Class1) then
      ok := 3;
  end
  else ok := 2;
  if (ok=1)  then
  if nConfere=1 then nTot1:=nTot1+1 else nTot2:=nTot2+1;
  eNFs.en_lbTot.Caption := nTot1.ToString + '  - ' + nTot2.ToString;

  if (ok = 1) or (ok = 3) then
  begin
    existe := false;
    // verifica se existe

    if eNFs.tab.RecordCount> 0 then
    begin
      eNFs.tab.First;
      while not existe and not eNFs.tab.Eof do
      begin
        if eNFs.tabidC.Value = eDM.cdsPPesqID.Value then Existe := true
          else  eNFs.tab.Next;
      end;

    end;


    qt := 0;
    if existe then
    begin
      if nConfere <> 2 then qt := eNFs.tabQ1.Value else qt := eNFs.tabQ2.Value;
      eNFs.tab.Edit;
    end
    else eNFs.tab.Insert;
    // Passa os Valores -------------------------------------------
    eNFs.tabProdS.Value := eDM.cdsPPesqNOMESUB.Value;
    eNFs.tabidSUB.Value := eDM.cdsPPesqID.Value;

    if nConfere <> 2 then eNFs.tabQ1.Value := qt + 1
      else eNFs.tabQ2.Value := qt + 1;
    eNFs.tabMens.Value := 'ok';
    if (nConfere=2) and (eNFs.tabQ2.Value<>eNFs.tabQ1.Value)  then
    begin
      eNFs.tabMens.Value := 'DIFERENTE';
      ok := 4;
    end;
    eNFs.tabVer.Value := ok;
    if ok = 3 then  eNFs.tabMens.Value := 'Pertence a outro';
    eNFs.tabidC.Value := eDM.cdsPPesqID.Value;
    eNFs.tab.Post;
    //--------------------------------------------------------------
  end;
  if (ok = 1) then
  begin
    en_EscreveMemo(eNFs.en_CodB.Text + ' encontrado ');

  end;
  if ok = 2 then en_EscreveMemo(eNFs.en_CodB.Text + ' NÃO encontrado ');
  if ok = 3 then en_EscreveMemo(eNFs.en_CodB.Text + ' Pertence a outra Class1 ');
  if ok = 4 then en_EscreveMemo(eNFs.en_CodB.Text + ' Q1 e Q2 são diferentes ');

  eNFs.tab.First;
end;

procedure TeNFs.en_btConfClick(Sender: TObject);
  var bConferir : boolean;
begin
  bConferir := false;
  if nConfere < 2 then
  if MessageDlg('Deseja fazer 2a conferência?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     nConfere := 2;

  if not bConferir then
  begin
    Confere;
  end;


end;

procedure TeNFs.en_btInicioClick(Sender: TObject);
  var Tipo, qtNF:Integer;
      sTipo : String;
begin
  en_IniciarTab;
  en_EscreveMemo('====> Início '+nmCli);
  Tipo := enCbTipo.ItemIndex;
  liVer(Tipo+1);

  if (Tipo=0) then
  begin
    qtNF := eDM.cdsLi1.RecordCount;
    sTipo := 'Entrada';
  end;
  if (Tipo=1) then
  begin
    qtNF := eDM.cdsLi2.RecordCount;
    sTipo := 'Saída';
  end;

  if qtNf >0 then
  begin
    en_EscreveMemo('Notas de '+sTipo+': '+qtNF.ToString);
    en_CodB.Enabled := true;
    en_CodB.SetFocus;
    nConfere := 1;
    en_dbGrid.Visible := true;
    nTot1:=0; nTot2:=0;
  end
  else
  begin
    en_EscreveMemo('Não existem Notas de '+sTipo+' para conferir');
  end;

end;

procedure TeNFs.en_CodBKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  //if Length(en_codB.Text)>4 then
  begin
    en_Verifica_CodB(en_CodB.Text, en_Class1.Items[en_Class1.ItemIndex]);
    en_CodB.Text := '';
  end;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;

procedure TeNFs.en_IniciarTab;
begin
  // Limpa
  tab.Active := false;
  tab.EmptyTable;
  tab.Active := true;

  en_Memo.Clear;

  en_lbTot.Caption := '0';

end;


procedure TeNFs.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;



procedure TeNFs.Imp_btAvantiClick(Sender: TObject);
begin
  eImportaAvanti.Show;
end;

procedure TeNFs.imp_btNotasClick(Sender: TObject);
begin
  eImportaNF.Entrar;
  eImportaNF.SHow;
end;

procedure TeNFs.JvDBGrid1DblClick(Sender: TObject);
begin
  DocVer.setCDS(eDM.cdsli0);
  DocVer.Entrar;
  DocVer.Show;
end;

procedure TeNFs.JvDBGrid1Enter(Sender: TObject);
begin
  SObj := 'JvDBGrid1';
end;

procedure TeNFs.JvDBGrid2DblClick(Sender: TObject);
begin
  DocVer.setCDS(eDM.cdsli1);
  DocVer.Entrar;
  DocVer.Show;

end;

procedure TeNFs.JvDBGrid2Enter(Sender: TObject);
begin
  SObj := 'JvDBGrid2';
end;

procedure TeNFs.JvDBGrid3DblClick(Sender: TObject);
begin
  DocVer.setCDS(eDM.cdsli2);
  DocVer.Entrar;
  DocVer.Show;

end;

procedure TeNFs.JvDBGrid3Enter(Sender: TObject);
begin
  SObj := 'JvDBGrid3';
end;

procedure TeNFs.JvDBGrid4DblClick(Sender: TObject);
begin
  DocVer.setCDS(eDM.cdsli4);
  DocVer.Entrar;
  DocVer.Show;
end;

procedure TeNFs.JvValidateEdit1Change(Sender: TObject);
begin

end;

//  =======================================  NF = Listas
procedure TeNFs.liVer(tipo:Smallint);
  var Bce : TBce;
begin
  Bce := TBce.Create;
  Bce.NF_mostraPendentes(eCli,Tipo);
  Bce.Destroy;
  if (tipo = 0) then eNFs.lilbTot.Caption := eDM.cdsLi0.RecordCount.ToString;
  if (tipo = 1) then eNFs.lilbEnt.Caption := eDM.cdsLi1.RecordCount.ToString;
  if (tipo = 2) then eNFs.lilbSai.Caption := eDM.cdsLi2.RecordCount.ToString;
end;

procedure TeNFs.li_btMarcarPClick(Sender: TObject);
begin
  Bce := TBce.Create;
  Bce.NF_status(eDM.cdsLi2ID.Value, NF_STATUS_PRONTO);
  Bce.Destroy;
end;

procedure TeNFs.liBtVerClick(Sender: TObject);
begin
  liVer(0);  // Todos
  liVer(1);  // Entradas
  liVer(2);  // Saídas
end;

//  =======================================  NF = Cria Nota
procedure TeNFs.nf_Limpar();
begin
  with eNFs do
  begin
    nf_cbTipo.ItemIndex := 0;
    nf_nNum.Value := 0;
    nf_nValor.Value := 0;
    nf_dtNota.Date := Now;
    nf_edDoc.Text := '';
    nf_nVol.Text := '0';
    nf_DBGridPesq.Visible := false;

    tabnf.Active := false;
    tabnf.EmptyTable;
    tabnf.Active := true;

    GridOrdem := 0;

    nf_ckArm.Checked  := true;
    nf_ckMov.Checked  := true;
    nf_ckSeg.Checked  := false;
    nf_ckPack.Checked := false;
    nf_ckExp.Checked  := false;

    nTot1 := 0;
    nTot2 := 0;

  end;
end;

procedure TeNFs.nf_nNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_edDoc.SetFocus;
end;

procedure TeNFs.nf_nValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_nVol.SetFocus;
end;

procedure TeNFs.nf_nVolKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_peso.SetFocus;
end;

procedure TeNFs.nf_pesoKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_edPesq.SetFocus;
end;

procedure TeNFs.nf_Preencher(tip, Num, vol, arm, mov, seg, Pack, exp, nPed:Integer; dt:TDatetime; doc, Dim:String; Val,Peso :double);
begin
  with eNFs do
  begin
    nf_RbPed.Checked := true;
    if Num> 0 then nf_RbNota.Checked := true;

    nf_cbTipo.ItemIndex := tip;
    nf_nNum.Value := Num;
    nf_lbPed.Caption := nPed.ToString;
    nf_nValor.Value := Val;
    nf_dtNota.Date := dt;
    nf_edDoc.Text := doc;
    nf_nVol.Value := Vol;
    nf_Peso.Value := Peso;
    nf_Dim.Text := Dim;

    nf_DBGridPesq.Visible := false;

    tabnf.Active := false;
    tabnf.EmptyTable;
    tabnf.Active := true;

    GridOrdem := 0;

    nf_ckArm.Checked  := (arm=1);
    nf_ckMov.Checked  := (mov=1);
    nf_ckSeg.Checked  := (seg=1);
    nf_ckPack.Checked := (pack=1);
    nf_ckExp.Checked  := (exp=1);

    nTot1 := 0;
    nTot2 := 0;

  end;
end;
procedure TeNFs.SpeedButton1Click(Sender: TObject);
begin
  if itensModificados then ShowMessage('Modificados');

end;

procedure TeNFs.tabnfCalcFields(DataSet: TDataSet);
begin
  tabnfTotal.Value := tabnfQt.Value * tabnfValorU.Value;
end;

procedure nf_Totaliza();
begin
  nTot1 := 0;
  nTot2 := 0;
  nfvProds := 0;
  with eNFs do
  if tabNF.Active then
  begin
    tabNF.First;
    while not tabNf.Eof do
    begin
      nTot1 := nTot1 + tabnfQt.Value;
      nfvProds := nfvProds + tabnfTotal.Value;
      tabNF.Next;
    end;
    nf_lbItens.Caption := nTot1.ToString;
  end;

end;

procedure nf_Salva_Itens(tipoSalva: Smallint);
  var BceS : TBce;
      tipoES : String;
begin
  with eNFs do
  if tabNF.Active then
  begin
    case nf_cbTipo.ItemIndex  of
       0 : tipoES := 'E';
       1 : tipoES := 'S';
       2 : tipoES := 'D';
    end;

    BceS := TBce.Create;
    tabNF.First;
    while not tabNf.Eof do
    begin
      if tipoSalva = 0 then
        BceS.NFitem_Insere(eCli, idNF, tabnfidPr.Value, tabnfidSub.Value, nf_nNum.Value,
          tabnfQt.Value, nf_dtNota.DateTime, tabnfValorU.Value, tabnfTotal.Value, tipoES)
      else
        BceS.NFitem_Altera(tabnfiditem.Value, nf_nNum.Value, tabnfQt.Value,
          nf_dtNota.DateTime, tabnfValorU.Value, tabnfTotal.Value, tipoES);

      tabNF.Next;
    end;
    BceS.Destroy;
    nf_lbItens.Caption := nTot1.ToString;
  end;

end;


procedure nf_Preenche();
begin
  with eNFs do
  begin
    nf_cbTipo.ItemIndex := 0;
    nf_nNum.Value := 0;
    nf_nValor.Value := 0;
    nf_dtNota.Date := Now;
    nf_edDoc.Text := '';
    nf_DBGridPesq.Visible := false;
    nf_LbPed.Caption := '0';
  end;
end;

procedure nf_tabnfAdiciona();
begin
  with eNFs do
  begin

    GridOrdem := GridOrdem + 1;
    tabnf.Insert;
    tabnfOrdem.Value := GridOrdem;
    tabnfidPr.Value  := eDM.cdsPPesqLIGPROD.Value;
    tabnfidSub.Value := eDM.cdsPPesqID.Value;
    tabnfProdS.Value := eDM.cdsPPesqNOMESUB.Value;
    tabnfcodcli.Value:= eDM.cdsPPesqCODCLI.Value;
    tabnfValorU.Value := 0;
    tabnfQt.Value := 1;
    if (eDM.cdsPPesqBVALIDADE.Value = 1) then tabnfdtValidade.Value := Now + 60;
    tabnf.Post;

    tabnf.SortOnFields('Ordem',false, false);
    tabnf.Refresh;
  end;
end;

procedure nf_tabnfPreenche(idNF:Integer);
begin
  with eNFs do
  begin
    itensModificados := false;

    tabnf.Active := false;
    tabnf.EmptyTable;
    tabnf.Active := true;

    Bce := TBce.Create;
    Bce.NFitem_Mostra(idNF);

    GridOrdem := 0;
    eDM.cdsNFi2.First;
    while not eDM.cdsNFi2.Eof do
    begin
      GridOrdem := GridOrdem + 1;
      tabnf.Insert;

      tabnfOrdem.Value := GridOrdem;
      tabnfidNF.Value := eDM.cdsNFi2LIGNF.Value;
      tabnfidC.Value := eDM.cdsNFi2LIGCLI.Value;
      tabnfiditem.Value := eDM.cdsNFi2ID.Value;
      tabnfidPr.Value  := eDM.cdsNFi2LIGPROD.Value;
      tabnfidSub.Value := eDM.cdsNFi2LIGSUB.Value;
      tabnfProdS.Value := Bce.Prod_LSubNome(eDM.cdsNFi2LIGSUB.Value);
      tabnfValorU.Value := eDM.cdsNFi2VUNIT.AsFloat;
      tabnfQt.Value := eDM.cdsNFi2QUANT.Value;
      tabnfsubt.Value := eDM.cdsNFi2VSUBT.AsFloat;
      //tabnfdtValidade.Value := eDM.cdsNFi2
      //tabnfTotal.Value := eDM.cdsNFi2
      //if (eDM.cdsPPesqBVALIDADE.Value = 1) then tabnfdtValidade.Value := Now + 60;
      tabnf.Post;

      eDM.cdsNFi2.Next;
    end;
    Bce.Destroy;

    tabnf.SortOnFields('Ordem',false, false);
    tabnf.Refresh;
  end;
end;


function nf_Existe(idProd:Integer):boolean;
var resp : boolean;
begin
  with eNFs do
  begin
    resp := tabnf.Locate('idSub', idProd, []);

  end;
  result := resp;
end;
procedure TeNFs.nf_btSalvarClick(Sender: TObject);
  var nErro : Smallint;
      Bce : TBce;
      tipo : String;
      idIt, nPedi, bPedi, st : Integer;
begin
  idNF := 0;
  nErro := 0;
  if (nf_cbTipo.ItemIndex = 0) and (nf_nNum.Value = 0) then nErro := 1;
  if (nf_cbTipo.ItemIndex = 0) and (nf_nValor.Value =0) then nErro := 2;
  if (nf_cbTipo.ItemIndex = 2) and (Length(nf_edDoc.Text) < 5) then nErro := 3;
  if tabnf.RecordCount = 0 then nErro := 4;
  if (nf_cbTipo.ItemIndex = 0) and (nf_nVol.Value =0) then nErro := 5;

  if nErro = 0 then
  begin
    Bce := TBce.Create;
    if idNF=0 then idNf := Bce.NF_fExiste(nf_nNum.Value, eCli);
    case nf_cbTipo.ItemIndex  of
       0 : tipo := 'E';
       1 : tipo := 'S';
       2 : tipo := 'D';
    end;

    nf_Totaliza;
    nPedi := 0;
    bPedi := 0;
    if nf_RbPed.Checked then
    begin
      nPedi := nf_nNum.Value;
      bPedi := 1;
    end;

    if idNF = 0 then
    begin
      Bce.NF_Insere(eCLi, nf_nNum.Value, 0, nTot1, nf_nVol.Value, nPedi, bPedi,
        tipo, nf_edDoc.Text,nf_Dim.Text, nf_dtNota.DateTime, nf_nValor.Value, nfvProds, nf_peso.Value,
        ckI(nf_ckArm.Checked), ckI(nf_ckMov.Checked), ckI(nf_ckSeg.Checked),
        ckI(nf_ckPack.Checked), ckI(nf_ckexp.Checked) );
      idNf := Bce.NF_fExiste(nf_nNum.Value, eCli);

      st := NF_STATUS_PRONTO;
      if (tipo = 'S') then st := NF_STATUS_INICIADO;
      Bce.NF_Status(idNF, st);


      // Itens
      tabnf.First;
      while not tabnf.Eof do
      begin
        Bce.NFitem_Insere(eCli, idNf, tabnfidPr.Value, tabnfidSub.Value, nf_nNum.Value, tabnfQt.Value,  nf_dtNota.DateTime, tabnfValorU.Value, tabnfTotal.Value, tipo);
        tabnf.Next;
      end;

    end
     else
    begin
      Bce.NF_Altera(idNF, nf_nNum.Value, nTot1, nf_nVol.Value, nPedi, bPedi,
        tipo, nf_edDoc.Text, nf_Dim.Text, nf_dtNota.DateTime, nf_nValor.Value, nfvProds, nf_peso.Value,
        ckI(nf_ckArm.Checked), ckI(nf_ckMov.Checked), ckI(nf_ckSeg.Checked),
        ckI(nf_ckPack.Checked), ckI(nf_ckexp.Checked) );

      st := NF_STATUS_PRONTO;
      if (tipo = 'S') then st := NF_STATUS_INICIADO;
      Bce.NF_Status(idNF, st);

      // Itens
      //Bce.NFitem_mostra(eCli, idNF);
      if itensModificados and eDM.cdsNFi.Active then
      begin
        // Parte 1 - apaga os não existentes
        eDM.cdsNFi.First;
        while not eDM.cdsNFi.Eof do
        begin
          if not (tabnf.Locate('idSub',eDM.cdsNFiLIGSUB.Value, [loCaseInsensitive])) then
            BCe.NFitem_Apagar(eDM.cdsNFiID.Value);
          eDM.cdsNFi.Next;
        end;
        // Parte 2 - grava os existentes
        tabnf.First;
        while not tabnf.Eof do
        begin
          idIt := Bce.NFitem_fExiste(idNF, tabnfidSub.Value);
          if (idIt = 0) then
            Bce.NFitem_Insere(eCli, idNf, tabnfidPr.Value, tabnfidSub.Value, nf_nNum.Value, tabnfQt.Value,  nf_dtNota.DateTime, tabnfValorU.Value, tabnfTotal.Value, tipo)
          else
            Bce.NFitem_Altera(idIt, nf_nNum.Value, tabnfQt.Value,  nf_dtNota.DateTime, tabnfValorU.Value, tabnfTotal.Value, tipo);

          tabnf.Next;
        end;
      end;

    end;

    Bce.Destroy;

    nf_Limpar;
    ShowMessage('Nota Salva com sucesso!');
  end
  ELSE
  begin
    case nErro of
    1 : ShowMessage('Nota de ENTRADA deve ter um Número');
    2 : ShowMessage('Nota de ENTRADA deve ter um Valor');
    3 : ShowMessage('Nota de Saída deve ter um Número do Pedido de Entrada ou um CNPJ');
    4 : ShowMessage('Não posso salvar Notas sem itens');
    5 : ShowMessage('Nota de ENTRADA deve ter um Volume');
    end;
  end;

end;

procedure TeNFs.nf_cbTipoChange(Sender: TObject);
begin
  if nf_cbTipo.ItemIndex = 0 then
  begin
    nf_RbNota.Checked := true;
    nf_ckArm.Checked := true;
    nf_ckMov.Checked := true;
    nf_ckSeg.Checked := false;
    nf_ckPack.Checked := false;
    nf_ckExp.Checked := false;
  end;

  if nf_cbTipo.ItemIndex = 1 then
  begin
    nf_RbPed.Checked := true;
    nf_ckArm.Checked := true;
    nf_ckMov.Checked := true;
    nf_ckSeg.Checked := false;
    nf_ckPack.Checked := true;
    nf_ckExp.Checked := true;
  end;

  if nf_cbTipo.ItemIndex = 2 then
  begin
    nf_RbNota.Checked := true;
    nf_ckArm.Checked := false;
    nf_ckMov.Checked := false;
    nf_ckSeg.Checked := false;
    nf_ckPack.Checked := false;
    nf_ckExp.Checked := false;
  end;

end;

procedure TeNFs.nf_DBGridItensCanEditCell(Grid: TJvDBGrid; Field: TField;
  var AllowEdit: Boolean);
begin
  itensModificados := true;
end;

procedure TeNFs.nf_DBGridItensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  var i : smallint;
begin
  if tabNf.RecordCount>0 then
  if key = VK_F7 then
    if MessageDlg('Tem certeza que deseja RETIRAR o item ' + tabnfProdS.Value + ' ',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       itensModificados := true;
       tabNF.Delete;
       nfItens := nfItens + 1;
       nf_lbItens.Caption := nfItens.ToString;

       if tabNf.RecordCount>0 then
       begin
         i := 0;
         tabNF.First;
         while not TabNf.eof do
         begin
           i := i + 1;
           tabNF.Edit;
           tabnfOrdem.Value := i;
           tabNF.Post;

           tabNF.next;
         end;
       end;


     end;
end;

procedure TeNFs.nf_DBGridPesqDblClick(Sender: TObject);
begin
    if Length( nf_edPesq.Text ) > 1 then
    if not nf_Existe(eDM.cdsPPesqID.AsInteger) then
    begin
      nf_tabnfAdiciona;
      nf_DBGridPesq.Visible := false;
      nf_edPesq.Text := '';
      nf_edPesq.SetFocus;
      nfItens := nfItens + 1;
      nf_lbItens.Caption := nfItens.ToString;
      nf_DBGridPesq.Visible := false;
    end;
end;

procedure TeNFs.nf_DBGridPesqKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then eDM.cdsPPesq.Next;
    if key = VK_UP then eDM.cdsPPesq.Prior;

    if key = VK_RETURN then
    if Length( nf_edPesq.Text ) > 3 then
    if not nf_Existe(eDM.cdsPPesqID.AsInteger) then
    begin
      nf_tabnfAdiciona;
      nf_DBGridPesq.Visible := false;
      nf_edPesq.Text := '';
      nf_edPesq.SetFocus;
    end;

    if key = VK_ESCAPE then
    begin
      nf_DBGridPesq.Visible := false;

      //nf_DBGridItens.setFocus;
    end;

    if key = VK_CONTROL then
    if Length( nf_edPesq.Text ) > 0 then
    begin
      nf_tabnfAdiciona;
      nf_DBGridPesq.Visible := false;
      nf_edPesq.Text := '';
      nf_edPesq.SetFocus;
    end;
end;

procedure TeNFs.nf_DimKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_edDoc.SetFocus;
end;

procedure TeNFs.nf_edDocKeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) then nf_nValor.SetFocus;
end;

procedure TeNFs.nf_edPesqKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var BCe : TBce;
    s : String;
begin
  if not (key in [VK_DOWN,VK_UP,VK_RETURN, VK_CONTROL, VK_ESCAPE]) then
  begin
    s :=  nf_edPesq.Text;
    if Length(s)>1 then
    begin
      nf_DBGridPesq.Visible := true;
      Bce := TBce.Create;
      if s[1] in ['0'..'9'] then Bce.Prod_fPesqCode(Trim(s))
        else Bce.Prod_fPesqNome(s);
      Bce.Destroy;
    end
    else
    begin
      nf_DBGridPesq.Visible := false;
      Bce := TBce.Create;
      Bce.Prod_fPesqMostrarTodos();
      Bce.Destroy;
    end;
  end
  else
  begin
    if key = VK_DOWN then eDM.cdsPPesq.Next;
    if key = VK_UP then eDM.cdsPPesq.Prior;

    if key = VK_RETURN then
    if Length( nf_edPesq.Text ) > 1 then
    if not nf_Existe(eDM.cdsPPesqID.AsInteger) then
    begin
      nf_tabnfAdiciona;
      nf_DBGridPesq.Visible := false;
      nf_edPesq.Text := '';
      nf_edPesq.SetFocus;
      nfItens := nfItens + 1;
      nf_lbItens.Caption := nfItens.ToString;
    end;

    if key = VK_ESCAPE then
    begin
      nf_DBGridPesq.Visible := false;
      //nf_DBGridItens.setFocus;
    end;

    if key = VK_CONTROL then
    if Length( nf_edPesq.Text ) > 0 then
    begin
      nf_tabnfAdiciona;
      nf_DBGridPesq.Visible := false;
      nf_edPesq.Text := '';
      nf_edPesq.SetFocus;
    end;

  end;

end;

//  =======================================  listas
procedure TeNFs.Excluir1Click(Sender: TObject);
  var nNF, idNF, n : Integer;
      Stok : TStok;
begin


  if (sObj = 'JvDBGrid1') then
  begin
    nNF := eDM.cdsLi0.FieldbyName('NUMNF').Value;
    idNF := eDM.cdsLi0.FieldByName('ID').Value;
    n := 1;
    if (eDM.cdsLi0.FieldbyName('tipo').Value = 'S') then n := 2;
  end;

  if (sObj = 'JvDBGrid2') then
  begin
    nNF := eDM.cdsLi1.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi1.FieldByName('ID').Value;
    n := 1;
  end;

  if (sObj = 'JvDBGrid3') then
  if JvDBGrid3.SelCount>0 then
  begin
    nNF := eDM.cdsLi2.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi2.FieldByName('ID').Value;
    n := 2;
  end;


  if nNF > 0 then
  begin
    Stok := TStok.Create;
    if MessageDlg('Nota '+ nNF.ToString +'. Tem certeza que deseja Excluir a nota? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       Stok.Excluir_Nota(idNF);
       liVer(0);
       liVer(n);
      end;
    Stok.Destroy;
  end;
end;




procedure TeNFs.fin_btVerNotasClick(Sender: TObject);
  var Bce : TBce;

begin
  Bce := TBce.Create;
  Bce.NF_mostraFinalizadas(eCli, fin_DtInic.Date, fin_DtFim.Date);
  Bce.Destroy;
end;

procedure TeNFs.Cancelar1Click(Sender: TObject);
  var nNF, idNF, n : Integer;
      BCe: TBce;

begin
  if (sObj = 'JvDBGrid1') then
  begin
    nNF := eDM.cdsLi0.FieldbyName('NUMNF').Value;
    idNF := eDM.cdsLi0.FieldByName('ID').Value;
    n := 1;
    if (eDM.cdsLi0.FieldbyName('tipo').Value = 'S') then n := 2;
  end;

  if (sObj = 'JvDBGrid2') then
  begin
    nNF := eDM.cdsLi1.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi1.FieldByName('ID').Value;
    n := 1;
  end;

  if (sObj = 'JvDBGrid3') then
  if JvDBGrid3.SelCount>0 then
  begin
    nNF := eDM.cdsLi2.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi2.FieldByName('ID').Value;
    n := 2;
  end;


  if nNF > 0 then
  begin
    Bce := TBce.Create;
    if MessageDlg('Tem certeza que deseja CANCELAR a nota'+ nNF.ToString +'? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
       // Cancelar : Status = 4
       Bce.Geral_AlterarStatus(idNF, 4, 'TBE_NF', 'status');  // no estoque
       Bce.Geral_AlterarStatus(eDM.cdsNFi2LIGSUB.Value, 4, 'TBE_NFitens', 'status');  // no estoque
       liVer(0);
       liVer(n);
      end;
    Bce.Destroy;
  end;
end;

procedure TeNFs.Confere;
  var nf, colQ : Integer;
      BCe : TBce;
      TodasOK:Boolean;

begin
  // FILTRAR
  en_EscreveMemo(' ====== CONFERINDO...');
  nf := 0;
  if enRbUma.Checked then
    nf := en_Nf.Value;

  Bce := TBce.Create;
  Bce.Confere_ListaBD(eCli, enCbTipo.ItemIndex, nf);
  Bce.Confere_ListaNF(eCli, enCbTipo.ItemIndex, nf);
  Bce.Destroy;

  if eDM.cdsCf0.RecordCount = tab.RecordCount then
  begin
    en_EscreveMemo('Quantidade de Notas: '+eDM.cdsCf1.RecordCount.ToString);
    en_EscreveMemo('Ok. Mesma Quantidade de Itens!');
  end
  else
    en_EscreveMemo('Erro. Quantidade de Itens Diferente!');

  TodasOK := true;
  Bce := TBce.Create;
  eDM.cdsCf0.First;
  while not eDM.cdsCf0.Eof do
  begin


     if tab.Locate('idSub',eDM.cdsCf0LIGSUB.Value, [loCaseInsensitive]) then
     begin
        colQ := tabQ1.Value;
       if en_ckQ2.Checked then  colQ := tabQ2.Value;


       if eDM.cdsCf0QT.Value = colQ  then
       begin
         en_EscreveMemo('Produto '+eDM.cdsCf0LIGSUB.AsString+ ': '+tabProdS.Value +' ...confere. OK' );
       end
       else
       begin
         en_EscreveMemo('Produto '+eDM.cdsCf0LIGSUB.AsString+ ': '+tabProdS.Value +' ...não confere' );
         TodasOk := false;
       end;

     end
     else
     begin
       en_EscreveMemo('Produto '+eDM.cdsCf0LIGSUB.AsString+ ': '+Bce.Geral_RetornarString(eDM.cdsCf0LIGSUB.Value,'TBE_PRODSUB', 'NOMESUB')+' ...não bipado' );
       TodasOk := false;
     end;

    eDM.cdsCf0.Next;
  end;

  // Se todas estao corretas
  if TodasOk then
  begin
    eDM.cdsCf1.First;
    while not eDM.cdsCf1.Eof do
    begin
      Bce.Confere_Marca(eDM.cdsCf1LIGNF.Value, 2);
      eDM.cdsCf1.Next;
    end;
  end;

  Bce.Destroy;

end;

procedure TeNFs.Alterar1Click(Sender: TObject);
  var nNF, n : Integer;

begin
  if (sObj = 'JvDBGrid1') then
  begin
    nNF := eDM.cdsLi0.FieldbyName('NUMNF').Value;
    idNF := eDM.cdsLi0.FieldByName('ID').Value;
    n := 2;
    if eDM.cdsLi0.FieldByName('TIPO').Value = 'S' then n:= 1;
    if eDM.cdsLi0.FieldByName('TIPO').Value = 'E' then n:= 0;
    if nNF > 0 then
    begin
//    nf_Preencher(tip, Num, Vol, arm, mov, seg, Pack, exp:Integer; dt:TDatetime; doc:String; Val:double);
      nf_Preencher(n, nNF, eDM.cdsLi0.FieldByName('VOLUME').Value,
        eDM.cdsLi0.FieldByName('usaArm').Value,eDM.cdsLi0.FieldByName('usaMov').Value,eDM.cdsLi0.FieldByName('usaSeg').Value,
        eDM.cdsLi0.FieldByName('usaPack').Value,eDM.cdsLi0.FieldByName('usaExp').Value, eDM.cdsLi0.FieldByName('numPed').Value,
        eDM.cdsLi0.FieldByName('dtNota').AsDateTime,eDM.cdsLi0.FieldByName('DocRef').Value,eDM.cdsLi0.FieldByName('Dimensao').Value,
        eDM.cdsLi0.FieldByName('VTotal').Value, eDM.cdsLi0.FieldByName('Peso').Value );
        nf_tabnfPreenche(idNF);
    end;

  end;

  if (sObj = 'JvDBGrid2') then
  begin
    nNF := eDM.cdsLi1.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi1.FieldByName('ID').Value;
    n := 1;
    if nNF > 0 then
    begin
      nf_Preencher(n, nNF, eDM.cdsLi1.FieldByName('VOLUME').Value,
        eDM.cdsLi1.FieldByName('usaArm').Value,eDM.cdsLi1.FieldByName('usaMov').Value,eDM.cdsLi1.FieldByName('usaSeg').Value,
        eDM.cdsLi1.FieldByName('usaPack').Value,eDM.cdsLi1.FieldByName('usaExp').Value,eDM.cdsLi1.FieldByName('numPed').Value,
        eDM.cdsLi1.FieldByName('dtNota').AsDateTime,eDM.cdsLi1.FieldByName('DocRef').Value,eDM.cdsLi1.FieldByName('Dimensao').Value,
        eDM.cdsLi1.FieldByName('VTotal').Value,eDM.cdsLi1.FieldByName('Peso').Value );
    end;
  end;

  if (sObj = 'JvDBGrid3') then
  if JvDBGrid3.SelCount>0 then
  begin
    nNF := eDM.cdsLi2.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi2.FieldByName('ID').Value;
    n := 2;
    if nNF > 0 then
    begin
      nf_Preencher(n, nNF, eDM.cdsLi2.FieldByName('VOLUME').Value,
        eDM.cdsLi2.FieldByName('usaArm').Value,eDM.cdsLi2.FieldByName('usaMov').Value,eDM.cdsLi2.FieldByName('usaSeg').Value,
        eDM.cdsLi2.FieldByName('usaPack').Value,eDM.cdsLi2.FieldByName('usaExp').Value,eDM.cdsLi2.FieldByName('numPed').Value,
        eDM.cdsLi2.FieldByName('dtNota').AsDateTime,eDM.cdsLi2.FieldByName('DocRef').Value,eDM.cdsLi2.FieldByName('Dimensao').Value,
        eDM.cdsLi2.FieldByName('VTotal').Value, eDM.cdsLi2.FieldByName('Peso').Value );
    end;
  end;

  PageControl1.TabIndex := 1;
end;




procedure TeNFs.InserirnoEstoque1Click(Sender: TObject);
  var nNF, idNF, n : Integer;
      Stok : TStok;
      conferidaOK : boolean;

begin
  conferidaOK := false;

  if (sObj = 'JvDBGrid1') then
  begin
    nNF := eDM.cdsLi0.FieldbyName('NUMNF').Value;
    idNF := eDM.cdsLi0.FieldByName('ID').Value;
    if eDM.cdsLi0STATUSDESC.Value = 'Conferida' then ConferidaOk := true;

    n := 1;
    if (eDM.cdsLi0.FieldbyName('tipo').Value = 'S') then n := 2;
  end;

  if (sObj = 'JvDBGrid2') then
  begin
    nNF := eDM.cdsLi1.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi1.FieldByName('ID').Value;
    if eDM.cdsLi1STATUSDESC.Value = 'Conferida' then ConferidaOk := true;

    n := 1;
  end;

  if (sObj = 'JvDBGrid3') then
  if JvDBGrid3.SelCount>0 then
  begin
    nNF := eDM.cdsLi2.FieldByName('NUMNF').Value;
    idNF := eDM.cdsLi2.FieldByName('ID').Value;
    if eDM.cdsLi2STATUSDESC.Value = 'Conferida' then ConferidaOk := true;

    n := 2;
  end;


  if nNF > 0 then
  begin
    if not conferidaOK then
    if MessageDlg('Nota '+ nNF.ToString +' SEM CONFERIR. Tem certeza que deseja Inserir no ESTOQUE? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then conferidaOK := true;

    if conferidaOK then
      begin
       Stok := TStok.Create;
       Stok.Altera_Estoque(idNF);
       Stok.Destroy;

       liVer(0);
       liVer(n);
      end;
  end;
end;

procedure TeNFs.fin_btExcelClick(Sender: TObject);

var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;

begin
  // Usar a uses ComObj,
  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  // Dados
  planilha.cells[1,2] :=  'Lista de Notas finalizadas';
  planilha.cells[2,2] :=  'Total de Notas: '+ fin_lbQtNf.Caption;
  planilha.cells[3,2] :=  'Datas: '+FormatDateTime('dd/MM/yy', fin_DtInic.Date)+' - '+FormatDateTime('dd/MM/yy', fin_DtFim.Date);

  eDM.cdsLi4.First;
  for linha := 0 to eDM.cdsLi4.RecordCount - 1 do
  begin
    planilha.cells[linha + 6,1] :=  eDM.cdsLi4.FieldByName('NUMNF').Value;
    dt := eDM.cdsLi4.FieldByName('DTCRIADO').AsDateTime;
    planilha.cells[linha + 6,2] :=  dt;
    planilha.cells[linha + 6,3] :=  eDM.cdsLi4.FieldByName('TIPO').AsString;
        valorcampo := eDM.cdsLi4.FieldByName('VTOTAL').AsString;
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    planilha.cells[linha + 6,4] :=  valorCampo;
    planilha.cells[linha + 6,5] :=  eDM.cdsLi4.FieldByName('NUMITENS').Value;
    planilha.cells[linha + 6,6] :=  eDM.cdsLi4.FieldByName('VOLUME').Value;
    planilha.cells[linha + 6,7] :=  eDM.cdsLi4.FieldByName('STATUS').Value;

    eDM.cdsLi4.Next;
 end;
 // Títulos
 planilha.cells[ 5,1] :=  'Nota Fiscal';
 planilha.cells[ 5,2] :=  'Data Entrada';
 planilha.cells[ 5,3] :=  'TipoNF';
 planilha.cells[ 5,4] :=  'Valor';
 planilha.cells[ 5,5] :=  'QtItens';
 planilha.cells[ 5,6] :=  'Volume';
 planilha.cells[ 5,7] :=  'Status';
 planilha.columns.Autofit;

end;


end.
