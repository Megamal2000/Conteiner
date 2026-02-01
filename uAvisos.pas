unit uAvisos;

interface

uses
  uBanco, DateUtils, SysUtils, uDM4;

type
  TAviso = class(TObject)

  private
    // variáveis

  protected

  public
    // procedures e métodos
    procedure Gravar_Avisos(dt_inic:TDateTime; repete:boolean; tipo, n, idAg : Integer);
    Function  Chamar_Avisos():Boolean;

    // Marca Avisos para os carros
    {
    procedure Marca_Carro_Controlar(idC:Integer; Placa:String);
    procedure Marca_Carro_CincoMil(idC:Integer);
    procedure Marca_Carro_Licenciamento(idC:Integer);
    procedure Marca_Carro_IPVA(IdC:integer);
    // Funcionário Marca
    procedure Marca_Aniversario(idF:Integer);
    procedure Marca_Mot_CNH(idM:Integer);
    procedure Marca_Mot_Seguro(idM:Integer);
    procedure Marca_Mot_ExameMedico(idM:Integer);
    }


  published

end;

implementation


Function TAviso.Chamar_Avisos():Boolean;

var Bco : TBco;
    b : Boolean;

begin
  Bco := Tbco.Create;
  Bco.Aviso_Agora;
  Bco.Create;

  b := (DM4.cdsAvisoM.RecordCount > 0);

  Chamar_Avisos := b;
end;

procedure TAviso.Gravar_Avisos(dt_inic:TDateTime; repete:boolean; tipo, n, idAg : Integer);

var Bco : TBco;
    i : Integer;
    dt1,dt2 : TDateTime;
    dia1, dia2, dia : integer;
    Av : TAviso;

begin
    Bco := TBco.Create;
    Bco.Aviso_Inserir(idAg,dt_inic,1, 0);
    if (repete) then
    begin
      case tipo of
      0 : begin
            // semanal
            dt1 := dt_inic;
            for i := 2 to n+1 do
            begin
              dt1 := dt1 + 7;
              Bco.Aviso_Inserir(idAg,dt1,i, 0);
            end;
          end;

      1 : begin
            // quinzenal
            dt1 := dt_inic; dia1 := DayOf(dt1);
            dt2 := dt1 + 15;      dia2 := DayOf(dt2);
            Bco.Aviso_Inserir(idAg,dt2,2, 0);
            dia := dia2;
            if (n>1) then
            for i := 3 to n+1 do
            begin
              dt1 := dt2 + 15;
              if (dia = dia2) then dia := dia1 else dia := dia2;
              dt2 := EncodeDate(YearOf(dt1), MonthOf(dt1), dia);
              Bco.Aviso_Inserir(idAg,dt2,i, 0);
            end;
          end;

      2 : begin
            // mensal
            dt1 := dt_inic; dia1 := DayOf(dt1);
            dt2 := dt1;
            if (n>1) then
            for i := 2 to n+1 do
            begin
              dt1 := dt2 + 30;
              dt2 := EncodeDate(YearOf(dt1), MonthOf(dt1), dia1);
              Bco.Aviso_Inserir(idAg,dt2,i, 0);
            end;
          end;

      3 : begin
            // anual
            dt1 := dt_inic;
              dia1 := DayOf(dt1);
              dia2 := MonthOf(dt1);
            dt2 := dt1;
            if (n>1) then
            for i := 2 to n+1 do
            begin
              dt1 := dt2 + 365;
              dt2 := EncodeDate(YearOf(dt1), dia2, dia1);
              Bco.Aviso_Inserir(idAg,dt2,i, 0);
            end;
          end;
       end;
    end;
    Bco.Destroy;
end;

end.
