unit uEstoque;

interface

uses
  DB, uDM1, uDM2, uLib, SysUtils, Variants;

type
  TEstoque = class(TObject)

  private
    // variáveis
    sq : String;
    iUser, iCli, iEst, qA : Integer;
  public
    // procedure
    procedure setUser(i : Integer);
    procedure setCli (i : Integer);
    procedure Insere(idP : Integer; tipo : Smallint; Doc : String; EAnt, EMov, EAtual : Integer; VEnt : Double; Modo : String; NumLocal : integer);
    procedure Ajuste(idP : Integer; EMov : Integer; VEnt : Double; Modo, msg : String);
    procedure Entrada(idP : Integer; EMov : Integer; VEnt : Double; msg : String);
    procedure Saida(idP : Integer; EMov : Integer; msg : String);
    procedure Perda(idP : Integer; EMov : Integer; VEnt : Double; msg : String);
    procedure Contagem(idP : Integer; EMov : Integer; msg : String);
    procedure Cancelado(idP, id : Integer; msg : String);
    procedure ProcuraUlt(idP : integer);
  end;
implementation


{ TEstoque }
procedure TEstoque.Ajuste(idP, EMov: Integer; VEnt: Double; Modo, msg: String);

var qtA, qtD: Integer;
    m : String;

begin
  m := 'Ajuste de Estoque';
  if (msg <> '') then m := msg;

  ProcuraUlt(idP);
  qtA := qA;
  if (Modo = 'E') then qtD := qtA + EMov;
  if (Modo = 'S') then qtD := qtA - EMov;

  Insere(idP, 0, m , qtA, EMov, qtD, VEnt, Modo, EMov);
end;

procedure TEstoque.Cancelado(idP, id: Integer; msg : String);

var    m : String;

begin
  m := 'Cancelado';
  if (msg <> '') then m := msg;
  // só cancela se for o último
  ProcuraUlt(idP);
  if (iEst = id) then
  begin
    sq := 'UPDATE TB_ESTOQUE_MOV SET Tipo = 5, DOCSOBS = ' + QuotedStr(m) + ' WHERE ID = '+IntToStr(id);
    DM2.Executa_SQL(DM1.Conexao, DM1.sdsEstM, sq, 'Cancela');
  end;
end;

procedure TEstoque.Contagem(idP, EMov: Integer; msg : String);

var qtA, qtD: Integer;
    m : String;

begin
  m := 'Inventário';
  if (msg <> '') then m := msg;

  ProcuraUlt(idP);
  qtA := qA;

  Insere(idP, 5, m, qtA, 0, EMov, 0, 'X', 0);

end;

procedure TEstoque.Entrada(idP, EMov: Integer; VEnt: Double; msg : String);

var qtA, qtD: Integer;
    m : String;

begin
  m := 'Compra';
  if (msg <> '') then m := msg;

  ProcuraUlt(idP);
  qtA := qA;
  qtD := qtA + EMov;

  Insere(idP, 1, m, qtA, EMov, qtD, VEnt, 'E', EMov);
end;

procedure TEstoque.Insere(idP: Integer; tipo: Smallint; Doc: String; EAnt,
  EMov, EAtual: Integer; VEnt: Double; Modo: String; NumLocal: integer);
begin
  sq := 'Insert Into TB_ESTOQUE_MOV (LigUser, LigCli, LigProd, Tipo, ';
  sq := sq + ' DOCSOBS, Q_ANTERIOR, Q_MOV, Q_ATUAL, V_ENTRADA, Modo, N_LOCAL) VALUES (';
  sq := sq + IntToStr(iUser)+', '+ IntToStr(iCli) + ', '+IntToStr(idP);
  sq := sq + ', '+ IntToStr(Tipo)+', '+ QuotedStr(Doc)+', '+ IntToStr(EAnt);
  sq := sq + ', '+ IntToStr(EMov)+', '+ IntToStr(EAtual)+', '+ FloatToStr(VEnt);
  sq := sq + ', '+ QuotedStr(Modo)+', '+ IntToStr(NumLocal);

  DM2.Executa_SQL(DM1.Conexao, DM1.sdsEstM, sq, 'Insere');

end;

procedure TEstoque.Perda(idP, EMov: Integer; VEnt: Double; msg : String);

var qtA, qtD: Integer;
    m : String;

begin
  m := 'Perda';
  if (msg <> '') then m := msg;

  ProcuraUlt(idP);
  qtA := qA;
  qtD := qtA - EMov;

  Insere(idP, 0, m, qtA, EMov, qtD, VEnt, 'S', 0);
end;

procedure TEstoque.ProcuraUlt(idP: integer);
begin
  sq := 'SELECT * FROM TB_ESTOQUE_MOV WHERE LigProd = '+IntToStr(idP);
  sq := sq + ' and (Tipo < 4) ORDER BY id DESC';
  DM2.Roda_SQL(DM1.sdsEstM, DM1.cdsEstM, sq);

  iEst := 0;
  qA   := 0;

  DM1.cdsEstM.First;
  if (DM1.cdsEstMID.Value <> null) then iEst := DM1.cdsEstMID.Value;
  if (DM1.cdsEstMQ_ANTERIOR.Value <> null) then qA := DM1.cdsEstMQ_ANTERIOR.Value;
end;

procedure TEstoque.Saida(idP, EMov: Integer; msg : String);

var qtA, qtD: Integer;
    m : String;

begin
  m := 'Venda';
  if (msg <> '') then m := msg;

  ProcuraUlt(idP);
  qtA := qA;
  qtD := qtA - EMov;

  Insere(idP, 2, m, qtA, EMov, qtD, 0, 'S', 0);

end;

procedure TEstoque.setCli(i: Integer);
begin
  iCli := i;
end;

procedure TEstoque.setUser(i: Integer);
begin
  iUser := i;
end;

end.
