unit uRel3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls, DB,
  Menus, Buttons;

type
  TRel3 = class(TForm)
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    Label1: TLabel;
    lbRel: TLabel;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    CalculaUM1: TMenuItem;
    CalculaTODOS1: TMenuItem;
    N1: TMenuItem;
    AlteraValor1: TMenuItem;
    N2: TMenuItem;
    RetiraNOTA1: TMenuItem;
    btAtualiza: TBitBtn;
    AlteraPonto1: TMenuItem;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    AlteraServioCob1: TMenuItem;
    Romaneio1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure CalculaUM1Click(Sender: TObject);
    procedure btAtualizaClick(Sender: TObject);
    procedure AlteraValor1Click(Sender: TObject);
    procedure CalculaTODOS1Click(Sender: TObject);
    procedure AlteraPonto1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure RetiraNOTA1Click(Sender: TObject);
    procedure AlteraServioCob1Click(Sender: TObject);
    procedure Romaneio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idRel(i : Integer);
    procedure Calcula_Frete(numRoma:Integer);

  end;

var
  Rel3: TRel3;
  idRel : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDm3, uBanco, uNegocio, uNotas, uAltCob, uRoman;



procedure Mostra_resumo;

var cNF, cPonto : Integer;
    tPeso, tValor, tFrete : Double;

begin
  tPeso  := 0;
  tValor := 0;
  tFrete := 0;
  cNF    := 0;
  cPonto := 0;

  if (DM3.cdsRelN.RecordCount > 0) then
  begin
    while not DM3.cdsRelN.Eof do
    begin
      cNF := cNF + 1;
      cPonto := cPonto + DM3.cdsRelNPONTO.Value;
      tPeso  := tPeso + DM3.cdsRelNPESO.AsFloat;
      tValor := tValor + DM3.cdsRelNVALOR.AsFloat;
      tFrete := tFrete + DM3.cdsRelNVFRETE.AsFloat;

      DM3.cdsRelN.Next;
    end;
    Dm3.cdsRelN.First;
  end;

  with Rel3 do
  begin
    lb1.Caption := intToStr(cNF);
    lb2.Caption := FormatFloat('#,##0.00', tValor);
    lb3.Caption := FormatFloat('#,##0.00', tPeso);
    lb4.Caption := intToStr(cPonto);
    lb5.Caption := FormatFloat('#,##0.00', tFrete);
  end;

end;


procedure Atualiza;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Relatorio_Notas(idRel);
  Bco.Destroy;
  Mostra_resumo;
end;

procedure Salva_Total();

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Relatorio_Notas(idRel);
  Bco.Destroy;

end;


procedure TRel3.FormActivate(Sender: TObject);

begin
  Atualiza;
end;

procedure TRel3.set_idRel(i: Integer);
begin
  idRel := i;
end;

procedure TRel3.Calcula_Frete(numRoma:integer);

var Neg : TNeg;
    Bco : TBco;
    tServ : Smallint;
    gravaFrete : Double;

begin
  Neg := TNeg.Create;

  gravaFrete :=  0;
  tServ      := 77; // marca que tentou calcular e não conseguiu

  Bco := Tbco.Create;
  Bco.Romaneio_MostraNum(numRoma);
  Bco.Romaneio_MostraNotas(numRoma);
  Bco.Destroy;


  // Combinado com o cliente
  if (DM1.cdsRomaFFRETECOMB.Value = 1) then
  begin
    tServ := 7;
    Neg.Calcula_Frete_Combinado(DM1.cdsRomaNF.RecordCount, DM1.cdsRomaVFRETECOMB.AsFloat);
    Neg.Calcula_Frete_NF(tServ);

    // Grava o 1o
    Bco := Tbco.Create;
    DM1.cdsRomaNF.First;
    Bco.Relatorio_Grava(DM1.cdsRomaNFID.Value , Neg.get_freteNF, tServ);
    //DM1.cdsRomaNF.Next;
    // Grava os Outros
    if (DM1.cdsRomaNF.RecordCount>1) then
    while Not DM1.cdsRomaNF.Eof do
    begin
      DM1.cdsRomaNF.Next;
      Bco.Relatorio_Grava(DM1.cdsRomaNFID.Value, 0, tServ);
    end;
    Bco.Destroy;


  end;

  if (DM1.cdsRomaFFRETECOMB.Value = 0) then
  ///  --- Carro / Saida
  if (DM3.cdsRelNCARRO.Value = 0) or (DM1.cdsCliSaidaNao.Value = 1)then
  begin
    if (DM3.cdsRelNTIPOLOCAL.value = 0) then
    begin
      Case DM1.cdsCliPADRAO_SP.Value of
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

      end;
    end; // if tipo = 0

    if (DM3.cdsRelNTIPOLOCAL.value = 1) then
    begin
      Case DM1.cdsCliPADRAO_GSP.Value of
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

      end;
    end; // if tipo = 1

    if (DM3.cdsRelNTIPOLOCAL.value >= 2) and (DM3.cdsRelNTIPOLOCAL.value < 6) then
    begin
      Case DM1.cdsCliPADRAO_INT.Value of
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

      end;
    end;  // if tipo >= 2
  end   ///  --- Carro / Saida
  else
  begin
    tServ := 4;
    Bco := TBco.Create;
    Bco.Romaneio_MostraNotas(DM3.cdsRelNNRoma.Value);
    Bco.Destroy;

    Neg.Calcula_Frete_Saida(DM3.cdsRelNLIGCLI.Value,DM3.cdsRelNCARRO.Value, DM3.cdsRelNTIPOLOCAL.value, DM1.cdsRomaNF.RecordCount);
  end;   ///  --- Carro / Saida
    Neg.Calcula_Frete_NF(tServ);


  if (DM1.cdsRomaFFRETECOMB.Value = 0) then
  begin
     // Copia valor do serviço
     Neg.Adicional_Calculos(DM1.cdsCliID.Value, tServ);

     gravaFrete := Neg.get_freteTot;


     Bco := TBco.Create;
     Bco.Relatorio_Grava(DM3.cdsRelNID.Value , gravaFrete, tServ);

     // Marca como calculado = 1
     if (gravaFrete>0) then
       Bco.Marca_Cobrado(DM3.cdsRelNID.Value, 1);
     Bco.Destroy;
  end;

  if (DM1.cdsRomaFFRETECOMB.Value = 1) then
  begin
  end;

  Neg.Destroy;

end;



procedure TRel3.CalculaUM1Click(Sender: TObject);

var Bco : TBco;


begin
  Bco := TBco.Create;
  Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
  Bco.Destroy;

  Calcula_Frete(DM3.cdsRelNNROMA.Value);


  Atualiza;
end;

procedure TRel3.btAtualizaClick(Sender: TObject);

begin
  Atualiza;
end;

procedure TRel3.AlteraValor1Click(Sender: TObject);

var a : String;
    n : Double;
    Bco : TBco;

begin
  a := InputBox('Altera o valor', 'Digite o Valor do Frete', DM3.cdsRelNVFRETE.AsString);
  if Length(a) > 0 then n := StrToFloat(a);
  Bco := TBco.Create;
  Bco.Relatorio_Grava(DM3.cdsRelNID.Value , n, 10); // 10 - alterado pelo usuário
  Bco.Destroy;

  Atualiza;
end;

procedure TRel3.CalculaTODOS1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
  Bco.Destroy;

  DM3.cdsRelN.First;
  while not DM3.cdsRelN.Eof do
  begin
    Calcula_Frete(DM3.cdsRelNNROMA.Value);
    DM3.cdsRelN.Next;
  end;

  Atualiza;
end;


procedure TRel3.AlteraPonto1Click(Sender: TObject);

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

procedure TRel3.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM3.cdsRelNID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TRel3.RetiraNOTA1Click(Sender: TObject);

var Bco : TBco;

begin
  if MessageDlg('Tem certeza que deseja RETIRAR a nota '+DM3.cdsRelNNUMNF.AsString+' deste relatório?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := TBco.Create;
      Bco.Relatorio_RetiraNota(DM3.cdsRelNID.Value);
      Bco.Destroy;

      Atualiza;
    end;  
end;

procedure TRel3.AlteraServioCob1Click(Sender: TObject);
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

procedure TRel3.Romaneio1Click(Sender: TObject);
begin
  if (DM3.cdsRelN.RecordCount >0) then
  begin
    Roman.set_idRoma(DM3.cdsRelNNROMA.Value);
    Roman.set_MostraNum(true);
    Roman.Entrar;
    Roman.Show;
  end;  
end;

end.
