unit uDM2;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB,
  SqlExpr, StdCtrls, Dialogs, Variants, midasLib;
  // Delphi 7 para DXE 10 - Rretirei o DBEXPRESS
  // coloquei o midaslib no USES e midas.dll na pasta

type
  TDM2 = class(TDataModule)
    sdsTMP: TSQLDataSet;
    sdsConta: TSQLDataSet;
    sdsVazio: TSQLDataSet;
    sdsDBCp: TSQLDataSet;
    sdsUser: TSQLDataSet;
    dspTMP: TDataSetProvider;
    cdsTMP: TClientDataSet;
    dspConta: TDataSetProvider;
    cdsConta: TClientDataSet;
    dspVazio: TDataSetProvider;
    cdsVazio: TClientDataSet;
    dspDBCp: TDataSetProvider;
    cdsDBCp: TClientDataSet;
    dspUser: TDataSetProvider;
    cdsUser: TClientDataSet;
    cdsUserID: TIntegerField;
    cdsUserNOME: TStringField;
    cdsUserLOGIN: TStringField;
    cdsUserSENHA: TStringField;
    cdsUserULTACESSO: TSQLTimeStampField;
    cdsUserNIVEL: TSmallintField;
    cdsUserUSSTATUS: TSmallintField;
    sdsSP: TSQLDataSet;
    dspSP: TDataSetProvider;
    cdsSP: TClientDataSet;
    sspSP: TSQLStoredProc;
    sdsTMP2: TSQLDataSet;
    dspTMP2: TDataSetProvider;
    cdsTMP2: TClientDataSet;
    sspExec: TSQLStoredProc;
    sspInicia: TSQLStoredProc;
  private
    { Private declarations }
    us_nome : String;
    us_nivel: ShortInt;
    us_tipo : String;
    // Cliente Padrao
    cli_num : Integer;

  public
    { Entrada de Variáveis }
    function get_usnome: String;
    function get_usnivel: Shortint;
    function get_ustipo : String;
    { Manipulação de BDs }
    procedure Executa_SQL(Conn : TSQLConnection; Daset: TSQLDataSet ; sql : string; tipo : string);
    procedure Roda_SQL(DataS : TSQLDataSet; ClientDS : TClientDataSet; SQL : String);
    procedure Executa_SP(Conn : TSQLConnection; DataS: TSQLStoredProc);
    function Vazio(Tab : String; cond : String):boolean;
    function Conta(Tab : String; cond : String): Integer ;
    function Lista(Tab : String; cond, campo : String; iniciavirg:boolean): String ;

    function Ultimo(Tab,campo, cond: String): Integer;
    procedure Altera_Status(Tab, campo: String; id, st : integer);
    procedure Altera_Texto(Tab, campo: String; id:Integer; texto: String);

    { Combo Box }
    procedure DBCb_Preenche(var Lista : tCombobox; Tab : String; Campo : String; cond : String);
    function DBCp_leid(escolhido : String; Tab : String; Campo : String):Integer;
    procedure DBCp_Pos(var Lista: TComboBox; Tabela : String; id : String; CampoMostrado : String);

    { Outras Funções }
    function Troca_num(n : String; t : Integer):String;
    {Cliente padrao}
    function get_cliNum : Integer;
    procedure set_cliNum(i : Integer);



  end;

var
  DM2: TDM2;

implementation

{$R *.dfm}

uses uDM1, uLib;

function TDM2.get_usnivel: Shortint;
begin
  get_usnivel := us_nivel;
end;

function TDM2.get_usnome: String;
begin
  get_usnome := us_nome;
end;

function TDM2.get_ustipo: String;
begin
  get_ustipo := us_tipo;
end;

function TDM2.Lista(Tab, cond, campo: String; iniciavirg:boolean): String;
var sq : String;
    resp : String;

begin
  resp := '';
  // prepara o SQL
  if (length(cond) > 0) then sq := 'SELECT '+campo+' as icmp FROM '+ tab+' WHERE '+cond
    else sq := 'SELECT '+campo+' as icmp FROM '+ tab+' ';
  // Roda o SELECT
  Roda_SQL(DM2.sdsTMP , DM2.cdsTMP , sq);
  // Pega o resultado
  if DM2.cdsTMP.RecordCount > 0 then
  begin
    resp := '';
    if iniciavirg then resp := ',';
    DM2.cdsTMP.First;
    while (not DM2.cdsTMP.Eof) do
    begin
      resp := resp + DM2.cdsTMP.Fields[0].AsString +',';
      DM2.cdsTMP.Next;
    end;
  end;
  // Atualiza a funcao
  if not iniciavirg then  resp := copy(resp, 0, Length(resp) -1);
  Lista := resp;
end;

procedure TDM2.Executa_SQL(Conn : TSQLConnection; Daset: TSQLDataSet ;
 sql : string; tipo : string);

 var Transacao : TTransactionDesc;

begin
  try
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREPEATABLEREAD;
    Conn.StartTransaction(Transacao);
    Daset.Close;
    Daset.CommandType := ctQuery;
    Daset.CommandText := sql;
    Daset.ExecSQL();
    Conn.Commit(Transacao);
  except
    on Exc : Exception do
      begin
        ShowMessage('Erro: '+tipo+#13+ sql+#13+#13+Exc.Message);
        Conn.Rollback(Transacao);
      end;
   end;
end;

procedure TDM2.Executa_SP(Conn : TSQLConnection; DataS: TSQLStoredProc);

 var Transacao : TTransactionDesc;

begin
  try
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREPEATABLEREAD;
    Conn.StartTransaction(Transacao);

    //DataS.Active := False;
    DataS.ExecProc;

    Conn.Commit(Transacao);
  except
    on Exc : Exception do
      begin
        ShowMessage('Erro: '+#13+#13+Exc.Message);
        Conn.Rollback(Transacao);
      end;
   end;
end;


procedure TDM2.Roda_SQL(DataS: TSQLDataSet; ClientDS: TClientDataSet;
  SQL: String);
begin
try
  DataS.Active := False;
  DataS.CommandType := ctQuery;
  DataS.CommandText := SQL;
  DataS.Active := True;

  ClientDS.Active := False;
  ClientDS.Active := True;
except
    on Exc : Exception do
      begin
        ShowMessage('Erro: CONSULTA '+#13+ sql+#13+#13+Exc.Message);
      end;
   end;
end;

//procedure TDM2.RodaAync_SQL(DataS: TSQLDataSet; ClientDS: TClientDataSet;
//  SQL: String);
//begin
//try
//  DataS.Active := False;
//  DataS.CommandType := ctQuery;
//  DataS.CommandText := SQL;
//  DataS.Active := True;
//
//  ClientDS.Active := False;
//  ClientDS.Active := True;
//except
//    on Exc : Exception do
//      begin
//        ShowMessage('Erro: CONSULTA '+#13+ sql+#13+#13+Exc.Message);
//      end;
//   end;
//end;


function TDM2.Vazio(Tab: String; cond: String): boolean;

var sq : String;
    resp : boolean;

begin
  // Prepara o SQL
  if (length(cond) > 0) then sq := 'SELECT 1 as TEM FROM '+ tab+' WHERE '+cond
    else sq := 'SELECT 1 as TEM FROM '+ tab+' ';
  // Roda o SELECT
  Roda_SQL(DM2.sdsVazio, DM2.cdsVazio,sq);
  // Verifica o resultado
  if (DM2.cdsVazio.FieldByName('TEM').Value = 1) then resp := false
    else resp := true;
  // retorna o valor para a funcao
  Vazio := resp;
end;


function TDM2.Conta(Tab, cond: String): Integer;

var sq : String;
    resp : Integer;

begin
  // prepara o SQL
  if (length(cond) > 0) then sq := 'SELECT Count(id) as Qty FROM '+ tab+' WHERE '+cond
    else sq := 'SELECT Count(id) as Qty FROM '+ tab+' ';
  // Roda o SELECT
  Roda_SQL(DM2.sdsConta , DM2.cdsConta , sq);
  // Pega o resultado
  resp := DM2.cdsConta.FieldByName('Qty').Value;
  // Atualiza a funcao
  Conta := resp;
end;

function TDM2.Ultimo(Tab,campo, cond: String): Integer;

var sq, c : String;
    resp : Integer;

begin
  // prepara o SQL
  if (length(cond) > 0) then sq := 'SELECT FIRST 2 id, '+campo+' FROM '+ tab+' WHERE '+cond+ 'ORDER BY '+campo+ ' DESC'
    else sq := 'SELECT FIRST 2 id, '+campo+' FROM '+ tab+ ' ORDER BY ' + campo+ ' DESC';
  // Roda o SELECT
  Roda_SQL(DM2.sdsTMP , DM2.cdsTMP , sq);
  // Pega o resultado
  Dm2.cdsTMP.First;
  if (VarIsNull(DM2.cdsTMP.Fields[1].Value)) then resp := 0
  else
  begin
  if (campo = 'id') then   resp := DM2.cdsTMP.Fields[0].Value
    else resp := DM2.cdsTMP.Fields[1].Value;
  end;
  // Atualiza a funcao
  Ultimo := resp;
end;

procedure TDM2.DBCb_Preenche(var Lista: tCombobox; Tab, Campo: String; cond : String);

var i  : integer;
    sq : String;

begin
  if (length(cond) > 0) then sq := 'SELECT id, ' + Campo + '  FROM ' + Tab + ' WHERE ' + cond  + ' order by ' + Campo
    else sq := 'SELECT id, ' + Campo + '  FROM ' + Tab + ' order by ' + Campo;
  Roda_SQL(DM2.sdsDBCp  , DM2.cdsDBCp  , sq);
  i := 0;
  DM2.cdsDBCp.First;
  while (i<DM2.cdsDBCp.RecordCount) do
  begin
    Lista.Items.Append(Trim(DM2.cdsDBCp.Fields[1].Value));
    DM2.cdsDBCp.Next;
    i := i + 1;
  end;
end;



function TDM2.DBCp_leid(escolhido : string; Tab, Campo: String): Integer;

var i: Integer;
    resp : integer;
    sq : String;

begin
  sq := 'SELECT id, ' + Campo + ' as cmp FROM ' + Tab + ' ';
  Roda_SQL(DM2.sdsDBCp  , DM2.cdsDBCp  , sq);
  i := 0;
  resp := 0;
  DM2.cdsDBCp.First;
  while (i<DM2.cdsDBCp.RecordCount) do
  begin
    if (UpperCase(TRIM(escolhido)) = UpperCase(TRIM(DM2.cdsDBCp.Fields[1].AsString))) then resp := DM2.cdsDBCp.Fields[0].Value;
    DM2.cdsDBCp.Next;
    i := i + 1;
  end;

  DBCp_leid := resp;
end;

function TDM2.Troca_num(n: String; t : Integer): String;

var i : integer;
    s : String;

begin
  s := '';
  n := Trim(n);

  for i := 1 to length(n) do
  begin
    if (t= 1) then if (n[i] = ',') then s := s + '.' else s := s + n[i];
    if (t<>1) then if (n[i] = '.') then s := s + ',' else s := s + n[i];
  end;
  Troca_num := Trim(s);
end;



procedure TDM2.DBCp_Pos(var Lista: TComboBox; Tabela : String; id : String; CampoMostrado : String);

var i : integer;
    sq , m: String;
    Achei : Boolean;

begin
  sq := 'SELECT id, ' + CampoMostrado + ' as cmp FROM ' + Tabela + ' Where id = '+id;
  Roda_SQL(DM2.sdsDBCp  , DM2.cdsDBCp  , sq);

  achei := false;
  i := 0;
  Lista.ItemIndex := 0;
  while ((not achei) and (i<Lista.Items.Count)) do
  begin
    m := TRIM(Lista.Items[i]);
    if (UpperCase(TRIM(DM2.cdsDBCp.Fields[1].AsString)) = UpperCase(m)) then
    begin
      Achei := true;
      Lista.ItemIndex := i;
    end;

    i := i + 1;
  end;
  //if (not Achei) then Lista.ItemIndex := Lista.Items.Count else Lista.ItemIndex := i-1;
end;






procedure TDM2.Altera_Status(Tab, campo: String; id, st: integer);

var sq : string;

begin
  sq := 'Update '+Tab+ ' SET '+ campo + ' = '+ intToStr(st)+ ' WHERE id = '+ intToStr(id)+ ' ';
  Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Altera Status');
end;

procedure TDM2.Altera_Texto(Tab, campo: String; id:Integer; texto: String);
  var sq : string;
begin
  sq := 'Update '+Tab+ ' SET '+ campo + ' = '+ QuotedStr(texto)+ ' WHERE id = '+ intToStr(id)+ ' ';
  Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Altera Status');
end;


function TDM2.get_cliNum: Integer;
begin
  get_cliNum :=  cli_num;
end;

procedure TDM2.set_cliNum(i: Integer);
begin
  cli_num := i;
end;

end.
