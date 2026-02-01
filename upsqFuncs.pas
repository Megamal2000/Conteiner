unit upsqFuncs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  TpsqFuncs = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    edDoc: TEdit;
    btPesq: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ckAtivo: TCheckBox;
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
    procedure set_saida(i : ShortInt);
    procedure set_tipo(i : ShortInt);
  end;

var
  psqFuncs: TpsqFuncs;
  saida, tipoP : ShortInt;

implementation

{$R *.dfm}

uses UDM1, uDM2, uBanco, ucadFuncs, uRoman, uContDias, uPagDiv, uGanhoM,
  upqCarM, uPagVale;


procedure Pesquisar;

var oque : String;
    bco  : TBco;
    idf  : Integer;
    ativ : Smallint;

begin
  bco := TBco.Create;
  // NOME
  oque := '';
  oque := psqFuncs.edNome.Text;
  ativ := 1;
  if psqFuncs.ckAtivo.Checked = false then ativ := 0;

  if ( oque <> '' ) then
  begin
    bco.Funcs_ProcuraNome(oque, tipoP, ativ);
  end;

  // Documento
  oque := '';
  oque := psqFuncs.edDoc.Text;
  if ( oque <> '' ) then
  begin
    idf := bco.Funcs_Existe(oque, Ativ);

    if (idf > 0) then
    begin
      cadFuncs.set_idFuncs(idf);
      cadFuncs.Show;
    end;
  end;

  bco.Destroy;

end;


procedure TpsqFuncs.btPesqClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TpsqFuncs.edNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key =13) then
  begin
    if (edNome.Text<>'') then Pesquisar else edDoc.SetFocus;

    if (DM1.cdsFuncs2.RecordCount  > 0) then
    begin
      DM1.cdsFuncs2.First;
      DBGrid1.SetFocus;

    end;


  end;
end;

procedure TpsqFuncs.edDocKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key =13) then
    if (edDoc.Text<>'') then Pesquisar else edNome.SetFocus;
end;

procedure Sair();
begin
  if (DM1.cdsFuncs2.RecordCount > 0) then
  begin
    // Tela de Funcionarios
    if (saida = 1) then
    begin
      cadFuncs.set_idFuncs(DM1.cdsFuncs2ID.Value);
      cadFuncs.Show;
    end;

    // Motoristas
    if (saida = 2) then
    begin
      Roman.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      Roman.set_idM(DM1.cdsFuncs2ID.Value);
      Roman.Show;
    end;

    // Ajudantes
    if (saida = 3) then
    begin
      Roman.lbAjud.Caption := DM1.cdsFuncs2NOME.Value;
      Roman.set_idA(DM1.cdsFuncs2ID.Value);
      Roman.Show;
    end;

    // Dias Contrato
    if (saida = 4) then
    begin
      ContDias.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      ContDias.set_idM(DM1.cdsFuncs2ID.Value);
      ContDias.Show;
    end;

    // Dias Contrato
    if (saida = 5) then
    begin

      PagDiv.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      PagDiv.set_idM(DM1.cdsFuncs2ID.Value);
      PagDiv.Entrar;
      PagDiv.Show;
    end;

    // ganho Mot
    if (saida = 6) then
    begin
      GanhoM.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      GanhoM.set_idMot(DM1.cdsFuncs2ID.Value);
      GanhoM.Show;
    end;

   // Carros Flayde Mot
    if (saida = 7) then
    begin
      pqCarM.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      pqCarM.set_idMot(DM1.cdsFuncs2ID.Value);
      pqCarM.Show;
    end;

   // vales
    if (saida = 8) then
    begin
      pagVale.lbMot.Caption := DM1.cdsFuncs2NOME.Value;
      pagVale.set_idM(DM1.cdsFuncs2ID.Value);
      pagVale.Show;
    end;

    psqFuncs.Hide;
  end;

end;


procedure TpsqFuncs.DBGrid1DblClick(Sender: TObject);
begin
  Sair;
end;

procedure TpsqFuncs.set_saida(i: ShortInt);
begin
  saida := i;
end;

procedure TpsqFuncs.set_tipo(i: ShortInt);
begin
  tipoP := i;
  if (tipoP = 0) then psqFuncs.Caption := 'Procura Funcionários';
  if (tipoP = 1) then psqFuncs.Caption := 'Procura Motoristas';
  if (tipoP = 2) then psqFuncs.Caption := 'Procura Ajudantes';

end;

procedure TpsqFuncs.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key = chr(VK_DOWN)) then DM1.cdsFuncs2.Next;
  if(key = chr(VK_UP))   then DM1.cdsFuncs2.Prior;
  if(key = #13) then Sair;
end;

end.
