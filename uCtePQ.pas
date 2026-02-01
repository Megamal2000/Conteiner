unit uCtePQ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids, uDM3,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.Buttons, JvDataSource,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TCtePQ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    edNum: TEdit;
    btPesq: TBitBtn;
    lbResp: TLabel;
    Label2: TLabel;
    lbNum: TLabel;
    Label4: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbCli: TLabel;
    lbDest: TLabel;
    Panel4: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    lbTotV: TLabel;
    lbTotP: TLabel;
    lb1FreteP: TLabel;
    lb2AdPeso: TLabel;
    lb3AdValor: TLabel;
    lb4Gris: TLabel;
    lb5Pedagio: TLabel;
    lb6Taxa: TLabel;
    lb7Tde: TLabel;
    lb8Pontos: TLabel;
    lb9Out: TLabel;
    lbTot: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    btCalc: TBitBtn;
    Label3: TLabel;
    lbBase: TLabel;
    Label8: TLabel;
    lbAliq: TLabel;
    Label10: TLabel;
    lbICMS: TLabel;
    Label5: TLabel;
    lbSomaSubt: TLabel;
    Label11: TLabel;
    lbSomaTot: TLabel;
    Label13: TLabel;
    lbTipoCob: TLabel;
    ed1FreteP: TJvValidateEdit;
    ed2AdPeso: TJvValidateEdit;
    ed3AdValor: TJvValidateEdit;
    ed4Gris: TJvValidateEdit;
    ed5Pedagio: TJvValidateEdit;
    ed6Taxa: TJvValidateEdit;
    ed7Tde: TJvValidateEdit;
    ed8Pontos: TJvValidateEdit;
    ed9Out: TJvValidateEdit;
    edBase: TJvValidateEdit;
    edAliq: TJvValidateEdit;
    edICMS: TJvValidateEdit;
    edTot: TJvValidateEdit;
    btEdita: TSpeedButton;
    btSalva: TSpeedButton;
    procedure btPesqClick(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure btCalcClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btEditaClick(Sender: TObject);
    procedure btSalvaClick(Sender: TObject);
    procedure ed1FretePExit(Sender: TObject);
    procedure edBaseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure PesqCTe(sNum:String);
  end;




var
  CtePQ: TCtePQ;
  Valores : Array[1..15] of double;
  TipoC   : Array[1..8] of String;


implementation

{$R *.dfm}

uses uBanco, uNegocio, uDM1, uDM2,  uDM4, uDM5, uNotas;

procedure Limpar_Valores();
  var i : Integer;
begin
  with CtePQ do
  begin
    lb1FreteP.Caption    := '0,00';
    lb2AdPeso.Caption    := '0,00';
    lb3AdValor.Caption   := '0,00';
    lb4Gris.Caption      := '0,00';
    lb5Pedagio.Caption   := '0,00';
    lb6Taxa.Caption      := '0,00';
    lb7Tde.Caption       := '0,00';
    lb8Pontos.Caption    := '0,00';
    lb9Out.Caption       := '0,00';
    lbTot.Caption        := '0,00';

  end;
end;

procedure Limpar_Inicio();
begin
  with CtePQ do
  begin
    edNum.Text := '';
    lbResp.Caption := '';
    lbValor.Caption := '';
    lbCli.Caption := '';
    lbNum.Caption := '';
    lbDest.Caption := '';
    lbTipoCob.Caption  := '';
  end;
end;

procedure Carregar_Valores;

begin
  Valores[1] :=  DM4.cdsConhFRETEPESO.AsExtended;
  Valores[2] :=  DM4.cdsConhADICPESO.AsExtended;
  Valores[3] :=  DM4.cdsConhFRETEVALOR.AsExtended;
  Valores[4] :=  DM4.cdsConhGRIS.AsExtended;
  Valores[5] :=  DM4.cdsConhPEDAGIO.AsExtended;
  Valores[6] :=  DM4.cdsConhTXCTE.AsExtended;
  Valores[7] :=  DM4.cdsConhTDE.AsExtended;
  Valores[8] :=  DM4.cdsConhPONTO.AsExtended;
  Valores[9] :=  DM4.cdsConhOUTROS.AsExtended;
  Valores[10]:=  DM4.cdsConhBASE.AsExtended;
  Valores[11] :=  DM4.cdsConhALIQ.AsExtended;
  Valores[12] :=  DM4.cdsConhICMS.AsExtended;
  Valores[13] :=  DM4.cdsConhTOTAL.AsExtended;
end;

procedure Preenche_TiposCOB();
begin
  TipoC[1] := 'Frete Peso';
  TipoC[2] := '2';
  TipoC[3] := '3';
  TipoC[4] := '4';
  TipoC[5] := '5';
  TipoC[6] := '6';
  TipoC[7] := 'Frete Combinado';
  TipoC[8] := 'Frete Fixo';
end;

procedure Preenche_Labels();
begin
  with CtePQ do
  begin
    lb1FreteP.Caption    := FormatFloat('#,##0.00', Valores[1]);
    lb2AdPeso.Caption    := FormatFloat('#,##0.00', Valores[2]);
    lb3AdValor.Caption   := FormatFloat('#,##0.00', Valores[3]);
    lb4Gris.Caption      := FormatFloat('#,##0.00', Valores[4]);
    lb5Pedagio.Caption   := FormatFloat('#,##0.00', Valores[5]);
    lb6Taxa.Caption      := FormatFloat('#,##0.00', Valores[6]);
    lb7Tde.Caption       := FormatFloat('#,##0.00', Valores[7]);
    lb8Pontos.Caption    := FormatFloat('#,##0.00', Valores[8]);
    lb9Out.Caption       := FormatFloat('#,##0.00', Valores[9]);
    lbBase.Caption       := FormatFloat('#,##0.00', Valores[10]);
    lbAliq.Caption       := FormatFloat('#,##0.00', Valores[11]);
    lbICMS.Caption       := FormatFloat('#,##0.00', Valores[12]);
    lbTot.Caption        := FormatFloat('#,##0.00', Valores[13]);
    lbValor.Caption      := FormatFloat('#,##0.00', Valores[13]);
  end;
end;

procedure Preenche_Edits();
begin
  with CtePQ do
  begin
    ed1FreteP.Text    := FormatFloat('#,##0.00', Valores[1]);
    ed2AdPeso.Text    := FormatFloat('#,##0.00', Valores[2]);
    ed3AdValor.Text   := FormatFloat('#,##0.00', Valores[3]);
    ed4Gris.Text      := FormatFloat('#,##0.00', Valores[4]);
    ed5Pedagio.Text   := FormatFloat('#,##0.00', Valores[5]);
    ed6Taxa.Text      := FormatFloat('#,##0.00', Valores[6]);
    ed7Tde.Text       := FormatFloat('#,##0.00', Valores[7]);
    ed8Pontos.Text    := FormatFloat('#,##0.00', Valores[8]);
    ed9Out.Text       := FormatFloat('#,##0.00', Valores[9]);
    edBase.Text       := FormatFloat('#,##0.00', Valores[10]);
    edAliq.Text       := FormatFloat('#,##0.00', Valores[11]);
    edICMS.Text       := FormatFloat('#,##0.00', Valores[12]);
    edTot.Text        := FormatFloat('#,##0.00', Valores[13]);
  end;
end;

procedure Ler_Edits;

begin
  with CtePQ do
  begin
    Valores[1] :=  ed1FreteP.AsFloat;
    Valores[2] :=  ed2AdPeso.AsFloat;
    Valores[3] :=  ed3AdValor.AsFloat;
    Valores[4] :=  ed4Gris.AsFloat;
    Valores[5] :=  ed5Pedagio.AsFloat;
    Valores[6] :=  ed6Taxa.AsFloat;
    Valores[7] :=  ed7Tde.AsFloat;
    Valores[8] :=  ed8Pontos.AsFloat;
    Valores[9] :=  ed9Out.AsFloat;
    Valores[10]:=  edBase.AsFloat;
    Valores[11] :=  edAliq.AsFloat ;
    Valores[12] :=  edICMS.AsFloat;
    Valores[13] :=  edTot.AsFloat;
  end;
end;

procedure Mostrar_Edits(b : boolean);
begin
  with CtePQ do
  begin
    ed1FreteP.Visible := b;
    ed2AdPeso.Visible := b;
    ed3AdValor.Visible := b;
    ed4Gris.Visible := b;
    ed5Pedagio.Visible := b;
    ed6Taxa.Visible := b;
    ed7Tde.Visible := b;
    ed8Pontos.Visible := b;
    ed9Out.Visible := b;
    edBase.Visible := b;
    edAliq.Visible := b;
    edICMS.Visible := b;
    edTot.Visible := b;
    btSalva.Visible := b;
  end;
end;


procedure Somas();
  var i : Integer;
      soma : double;
begin
  soma := 0;
  for i := 1 to 9 do soma := soma + Valores[i];
  Valores[14] := soma;
  Valores[15] := soma + Valores[12];
  CtePq.lbSomaSubt.Caption := FormatFloat('#,##0.00', Valores[14]);
  CtePq.lbSomaTot.Caption  := FormatFloat('#,##0.00', Valores[15]);
end;

procedure Calcula_Imposto(direcao:smallint);
  var tx, imp, bas, tot, frete, valor:double;
      i : Integer;
begin
  // normal
  if direcao =1 then
  begin
    tot := Valores[14];
    tx := Valores[11];
    bas := tot*100 / (100 - tx);
    imp := bas - tot;


    Valores[10] := bas;
    Valores[11] := tx;
    Valores[12] := imp;
    Valores[13] := tot;

  end
  else
  begin
    bas := Valores[10];
    tx := Valores[11];
    imp := bas * tx / 100;
    tot := bas - imp;

    valor := 0;
    for i := 2 to 9 do valor := valor + Valores[i];

    frete := tot - valor;

    Valores[1]  := frete;
    Valores[10] := bas;
    Valores[11] := tx;
    Valores[12] := imp;
    Valores[13] := tot;

  end;

end;

procedure Pesquisar(sCT:String);
  var nCT,iTransp : Integer;
        sTmp : String;
      Bco : TBco;
      TotV, TotP:double;

begin
  CtePQ.lbResp.Caption := 'Pesquisando. Aguarde... ';
  Limpar_Valores;
  Limpar_Inicio;
  CtePq.btCalc.Enabled := false;
  // Inicia
  nCT := 0;
  iTransp := 3;
  // Lê o numero
  sTmp := sCT;
  nCT := StrToInt(sTmp);
  // pesquisa
  Bco := TBco.Create;
  Bco.Cte_Notas(nCT, iTransp);
  Bco.Conhec_MostraNUM(nCT, iTransp);
  Bco.Destroy;

  with CtePQ do
  begin
    btCalc.Enabled := false;
    if DM5.cdsNFcte.RecordCount>0 then
    begin
      btCalc.Enabled := true;
      lbResp.Caption := 'MOSTRANDO a CT-e    '+sTmp;

      lbNum.Caption   := sTmp;
      lbCli.Caption   := DM5.cdsNFcteNOME.Value;
      lbDest.Caption  := DM5.cdsNFcteNOMEDEST.Value;

      TotV := 0;
      TotP := 0;
      DM5.cdsNFcte.First;
      Preenche_TiposCOB;
      CtePQ.lbTipoCob.Caption := 'Frete Peso';
      if (DM5.cdsNFcteTIPO_COB.Value > 0) then
        CtePQ.lbTipoCob.Caption := TipoC[ DM5.cdsNFcteTIPO_COB.AsInteger ];
      while not DM5.cdsNFcte.Eof do
      begin
        TotV := TotV + Dm5.cdsNFcteVALOR.AsExtended;
        TotP := TotP + DM5.cdsNFctePESO.AsExtended;
        DM5.cdsNFcte.Next;
      end;
      lbTotV.Caption := FormatFloat('#,##0.00', TotV);
      lbTotP.Caption := FormatFloat('#,##0.00', TotP);


      if DM4.cdsConh.RecordCount>0 then
      begin
        Carregar_Valores;
        Preenche_Labels;
        Somas;
      end;

    end
    else
      lbResp.Caption := 'CT-e '+sTmp+ ' não encontrado';
  end;

end;

procedure TCtePQ.btCalcClick(Sender: TObject);
  var neg : TNeg;
  vPeso : double;
  vValor, ValorComb, vFrete, vBase, vICMS: double;
  idClie : Integer;
  Bco : TBco;
  MotN, MotP, MotV : String;
  Hoje : TDateTime;

begin
  CtePQ.lbResp.Caption := 'Calculando. Aguarde... ';
  idClie := DM5.cdsNFcteLIGCLI.Value;
  vPeso := 0;
  vValor:= 0;
  vBase := 0;

  // Totaliza
  DM5.cdsNFcte.First;
  while not DM5.cdsNFcte.Eof do
  begin
     vValor:= vValor + Dm5.cdsNFcteVALOR.AsExtended;
     vPeso := vPeso + DM5.cdsNFctePESO.AsExtended;
     DM5.cdsNFcte.Next;
  end;
  // Calcula


  neg := TNeg.Create;
  DM5.cdsNFcte.First;

    if (DM5.cdsNFcteVLRCOMBINADO.AsFloat>0) then
    begin

      if (DM5.cdsNFcteTIPO_COB.Value = 7) then
      begin
        ValorComb := DM5.cdsNFcteVLRCOMBINADO.AsFloat;
        neg.Calcula_Frete_Combinado(2, ValorComb);
        neg.Calcula_Frete_NF(7);
        vFrete := neg.get_frete_combinado;
      end;

      if (DM5.cdsNFcteTIPO_COB.Value = 8) then
      begin
        ValorComb := DM5.cdsNFcteVLRCOMBINADO.AsFloat;

        neg.Adicional_Banco(idClie, 4, DM5.cdsNFcteTIPOLOCAL.Value);
        neg.Calcula_Frete_Fixo(ValorComb, DM5.cdsNFcteVALOR.AsFloat, DM5.cdsNFctePESO.AsFloat);

        //neg.Adicional_Calculos(DM5.cdsNFcteLIGCLI.Value, 8);
        neg.Calcula_Frete_NF(8);
        vFrete := neg.get_frete_fixo;
        vBase  := neg.get_11base;
        vICMS  := neg.get_05ICMS;

      end;
    end
    else
    begin
      neg.Calcula_Frete_Peso(idClie, vPeso, DM5.cdsNFcteTIPOLOCAL.Value, DM5.cdsNFcteCEP.Value);
      neg.Calcula_Frete_NF(1);
      neg.Adicional_AlteraValor(DM5.cdsNFcteID.Value, idClie, DM5.cdsNFcteTIPOLOCAL.Value,DM5.cdsNFctePONTO.Value ,1, vValor,vPeso);
      vFrete := neg.get_A_fretePeso;
      vBase  := neg.get_H_base;
      vICMS  := neg.get_J_ICMS;
    end;


  // Grava
  Hoje := Now;
  if (DM4.cdsCTDTROMA.Value > Hoje - 60) then Hoje := DM4.cdsCTDTROMA.Value;

  Bco := TBco.Create;
  Bco.Conhec_Motor(DM5.cdsNFcteID.Value);
  MotN := 'Fabio';
  MotP := 'EFV-6657';
  MotV := 'VAN';
  if (DM2.cdsTMP.Fields[2].Value <> null) then MotN := copy(DM2.cdsTMP.Fields[2].Value,1,20);
  if (DM2.cdsTMP.Fields[3].Value <> null) then MotP := DM2.cdsTMP.Fields[3].Value;
  if (DM2.cdsTMP.Fields[4].Value <> null) then MotV := copy(DM2.cdsTMP.Fields[4].Value,1,20);
  bco.Conhec_AlteraCalc(DM4.cdsConhID.Value, DM5.cdsNFcteNUMNF.Value, -1,DM5.cdsNFcteID.Value, vFrete, neg.get_01AdValor, neg.get_C_secCAT,neg.get_D_despacho, neg.get_02Pedagio,
                  neg.get_F_outros,neg.get_G_total,vBase, neg.get_I_aliq, vICMS ,neg.get_K_fretePesoAdic, neg.get_03Gris, neg.get_07emissao, neg.get_04GrauD,
                  neg.get_06Ponto, neg.get_08devolucao, Hoje, MotN, MotP, MotV);
  CtePQ.lbResp.Caption := 'Cálculo terminado! ';
  Bco.Conhec_MostraNUM(StrToInt(lbNum.Caption), 3);
  Bco.Destroy;
  neg.Destroy;

  Carregar_Valores;
  Preenche_Labels;
  Somas;

  //Pesquisar(lbNum.Caption);
  edNum.SetFocus;
end;

procedure TCtePQ.btEditaClick(Sender: TObject);
begin
  Preenche_Edits;
  Mostrar_Edits(true);
end;

procedure TCtePQ.btPesqClick(Sender: TObject);
begin
  Pesquisar(edNum.Text);

end;

procedure TCtePQ.btSalvaClick(Sender: TObject);
  var Bco : TBco;
begin
  Ler_Edits;
  Bco := TBco.Create;
  Bco.Conhec_AlteraValores(DM4.cdsConhID.Value, Valores[1], Valores[3], 0, 0, Valores[5], Valores[9], Valores[13],
     Valores[10], Valores[11], Valores[12], Valores[2], Valores[4], Valores[6], Valores[7], Valores[8], 0);
  Bco.Destroy;
  Preenche_Labels;
  Mostrar_Edits(false);
end;

procedure TCtePQ.ed1FretePExit(Sender: TObject);
begin
  Ler_Edits;
  somas;
  Calcula_Imposto(1);
  Preenche_Edits;
end;

procedure TCtePQ.edBaseExit(Sender: TObject);
begin
  Ler_Edits;
  Calcula_Imposto(0);
  Preenche_Edits;
end;

procedure TCtePQ.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13  then
  begin
    Mostrar_Edits(false);
    Pesquisar(ednUm.Text);
    edNum.Text := '';
  end;
end;

procedure TCtePQ.Entrar;
begin
  CtePQ.lbResp.Caption := 'Digite um número de CT-e ';
  Limpar_Valores;
  Limpar_Inicio;
  CtePq.btCalc.Enabled := false;
  Mostrar_Edits(false);
end;

procedure TCtePQ.JvDBGrid1DblClick(Sender: TObject);
begin
    NotasP.Entrar;
    NotasP.Mostrar_Nota_id(DM5.cdsNFcteID.Value);
    NotasP.Show;
end;

procedure TCtePQ.PesqCTe(sNum: String);
begin
  Pesquisar(sNum);
end;

end.
