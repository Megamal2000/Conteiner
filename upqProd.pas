unit upqProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, ExtCtrls;

type
  TpqProd = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edCod: TEdit;
    Label3: TLabel;
    cbGrupo: TComboBox;
    btPesq: TBitBtn;
    DataSource1: TDataSource;
    Panel2: TPanel;
    Label4: TLabel;
    lbCli: TLabel;
    DBGrid1: TDBGrid;
    procedure edNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbGrupoCloseUp(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_saida(i : Smallint);
  end;

var
  pqProd: TpqProd;
  Saida : Smallint;


implementation

{$R *.dfm}

uses uDM1, uDM2, Global, ucadProd, uBanco;

procedure Sair();

var idP : Integer;

begin
  if (DM1.cdsProd.RecordCount > 0) then
  begin
    if (Saida = 1) then
    begin
      idP := DM1.cdsProdID.Value;
      cadProd.set_idProg(idP);
      cadProd.Show;
    end;

    if (Saida = 2) then
    begin
    end;
    pqProd.Hide;
  end;
end;

procedure Mostra_Cli;

var bco : TBco;

begin
  bco := TBco.Create;
  with pqProd do
  begin
      bco.Cliente_MostraId(idCli);
      lbCli.Caption := DM1.cdsCliNOME.Value+ '  '+IntToStr(idCli);
      cbGrupo.Clear;
      cbGrupo.Text := 'Escolha um GRUPO';
      DM2.DBCb_Preenche(cbGrupo, 'TB_GRUPO', 'DESCRICAO', 'LIGCLI = '+IntToStr(idCli) );
      //lbCli.Caption := 'nadaBBB';
  end;
end;

procedure Limpar;

begin
  with pqProd do
  begin
    edNome.Text       := '';
    edCod.Text        := '';
    cbGrupo.Itemindex := 0;
  end;

end;



procedure TpqProd.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (key = 13) then
  if (edNome.Text <> '') then
  begin
    bco.Prod_MostraDescricao(idCli, edNome.Text);
    Limpar;
    edNome.SetFocus;
  end
  else edCod.SetFocus;

end;

procedure TpqProd.edCodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var bco : Tbco;

begin
  bco := TBco.Create;
  if (key = 13) then
  if (edCod.Text <> '') then
  begin
    bco.Prod_MostraCod(idCli, edCod.Text);
    Limpar;
    edCod.SetFocus;
  end
  else cbGrupo.SetFocus;

end;

procedure TpqProd.cbGrupoCloseUp(Sender: TObject);

var bco : Tbco;
    idG : Integer;

begin
  bco := TBco.Create;
  idG := DM2.DBCp_leid(cbGrupo.Items[cbGrupo.Itemindex], 'TB_PRODUTO', 'DESCRICAO' );
  bco.Prod_MostraGrupo(idG);

end;

procedure TpqProd.FormActivate(Sender: TObject);
begin
  Mostra_Cli;
  Limpar;
end;

procedure TpqProd.DBGrid1DblClick(Sender: TObject);

begin
  Sair;
end;

procedure TpqProd.set_saida(i: Smallint);
begin
  Saida := i;
end;

end.
