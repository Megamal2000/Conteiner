unit uSimula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  Buttons, uNegocio, ExtCtrls;

type
  TSimula = class(TForm)
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    cbLocal: TComboBox;
    Label6: TLabel;
    lbFreteTot: TLabel;
    Frete: TLabel;
    Bevel1: TBevel;
    lbTipo: TLabel;
    lbFrete: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbAdv: TLabel;
    lbPed: TLabel;
    lbGris: TLabel;
    nPontos: TJvValidateEdit;
    totNotas: TJvValidateEdit;
    Label5: TLabel;
    Label10: TLabel;
    btEntregas: TBitBtn;
    btPeso: TBitBtn;
    btSaida: TBitBtn;
    cbFaixa: TComboBox;
    vlPeso: TJvValidateEdit;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    Label11: TLabel;
    lbSubA: TLabel;
    Shape2: TShape;
    Label13: TLabel;
    lbSubAA: TLabel;
    Label15: TLabel;
    lbGrauD: TLabel;
    Label17: TLabel;
    lbICMS: TLabel;
    Label19: TLabel;
    lbPonto: TLabel;
    Shape3: TShape;
    Label21: TLabel;
    lbSubB: TLabel;
    Label12: TLabel;
    lbEmissao: TLabel;
    Label14: TLabel;
    lbDevol: TLabel;
    Label18: TLabel;
    lbReent: TLabel;
    Label16: TLabel;
    edCEP: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure btEntregasClick(Sender: TObject);
    procedure btPesoClick(Sender: TObject);
    procedure btSaidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idC(i : Integer);
  end;

var
  Simula: TSimula;
  Neg : TNeg;
  idCli : Integer;
  cFTtotal, cFT, cAdV, cPed, cGris  : Double;
  cSub1, cSub2, cGrauD, cPt, cICMS
  , cEmissao, cDevol, cReent : Double;
  idC : Integer;


implementation

uses uDM2;



{$R *.dfm}




procedure Escreve(tipo : String);
begin
  with Simula do
  begin
    lbTipo.Caption     := tipo;
    lbFreteTot.Caption := FormatFloat('#,##0.00',cFTtotal);
    lbFrete.Caption    := FormatFloat('#,##0.00',cFT);
    lbAdv.Caption      := FormatFloat('#,##0.00',cAdv);
    lbPed.Caption      := FormatFloat('#,##0.00',cPed);
    lbGris.Caption     := FormatFloat('#,##0.00',cGris);
    lbSubA.Caption     := FormatFloat('#,##0.00',cSub1);
    lbSubAA.Caption    := FormatFloat('#,##0.00',cSub1);
    lbGrauD.Caption    := FormatFloat('#,##0.00',cGrauD);
    lbICMS.Caption     := FormatFloat('#,##0.00',cICMS);
    lbPonto.Caption    := FormatFloat('#,##0.00',cPt);
    lbSubB.Caption     := FormatFloat('#,##0.00',cSub2);
    lbEmissao.Caption  := FormatFloat('#,##0.00',cEmissao);
    lbDevol.Caption    := FormatFloat('#,##0.00',cDevol);
    lbReent.Caption    := FormatFloat('#,##0.00',cReent);

  end;
end;


procedure TSimula.FormActivate(Sender: TObject);
begin
  if (cbCli.Items.Count= 0) then
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  if (idC >0) then
    DM2.DBCp_Pos(Simula.cbCli, 'TB_Cliente',IntToStr(idC), 'NOME');  
end;

procedure Simulador(tipo : String);

var i : Integer;

begin
 with Simula do
 begin
   idCli := DM2.DBCp_leid(cbCli.Items[cbCli.itemindex], 'TB_CLIENTE', 'NOME');
   Neg := TNeg.Create;

   // Define o Frete
   if (tipo = 'Entregas') then
   begin
     Neg.Calcula_Frete_Entrega(idCli, cbLocal.ItemIndex);
     i := 3;
   end;

   if (tipo = 'Peso') then
   begin
     Neg.Calcula_Frete_Peso(idCli, vlPeso.Value, cbLocal.Itemindex, edCEP.Text);
     i := 1;
   end;

   if (tipo = 'Saida') then
   begin
     Neg.Calcula_Frete_Saida(idCli, cbFaixa.ItemIndex,cbLocal.ItemIndex,1);
     i := 4;
   end;

   // Cálculos
   Neg.Calcula_Frete_NF(i);
   Neg.Adicional_Simulador(idCli, cbLocal.ItemIndex, nPontos.Value, i, totNotas.Value, vlPeso.Value);

     // Guarda Valores
     cFTtotal := Neg.get_freteTot;
     cFT      := Neg.get_freteNF;
     cAdV     := Neg.get_01AdValor;
     cPed     := Neg.get_02Pedagio;
     cGris    := Neg.get_03Gris;
     cSub1    := Neg.get_03SubTotal;
     cGrauD   := Neg.get_04GrauD;
     cICMS    := Neg.get_05ICMS;
     cPt      := Neg.get_06Ponto;
     cSub2    := Neg.get_SubTotal2;
     cEmissao := Neg.get_07emissao;
     cDevol   := Neg.get_08devolucao;
     cReent   := Neg.get_09reentrega;

   Neg.Destroy;

   Escreve(tipo);
 end;
end;

procedure TSimula.btEntregasClick(Sender: TObject);
begin
  Simulador('Entregas');
end;

procedure TSimula.btPesoClick(Sender: TObject);
begin
  Simulador('Peso');
end;

procedure TSimula.btSaidaClick(Sender: TObject);
begin
  Simulador('Saida');
end;

procedure TSimula.set_idC(i: Integer);
begin
  idC := i;
end;

end.
