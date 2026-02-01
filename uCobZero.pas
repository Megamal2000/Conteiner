unit uCobZero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TCobZero = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    lbRel: TLabel;
    btAtualiza: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    CalculaUM1: TMenuItem;
    CalculaTODOS1: TMenuItem;
    N1: TMenuItem;
    AlteraPonto1: TMenuItem;
    AlteraServioCob1: TMenuItem;
    N2: TMenuItem;
    Romaneio1: TMenuItem;
    procedure btAtualizaClick(Sender: TObject);
    procedure CalculaUM1Click(Sender: TObject);
    procedure CalculaTODOS1Click(Sender: TObject);
    procedure AlteraServioCob1Click(Sender: TObject);
    procedure AlteraPonto1Click(Sender: TObject);
    procedure Romaneio1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atualiza;
    procedure set_idCob(i : Integer);
  end;

var
  CobZero: TCobZero;
  idCob : integer;

implementation

{$R *.dfm}

uses uBanco, uDM3, uRel3, uAltCob, uDM1, uNegocio, uRoman, uNotas;

procedure TCobZero.Atualiza;

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.Relatorio_NotasZero(idCob);
  Bco.Destroy;
  lbRel.Caption := IntToStr(DM3.cdsRelN.RecordCount) + ' Notas ';
end;

procedure TCobZero.btAtualizaClick(Sender: TObject);
begin
  Atualiza;
end;

procedure TCobZero.set_idCob(i: Integer);
begin
  idCob := i;
end;

procedure Calcula_Frete2(tServNovo:Integer);

var Neg : TNeg;
    Bco : TBco;
    tServ : Smallint;
    gravaFrete : Double;
    numRoma : Integer;


begin
  Neg := TNeg.Create;

  gravaFrete :=  0;
  tServ      := 77; // marca que tentou calcular e não conseguiu

  numRoma := DM3.cdsRelNNROMA.Value;

  Bco := Tbco.Create;
  Bco.Romaneio_MostraNum(numRoma);
  Bco.Romaneio_MostraNotas(numRoma);
  Bco.Destroy;


    // Calcula de acrodo com NOVO
     Case tServNOVO of

        1 : begin
              tServ := 1;
              Neg.Calcula_Frete_Peso(DM3.cdsRelNLIGCLI.Value, DM3.cdsRelNPESO.AsFloat, DM3.cdsRelNTIPOLOCAL.Value, DM3.cdsRelNCEP.Value);
            end;

        2 : begin
              tServ := 2;
              Neg.Calcula_Frete_Taxa(DM3.cdsRelNLIGCLI.Value, DM3.cdsRelNTIPOLOCAL.value, DM3.cdsRelNVALOR.AsFloat);
            end;

        3 : begin
              tServ := 3;
              Neg.Calcula_Frete_Entrega(DM3.cdsRelNLIGCLI.Value, DM3.cdsRelNTIPOLOCAL.value);
            end;

        4 : begin
              tServ := 4;
              Neg.Calcula_Frete_Saida(DM3.cdsRelNLIGCLI.Value,DM3.cdsRelNCARRO.Value, DM3.cdsRelNTIPOLOCAL.value, DM1.cdsRomaNF.RecordCount);
            end;

        5 : begin
              tServ := 5;
              Neg.Calcula_Frete_NF(5);
            end;
     end;

     // Copia valor do serviço
     Neg.Adicional_Calculos(DM1.cdsCliID.Value, tServ);

     gravaFrete := Neg.get_freteTot;

     if (gravaFrete>0) then
     begin
       Bco := TBco.Create;
       Bco.Relatorio_Grava(DM3.cdsRelNID.Value , gravaFrete, tServ);

       // Marca como calculado = 1
       Bco.Marca_Cobrado(DM3.cdsRelNID.Value, 1);
       Bco.Destroy;
     end;

  Neg.Destroy;

end;



procedure TCobZero.CalculaUM1Click(Sender: TObject);

 var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
  Bco.Destroy;

  Calcula_Frete2(DM3.cdsRelNTIPO_COB.Value);

  Atualiza;
end;

procedure TCobZero.CalculaTODOS1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
  Bco.Destroy;

  DM3.cdsRelN.First;
  while not DM3.cdsRelN.Eof do
  begin
    Calcula_Frete2(DM3.cdsRelNTIPO_COB.Value);
    DM3.cdsRelN.Next;
  end;

  Atualiza;
end;

procedure TCobZero.AlteraServioCob1Click(Sender: TObject);
begin
  if (DM3.cdsRelN.RecordCount > 0) then
  begin
    AltCob.lbNF.Caption    := DM3.cdsRelNNUMNF.AsString;
    AltCob.lbLocal.Caption := DM3.cdsRelNLOCALI.Value;
    AltCob.cbCob.ItemIndex := DM3.cdsRelNTIPO_COB.Value - 1;
    AltCob.set_IdNF(DM3.cdsRelNID.Value);

    AltCob.Show;
  end
  else ShowMessage('Sem Nota !');
end;

procedure TCobZero.AlteraPonto1Click(Sender: TObject);

var a : String;
    n : smallint;
    Bco : TBco;

begin
  a := InputBox('Altera a quantidade', 'Digite a Quantidade de Ponto a Ponto', DM3.cdsRelNPONTO.AsString);
  if Length(a) > 0 then n := StrToInt(a)
    else n := 0;
  Bco := TBco.Create;
  Bco.Relatorio_GravaPonto(DM3.cdsRelNID.Value , n);
  Bco.Destroy;

  Atualiza;

end;

procedure TCobZero.Romaneio1Click(Sender: TObject);
begin
  if (DM3.cdsRelN.RecordCount >0) then
  begin
    Roman.set_idRoma(DM3.cdsRelNNROMA.Value);
    Roman.set_MostraNum(true);
    Roman.Entrar;
    Roman.Show;
  end;  
end;

procedure TCobZero.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM3.cdsRelNID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
