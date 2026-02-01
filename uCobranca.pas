unit uCobranca;

interface

uses uBanco;

type
  TCobra = Class(TObject)

  protected
    dti, dtf : TDateTime;
    contCli, contNotas : Integer;
    Bco : TBco;

  private

  public
  Constructor Create;
  procedure Entrada(dt1, dt2:TdateTime);
  procedure Lista_Clientes(tipo:smallint);

  Destructor Destroy; Override;
  // GETS
  function get_qtNotas():Integer;


end;

implementation



{ TCobra }


constructor TCobra.Create;
begin
  Bco := TBco.Create;
  Bco.Cob2_Zera(10,19);
end;

destructor TCobra.Destroy;
begin
  Bco.Destroy;

  inherited;
end;

procedure TCobra.Entrada(dt1, dt2: TdateTime);
begin
  contNotas := 0;
  contNotas := Bco.Cob2_Marcar(dt1,dt2,10);
end;


function TCobra.get_qtNotas: Integer;
begin
  get_qtNotas := contNotas;
end;

procedure TCobra.Lista_Clientes(tipo: smallint);
begin
  Bco.Cob2_Clientes;
end;

end.
