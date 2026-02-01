unit uNFconta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid;

type
  TNFconta = class(TForm)
    dta: TDateTimePicker;
    Label1: TLabel;
    btManual: TBitBtn;
    lbMan: TLabel;
    lbEDI: TLabel;
    btEdi: TBitBtn;
    lbCol: TLabel;
    btColeta: TBitBtn;
    lbSEM: TLabel;
    btSem: TBitBtn;
    btDia: TBitBtn;
    btSemana: TBitBtn;
    btSair: TSpeedButton;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    lbTot: TLabel;
    lbSoma: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbRelCom: TLabel;
    lbRelSem: TLabel;
    Shape2: TShape;
    Label6: TLabel;
    lbCTe: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbRelCob: TLabel;
    lbCteCob: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    dtb: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    lbdesc: TLabel;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    procedure btSairClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btDiaClick(Sender: TObject);
    procedure btSemanaClick(Sender: TObject);
    procedure btManualClick(Sender: TObject);
    procedure btEdiClick(Sender: TObject);
    procedure btColetaClick(Sender: TObject);
    procedure btSemClick(Sender: TObject);
    procedure dtaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure JvDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NFconta: TNFconta;
  dias : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM4, uDM3, uDM2, uDM1, uNotasCOM, uNotas;

// 0 = Não marcada
// 1 = Nota Fiscal (manual)
// 2 = Coleta
// 3 = Nota Fiscal (edi)
// 4 = Reentrega

procedure Modo(n : Integer);

var Bco : TBco;
    vSoma : Longint;
    vTot  : LongInt;
    sConta: String;
    RelCOM, RelSEM, RelCTE, RelCob1, RelCob2 : integer;

begin
  with NFconta do
  begin
    btDia.Font.Color    := clBlack;
    btSemana.Font.Color := clBlack;

    btDia.Font.Style    := [];
    btSemana.Font.Style := [];

    dias := 0;
    if (n = 1) then
    begin
      btDia.Font.Color    := clred;
      btDia.Font.Style    := [fsBold];
      sConta  := 'DTroma = ' + QuotedStr(FormatDateTIme('yyyy-MM-dd',dta.DateTime));
      dtb.DateTime := dta.DateTime;
    end;
    if (n = 2) then
    begin
      btSemana.Font.Color    := clred;
      btSemana.Font.Style    := [fsBold];
      sConta  := 'DTroma >= ' + QuotedStr(FormatDateTIme('yyyy-MM-dd',dta.DateTime))+ ' and DTroma <= ' + QuotedStr(FormatDateTIme('yyyy-MM-dd',dtb.DateTime));
    end;

    Bco := TBco.Create;
    Bco.Notas_ContaTipos(dta.DateTime, dtb.DateTime);
    vTot := Bco.Notas_MostraDia_ContaTodas(dta.DateTime, dtb.DateTime);
    RelCOM :=  Bco.Notas_MostraDia_Rel(1, dta.DateTime , dtb.DateTime);
    RelSEM :=  Bco.Notas_MostraDia_Rel2(1, dta.DateTime , dtb.DateTime);
    RelCTE :=  Bco.Notas_MostraDia_Rel(3, dta.DateTime , dtb.DateTime);
    RelCob1:=  Bco.Notas_MostraDia_Rel2(3, dta.DateTime , dtb.DateTime);
    RelCob2:=  Bco.Notas_MostraDia_Rel2(4, dta.DateTime , dtb.DateTime);
    Bco.Destroy;

    vSoma := 0;
    DM3.cdsCta.First;
    while not DM3.cdsCta.Eof do
    begin
      if (DM3.cdsCtaORIGEM.Value = 1) then lbMan.Caption := DM3.cdsCtaQUANT.AsString;
      if (DM3.cdsCtaORIGEM.Value = 2) then lbCol.Caption := DM3.cdsCtaQUANT.AsString;
      if (DM3.cdsCtaORIGEM.Value = 3) then lbEDI.Caption := DM3.cdsCtaQUANT.AsString;
      if (DM3.cdsCtaORIGEM.Value = 4) then lbSEM.Caption := DM3.cdsCtaQUANT.AsString;
      vSoma := vSoma + DM3.cdsCtaQUANT.Value;
      DM3.cdsCta.Next;
    end;

    // Saída
    lbRelCom.Caption := IntToStr(RelCOM);
    lbRelSem.Caption := IntToStr(RelSEM);
    lbCte.Caption    := IntToStr(RelCte);
    lbRelCob.Caption := IntToStr(RelCob1);
    lbCteCob.Caption := IntToStr(RelCob2);

    lbSoma.Caption := IntToStr(vSoma);
    lbTot.Caption  := IntToStr(vTot);
  end;
end;

procedure Mostra_Lista(tipo:Integer);

var Bco : TBco;

begin
  NFconta.JvDBGrid2.Visible := False;
  Bco := TBco.Create;
  Bco.Notas_MostraDia_Partes(tipo, NFconta.dta.DateTime, NFconta.dtb.DateTime);
  Bco.Destroy;
end;


procedure TNFconta.btSairClick(Sender: TObject);
begin
  NFconta.Hide;
end;

procedure TNFconta.FormActivate(Sender: TObject);
begin
  NFconta.Left := 2;
  NFconta.Top  := 200;
  if (lbMan.Caption = '00000') then
    Modo(1);
  if (dta.DateTime < EncodeDate(2012,7, 20)) then dta.DateTime := Now;

end;

procedure TNFconta.btDiaClick(Sender: TObject);
begin
  Modo(1);
end;

procedure TNFconta.btSemanaClick(Sender: TObject);
begin
  Modo(2);
end;




procedure TNFconta.btManualClick(Sender: TObject);
begin
 NotasCOM.set_dados(1, dta.DateTime, dtb.DateTime);
 NotasCOM.Show;
end;

procedure TNFconta.btEdiClick(Sender: TObject);
begin
 NotasCOM.set_dados(3, dta.DateTime, dtb.DateTime);
 NotasCOM.Show;
end;

procedure TNFconta.btColetaClick(Sender: TObject);
begin
 NotasCOM.set_dados(2, dta.DateTime, dtb.DateTime);
 NotasCOM.Show;
end;

procedure TNFconta.btSemClick(Sender: TObject);
begin
 NotasCOM.set_dados(4, dta.DateTime, dtb.DateTime);
 NotasCOM.Show;
end;

procedure TNFconta.dtaChange(Sender: TObject);
begin
  dtb.DateTime := dta.DateTime+1;
end;

procedure TNFconta.BitBtn1Click(Sender: TObject);

begin
  Mostra_Lista(3);
  lbDesc.Caption := 'Notas com Relatório';
end;

procedure TNFconta.BitBtn2Click(Sender: TObject);
begin
  Mostra_Lista(4);
  lbDesc.Caption := 'Notas com Cte';
end;

procedure TNFconta.BitBtn3Click(Sender: TObject);

var Bco : TBco;

begin
  JvDBGrid2.Visible := true;

  Bco := TBco.Create;
  Bco.Notas_MostraDia_SemCob(dta.DateTime, dtb.DateTime);
  Bco.Destroy;

  lbDesc.Caption := 'Notas sem Cobrança' ;
end;

procedure TNFconta.JvDBGrid2DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM1.cdsNotasID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
