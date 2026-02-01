unit ucadProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit,
  ExtCtrls, ImgList, JvSpeedbar, JvExExtCtrls, JvExtComponent, System.ImageList;

type
  TcadProd = class(TForm)
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
    ImageList1: TImageList;
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label3: TLabel;
    cbGrupo: TComboBox;
    ckModo: TCheckBox;
    Label5: TLabel;
    edDesc: TEdit;
    Label6: TLabel;
    edUnid: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Bevel1: TBevel;
    edMin: TJvValidateEdit;
    edPalete: TJvValidateEdit;
    ckAtivo: TCheckBox;
    PopupMenu1: TPopupMenu;
    ListadeProdutos1: TMenuItem;
    Estoque1: TMenuItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edCodB: TEdit;
    Label10: TLabel;
    edCodCli: TEdit;
    Label11: TLabel;
    edCod3: TEdit;
    ckMintela: TCheckBox;
    ckMinMail: TCheckBox;
    Label4: TLabel;
    edNCM: TEdit;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    vlrPeso: TJvValidateEdit;
    vlrCubag: TJvValidateEdit;
    Label15: TLabel;
    lbAtual: TLabel;
    Label16: TLabel;
    edComp: TEdit;
    vlrCFOP: TJvValidateEdit;
    SpeedButton1: TSpeedButton;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure cbGrupoChange(Sender: TObject);
    procedure edCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edUnidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPaleteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodBarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure edNCMKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idProg(i : Integer);
    procedure Entrar;
  end;

var
  cadProd: TcadProd;
  idProd : Integer;

implementation

{$R *.dfm}

uses Global, uDM1, uDM2, uBanco, upqProd, uLib;


procedure Limpar();

begin
  with cadProd do
  begin
    cbGrupo.ItemIndex := 0;

    edCodB.Text       := '';
    edCodCli.Text     := '';
    edCod3.Text       := '';

    edDesc.Text       := '';
    edComp.Text       := '';
    edUnid.Text       := '';
    edMin.Value       := 10;
    edPalete.Value    := 0;
    vlrPeso.Value     := 1;
    vlrCubag.Value    := 1;

    edNCM.Text        := '';
    vlrCFOP.Value     := 0;

    lbAtual.Caption   := '0';
    ckAtivo.Checked   := true;

    ckMintela.Checked := false;
    ckMinMail.Checked := false;

  end;
end;


procedure Mostra_Cli;

var bco : Tbco;
    usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  idcli := usa.get_cliNumero;
  cadProd.lbCli.Caption := usa.get_cliNome;
  usa.Destroy;

  bco := TBco.Create;
  with cadProd do
  begin
      bco.Cliente_MostraId(idCli);
      lbCli.Caption := DM1.cdsCliNOME.Value;
      cbGrupo.Clear;
      cbGrupo.Text := 'Escolha um GRUPO';
      DM2.DBCb_Preenche(cbGrupo, 'TB_GRUPO', 'DESCRICAO', 'LIGCLI = '+IntToStr(idCli) );
  end;
end;

procedure Carrega_Prod();
var bco : Tbco;

begin
  with cadProd do
  if (idProd > 0) then
  begin
    bco := TBco.Create;
    bco.Prod_MostraId(idProd);

    DM2.DBCp_Pos(cbGrupo, 'TB_PRODUTO', IntToStr(idProd),'DESCRICAO');
    edCodB.Text   := DM1.cdsProdCODBARRA.Value;
    edCodCli.Text := DM1.cdsProdCODCLI.Value;
    edCod3.Text   := DM1.cdsProdCOD.Value;

    edDesc.Text:= DM1.cdsProdDESCRICAO.Value;
    edComp.Text:= DM1.cdsProdDESCRICAO.Value;
    edUnid.Text:= DM1.cdsProdUNIDADE.Value;
    edMin.Value:= DM1.cdsProdMINIMO.Value;
    edPalete.Value := DM1.cdsProdPALETE.AsFloat;

    vlrPeso.Value     := DM1.cdsProdPESO.AsFloat;
    vlrCubag.Value    := DM1.cdsProdCUBAGEM.Value;

    edNCM.Text        := DM1.cdsProdNFNCM.Value;
    vlrCFOP.Value     := DM1.cdsProdNFCFOP.Value;

    lbAtual.Caption   := DM1.cdsProdQUANT.AsString;

    ckAtivo.Checked   := (DM1.cdsProdATIVO.Value = 1);
    ckMintela.Checked := (DM1.cdsProdFLG_MINTELA.Value = 1);
    ckMinMail.Checked := (DM1.cdsProdFLG_MINMAIL.Value = 1);

  end;
end;


procedure TcadProd.btNovoClick(Sender: TObject);
begin
  idProd := 0;
  Limpar;
end;


procedure Salvar;

var bco : Tbco;
    idG : Integer;
    ft, fm : Smallint;

begin
  bco := TBco.Create;
  //usa := TMarco.Create;

  with cadProd do
  begin
    idG := DM2.DBCp_leid(cbGrupo.Items[cbGrupo.ItemIndex], 'TB_PRODUTO WHERE LIGCLI = '+IntToStr(idCli),'DESCRICAO') ;
    ft := 0;
    fm := 0;

    if (ckMintela.Checked) then ft := 1;
    if (ckMinMail.Checked) then fm := 1;


    // Novo
    if (idProd = 0) then
    begin
      bco.Prod_Insere(idCli, edCod3.Text, edCodB.Text, edCodCli.Text,edDesc.Text, edComp.Text, edUnid.Text,edNCM.Text,
                      edMin.Value, vlrCFOP.Value, ft, fm, edPalete.Value, vlrPeso.Value, idG, vlrCubag.Value );
    end;

    if (idProd > 0) then
    begin
      bco.Prod_Altera(idProd, edCod3.Text, edCodB.Text, edCodCli.Text,edDesc.Text, edComp.Text, edUnid.Text,edNCM.Text,
                      edMin.Value, vlrCFOP.Value, ft, fm, edPalete.Value, vlrPeso.Value, idG, vlrCubag.Value );
    end;

  end;
end;

procedure TcadProd.btSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TcadProd.btApagarClick(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (idProd > 0) then
  if MessageDlg('Tem certeza que deseja apagar o produto?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      bco.Prod_Apaga(idProd);
    end;

end;

procedure TcadProd.cbGrupoChange(Sender: TObject);
begin
  edCod3.SetFocus;
end;

procedure TcadProd.edCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edDesc.SetFocus;
end;

procedure TcadProd.edDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edUnid.SetFocus;
  
end;

procedure TcadProd.edUnidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edMin.SetFocus;
end;

procedure TcadProd.edMinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edPalete.SetFocus;
end;

procedure TcadProd.edPaleteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edCodB.SetFocus;
end;

procedure TcadProd.edCodBarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key =13) then
    if (ckModo.Checked = true) then
    begin
      Salvar;
      Limpar;
      edCod3.SetFocus;
    end
    else
    begin
      Salvar;
      Limpar;
      cbGrupo.ItemIndex := 0;
      cbGrupo.SetFocus;
    end;
end;

procedure TcadProd.set_idProg(i: Integer);
begin
  idProd := i;
  Carrega_Prod;
end;

procedure TcadProd.cbGrupoCloseUp(Sender: TObject);
begin
  edCod3.SetFocus;
end;

procedure TcadProd.btPesqClick(Sender: TObject);
begin
  pqProd.set_saida(1);
  pqProd.Show;
end;

procedure TcadProd.edNCMKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TcadProd.Entrar;
begin
  Mostra_Cli;
  Limpar;
  Carrega_Prod;
end;


end.
