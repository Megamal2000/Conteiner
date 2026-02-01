unit gBanco;

interface

uses Variants, SysUtils, StdCtrls, veDM, DB, SQLExpr, DBClient, Dialogs;

type
  TBcg = class(TObject)
  private
    sq : String;
    ConexaoBD : TSQLConnection;
    sdsTemp   : TsqlDataSet;
    cdsTemp   : TClientDataSet;
  protected

  public
    // CONSTRUCTOR = Escolhe a conexao
    Constructor Create; overload;   // sem Parametro = ConStok
    Constructor Create(Conexao : TSQLConnection); overload;
    // Manipula SQL
    procedure sqlExecuta( sql : string; tipo : string);
    procedure sqlRoda(DataS : TSQLDataSet; ClientDS : TClientDataSet; SQL : String);
    procedure sqlExecuta_SP( DataS: TSQLStoredProc);
    procedure sqlPuro(sql:string);

    // Altera/Configura
    procedure acAlteraStatus(id, Status:Integer; sTab, sCampo:String);
    // Objetos - Interação
    procedure oiCb_Preenche(var Lista: tCombobox; Tab, Campo: String; cond : String; sdsT:TSQLDataset; cdsT:TClientDataSet);
    function oiCp_leid(escolhido : string; Tab, Campo: String; sdsT:TSQLDataset; cdsT:TClientDataSet): Integer;
    procedure oiCp_Pos(var Lista: TComboBox; Tabela : String; id : String; CampoMostrado : String; var sdsT:TSQLDataset; var cdsT:TClientDataSet);
    // Traduzir ID
    function tiRetornaINT(idg:Integer; sTab, sCampo:String ):Integer;
    function tiRetornaSTR(idg:Integer; sTab, sCampo:String ):String;
    end;



implementation



{ TBcg }
// ------------------- CONSTRUCTOR
constructor TBcg.Create(Conexao : TSQLConnection);
begin
  // Configura a Conexao
  self.ConexaoBD := Conexao;
  self.sdsTemp := eDM.sdsTMPe;
  self.cdsTemp  := eDM.cdsTMPe;
end;


constructor TBcg.Create;
begin
  // Execute the parent (TObject) constructor first
  inherited;  // Chama o método original

  // Configura o padrao
  self.ConexaoBD := eDM.ConSTOK;
  self.sdsTemp := eDM.sdsTMPe;
  self.cdsTemp  := eDM.cdsTMPe;

end;


// ------------------- MANIPULA SQL
procedure TBcg.sqlExecuta( sql, tipo: string);

 var Transacao : TTransactionDesc;

begin
  try
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREPEATABLEREAD;
    ConexaoBD.StartTransaction(Transacao);
    sdsTemp.Close;
    sdsTemp.CommandType := ctQuery;
    sdsTemp.CommandText := sql;
    sdsTemp.ExecSQL();

    ConexaoBD.Commit(Transacao);
  except
    on Exc : Exception do
      begin
        ShowMessage('Erro: '+tipo+#13+ sql+#13+#13+Exc.Message);
        ConexaoBD.Rollback(Transacao);
      end;
   end;


end;

procedure TBcg.sqlExecuta_SP(DataS: TSQLStoredProc);
 var Transacao : TTransactionDesc;

begin
  try
    Transacao.TransactionID := 1;
    Transacao.IsolationLevel := xilREPEATABLEREAD;
    ConexaoBD.StartTransaction(Transacao);

    //DataS.Active := False;
    DataS.ExecProc;

    ConexaoBD.Commit(Transacao);
  except
    on Exc : Exception do
      begin
        ShowMessage('Erro: '+#13+#13+Exc.Message);
        ConexaoBD.Rollback(Transacao);
      end;
   end;

end;

procedure TBcg.sqlRoda(DataS: TSQLDataSet; ClientDS: TClientDataSet;
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

function TBcg.tiRetornaINT(idg: Integer; sTab, sCampo: String): Integer;
  var resp : Integer;
begin
  resp := 0;

  sq := 'Select  '+sCampo+' from '+sTab+ ' ' ;
  sq := sq + '  Where id = ' + idg.ToString;
  sq := sq + ' ';
  sqlRoda(eDM.sdsTMPe  , eDM.cdsTMPe  , sq);

  if eDM.cdsTMPe.RecordCount>0 then
    resp := eDM.cdsTMPe.Fields[0].Value;

  Result := Resp;

end;

function TBcg.tiRetornaSTR(idg: Integer; sTab, sCampo: String): String;
  var resp : String;
begin
  resp := '';

  sq := 'Select  '+sCampo+' from '+sTab+ ' ' ;
  sq := sq + '  Where id = ' + idg.ToString;
  sq := sq + ' ';
  sqlRoda(eDM.sdsTMPe  , eDM.cdsTMPe  , sq);

  if eDM.cdsTMPe.RecordCount>0 then
    resp := eDM.cdsTMPe.Fields[0].Value;

  Result := resp;

end;

procedure TBcg.sqlPuro(sql:String);
var sq : String;
begin
  sq := sql;
  sqlRoda(eDM.sdsTMPe  , eDM.cdsTMPe  , sq);

end;

// ---------------------------------- procedimentos
procedure TBcg.acAlteraStatus(id, Status: Integer; sTab, sCampo: String);
begin
  sq := 'Update '+sTab+ ' SET '+sCampo+ ' = ' + Status.ToString ;
  sq := sq + '  Where id = ' + id.ToString;
  sq := sq + ' ';
  sqlExecuta(sq , 'Alterar Status');
end;


procedure TBcg.oiCb_Preenche(var Lista: tCombobox; Tab, Campo, cond: String; sdsT:TSQLDataset; cdsT:TClientDataSet);
var i  : integer;
    sq : String;

begin
  if (length(cond) > 0) then sq := 'SELECT id, ' + Campo + '  FROM ' + Tab + ' WHERE ' + cond  + ' order by ' + Campo
    else sq := 'SELECT id, ' + Campo + '  FROM ' + Tab + ' order by ' + Campo;
  sqlRoda(sdsT  , cdsT  , sq);
  i := 0;
  cdsT.First;
  while (i<cdsT.RecordCount) do
  begin
    Lista.Items.Append(Trim(cdsT.Fields[1].Value));
    cdsT.Next;
    i := i + 1;
  end;

end;

function TBcg.oiCp_leid(escolhido, Tab, Campo: String; sdsT:TSQLDataset; cdsT:TClientDataSet): Integer;
var i: Integer;
    resp : integer;
    sq : String;

begin
  sq := 'SELECT id, ' + Campo + ' as cmp FROM ' + Tab + ' ';
  sqlRoda(sdsT  , cdsT  , sq);
  i := 0;
  resp := 0;
  cdsT.First;
  while (i<cdsT.RecordCount) do
  begin
    if (UpperCase(TRIM(escolhido)) = UpperCase(TRIM(cdsT.Fields[1].AsString))) then resp := cdsT.Fields[0].Value;
    cdsT.Next;
    i := i + 1;
  end;

  oiCp_leid := resp;

end;

procedure TBcg.oiCp_Pos(var Lista: TComboBox; Tabela, id,
  CampoMostrado: String; var sdsT:TSQLDataset; var cdsT:TClientDataSet);
var i, c : integer;
    sq , m, n: String;
    Achei : Boolean;

begin
  sq := 'SELECT id, ' + CampoMostrado + ' as cmp FROM ' + Tabela + ' Where (id = '+ id + ')  ';
  sqlRoda(sdsT  , cdsT  , sq);
  cdsT.Refresh;
  n := UpperCase(TRIM(cdsT.Fields[1].AsString));
  c := cdsT.RecordCount;
  achei := false;
  i := 0;
  Lista.ItemIndex := 0;
  while ((not achei) and (i<Lista.Items.Count)) do
  begin
    m := TRIM(Lista.Items[i]);
    if (n = UpperCase(m)) then
    begin
      Achei := true;
      Lista.ItemIndex := i;
    end;

    i := i + 1;
  end;
  //if (not Achei) then Lista.ItemIndex := Lista.Items.Count else Lista.ItemIndex := i-1;


end;


end.
