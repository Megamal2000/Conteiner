unit uNFsegue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ExtCtrls;

type
  TNFsegue = class(TForm)
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    edNota: TEdit;
    btMostra: TBitBtn;
    DataSource1: TDataSource;
    procedure btMostraClick(Sender: TObject);
    procedure edNotaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarNF(idC, nNF : Integer);
    procedure AjustaCli(idC:Integer);
    procedure Entrar;
    
  end;

var
  NFsegue: TNFsegue;

implementation

{$R *.dfm}

uses uBanco, uDM5, uDM2;


procedure TNFsegue.Entrar;
begin
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  cbCli.ItemIndex := 0;
  edNota.Text := '';
end;

procedure TNFsegue.MostrarNF(idC, nNF: Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Fases_MostraNF(idC, nNF);
  Bco.Destroy;
end;

procedure Pesquisa();

var idCliente, nNota : integer;

begin

  idcliente := 0;
  nNota     := 0;

  with NFsegue do
  if (Length(edNota.Text) > 0) then
  begin
    if (cbCli.ItemIndex > 0) then
      idCliente := DM2.DBCp_leid(cbCli.Items[cbCli.itemindex], 'TB_CLIENTE', 'NOME');
    nNota := StrToInt(edNota.Text);
    MostrarNF(idCliente, nNota);
    edNota.Text := '';
  end
  else ShowMessage('Insira um número de Nota');

end;


procedure TNFsegue.btMostraClick(Sender: TObject);


begin
  Pesquisa;
end;

procedure TNFsegue.edNotaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Pesquisa;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;
end;

procedure TNFsegue.AjustaCli(idC: Integer);
begin
  DM2.DBCp_Pos(cbCli, 'TB_CLIENTE', IntToStr(idC), 'NOME');
end;

end.
