unit uCliGP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Buttons, StdCtrls, ComCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvMemoryDataset, JvDataSource;

type
  TcliGP = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    edPesq: TEdit;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    btNovo: TBitBtn;
    Label2: TLabel;
    edNovo: TEdit;
    btSalvarN: TSpeedButton;
    lbSel: TLabel;
    edSel: TEdit;
    btSalvarA: TSpeedButton;
    btApagar: TSpeedButton;
    DataSource1: TDataSource;
    JvDBGrid2: TJvDBGrid;
    Panel4: TPanel;
    btRetirar: TBitBtn;
    BitBtn1: TBitBtn;
    JvDBGrid3: TJvDBGrid;
    Label3: TLabel;
    btInsere: TBitBtn;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    Tab: TJvMemoryData;
    TabidGrupo: TIntegerField;
    TabNomeGrupo: TStringField;
    procedure edPesqKeyPress(Sender: TObject; var Key: Char);
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarNClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btSalvarAClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btInsereClick(Sender: TObject);
    procedure btRetirarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  cliGP: TcliGP;
  idGR : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM4, DateUtils;



procedure Mostra_ClientesSIM;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.CliGrupo_ListaCli(idGR);
  Bco.Destroy;
end;

procedure Mostra_ClientesNAO;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.CliGrupo_ListaCli(0);
  Bco.Destroy;
end;

procedure Mostra_SemGrupo(b : Boolean);


begin
  with cliGP do
  begin
    JvDBGrid3.Visible := b;
    Label3.Visible    := b;
    btInsere.Visible  := b;

  if b then
  begin
    Mostra_ClientesNAO;
    Tab.Close;
    Tab.EmptyTable;
    Tab.Open;

    DM4.cdsGRcli.First;
    while not DM4.cdsGRcli.Eof do
    begin
      Tab.Insert;
      TabidGrupo.Value   := DM4.cdsGRcliID.Value;
      TabNomeGrupo.Value := DM4.cdsGRcliNOME.Value;
      DM4.cdsGRcli.Next;
    end;


    Mostra_ClientesSIM;

  end;

  end; // with

end;

procedure Mostra_Ins(b : Boolean);

begin
  with cliGP do
  begin
    edNovo.Visible    := b;
    btSalvarN.Visible := b;
    edNovo.Text       := '';
  end;
end;


procedure Mostra_Alt(b : Boolean);

begin
  with cliGP do
  begin
    edSel.Visible     := b;
    btSalvarA.Visible := b;
    edSel.Text        := '';
    btApagar.Visible  := b;
  end;
end;

procedure Mostra_GRP;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cligrupo_Mostra;
  Bco.Destroy;
end;




procedure Pesquisar(nome:String);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cligrupo_Pesquisa(nome);
  Bco.Destroy;
end;

{ TcliGP }

procedure TcliGP.Entrar;

begin
  Mostra_SemGrupo(false);
  Mostra_Ins(false);
  Mostra_Alt(false);
  Mostra_GRP;

end;

procedure TcliGP.edPesqKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    if (length(edPesq.Text)>0) then
      Pesquisar(edPesq.Text);
end;

procedure TcliGP.btNovoClick(Sender: TObject);
begin
  Mostra_Ins(true);
  Mostra_Alt(false);
end;

procedure TcliGP.btSalvarNClick(Sender: TObject);

var Bco : TBco;

begin
  if (length(edNovo.Text)>0) then
  begin
    Bco := tBco.Create;
    Bco.CliGrupo_Insere(edNovo.Text);
    Bco.Destroy;
    Mostra_GRP;
  end;
end;

procedure TcliGP.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsGR.RecordCount > 0) then
  begin
    Mostra_Alt(true);
    Mostra_Ins(false);
    Mostra_SemGrupo(false);

    edSel.Text := DM4.cdsGRNOMEG.Value;
    idGR       := DM4.cdsGRID.Value;

    Mostra_ClientesSIM;
  end;
end;



procedure TcliGP.btSalvarAClick(Sender: TObject);

var Bco : TBco;

begin
  if (length(edSel.Text)>0) then
  begin
    Bco := tBco.Create;
    Bco.CliGrupo_Altera(idGr, edSel.Text);
    Bco.Destroy;
    Mostra_GRP;
  end;

end;

procedure TcliGP.btApagarClick(Sender: TObject);
var Bco : TBco;

begin
  if (DM4.cdsGRcli.RecordCount=0) then
  begin
    if MessageDlg('Tem certeza que deseja apagar?'+#13+DM4.cdsGRNomeG.Value,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := tBco.Create;
      Bco.CliGrupo_Apaga(idGr);
      Bco.Destroy;
      Mostra_GRP;
      idGR := 0;
      Mostra_ClientesSIM;
    end;
  end
  else ShowMessage('Não é possível excluir Grupo com Clientes'+#13+'Retire os clientes antes de excluir o Grupo');
end;

procedure TcliGP.BitBtn1Click(Sender: TObject);
begin
  Mostra_SemGrupo(true);
end;

procedure TcliGP.btInsereClick(Sender: TObject);

var Bco : TBco;

begin
    Bco := tBco.Create;
    Bco.CliGrupo_InsereCli(TabidGrupo.Value, idGR);
    Bco.Destroy;

  Mostra_SemGrupo(false);
  Mostra_ClientesSIM;
end;

procedure TcliGP.btRetirarClick(Sender: TObject);

var Bco : TBco;

begin
  if MessageDlg('Tem certeza que deseja retirar?'+#13+DM4.cdsGRcliNome.Value,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := tBco.Create;
    Bco.CliGrupo_InsereCli(DM4.cdsGRcliID.Value, 0);
    Bco.Destroy;
    Mostra_ClientesSIM;
  end;
end;

end.
