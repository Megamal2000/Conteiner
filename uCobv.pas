unit uCobv;

interface

uses uDM1, uDM2, SysUtils, DBClient;

type
  TCobv = Class(TObject)
    protected
      idNF : integer;
    private
      sq : String;
      function  BcoRoda(sql:String):TClientDataSet;
      procedure BcoExecuta(sql:String);
      function  fmtData(d:TDateTime):String;
      function  fmtValor(v:double):String;
    public
      procedure set_idNf(i:Integer);
      function  Existe():boolean;
      procedure Criar();
      procedure Insere(NumNf, ligCli:Integer; dtRoma:TDateTime);
      function  NotasSistema(idCli:Integer; dt1, dt2:TDateTime):Integer;
      function  NotasCob(idCli:Integer; dt1, dt2:TDateTime):Integer;
      procedure AlteraStatus(st:Smallint);
      procedure AlteraFlag(flg:Smallint);
      procedure Combinado(v:double; tipo:Smallint);
      procedure copiaPed(ped:String);
      procedure copiaRoma(dt:TDateTime);
      procedure copiaCte(n:Integer);
      //procedure Calcula;
      //procedure Altera


  end;

implementation

{ TCobv }

procedure TCobv.AlteraFlag(flg: Smallint);
begin
  // 0=não   1=simSS
  sq := 'update TB_COBVALOR set flgCob = '+flg.ToString;
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.AlteraStatus(st: Smallint);
begin
  //status (0=criado [tudo zero], 1=calculado, 2=noDOC. 3=cancelado, 4=perda)
  sq := 'update TB_COBVALOR set status = '+st.ToString+' ';
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.BcoExecuta(sql: String);
begin
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sql, 'Atualiza');
end;

function TCobv.BcoRoda(sql:String):TClientDataSet;
begin
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sql);
  result := DM2.cdsTMP;
end;

procedure TCobv.Combinado(v: double; tipo: Smallint);
begin
  sq := 'update TB_COBVALOR set vCombina = '+fmtValor(v)+', tipoCob = '+tipo.ToString;
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.copiaCte(n: Integer);
begin
  sq := 'update TB_COBVALOR set cpNcte = '+n.ToString+' ';
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.copiaPed(ped: String);
begin
  sq := 'update TB_COBVALOR set cppedido = '+QuotedStr(ped)+' ';
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.copiaRoma(dt: TDateTime);
begin
  sq := 'update TB_COBVALOR set flgCob = '+fmtData( dt )+' ';
  sq := sq + ',  dtAlt = '+ QuotedStr(fmtData(now));
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  BcoExecuta(sq);
end;

procedure TCobv.Criar();
  var dados, dadosRoma:TClientDataSet;
      dt : TDateTime;
begin
  sq := 'Select numnf, nroma, nconh, numped from TB_Notaf ';
  sq := sq + ' WHERE id = ' + idNF.ToString;
  dados := BcoRoda(sq);

  if dados.RecordCount > 0 then
  begin
    dt := EncodeDate(2000,1,1) ;
    if dados.FieldByName('nroma').Value>0 then
    begin
      sq := 'Select dtroma from TB_Roma ';
      sq := sq + ' WHERE num = ' + dados.FieldByName('nroma').Value;
      dadosRoma := BcoRoda(sq);
      dt := dadosRoma.FieldByName('dtroma').AsDateTime;
    end;

    Insere(dados.FieldByName('numnf').Value,dados.FieldByName('ligcli').Value, dt);
    if dados.FieldByName('nconh').Value > 0 then copiaCte( dados.FieldByName('nconh').Value ) ;
    if Length( dados.FieldByName('numped').AsString ) > 3 then copiaPed( dados.FieldByName('numped').AsString ) ;
  end;

end;


function TCobv.Existe(): boolean;
  var dados:TClientDataSet;
begin
  sq := 'Select id from TB_COBVALOR ';
  sq := sq + ' WHERE ligNF = ' + idNF.ToString;
  dados := BcoRoda(sq);

  result :=  (dados.RecordCount>0);
end;

function TCobv.fmtData(d: TDateTime): String;
begin
  result := FormatDateTime('yyyy-MM-dd', d);
end;

function TCobv.fmtValor(v: double): String;
  var resp : string;
       i : integer;
       s, n : String;
begin
  s := '';
  n := FloatToStr(v);
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + '.';
  end;
  resp := s;

  result := resp;
end;

procedure TCobv.Insere(NumNf, ligCli: Integer; dtRoma: TDateTime);
begin
  sq := 'insert into TB_COBVALOR values (ligNF, cpnumNF, ligCli, cpdtRoma, ';
  sq := sq + ' cpncte, dtpago, dtcria, dtalt, tipoCob, flgCob, status, ';
  sq := sq + ' VFRETETOTAL, VFRETESERV, VADICPESO, VADVALOR, VGRIS, VPEDAGIO, VTAXA, ';
  sq := sq + ' VTDE, VPONTO, VREENT, VDEVOLUCAO, VOUTROS, VCOMBINA, NPONTO ';
  sq := sq + ' ) Values ( ';
  sq := sq + ' '+idNF.ToString+', '+NumNF.ToString+', '+ligcli.ToString+', '+QuotedStr(fmtData(dtRoma));
  sq := sq + ', 0, '+QuotedStr('2000-01-01')+', '+QuotedStr(fmtData(now))+', '+QuotedStr(fmtData(now))+', 0, 0, 0 ';
  sq := sq + ', 0, 0, 0, 0, 0, 0, 0 ';
  sq := sq + ', 0, 0, 0, 0, 0, 0, 0 ';
  sq := sq + ' ) ';

  BcoExecuta(sq);

end;

function TCobv.NotasCob(idCli: Integer; dt1, dt2: TDateTime): Integer;
begin

end;

function TCobv.NotasSistema(idCli: Integer; dt1, dt2: TDateTime): Integer;
begin

end;


procedure TCobv.set_idNf(i: Integer);
begin
  idNF := i;
end;

end.
