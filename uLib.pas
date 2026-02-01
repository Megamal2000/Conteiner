unit uLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Dialogs, Forms,
  SqlExpr, DB, DBClient, IniFiles, StdCtrls, ComObj, dateUtils, JvMemoryDataset;
    // Delphi 7 para DXE 10 - Retirei o DBEXPRESS

type
  E_endereco = class(Exception);
  E_complemento = class(Exception);
  E_bairro = class(Exception);
  E_cidade = class(Exception);
  E_Remetente = class(Exception);
  E_Destinatario = class(Exception);


  TMarco = class(TObject)
  private
    bd_usuario, bd_senha, bd_server : string;
    seg_user, seg_nivel, seg_senha : string;
    dir_prog, dir_Listas, dir_rels, dir_bip : string;
    cep_server, novos_server, ibge_server, cfop_server,
    averb_server, espelho_server, rest_server, stok_server : String;
    cli_nome, versao, data_sis, rest_server2 : String;
    cli_numero, cli_stok : Integer;
    scan_dir, scan_rec, scan_cli, scan_bkp, stok_imp : String;

    mail_pop, mail_smtp,
    mail_rem, mail_dest : String;

  protected

  public
    procedure AbreForm (aClasseForm : TComponentClass; aForm: TForm);
    function Codifica(Entrada: String): String;
    function Decodifica(Entrada: String): String;
    function get_bdpass: String;
    function get_bdserver: String;
    function get_bduser: String;
    function get_bdstok: String;
    procedure Grava_INI(tipo : Shortint);
    procedure Le_INI;
    procedure RefreshCds(aCds: TClientDataSet);
    procedure set_bdpass(pw: String);
    procedure set_bdserver(sv: String);
    procedure set_bduser(us: String);
    procedure set_bdstok(sv: String);
    function TestaCon(TestConnect: TSQLConnection; Servidor: String): Boolean;
    function AdjustCenter(st: string; qt: byte; ch: char): string;
    function AdjustLeft(st: string; qt: byte; ch: char): string;
    function AdjustRight(st: string; qt: byte; ch: char): string;
    procedure Cabeca_Padrao(Titulo: String);
    procedure Combo_Pos(var Lista: TComboBox; Valor: String);
    procedure Combo_Preenche(Lista: TComboBox; Arq: String);
    function get_listas: String;
    function get_progs: String;
    procedure set_progs(p : String);
    function get_rels: String;
    procedure set_rels(r : String);
    procedure Incrementa(TableName: String; PrimaryKey: TField; Connection: TSQLConnection);
    procedure set_listas(li: String);
    function get_seguser: String;
    function get_segsenha : String;
    procedure set_seguser(u: String);
    procedure set_segsenha(s: String);
    Function Formata_DOC(num : String):String;
    Function Monta_DOC(num : String):String;
    Function TestaCNPJ(xCGC: String):Boolean;
    Function get_cepServ:String;
    Function get_newServ:String;
    Function get_ibgeServ:String;
    Function get_cfopServ:String;
    Function get_AverbServ:String;
    Function get_EspelhoServ:String;
    Function get_RestServ:String;
    Function get_RestServ2:String;
    Function Formata_Num(n : String): String;
    function get_cliNome:string;
    procedure set_cliNome(s : string);
    function get_cliNumero : Integer;
    procedure set_cliNumero(i : integer);
    function get_cliStok : Integer;
    procedure set_cliStok(i : integer);
    function get_stokImp():string;
    procedure set_stokImp(s : string);

    Function get_versao:String;
    procedure set_dtSis(d : TDateTime);
    function get_dtSis(): TDateTime;
    procedure Exporta_Excel(sColDatas: String; ClientDS: TClientDataSet);
    procedure Exporta_ExcelTAB(sColDatas: String; ClientDS: TJvMemoryData);
    function FileCopy(source,dest: String): Boolean;


    function get_scanNao:string;
    function get_scanRec:string;
    function get_scanCli:string;
    function get_scanBkp:string;

    function get_mailpop:string;
    function get_mailsmtp:string;
    function get_mailrem:string;
    function get_maildest:string;
    function IsNumeric(S : String) : Boolean;

    function dia_util(dt:TDateTime):boolean;
    function IntervaloDias(dt1,dt2:TDateTime):integer;




  published

  end;
implementation
{ TMarco }

function TMarco.FileCopy(source,dest: String): Boolean;
{copia um arquivo de um lugar para outro. Retornando falso em caso de erro}
var
fSrc,fDst,len: Integer;
size: Longint;
buffer: packed array [0..2047] of Byte;
begin
if source <> dest then
  begin
    fSrc := FileOpen(source,fmOpenRead);
    if fSrc >= 0 then
    begin
      size := FileSeek(fSrc,0,2);
      FileSeek(fSrc,0,0);
      fDst := FileCreate(dest);
      if fDst >= 0 then
      begin
        while size > 0 do
        begin
          len := FileRead(fSrc,buffer,sizeof(buffer));
          FileWrite(fDst,buffer,len);
          size := size - len;
        end;
        FileSetDate(fDst,FileGetDate(fSrc));
        FileClose(fDst);
        FileSetAttr(dest,FileGetAttr(source));
        Result := True;
      end
      else
      begin
        Result := False;
      end;
      FileClose(fSrc);
    end;
  end;
end;


procedure TMarco.AbreForm(aClasseForm: TComponentClass; aForm: TForm);
begin
  {: método para abrir form}
  Application.CreateForm(aClasseForm, aForm);
  try
    aForm.ShowModal;
  finally
    aForm.Free;
  end;
end;

function TMarco.IsNumeric(S : String) : Boolean;
var
  i: integer;
begin
Result := TryStrToInt(s, i);
end;

Function TMarco.Codifica(Entrada:String): String;
  var let1, let2 : char;
      i : integer;
      val : byte;
      S : String;

begin
  S := '';
  for i := 1 to length(Entrada) do
  begin
    let1 := Entrada[i];
    val := ord(let1);
    // impar e 1a faixa
    if (i mod 2 <> 0) and (val <= 142) then let2 := chr(142 + val -  31);
    if (i mod 2 =  0) and (val <= 142) then let2 := chr(254 - (val -  31));
    if (i mod 2 <> 0) and (val >  142) then let2 := chr(31  + val - 142);
    if (i mod 2 =  0) and (val >  142) then let2 := chr(143 - (val + 142));

    S := S + let2;
  end;

  Codifica := S;
end;

Function TMarco.Decodifica(Entrada:String): String;
  var let1, let2 : char;
      i : integer;
      val : byte;
      S : String;

begin
  S := '';
  for i := 1 to length(Entrada) do
  begin
    let1 := Entrada[i];
    val := ord(let1);
    // impar e 1a faixa
    if (i mod 2 <> 0) and (val > 142) then let2 := chr(31  + val - 142);
    if (i mod 2 =  0) and (val > 142) then let2 := chr(254  - val + 31);
    if (i mod 2 <> 0) and (val <=  142) then let2 := chr(142 + val - 31);
    if (i mod 2 =  0) and (val <=  142) then let2 := chr(143 - val - 142);

    S := S + let2;
  end;

  Decodifica := S;
end;



procedure TMarco.RefreshCds(aCds: TClientDataSet);
begin
  {: atualiza o ClientDataSet (principalmente para Relatórios)}
  aCds.Close;
  aCds.Open;
end;

function TMarco.TestaCon(TestConnect: TSQLConnection; Servidor: String): Boolean;

var ok : boolean;

begin
  ok := false;

  with TestConnect do
  begin
    params.Values['database']  := Servidor;
    params.Values['User_Name'] := bd_usuario;
    params.Values['PASSWORD']  := bd_senha;

    try
      Connected  := true;
      Connected  := false;
      ok := true;
    except
      on e : exception do ok := false;
    end;
  end;

  TestaCon := ok;
end;

procedure TMarco.set_bdpass(pw: String);
begin
  bd_senha := pw;
end;

procedure TMarco.set_bduser(us: String);
begin
  bd_usuario := us;
end;

Procedure TMarco.Le_INI();

var IniP : TiniFile;
    X    : Integer;
    DirProg : String;

begin
  GetDir(0, DirProg);
  IniP := TiniFile.Create(DirProg+'\Config.ini');

  versao   := IniP.ReadString('Programa','ver','nada');

  bd_server   := IniP.ReadString('Rede','Servidor','nada');
  CEP_server  := IniP.ReadString('Rede','ServidorCEP','nada');
  Averb_server:= IniP.ReadString('Rede','ServidorAverb','nada');
  Espelho_server:= IniP.ReadString('Rede','ServidorESPELHO','nada');
  ibge_server := IniP.ReadString('Rede','ServidorIBGE','nada');
  stok_server := IniP.ReadString('Rede','ServidorSTOK','nada');
  rest_server := IniP.ReadString('Rede','REST_base1','nada');
  rest_server2 := IniP.ReadString('Rede','REST_base2','nada');

  bd_usuario  := IniP.ReadString('Rede','Chave'   ,'nada');
  bd_senha    := IniP.ReadString('Rede','Acesso'  ,'nada');

  dir_prog    := IniP.ReadString('Pastas','Programa'   ,'nada');
  dir_Listas  := IniP.ReadString('Pastas','Listas'   ,'nada');
  dir_rels    := IniP.ReadString('Pastas','Relatorios'   ,'nada');

  scan_dir    := IniP.ReadString('Scanner','NaoRec'    ,'nada');
  scan_rec    := IniP.ReadString('Scanner','Recebidos' ,'nada');
  scan_cli    := IniP.ReadString('Scanner','Cliente'   ,'nada');
  scan_bkp    := IniP.ReadString('Scanner','Backup'   ,'nada');

  mail_pop   := IniP.ReadString('Mail','MailPOP','nada');
  mail_smtp  := IniP.ReadString('Mail','MailSMTP','nada');
  mail_rem   := IniP.ReadString('Mail','MailREM','nada');
  mail_dest  := IniP.ReadString('Mail','MailDEST','nada');

  //Le
  bd_usuario  := Decodifica(bd_usuario);
  bd_senha    := Decodifica(bd_senha);

  cli_nome    := IniP.ReadString('Cliente','Nome'   ,'nada');
  cli_numero  := IniP.ReadInteger('Cliente','Numero',0);
  cli_stok    := IniP.ReadInteger('Estoque','PadraoStok',0);

  stok_imp    := IniP.ReadString('Estoque','ImportaNF'   ,'nada');

  data_sis    := IniP.ReadString('Ajuste','DataSistema' ,'01/01/2010');

  IniP.Free;
end;

Procedure TMarco.Grava_INI(tipo : Shortint);

var IniP : TiniFile;
    DirProg : String;

begin
  GetDir(0, DirProg);
  IniP := TiniFile.Create(DirProg+'\Config.ini');

  if (tipo = 1) then
  begin
    IniP.WriteString('Rede','Servidor',bd_server);
    IniP.WriteString('Rede','Chave'   ,Codifica(bd_usuario));
    IniP.WriteString('Rede','Acesso'  ,Codifica(bd_senha));
  end;

  if (tipo = 2) then
  begin
    IniP.WriteString('Login','Ultimo',seg_user);
  end;

  // Cliente
  if (tipo = 3) then
  begin
    IniP.WriteString( 'Cliente','Nome'  ,cli_nome);
    IniP.WriteInteger('Cliente','Numero',cli_numero);
  end;

  if (tipo = 4) then
  begin
    IniP.WriteString('Pastas','Programa'  ,dir_prog);
    IniP.WriteString('Pastas','Listas'    ,dir_Listas);
    IniP.WriteString('Pastas','Relatorios',dir_rels);
  end;

  if (tipo = 5) then
  begin
    IniP.WriteString('Ajuste','DataSistema'  ,data_sis);
  end;

  // Estoque
  if (tipo = 6) then
  begin
    IniP.WriteInteger('Estoque','PadraoStok'  ,cli_stok);
  end;

  // Estoque
  if (tipo = 7) then
  begin
    IniP.WriteString('Estoque','ImportaNF'  ,stok_imp);
  end;


  if (tipo = 80) then
  begin
    IniP.WriteString('Rede','REST_base2','http://www.flaydel.log.br/portalauto/fdrest');
  end;


  // Grava Entrada
  if (tipo = 99) then
  begin
    IniP.WriteString('Rede','REST_base1', 'http://www.flaydel.srv.br/fdREST');
    //IniP.WriteString('Rede','REST_base1', 'http://localhost:2902');
  end;

  //termina
  IniP.Free;
end;


procedure TMarco.set_bdserver(sv: String);
begin
  bd_server := sv;
end;


procedure TMarco.set_bdstok(sv: String);
begin
  stok_server := sv;
end;

function TMarco.get_bdpass(): String;
begin
  get_bdpass := bd_senha;
end;

function TMarco.get_bdserver(): String;
begin
  get_bdserver:= bd_server;
end;

function TMarco.get_bdstok: String;
begin
  get_bdstok := stok_server;
end;

function TMarco.get_bduser(): String;
begin
  get_bduser := bd_usuario;
end;


procedure TMarco.Incrementa(TableName: String; PrimaryKey: TField; Connection : TSQLConnection);
var
  Qry:TSQLQuery;
begin
  {: cria uma autonumeração}
  if PrimaryKey.DataSet.State <> dsInsert then
    Exit;
  Qry := TSQLQuery.Create(nil); {: cria uma instância do objeto}
  try
    Qry.SQLConnection := Connection; {: componente de conexão}
    Qry.SQL.Add('SELECT MAX('+PrimaryKey.FieldName+')FROM '+ TableName);
    Qry.Open;
   if Qry.Fields[0].IsNull then {: se a tabela está vazia, retornará nulo}
    PrimaryKey.AsInteger := 1 {: então este será o 1º registro}
   else PrimaryKey.AsInteger := Qry.Fields[0].AsInteger+1;
  finally
    FreeAndNil(Qry);  {: libera o objeto da memória}
  end;
end;
{
procedure TMarco.FilterSearch (aCds: TClientDataSet; aType: TTypeLocalizar; aBusca: string);
begin
  // Filtra ou Busca os dados
  aCds.Close;
  case aType of
    // filtrar dados
    fsFilter: aCds.Params[0].AsInteger := StrToInt(aBusca);
    // buscar dados
    fsSearch: aCds.Params[0].AsString := UpperCase('%'+aBusca+'%');
  end;
  aCds.Open;
end;
 }
procedure TMarco.Combo_Preenche(Lista : TComboBox; Arq : String);

var S : String;
begin
  GetDir(0, S);
  S := S + '\Listas\';
  Arq := S + Arq;
  if FileExists(Arq) then
    Lista.Items.LoadFromFile(Arq);

end;

procedure TMarco.Combo_Pos(var Lista: TComboBox; Valor: String);

var i : integer;
    achei : boolean;

begin
  achei := false;
  i := 0;
  while ((not achei) and (i<Lista.Items.Count)) do
  begin
    if (UpperCase(Valor) = UpperCase(Lista.Items[i])) then Achei := true;
    i := i + 1;
  end;
  if (not Achei) then Lista.ItemIndex := 0 else Lista.ItemIndex := i-1;

end;

{<<< 05 >>>----------------------------------------------------------------
|          AdjustLeft
---------------------------------------------------------------------------}
function TMarco.AdjustLeft(st:string; qt:byte; ch:char) : string;
var
  aux : string;
  i   : integer;

begin
  aux := '';
  for i := 1 to qt do aux := aux + ch;
  aux := st + aux;
  aux := copy(aux, 1, qt);

  AdjustLeft := aux;
end;


{<<< 06 >>>----------------------------------------------------------------
|          AdjustCenter
---------------------------------------------------------------------------}
function TMarco.AdjustCenter(st:string; qt:byte; ch:char) : string;
var
  aux : string;
  i, n1,n2, inicio   : integer;

begin
  aux := '';
  for i := 1 to qt do aux := aux + ch;
  aux := aux + st + aux;
  n1 := length(aux) div 2;
  n2 := qt div 2;
  inicio := n1 - n2;

  aux := copy(aux, inicio, qt);

  AdjustCenter := aux;
end;


{<<< 07 >>>----------------------------------------------------------------
|          AdjustRight
---------------------------------------------------------------------------}
function TMarco.AdjustRight(st:string; qt:byte; ch:char) : string;
var
  aux : string;
  l   : byte;
  i   : integer;

begin
  aux := '';
  for i := 1 to qt do aux := aux + ch;
  aux := aux + st;
  aux := copy(aux, length(aux)-qt+1, qt);

  AdjustRight := aux;
end;

procedure TMarco.Cabeca_Padrao(Titulo : String);
var i, j : integer;
    MyFile    : TextFile;
    tools     : TMarco;
begin
   try
      AssignFile(MyFile, 'LPT1');
      Rewrite(MyFile);

     //Imprime o cabeçalho padrão
       Writeln(MyFile, 'Circulo de Recup Fisica, Mental e Espiritual Prof. Dr. Wilson Simonelli');
       Writeln(MyFile, 'Data da impressao: '+FormatDateTime('dd-MMMM-yyyy HH:mm',Now));
       Writeln(MyFile, '===> '+Titulo);
       Writeln(MyFile, tools.AdjustRight('  ',76,'-'));
       Writeln(MyFile, '');;


     CloseFile(MyFile);

   except
     on EInOutError do
       ShowMessage('Erro ocorrido.'+#13+'Tente novamente');
   end;

end;


procedure TMarco.set_listas(li: String);
begin
  dir_listas := li;
end;

function TMarco.get_listas: String;
begin
  get_listas := dir_listas;
end;

function TMarco.get_seguser: String;
begin
  get_seguser := seg_user;
end;

function TMarco.get_stokImp: string;
begin
  get_stokImp :=  stok_imp;
end;

procedure TMarco.set_seguser(u: String);
begin
  seg_user := u;
end;

procedure TMarco.set_stokImp(s: string);
begin
  stok_imp := s;
end;

procedure TMarco.set_segsenha(s: String);
begin
  seg_senha := s;
end;

function TMarco.get_segsenha: String;
begin
  get_segsenha := seg_senha;
end;

Function TMarco.TestaCNPJ(xCGC: String):Boolean;
{Testa se o CGC é válido ou não}
Var
d1,d4,xx,nCount,fator,resto,digito1,digito2 : Integer;
Check : String;
begin
d1 := 0;
d4 := 0;
xx := 1;
for nCount := 1 to Length( xCGC )-2 do
    begin
    if Pos( Copy( xCGC, nCount, 1 ), '/-.' ) = 0 then
       begin
       if xx < 5 then
          begin
          fator := 6 - xx;
          end
       else
          begin
          fator := 14 - xx;
          end;
       d1 := d1 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       if xx < 6 then
          begin
          fator := 7 - xx;
          end
       else
          begin
          fator := 15 - xx;
          end;
       d4 := d4 + StrToInt( Copy( xCGC, nCount, 1 ) ) * fator;
       xx := xx+1;
       end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
       begin
       digito1 := 0;
       end
   else
       begin
       digito1 := 11 - resto;
       end;
   d4 := d4 + 2 * digito1;
   resto := (d4 mod 11);
   if resto < 2 then
      begin
      digito2 := 0;
      end
   else
      begin
      digito2 := 11 - resto;
      end;
   Check := IntToStr(Digito1) + IntToStr(Digito2);
   if Check <> copy(xCGC,succ(length(xCGC)-2),2) then
      begin
      Result := False;
      end
   else
      begin
      Result := True;
      end;
end;

Function TMarco.Formata_DOC(num : String):String;

var i : Integer;
    s : String;

begin
  s := '';
  num := Trim(num);
  for i := 1 to length(num) do
  begin
    if (num[i] in ['0'..'9']) then s := s + num[i];
  end;

  Formata_DOC := s;
end;



function TMarco.get_cepServ: String;
begin
   get_cepServ := cep_server;
end;

function TMarco.get_newServ: String;
begin
   get_newServ := novos_server;
end;

function TMarco.Formata_Num(n: String): String;

var i : integer;
    s : String;
begin
  s := '';
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + '.';
  end;
  Formata_num := s;
end;

function TMarco.get_ibgeServ: String;
begin
   get_ibgeServ := ibge_server;
end;

function TMarco.get_cfopServ: String;
begin
  get_cfopServ := cfop_server;
end;

function TMarco.Monta_DOC(num: String): String;

var d : String;

begin
  d := '';
  if (Length(num)<14) then
  begin // CPF
    d := copy(num, 1, 3) + '.'+copy(num, 4, 3)+'.'+copy(num, 7, 3)+'-'+copy(num, 10, 2);
  end
  else
  begin // CNPJ
    d := copy(num, 1, 2) + '.'+copy(num, 3, 3)+'.'+copy(num, 6, 3)+'/'+copy(num, 9, 4)+ '-'+ copy(num, 13,2);
  end;
  Monta_DOC := d;

end;

procedure TMarco.Exporta_Excel(sColDatas: String; ClientDS: TClientDataSet);

var linha, coluna : integer;
var planilha : variant;
var valorcampo, sCol : string;
var dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

 // Dados
 ClientDS.First;
 for linha := 0 to ClientDS.RecordCount - 1 do
 begin
   for coluna := 1 to ClientDS.FieldCount do
   begin
     sCol := ','+IntToStr(coluna)+',';
     if (pos(sCol, sColDatas)>0) then
     begin
      if not (ClientDS.Fields[coluna - 1].isNull) then
      begin
        //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
        dt := ClientDS.Fields[coluna - 1].AsDateTime;

        planilha.cells[linha + 2,coluna] :=  dt;
      end;
     end
     else
     begin
       valorcampo := ClientDS.Fields[coluna - 1].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna] :=  valorCampo;
     end;
   end;
   ClientDS.Next;
 end;
 // Títulos
 for coluna := 1 to ClientDS.FieldCount do
 begin
   valorcampo := ClientDS.Fields[coluna - 1].DisplayLabel;
   planilha.cells[1,coluna] := valorcampo;
 end;
 planilha.columns.Autofit;
end;

procedure TMarco.Exporta_ExcelTAB(sColDatas: String; ClientDS: TJvMemoryData );

var linha, coluna : integer;
var planilha : variant;
var valorcampo, sCol : string;
var dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

 // Dados
 ClientDS.First;
 for linha := 0 to ClientDS.RecordCount - 1 do
 begin
   for coluna := 1 to ClientDS.FieldCount do
   begin
     sCol := ','+IntToStr(coluna)+',';
     if (pos(sCol, sColDatas)>0) then
     begin
      if not (ClientDS.Fields[coluna - 1].isNull) then
      begin
        //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
        dt := ClientDS.Fields[coluna - 1].AsDateTime;

        planilha.cells[linha + 2,coluna] :=  dt;
      end;
     end
     else
     begin
       valorcampo := ClientDS.Fields[coluna - 1].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna] :=  valorCampo;
     end;
   end;
   ClientDS.Next;
 end;
 // Títulos
 for coluna := 1 to ClientDS.FieldCount do
 begin
   valorcampo := ClientDS.Fields[coluna - 1].DisplayLabel;
   planilha.cells[1,coluna] := valorcampo;
 end;
 planilha.columns.Autofit;
end;

function TMarco.get_cliNome: string;
begin
  get_cliNome := cli_nome;
end;

function TMarco.get_cliNumero: Integer;
begin
  get_cliNumero := cli_numero;
end;

function TMarco.get_cliStok: Integer;
begin
  get_cliSTok := cli_stok;
end;

procedure TMarco.set_cliNome(s: string);
begin
  cli_nome := s;
end;

procedure TMarco.set_cliNumero(i: integer);
begin
  cli_numero := i;
end;

procedure TMarco.set_cliStok(i: integer);
begin
  cli_stok := i;
end;

function TMarco.get_progs: String;
begin
  get_progs := dir_prog;
end;

function TMarco.get_rels: String;
begin
  get_rels := dir_rels;
end;

function TMarco.get_RestServ: String;
begin
  get_RestServ := rest_server;
end;

function TMarco.get_RestServ2: String;
begin
  result := rest_server2;
end;

procedure TMarco.set_progs(p: String);
begin
  dir_prog := p;
end;

procedure TMarco.set_rels(r: String);
begin
  dir_rels := r;
end;

function TMarco.get_versao: String;
begin
  get_versao := versao;
end;

function TMarco.get_dtSis: TDateTime;

var d, m, a : String;
    ds : String;

begin
  get_dtSis := StrToDateTime(data_sis);
end;

procedure TMarco.set_dtSis(d: TDateTime);
begin
  data_sis := FormatDateTime('dd/MM/yyyy', d);
end;

function TMarco.get_AverbServ: String;
begin
  get_AverbServ := averb_server;
end;

function TMarco.get_EspelhoServ: String;
begin
  get_EspelhoServ := espelho_server;
end;

function TMarco.get_scanCli: string;
begin
  get_scanCli := scan_cli;
end;

function TMarco.get_scanNao: string;
begin
  get_scanNao := scan_dir;
end;

function TMarco.get_scanRec: string;
begin
  get_scanRec := scan_rec;
end;

function TMarco.get_scanBkp: string;
begin
  get_scanBkp := scan_bkp;
end;

function TMarco.get_maildest: string;
begin
  get_maildest := mail_dest;
end;

function TMarco.get_mailpop: string;
begin
  get_mailpop := mail_pop;

end;

function TMarco.get_mailrem: string;
begin
  get_mailrem := mail_rem;

end;

function TMarco.get_mailsmtp: string;
begin
  get_mailsmtp := mail_smtp;

end;

function TMarco.dia_util(dt: TDateTime): boolean;

var resp : boolean;
    feriados : String;
    sData : String;

begin
  resp := true;
  if (DayOfTheWeek(dt)> 5) then resp := false;
  if (resp) then
  begin
    feriados := ',01/01,21/04,01/05,07/09,22/10,02/11,15/11,25/12,25/01,20/11,';
    sData := ','+FormatDateTime('dd/MM',dt)+',';
    if (pos(SData, feriados)>0) then resp := false;
  end;

  dia_util := resp;
end;

function TMarco.IntervaloDias(dt1, dt2: TDateTime): integer;
var conta : Integer;
    dia : TDateTime;

begin
  conta := 0;
  dia := dt1 + 1;
  while dia < dt2 do
  begin
    if (dia_util(dia)) then conta := conta + 1;
    dia := dia + 1;
  end;

  IntervaloDias := conta;
end;



end.


