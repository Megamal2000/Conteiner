unit uAverbacao;

interface

uses
  DB, uDM4, uDM2, SysUtils;

Type
  TAvb = class(TObject)

  private
    // variáveis
    sq : String;

  protected

  public
    { Averbação - cabeçaçho }
    procedure Averb_Altera(id:Integer; Descr:String; Total:Double; Quant:Integer);
    procedure Averb_Apaga(id : integer);
    function  Averb_Insere(Descr:String; Total:Double; Quant:Integer):Integer ;
    procedure Averb_MostraId(id : Integer);
    procedure Averb_MostraTodos();

    { Averbação - itens }
    procedure Item_Altera(id:Integer; MinData:TDateTime; MinNum:Integer; Valor, VlrOutro:double; Sinistro:Smallint; LigAV:integer);
    procedure Item_Apaga(id : integer);
    procedure Item_Insere(MinData:TDateTime; MinNum:Integer; Valor, VlrOutro:double; Sinistro:Smallint; LigAV:integer);
    procedure Item_MostraId(id : Integer);
    procedure Item_MostraAv(idM : Integer);
    procedure Item_Virtual(id : Integer; VlrOutro:Double);

    { Analisa }
    procedure Altera_Valores(fim : double);

    procedure Minutas_Lista(dt1,dt2 : TDateTime);
    procedure Minutas_Complemento(dt1,dt2 : TDateTime);
  published

end;


implementation


// Rotinas Gerais
function Formata_Num(num: double): String;

var i : integer;
    s, n : String;
begin
  s := '';
  n := FloatToStr(num);
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + '.';
  end;
  Formata_num := s;
end;


// Métodos AQUI
{ TAvb }

procedure TAvb.Altera_Valores(fim: double);
begin

end;

// ===========================================
// Averbação

procedure TAvb.Averb_Altera(id: Integer; Descr: String; Total: Double;
  Quant: Integer);
begin
  sq := 'update TB_AVERB set Descr = '+QuotedStr(Descr);
  sq := sq + ', Total = '+ Formata_Num(Total);
  sq := sq + ', Quant = '+ IntToStr(Quant);
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');
end;

procedure TAvb.Averb_Apaga(id: integer);
begin
  sq := 'Delete from TB_AVERB ';
  sq := sq + ' where ID = '+ IntToStr(id);
  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Apagar');

end;

function TAvb.Averb_Insere(Descr: String; Total: Double; Quant: Integer):Integer;
begin
  sq := 'Insert Into TB_AVERB (Descr, Total, Quant) VALUES ( ';
  sq := sq + '  '+QuotedStr(Descr);
  sq := sq + ', '+ Formata_Num(Total);
  sq := sq + ', '+ IntToStr(Quant);
  sq := sq + ' ) ';
  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');

  sq := 'Select * from TB_AVERB where Descr = '+QuotedStr(Descr)+ ' Order by id ';
  DM2.Roda_SQL(DM4.sdsAv1,DM4.cdsAv1, sq);

  DM4.cdsAv1.Last;
  Averb_Insere := Dm4.cdsAv1ID.Value;
end;

procedure TAvb.Averb_MostraId(id: Integer);
begin
  sq := 'Select * from TB_AVERB where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM4.sdsAv1,DM4.cdsAv1, sq);
end;

procedure TAvb.Averb_MostraTodos;
begin
  sq := 'Select FIRST 30 * from TB_AVERB Order by id Desc';
  DM2.Roda_SQL(DM4.sdsAv1,DM4.cdsAv1, sq);
end;


// ===========================================
// Itens

procedure TAvb.Item_Altera(id: Integer; MinData: TDateTime;
  MinNum: Integer; Valor, VlrOutro: double; Sinistro: Smallint;
  LigAV: integer);
begin
  sq := 'update TB_MINUTAS set Mindata = '+QuotedStr(FormatDateTime('yyyy-MM-dd',Mindata));
  sq := sq + ', MinNum   = '+ IntToStr(minNum);
  sq := sq + ', Valor    = '+ Formata_Num(Valor);
  sq := sq + ', VlrOutro = '+ Formata_Num(VlrOutro);
  sq := sq + ', Sinistro = '+ IntToStr(Sinistro);
  sq := sq + ', ligAv    = '+ IntToStr(LigAv);
  sq := sq + ' where ID = '+ IntToStr(id);

  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');

end;

procedure TAvb.Item_Apaga(id: integer);
begin
  sq := 'DELETE from TB_MINUTAS ';
  sq := sq + ' where ID = '+ IntToStr(id);

  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');

end;

procedure TAvb.Item_Insere(MinData: TDateTime; MinNum: Integer; Valor,
  VlrOutro: double; Sinistro: Smallint; LigAV: integer);
begin
  sq := 'INSERT into TB_MINUTAS (Mindata, MinNum, Valor, VlrOutro, Sinistro, ligAv) VALUES ( ';
  sq := sq + '  '+QuotedStr(FormatDateTime('yyyy-MM-dd',Mindata));
  sq := sq + ', '+ IntToStr(minNum);
  sq := sq + ', '+ Formata_Num(Valor);
  sq := sq + ', '+ Formata_Num(VlrOutro);
  sq := sq + ', '+ IntToStr(Sinistro);
  sq := sq + ', '+ IntToStr(LigAv);
  sq := sq + '  )';

  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');

end;

procedure TAvb.Item_MostraAv(idM: Integer);
begin
  sq := 'Select * from TB_MINUTAS where ligAv = '+IntToStr(idM);
  DM2.Roda_SQL(DM4.sdsAv2,DM4.cdsAv2, sq);
end;

procedure TAvb.Item_MostraId(id: Integer);
begin
  sq := 'Select * from TB_MINUTAS where ID = '+IntToStr(id);
  DM2.Roda_SQL(DM4.sdsAv2,DM4.cdsAv2, sq);
end;

// ===========================================
// Averbação

procedure TAvb.Item_Virtual(id: Integer; VlrOutro: Double);
begin
  sq := 'update TB_MINUTAS set VlrOutro = '+ Formata_Num(VlrOutro);
  sq := sq + ' where ID = '+ IntToStr(id);

  DM2.Executa_SQL(DM4.Conecta2, DM4.sdsTEMP, sq , 'Alterar');
end;

procedure TAvb.Minutas_Complemento(dt1, dt2: TDateTime);
begin
  sq := 'select dtRoma, Minuta, NUM, num - CAST(num / 1000000 AS INTEGER)* 1000000 as Romaneio, Nome, CPF,  TB_FUNCCAR.PLACA, TB_CARRO.PLACA as PlacaF,TB_FUNCCAR.CODLIBERA,  TB_CARRO.CODLIBERA as CODLIBERAF ';
  sq := sq + ' from tb_roma left join TB_CARRO ON TB_CARRO.ID = TB_ROMA.LIGCARF, TB_FUNCS left join TB_FUNCCAR on TB_FUNCS.ID = TB_FUNCCAR.LIGFUNC ';
  sq := sq + ' where TB_FUNCS.id = TB_ROMA.LIGMOT ';
  sq := sq + ' and dtRoma between '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1))+ ' and '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2));
  sq := sq + ' order by TB_ROMA.id ';
  DM2.Roda_SQL(DM4.sdsMin2,DM4.cdsMin2, sq);

end;

procedure TAvb.Minutas_Lista(dt1, dt2: TDateTime);
begin
  sq := 'select dtRoma, Minuta, SUM(Valor) as Total, count(valor) as Notas, NUM ';
  sq := sq + ' from Tb_Roma, Tb_NotaF ';
  sq := sq + ' where TB_Roma.num = TB_NOTAF.nRoma ';
  sq := sq + ' and dtRoma between '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1))+ ' and '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2));
  sq := sq + ' Group by dtRoma, Minuta, NUM ';
  DM2.Roda_SQL(DM4.sdsMin,DM4.cdsMin, sq);

end;

end.
