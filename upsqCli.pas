unit upsqCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls;

type
  TpsqCli = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edNome: TEdit;
    Label2: TLabel;
    edDoc: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btPesq: TBitBtn;
    procedure btPesqClick(Sender: TObject);
    procedure edNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDocKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_Saida(i : Integer);
  end;

var
  psqCli: TpsqCli;
  Saida : Smallint;

implementation

{$R *.dfm}

uses UDM1, uDM2, uBanco, ucadCli, uContDias;


procedure Sair();
begin
  if (DM1.cdsCli2.RecordCount > 0) then
  begin
    if (Saida = 1) then
    begin
      cadCli.set_idCli(DM1.cdsCli2ID.Value);
      cadCli.Show;
    end;

    if (Saida = 2) then
    begin
      ContDias.set_idC(DM1.cdsCli2ID.Value);
      ContDias.lbCli.Caption := DM1.cdsCli2NOME.Value;
      ContDias.Show;
    end;
    psqCli.Hide;
  end;
end;


procedure Pesquisar;

var oque : String;
    bco  : TBco;
    idc  : Integer;

begin
  bco := TBco.Create;
  // NOME
  oque := '';
  oque := psqCli.edNome.Text;
  if ( oque <> '' ) then
  begin
    bco.Cliente_ProcuraNome(oque);
    if (Dm1.cdsCli2.RecordCount > 0) then
      psqCli.DBGrid1.SetFocus;
  end;

  // Documento
  oque := '';
  oque := psqCli.edDoc.Text;
  if ( oque <> '' ) then
  begin
    idc := bco.Cliente_Existe(oque);

    if (idc > 0) then
    begin
      Sair;
    end;
  end;

  bco.Destroy;

end;



procedure TpsqCli.btPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TpsqCli.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key =13) then
    if (edNome.Text<>'') then Pesquisar else edDoc.SetFocus;
end;

procedure TpsqCli.edDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    if (edDoc.Text<>'') then Pesquisar else edNome.SetFocus;
end;

procedure TpsqCli.DBGrid1DblClick(Sender: TObject);
begin
  Sair;
end;

procedure TpsqCli.set_Saida(i: Integer);
begin
  Saida := i;
end;

procedure TpsqCli.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key = chr(VK_DOWN)) then DM1.cdsCli2.Next;
  if(key = chr(VK_UP))   then DM1.cdsCli2.Prior;
  if(key = #13) then Sair;
end;

end.
