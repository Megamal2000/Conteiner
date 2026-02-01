unit uScanner;

interface

uses
  uBanco, DateUtils, SysUtils, uDM4, Classes, uLib,
  StdCtrls,ShellApi, DIalogs;

type
  TScan = class(TObject)

  private
    // variáveis
    dir_Nao, dir_Rec, dir_Cli, dir_BKP : String;
    arq_num, arq_feitos : Integer;

  protected

  public
    // procedures e métodos
    procedure Iniciar;
    procedure Le_Dir(var Li : TListBox);
    procedure baixa(numNF, idNF, nRoma, idCli, origem : Integer; Lista:TListBox);
    function  get_numA    : Integer;
    function  get_feitosA : Integer;
    procedure Copiar_Flaydel(arq:String; numRoma: Integer);
    procedure Copiar_Backup(arq:String; idCli : Integer);
    procedure Copiar_Cliente(arq:String; idCli, origem : Integer);
    Function  Mostra_Imagem(numRoma:Integer; nomeArq: String): String;



  published

end;

var
    usa : TMarco;

implementation

{ TScan }

procedure Copiar_Arquivo(arq, dir_o, dir_d : String);
var
  Dados: TSHFileOpStruct;
begin
  FillChar(Dados,SizeOf(Dados), 0);
  with Dados do
  begin
    wFunc := FO_COPY;
    pFrom := PChar(dir_o+'\'+arq);
    //ShowMessage(dir_o+'\'+arq);
    pTo   := PChar(dir_d);
    fFlags:= FOF_ALLOWUNDO;
  end;
  SHFileOperation(Dados);
end;

procedure Copiar_Arquivo2(arq, dir_o, dir_d : String);

Var
  S, T: TFileStream;
  Origem, Destino : String;

Begin
  Origem := dir_o+'\'+arq;
  Destino := dir_d+'\'+arq;

  S := TFileStream.Create( Origem, fmOpenRead );
  try
    T := TFileStream.Create( Destino, fmOpenWrite or fmCreate );
    try
      T.CopyFrom(S, S.Size ) ;
    finally
      T.Free;
    end;
  finally
    S.Free;
  end;
end;

function SoNumeros(no : String): Integer;

var i, p : Integer;
    s : String;
begin
  s := '';
  // procura -
  p := pos('-', no)-1;
  if (p > 0) then s := copy(no, 1, p) else s := no;
  // procura PONTO
  p := pos('.', s)-1;
  if (p > 0) then s := copy(s, 1, p);

  i := StrToInt(s);
  SoNumeros := i;

end;

function Renomear_Arq(arq : String; sSerie : String):String;


var posicaoPonto, posicaoHifen : Smallint;
    resp, tmp : String;
    incluir : String;

begin
  resp := 'x';
  posicaoPonto := 0;
  incluir := '-'+sSerie+'.jpg';

    tmp := arq;
    posicaoHifen := pos('-', arq);
    if (posicaoHifen>0) then tmp := copy(arq,0,posicaoHifen - 1);
    // Nao tem ponto
    posicaoPonto := pos('.', tmp);
    if (posicaoPonto > 0) then tmp := copy(tmp,0,posicaoPonto - 1);

    resp := tmp +incluir;

  Renomear_Arq := resp;
end;


procedure TScan.baixa(numNF, idNF, nRoma, idCli, origem : Integer; Lista:TListBox);

var Bco   : TBco;
    i, p, NumRoma  : integer;
    achei, ok : boolean;
    it, dirD, dirO, NovoArq, Serie, nomeSimples : String;
    conta : integer;

begin
  if (Lista.Items.Count > 0) then
  begin
    achei := false;
    Lista.ItemIndex := 0;
    i := 0;
    conta := 0;
    dirD := dir_Rec + '\Roma'+IntToStr(nRoma);
    ok := true;
    if Not DirectoryExists(dirD) then ok := CreateDir(dirD);


    while (i < Lista.Items.Count -1) and not achei do
    begin
      it := copy(Lista.Items[i],3,Length(Lista.Items[i]));
      p  := SoNumeros(It);
      if (p = numNF) then
      begin
        // baixa
        Bco := TBco.Create;
        Bco.Notas_Entregas_Ocorr(idNF, 'Entrega Realizada Normalmente *scan', 'Sim', 1);
        Bco.Controle_Altera_StatusTkt(numNF, nRoma, 1);
        Bco.Destroy;

        // Copiar arquivo
        dirO := dir_Nao+'\0000';
                 // ShowMessage(dirO+#13+dirD);
        if (FileExists(dirO+'\'+Lista.Items[i])) then
        begin

          //Copiar_Arquivo2(Trim(Lista.Items[i]), dirO, dirD);
          // Coloca num serie
          Serie := '3';
          NovoArq :=  Renomear_Arq(Lista.Items[i], Serie);
          if (LowerCase(Lista.Items[i]) <> Lowercase(NovoArq)) then
          begin
            if (FileExists(dirO+'\'+Lista.Items[i])) then
              RenameFile(dirO+'\'+Lista.Items[i], dirO+'\'+NovoArq );
          end;



          Copiar_Flaydel(NovoArq, nRoma);
          Copiar_Backup (NovoArq, idCli);
          Copiar_Cliente(NovoArq, idCli, origem);

          if (FileExists(dirD+'\'+NovoArq)) then
            DeleteFile(dirO+'\'+NovoArq);

          Bco := TBco.Create;
          Bco.Notas_InserirFIG(idNF, NovoArq);
          Bco.Destroy;

        end;

        // apagar arquivo
        //DeleteFile(dir_Nao+'\'+Lista.Items[i]);
        conta := conta + 1;
        arq_feitos := conta;

        achei := true;
      end;
      i := i + 1;
    end;
  end else ShowMessage('Pasta vazia!');
end;

procedure TScan.Copiar_Backup(arq: String; idCli : Integer);

var dirD, dirO : String;
    ok : Boolean;

begin
  // Destino ------------------------------------------------
  dirD := dir_BKP + '\Cliente_'+IntToStr(idCli);
  ok := true;
  if Not DirectoryExists(dirD) then ok := CreateDir(dirD);

  // Origem -------------------------------------------------
  dirO := dir_Nao+'\0000';

  // Copiar -------------------------------------------------
  Copiar_Arquivo2(Trim(arq), dirO, dirD);

end;

procedure TScan.Copiar_Cliente(arq: String; idCli, origem : Integer);

var dirD, dirO, dirCol : String;
    ok : Boolean;
    NomeCli : String;

begin
  // Destino ------------------------------------------------
  if (idCli = 1) or (idCli = 22) then NomeCli := 'StaplesFTP'
    else NomeCli := 'Cliente'+IntToStr(idcli);

  dirD := dir_Cli + '\'+NomeCli;
  ok := true;
  if Not DirectoryExists(dirD) then ok := CreateDir(dirD);

  // Coletas ------------------------------------------------
  if (origem = 2) then
  begin
    dirCol := dirD + '\Coletas';
    if Not DirectoryExists(dirCol) then ok := CreateDir(dirCol);
  end;

  // Origem -------------------------------------------------
  dirO := dir_Nao+'\0000';

  // Copiar -------------------------------------------------
  if (origem = 2) then Copiar_Arquivo2(Trim(arq), dirO, dirCol)
  else
    Copiar_Arquivo2(Trim(arq), dirO, dirD);

end;

procedure TScan.Copiar_Flaydel(arq: String; numRoma:Integer);

var dirD, dirO : String;
    ok : Boolean;

begin
  // Destino ------------------------------------------------
  dirD := dir_Rec + '\Roma'+IntToStr(numRoma);
  ok := true;
  if Not DirectoryExists(dirD) then ok := CreateDir(dirD);

  // Origem -------------------------------------------------
  dirO := dir_Nao+'\0000';

  // Copiar -------------------------------------------------
  Copiar_Arquivo2(Trim(arq), dirO, dirD);
end;

function TScan.get_feitosA: Integer;
begin
  get_feitosA := arq_feitos;
end;

function TScan.get_numA: Integer;
begin
  get_numA := arq_num;
end;


function TemAtributo(Attr, Val: Integer): Boolean;

begin
  Result := Attr and Val = Val;
end;

procedure ListarArquivos(Diretorio: String; var Lista : TListBox);

var  F       : TSearchRec;
     Ret     : Integer;
     TempNome: string;
     d       : String;
begin
  d := Diretorio;
  Lista.Items.Clear;
  Ret := FindFirst(d+'\*.*', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      begin
        if (length(F.Name)>2) then Lista.Items.Append(F.Name);
      end;
        Ret := FindNext(F);
    end;
    finally
    begin
      FindClose(F);
    end;
    end;
end;


procedure TScan.Iniciar;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  dir_Nao := usa.get_scanNao;
  dir_Rec := usa.get_scanRec;
  dir_Cli := usa.get_scanCli;
  dir_bkp := usa.get_scanBKP;
  usa.Destroy;
end;


procedure TScan.Le_Dir(var Li : TListBox);
begin
  ListarArquivos(dir_Nao+'\0000', Li);
  arq_Num := Li.items.Count;
  arq_feitos := 0;
end;





Function TScan.Mostra_Imagem(numRoma:Integer; nomeArq: String):String;

var dirFD, resp : String;

begin
  dirFD := dir_Rec + '\Roma'+IntToStr(numRoma);

  resp := 'nada';
  if (DirectoryExists(dirFD)) then
    if (FileExists(dirFD+'\'+nomeArq)) then
       resp := dirFD+'\'+nomeArq;

  Mostra_Imagem := resp;

  
end;

end.
