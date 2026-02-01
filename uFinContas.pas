unit uFinContas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TFinContas = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    TreeView1: TTreeView;
    Label1: TLabel;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel4: TPanel;
    Label2: TLabel;
    lbNiv: TLabel;
    Label3: TLabel;
    lbConta: TLabel;
    ckAtivo: TCheckBox;
    Bevel1: TBevel;
    lbAtivo: TLabel;
    Label4: TLabel;
    lbMens: TLabel;
    btAlt: TBitBtn;
    btSubN: TBitBtn;
    edConta: TEdit;
    btCancel: TBitBtn;
    btSalvar: TBitBtn;
    PanelSub: TPanel;
    Label5: TLabel;
    lbSub: TLabel;
    Label7: TLabel;
    edSub: TEdit;
    Bevel2: TBevel;
    btCancelSub: TBitBtn;
    btSalvarSub: TBitBtn;
    btApagar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure btAltClick(Sender: TObject);
    procedure btSubNClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure btCancelSubClick(Sender: TObject);
    procedure btSalvarSubClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  FinContas: TFinContas;

implementation

{$R *.dfm}

uses uFinanceiro, uDM5;

procedure TFinContas.BitBtn1Click(Sender: TObject);
var
  Nivel1, Nivel2, Nivel3: TTreeNode;
begin
  with TreeView1.Items do
  begin
    Clear; { Remove any existing nodes. }
    Nivel1 := Add(nil, 'RECEITAS'); { Add a root node. }
    { Add a child node to the node just added. }
    AddChild(Nivel1,'Transporte');
    AddChild(Nivel1,'Armazenagem');
    AddChild(Nivel1,'Venda de Bens');

    {Add another root node}
    Nivel1 := Add(nil, 'CUSTOS'); { Add a root node. }
    { Add a child node to the node just added. }
    AddChild(Nivel1,'Motoristas Nossos');
    AddChild(Nivel1,'Motoristas Autônomos');
    AddChild(Nivel1,'Veículos');

    Nivel1 := Add(nil, 'DESPESAS'); { Add a root node. }
    { Add a child node to the node just added. }
    Nivel2 := AddChild(Nivel1,'Administrativas');
    AddChild(Nivel2,'Fixas');
    AddChild(Nivel2,'Variáveis');
    AddChild(Nivel1,'Financeiras');

  end;
  TreeView1.FullExpand;

end;

procedure Preenche();

var Fin : TFin;

begin
  Fin := TFin.Create;
  Fin.Preenche_Esquema(FinContas.TreeView1);
  Fin.Destroy;
end;

procedure TFinContas.BitBtn2Click(Sender: TObject);

begin
  Preenche;
end;

procedure Mostra_edita(tipo:smallint);
begin
  with FinContas do
  begin
    lbMens.Caption := '';
    // Normal
    if (tipo=1) then
    begin
      edConta.Visible := false;
      ckAtivo.Visible := false;
      lbAtivo.Visible := true;

      btAlt.Visible := true;
      btSubN.Visible := true;
      btCancel.Visible := false;
      btSalvar.Visible := false;
      btApagar.Visible := false;

      btAlt.Enabled := true;
      btSubN.Enabled := true;

      PanelSub.Visible := false;
    end;
    // Alterar
    if (tipo=2) then
    begin
      edConta.Visible := true;
      ckAtivo.Visible := true;
      lbAtivo.Visible := false;

      btAlt.Visible := false;
      btSubN.Visible := false;
      btCancel.Visible := true;
      btSalvar.Visible := true;
      btApagar.Visible := true;
    end;

    // SubNivel
    if (tipo=3) then
    begin
      edConta.Visible := false;
      ckAtivo.Visible := false;
      lbAtivo.Visible := true;

      btAlt.Visible := true;
      btSubN.Visible := true;
      btCancel.Visible := false;
      btSalvar.Visible := false;
      btApagar.Visible := false;

      btAlt.Enabled := false;
      btSubN.Enabled := false;

      PanelSub.Visible := true;
    end;

  end;
end;

procedure TFinContas.btAltClick(Sender: TObject);
begin
  // Alterar Nível Atual
  if (DM5.cdsFinCPERMISSAO.Value = 2) then Mostra_edita(2)
    else lbMens.Caption := 'Conta do SISTEMA. Não pode ser Alterada';
end;

procedure TFinContas.btApagarClick(Sender: TObject);

var Fin    : TFin;
    r : Smallint;

begin
  r := 0;
  if MessageDlg('Tem certeza que deseja APAGAR a conta ' + DM5.cdsFinCNOMECONTA.Value + '? ',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Fin   := TFin.Create;
    r := Fin.Apagar(DM5.cdsFinCNIVEL.value);
    Fin.Destroy;

    if (r = 1)  then  lbMens.Caption := 'Existem Registros. Não posso apagar!';
    Preenche;
    Mostra_edita(1);
  end;
end;

procedure TFinContas.btCancelClick(Sender: TObject);
begin
  // cancelar
  Mostra_Edita(1);
end;

procedure TFinContas.btCancelSubClick(Sender: TObject);
begin
  Mostra_edita(1);
end;

procedure TFinContas.btSalvarClick(Sender: TObject);

var Fin    : TFin;
    idFin  : Integer;
    st, niv: Smallint;
    nome   : String;

begin
  if (length(edConta.Text)>3) then
  begin
    idFin := DM5.cdsFinCID.Value;
    niv   := DM5.cdsFinCNIVEL.Value;
    st    := 1;
    if not (ckAtivo.Checked) then st := 0;
    nome  := edConta.Text;

    // Salvar
    Fin   := TFin.Create;
    Fin.Salvar(idFin, niv, st, nome );
    Fin.Destroy;
    Mostra_edita(1);
    Preenche;
    lbConta.Caption := edConta.Text;

  end;
end;

procedure TFinContas.btSalvarSubClick(Sender: TObject);

var Fin    : TFin;
    idFin  : Integer;
    st, niv: Smallint;
    nome   : String;

begin
  if (length(edSub.Text)>3) then
  begin
    idFin := 0;
    niv   := StrToInt(lbSub.Caption);
    st    := 1;
    nome  := edSub.Text;

    // Salvar
    Fin   := TFin.Create;
    Fin.Salvar(idFin, niv, st, nome );
    Fin.Destroy;
    Mostra_edita(1);
    Preenche;
  end;
end;

procedure TFinContas.btSubNClick(Sender: TObject);
var iProx : Integer;
    Fin : TFin;

begin
  /// Inserir SubNíbvel
    Fin := TFin.Create;
    iProx := Fin.Calcula_NovoNivel(DM5.cdsFinCNIVEL.Value);
    Fin.Destroy;
  if (iProx > 0) then
  begin
    Mostra_edita(3);
    edSub.Text := '';
    lbSub.Caption := iProx.ToString;
    edSub.SetFocus;
  end
  else lbMens.Caption := 'Não é possível criar CONTA neste Nível!';

end;

procedure TFinContas.Entrar;
begin
  lbMens.Caption  := '';
  lbAtivo.Caption := '';
  lbConta.Caption := '-';
  lbNiv.Caption   := '-';
  Mostra_edita(1);
  Preenche;

end;

procedure TFinContas.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (Node.Level=0) then
  begin
    Node.TreeView.Canvas.Font.Color := clRed;
  end;
end;

procedure TFinContas.TreeView1DblClick(Sender: TObject);
var Fin : TFin;

begin
  // Carregar
  Fin := TFin.Create;
  Fin.Seleciona_Item(TreeView1.Selected.AbsoluteIndex);
  Fin.Destroy;

  edConta.Text     := DM5.cdsFinCNOMECONTA.Value;
  lbConta.Caption  := DM5.cdsFinCNOMECONTA.Value;

  lbNiv.Caption    := DM5.cdsFinCNIVEL.AsString;

  lbAtivo.Caption := 'Conta Ativa';
  lbAtivo.Font.Color := clGreen;
  ckAtivo.Checked := true;

  if DM5.cdsFinCSTATUS.Value = 0 then
  begin
    lbAtivo.Caption := 'Conta Desativada';
    lbAtivo.Font.Color := clGray;
    ckAtivo.Checked := false;
  end;

  Mostra_edita(1);
end;

end.
