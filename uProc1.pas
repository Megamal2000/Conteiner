unit uProc1;
{
    **********************************************
    Thread  para  Gorm Frete: 17/01/2021

}

interface

uses Classes, SysUtils;

Type
  Tth1 = class(TThread)
  private
    numTarefa : Smallint;
  protected
    procedure Execute; Override;
  public
    procedure Chamar(n:Smallint);
    procedure Finaliza();
end;

implementation

uses uFrete, uBanco;

{ Tth1 }

procedure TarefaSP();

var Bco : TBco;
    tempo : Tdatetime;


begin
  tempo := Now;
  with Frete do
  begin
    Bco := TBco.Create;
    StaticText1.Caption := '1/3 Iniciando: Selecionando as Notas...';
    //sleep(3000);
    Bco.FreteCOB_Inicia(dt1.DateTime, dt2.DateTime);
    StaticText1.Caption := '2/3 Classificando e Calculando o Serviço...';
    //sleep(3000);
    Bco.FreteCOB_Servico;
    StaticText1.Caption := '3/3 Calculando adicionais e Totalizando...';
    //sleep(3000);
    Bco.FreteCOB_Total;
    StaticText1.Caption := 'Finalizado em '+ FormatDateTime('mm ss',  now - tempo);
    Bco.Destroy;
  end;
end;

procedure TarefaGIF();

begin

  with Frete do
  begin
   //JvGIFAnimator1.Animate := true;
  end;
end;


procedure Tth1.Chamar(n: Smallint);
begin
  numTarefa := n;
end;

procedure Tth1.Execute;
begin
  Priority := tpLower;
  if (numTarefa = 1) then TarefaGIF;
  if (numTarefa = 2) then TarefaSP;

  inherited;
end;

procedure Tth1.Finaliza;
begin
  //Frete.JvGIFAnimator1.Animate := false;
  Terminate;
end;

end.
