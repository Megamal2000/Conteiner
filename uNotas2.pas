unit uNotas2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Mask, JvExStdCtrls, JvEdit, JvValidateEdit, DB;

type
  TNotas2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    JvDBGrid1: TJvDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    lbMot: TLabel;
    lbTel: TLabel;
    cbCli: TComboBox;
    Label13: TLabel;
    Edit1: TEdit;
    Label14: TLabel;
    Edit2: TEdit;
    vEdit2: TJvValidateEdit;
    vEdit3: TJvValidateEdit;
    vEdit4: TJvValidateEdit;
    vEdit5: TJvValidateEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    edDest: TEdit;
    edFone: TEdit;
    edHora: TMaskEdit;
    Label11: TLabel;
    lbNum: TLabel;
    edoc: TEdit;
    Label12: TLabel;
    edObs: TEdit;
    Label15: TLabel;
    dtEnt: TDateTimePicker;
    Shape1: TShape;
    Label16: TLabel;
    lbRoma1: TLabel;
    lbRoma2: TLabel;
    Label19: TLabel;
    Edpesq: TEdit;
    DataSource1: TDataSource;
    lblQuant: TLabel;
    Panel7: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Bevel2: TBevel;
    Label29: TLabel;
    apMot: TLabel;
    apTel: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    apCli: TLabel;
    apNF: TLabel;
    apSerie: TLabel;
    apValor: TLabel;
    apPeso: TLabel;
    apVol: TLabel;
    apCEP: TLabel;
    apConhec: TLabel;
    apLocal: TLabel;
    apDest: TLabel;
    apDestTel: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Shape2: TShape;
    Label30: TLabel;
    Label31: TLabel;
    Label34: TLabel;
    Shape3: TShape;
    lbData: TLabel;
    lbOrigem: TLabel;
    Origem: TLabel;
    Shape4: TShape;
    lbRelDT: TLabel;
    lbRel: TLabel;
    Label40: TLabel;
    Shape5: TShape;
    lbEst1: TLabel;
    lbEst2: TLabel;
    Label43: TLabel;
    btRoma: TSpeedButton;
    PanelSEM: TPanel;
    PanelLISTA: TPanel;
    StatusBar1: TStatusBar;
    Label17: TLabel;
    lbdia0: TLabel;
    lbdia1: TLabel;
    Label18: TLabel;
    cbFiltro: TComboBox;
    btVisto: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Shape6: TShape;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    CheckBox1: TCheckBox;
    Label35: TLabel;
    apDestDOC: TLabel;
    Label36: TLabel;
    edDOC: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    lbEst3: TLabel;
    procedure EdpesqEnter(Sender: TObject);
    procedure EdpesqKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btRomaClick(Sender: TObject);
    procedure edocKeyPress(Sender: TObject; var Key: Char);
    procedure cbFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Notas2: TNotas2;
  idNota, idCli, idC, nRomaG : Integer;

implementation

uses uDM1, uDM3, uBanco, uRoma, uLib, uDM2, Global, uRoman;

{$R *.dfm}


procedure Limpar();
begin
  with Notas2 do
  begin
    // Paineis
    PaneLSEM.Visible := true;
    PanelLISTA.Visible := true;
    //----------------

    Edit1.Text   := '';
    vEdit2.Value := 0;
    vEdit3.Value := 0;
    vEdit4.Value := 0;
    vEdit5.Value := 0;
    Edit6.Text   := '';
    Edit7.Text   := '';
    edDest.Text  := '';
    edFone.Text  := '';
 {
    Edit8.Text := '';
    Edit9.Text := '';
    Edit10.Text := '';
    cbCli.ItemIndex := 0;
    cbEnt.ItemIndex := 0;

    edHora.Text := '00:00';
    dtEnt.DateTime := Now;

    lbPed.Caption := '';
    lbNum.Caption := '';
    lbMot.Caption := '';

    // Avisos
    Label8.Caption := '';

    LbOrigem.Caption := '';

    //origem da Baixa
    // 0=sem  1=Flaydel  2=Moto   3=Alterada
    lbBaixa.Caption  := '';
    lbBaixaUser.Caption := '';
    imgBaixa1.Visible := false;
    imgBaixa2.Visible := false;
    imgBaixa3.Visible := false;
    }
/// ====================================
/// Limpar o outro Painel
    apCli.Caption     := '';
    apNF.Caption      := '';
    apSerie.Caption   := '';
    apValor.Caption   := '';
    apPeso.Caption    := '';
    apVol.Caption     := '';
    apCEP.Caption     := '';
    apConhec.Caption  := '';
    apLocal.Caption   := '';
    apDest.Caption    := '';
    apDestTel.Caption := '';
    apMot.Caption     := '';
    apTel.Caption     := '';

    lbdia0.Caption := '';
    lbdia1.Caption := '';

   end;

end;

procedure Preencher();

var usa : TMarco;
    sTMP : String;
    Bco : Tbco;
    idUs : Integer;

begin
  usa := TMarco.Create;
  with Notas2 do
  begin
    // Minimo
    Edit1.Text      := DM1.cdsNotasNUMNF.AsString;
    Edit2.Text      := DM1.cdsNotasSERIENF.AsString;
    vEdit2.Value    := DM1.cdsNotasVALOR.AsFloat;
    vEdit3.Value    := DM1.cdsNotasPESO.AsFloat;
    vEdit4.Value    := DM1.cdsNotasVOLUME.Value;
    vEdit5.Value    := DM1.cdsNotasNCONH.Value;
    Edit6.Text      := DM1.cdsNotasCEP.AsString;
    Edit7.Text      := DM1.cdsNotasLOCALI.Value;
    if (DM1.cdsNotasnomedest.Value <> null) then
      edDest.Text := DM1.cdsNotasnomedest.Value;
    if (DM1.cdsNotasFoneDest.Value <> null) then
      edFone.Text := DM1.cdsNotasFoneDest.Value;
    if (DM1.cdsNotasDocDest.Value <> null) then
      edDoc.Text := DM1.cdsNotasDocDest.Value;

    if (DM1.cdsNotasDTNOTA.Value <> null) then
      lbData.Caption := FormatDateTime('dd/MM/yy ddd',DM1.cdsNotasDTNOTA.Value);


    // Cliente
    if (Length(DM1.cdsNotasLIGCLI.AsString) > 0) then
      DM2.DBCp_Pos(cbCli, 'TB_Cliente',DM1.cdsNotasLIGCLI.AsString , 'Nome');
    // usa.Combo_Pos(cbEnt, DM1.cdsNotasENTREGUE.Value);

    // Resultado da Nota
    lbNum.Caption   := '';
    edHora.Text     := '';
    edOc.Text       := '';
    //Edit10.Text     := '';
    //cbEnt.ItemIndex := 0;

    edHora.Text := '__:__';
    dtEnt.DateTime := Now;


    LbOrigem.Caption := '';
    if (DM1.cdsNotasOrigem.Value = 1) then lborigem.Caption := 'Manual';
    if (DM1.cdsNotasOrigem.Value = 2) then lborigem.Caption := 'Coleta';
    if (DM1.cdsNotasOrigem.Value = 3) then lborigem.Caption := 'Importada EDI';
    if (DM1.cdsNotasOrigem.Value = 4) then lborigem.Caption := 'Reentrega';
    if (DM1.cdsNotasOrigem.Value = 5) then lborigem.Caption := 'Importada XML';
{
    // Verifica o Chat
    BtMarcaChat.Visible := false;
    if (DM1.cdsNotasNCHAM.Value > 0) then BtMarcaChat.Visible := true;

    // origem (jan/2012)
    if (DM1.cdsNotasOrigem.Value = 2) then
    begin
      cbColeta.Checked := true;
      cbColeta.Font.Color := clRed;
    end
    else
    begin
      cbColeta.Checked := false;
      cbColeta.Font.Color := clGray;
    end;

    if (DM1.cdsNotasSTATUS_ENT.Value > 0) then
    begin
      cbEnt.ItemIndex :=   DM1.cdsNotasSTATUS_ENT.Value;
      if (DM1.cdsNotasNOCORR.Value > 0) then
      begin
        sTMP := '000'+DM1.cdsNotasNOCORR.AsString;
        lbNum.Caption := copy(sTMP,Length(sTMP)-2,Length(sTMP));
        Bco := TBco.Create;
        Bco.Ocorre_PesqNum(DM1.cdsNotasNOCORR.Value);
        Bco.Destroy;
        Edit8.Text := DM1.cdsOcDESCR.Value;
      end;

      if (DM1.cdsNotasObs.Value <> null) then
        if (DM1.cdsNotasObs.Value <> '') then
         Edit8.Text       := DM1.cdsNotasObs.Value ;
      if (DM1.cdsNotasRecebedor.Value <> null) then Edit9.Text := DM1.cdsNotasRecebedor.Value;
      if (DM1.cdsNotasHRENT.Value <> null) then edHora.Text    := FormatDateTime('HH:mm', DM1.cdsNotasHRENT.Value);
      if (DM1.cdsNotasDTENT.Value <> null) then dtEnt.Date     := DM1.cdsNotasDTENT.Value;


      // Origem da Baixa
      idUs := DM1.cdsNotasBAIXA_FUNC.Value;

      Bco := TBco.Create;
      Bco.Usuarios_MostraId(idUs);
      Bco.Destroy;

      if (DM1.cdsNotasBAIXA_ORIG.Value = 1) then
      begin
        lbBaixa.Caption     := 'Flaydel';
        lbbaixaUser.Caption := DM2.cdsUserLOGIN.Value;
        imgBaixa1.Visible   := true;
        imgBaixa2.Visible   := false;
        imgBaixa3.Visible   := false;
      end;

      if (DM1.cdsNotasBAIXA_ORIG.Value = 2) then
      begin
        lbBaixa.Caption     := 'Motorista';
        lbbaixaUser.Caption := '-';
        imgBaixa2.Visible   := true;
        imgBaixa3.Visible   := false;
      end;

      if (DM1.cdsNotasBAIXA_ORIG.Value = 3) then
      begin
        lbBaixa.Caption     := 'Flaydel/Alterado';
        lbbaixaUser.Caption := DM2.cdsUserLOGIN.Value;
        imgBaixa3.Visible   := true;
      end;

    end;


   }
/// ====================================
/// Preencher o outro Painel
    // Cliente
    Bco := TBco.Create;
    Bco.Cliente_MostraId(DM1.cdsNotasLIGCLI.Value);
    Bco.Destroy;
    if (DM1.cdsCli.RecordCount > 0) then apCli.Caption   := DM1.cdsCliNOME.AsString;

    apNF.Caption    := FormatFloat('#,##0',DM1.cdsNotasNUMNF.AsFloat);
    apSerie.Caption := DM1.cdsNotasSERIENF.AsString;
    apValor.Caption := FormatFloat('#,##0.00', DM1.cdsNotasVALOR.AsFloat);
    apPeso.Caption  := FormatFloat('#,##0.0', DM1.cdsNotasPESO.AsFloat);
    apVol.Caption   := DM1.cdsNotasVOLUME.AsString;
    apConhec.Caption:= DM1.cdsNotasNCONH.AsString;
    apCEP.Caption   := DM1.cdsNotasCEP.AsString;
    apLocal.Caption := DM1.cdsNotasLOCALI.Value;
    if (DM1.cdsNotasnomedest.Value <> null) then
      apDest.Caption := DM1.cdsNotasnomedest.Value;
    if (DM1.cdsNotasFoneDest.Value <> null) then
      apDestTel.Caption := DM1.cdsNotasFoneDest.Value;
    if (DM1.cdsNotasDocDest.Value <> null) then
      apDestDoc.Caption := DM1.cdsNotasDocDest.Value;

    lbdia0.Caption := FormatDateTime('dd/MM/yyyy HH:mm', DM1.cdsNotasDTCRIA.AsDatetime);
    lbdia1.Caption := FormatDateTime('dd/MM/yyyy HH:mm', DM1.cdsNotasDTALT.AsDatetime);

  end;

end;

procedure Mostra_Romaneio(nR:Integer; dtR:TDateTime);

var Rm : TRoma;
    nRoma : integer;


begin
  Notas2.btRoma.Visible := false;
  Notas2.lbRoma1.Caption := 'sem';
  Notas2.lbRoma2.Caption := '-';
  nRomaG := 0;
  // Converte Numero Romaneio
  nRoma := nR;
  if (nRoma > 900000) then
  begin
    Rm := TRoma.Create;
    nRoma :=   Rm.Converte_BDNum(nRoma);
    nRomaG := nR;
    Rm.Destroy;
  end;

  if (nRoma > 0) then
  begin
    Notas2.btRoma.Visible  := true;
    Notas2.lbRoma1.Caption := FormatFloat('#,##0', nRoma);
    Notas2.lbRoma2.Caption := FormatDateTime('dd/MM/yy ddd', dtR);
  end;

end;

procedure Mostra_NotaF(idNot:integer);

begin
  with Notas2 do
  begin
    // Informações da Nota Fiscal
    Bco.Notas_MostraId(idNota);
    Bco.Notas_Geral(idNota);
    Preencher;
  end;
end;

procedure Pesq_Nota(sNum:String; tipo : integer);

var Bco : TBco;
    Num_Pesquisar, num, todos : Integer;
    nRoma, i : Integer;
    Rm : TRoma;
    nfValor : Double;

begin
  /// ------------- Verifica se mostra todos ou os ulimos ----------------
  todos := 0; // mostra só os últimos
  if (copy(Uppercase(sNum), 1,1) = 'T') then
  begin
    sNum := copy(sNum, 2, length(sNum)-1);
    todos := 1;
  end;

  Bco := TBco.Create;
  with Notas2 do
  begin
    // Mostrar Todos ou novos
    idNFpesquisa := 0;
    if (todos <> 1) then idNFpesquisa := Bco.Config_DTP_MostraN;

    /// --------------------- Tipos de Pesquisa -------------------------
    //  0 Por número
    //  1 Por CEP
    //  2 Por Localidade
    //  3 Por Destinatário
    //  4 Por valor
    //  5 Por documento
    //  6 Por Número do Pedido
    if (cbFiltro.ItemIndex = 0) then
    begin
        num:= StrToInt(sNum);
        Num_Pesquisar := num;
        if (num > 0) then
        if (idNFpesquisa = 0) then Bco.Notas_MostraNumNovo(Num_Pesquisar)
          else Bco.Notas_MostraNum2Novo(idNFpesquisa, Num_Pesquisar);
    end;
    if (cbFiltro.ItemIndex = 1) then Bco.Notas_MostraCEP(idNFpesquisa, sNum);
    if (cbFiltro.ItemIndex = 2) then Bco.Notas_MostraLocal(idNFpesquisa, sNum);
    if (cbFiltro.ItemIndex = 3) then Bco.Notas_MostraDest(idNFpesquisa, sNum);
    if (cbFiltro.ItemIndex = 4) then
    begin
      i := Pos(',',sNum);
      if (i>0) then sNum[i] := '.';
      nfValor := StrToFloat(sNum);
      Bco.Notas_MostraValor(idNFpesquisa, nfValor);
    end;
    if (cbFiltro.ItemIndex = 5) then Bco.Notas_MostraDOC(idNFpesquisa, sNum);
    if (cbFiltro.ItemIndex = 6) then Bco.Notas_MostraPED(idNFpesquisa, sNum);


    //// ********************************************************************

    EdPesq.Text := '';


    /// --------------------- Nota não encontrada -------------------------
    if (DM3.vcNFp.RecordCount = 0) then
    begin
      Limpar;
      idNota := 0;
      Panel4.Caption := 'Nenhuma Nota localizada';
      Statusbar1.Panels[0].Text :=  'Nenhuma Nota localizada';
    end;

    /// --------------------- UMA Nota encontrada -------------------------
    if (DM3.vcNFp.RecordCount = 1) then
    begin
      Limpar;
      idNota := DM3.vcNFpIDN.Value;
      Bco.Notas_MostraId(idNota);
      vEdit2.setfocus;
      Panel4.Caption := 'UMA Nota Localizada';
      PanelSEM.Visible := false;
      Statusbar1.Panels[0].Text :=  'UMA Nota Localizada';
      Preencher;
      Mostra_Romaneio(DM1.cdsNotasNROMA.Value , DM1.cdsNotasDTENT.Value);

    end;

    /// --------------------- VARIAS Notas encontradas -----------------------
    if (DM3.vcNFp.RecordCount > 1) then
    begin
      PanelLISTA.Visible := false;
      PanelSEM.Visible   := false;
      Statusbar1.Panels[0].Text :=  IntToStr(DM3.vcNFp.recordCount) + ' notas encontradas';

      /// Mostra a 1a NOTA
      // ------------------------
      DM3.vcNFp.First;
      Bco.Notas_MostraId(DM3.vcNFpIDN.Value);

      Preencher;
      Mostra_Romaneio(DM3.vcNFpROMANEIO.AsInteger, DM3.vcNFpDTROMA.Value);
      nRomaG := DM3.vcNFpnRoma.Value;

      LblQuant.Visible := true;
      LblQuant.Caption := 'Este Número possui '+IntToStr(DM3.vcNFp.RecordCount)+' Notas. Verifique Reentrega';
    end;


    {
    if (idNota > 0) then
    begin
      Bco.Notas_MostraId(idNota);
      // Procura outros dados
      Bco.Notas_Geral(idNota);

      Preencher;
      if (DM1.cdsNotasNROMA.Value = 0) then
      begin
        Bco.NotasFora_PesqNFid(idNota);

        //BtRetira.Visible := False;
        //Panel2.Enabled   := False;
        Panel4.Caption   := 'Nota Localizada (sem Romaneio)';
        if (DM3.cdsFora.RecordCount > 0) then
           Panel4.Caption   := Panel4.Caption + #13+ DM3.cdsForaEVDESC.Value;
        lbMot.Caption    := '';
        dtEnt.DateTime   := DM3.vcNFgdtRoma.Value;
        //Panel2.Color     := clgray;
        vEdit2.SetFocus;
      end
      else
      begin
        // Converte Numero Romaneio
        Rm := TRoma.Create;
        nRoma :=   Rm.Converte_BDNum(DM1.cdsNotasNROMA.Value);
        Rm.Destroy;

        //BtRetira.Visible := True;
        //Panel2.Enabled   := True;
        Mostra_Romaneio(nRoma,DM3.vcNFgdtRoma.Value);
        Panel4.Caption   := 'Romaneio nº '+IntToStr(nRoma)+ ' ['+FormatDateTime('dd/MM/yyyy',DM3.vcNFgdtRoma.Value)+']';
        lbMot.Caption    := DM3.vcNFgMotorista.Value;
        nRomaG := DM1.cdsNotasNRoma.Value;
        if (DM3.vcNFgLIGMOT.Value <> null) then
        begin
          bco := TBco.Create;
          lbtel.Caption := bco.Func_Tel(DM3.vcNFgLIGMOT.Value);
          bco.Destroy;

        end;
        if (DM1.cdsNotasDTENT.Value <> null) then
        if (DM1.cdsNotasDTENT.Value > 0) then
           dtEnt.DateTime := DM1.cdsNotasDTENT.Value
             else dtEnt.DateTime := DM3.vcNFgdtRoma.Value;
        ///Panel2.Color     := clBtnFace;
        edHora.SetFocus;
      end;
    end; }
  end; // with

end; // fim procedure


procedure TNotas2.EdpesqEnter(Sender: TObject);
begin
  /// ---------- Tipos de Pesquisa -------------------------
  //  0 Por número
  //  1 Por CEP
  //  2 Por Localidade
  //  3 Por Destinatário
  //  4 Por valor
  //  5 Por documento
  if (cbFiltro.ItemIndex = 0) then panel4.Caption := 'Digite o número da Nota';
  if (cbFiltro.ItemIndex = 1) then panel4.Caption := 'Digite somente os cinco primeiros dígitos do CEP';
  if (cbFiltro.ItemIndex = 2) then panel4.Caption := 'Digite parte da Localidade';
  if (cbFiltro.ItemIndex = 3) then panel4.Caption := 'Digite parte do destinatário';
  if (cbFiltro.ItemIndex = 4) then panel4.Caption := 'Digite o Valor';
  if (cbFiltro.ItemIndex = 5) then panel4.Caption := 'Digite o Documento ';

  edPesq.Text := '';
end;

procedure TNotas2.EdpesqKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if (EdPesq.Text <> '') then
      Pesq_Nota(EdPesq.Text, 0);
  if (cbFiltro.ItemIndex < 2) then
  if not(Key in ['0'..'9',Chr(8), 't', 'T']) then Key := #0;
end;

procedure TNotas2.Entrar;

var Bco : TBco;

begin

  Limpar;
  cbCli.Items.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome', ' ativo = 1 ');
  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli), 'Nome');
  idC := idCli;
  cbFiltro.ItemIndex := 0;
  // Estatisticas
  Bco := TBco.Create;
  lbEst1.Caption := FormatDateTime('dd/MM/yyyy', Now);
  lbEst3.Caption := IntToStr(Bco.EstatC_NotasDia(Now));
  lbEst2.Caption := IntToStr(Bco.EstatC_RomaDia(Now));
  Bco.Destroy;

end;

procedure TNotas2.JvDBGrid1DblClick(Sender: TObject);

var Bco : TBco;

begin
  idNota := 0;
  if (DM3.vcNFpIDN.Value <> null) then idNota := DM3.vcNFpIDN.Value;
  if (idNota > 0) then
  begin
    Bco := TBco.Create;
    Bco.Notas_MostraId(idNota);
    Bco.Destroy;
    Preencher;
    Mostra_Romaneio(DM3.vcNFpROMANEIO.AsInteger, DM3.vcNFpDTROMA.Value);
    nRomaG := DM3.vcNFpnRoma.Value;
  end;
end;

procedure TNotas2.SpeedButton2Click(Sender: TObject);
begin
  Panel7.Visible := false;
end;

procedure TNotas2.SpeedButton3Click(Sender: TObject);
begin
  Panel7.Visible := true;
end;

procedure TNotas2.btRomaClick(Sender: TObject);
begin
  if (nRomaG > 0) then
  begin
    Roman.set_idRoma(nRomaG);
    Roman.set_MostraNum(true);
    Roman.Entrar;
    Roman.Show;
  end;
end;

procedure TNotas2.edocKeyPress(Sender: TObject; var Key: Char);

var ocnum : integer;
begin
  if (key = #13) then
  if (Length(edOc.Text)>0) then
  begin
    if  (TryStrToInt(edOc.Text, ocnum)) then
    begin
      Bco := TBco.Create;
      Bco.Ocorre_PesqNum(ocnum);
      Bco.Destroy;

      if (DM1.cdsOc.RecordCount > 0) then
      begin
        edOc.Text := DM1.cdsOcDESCR.Value;
        lbNum.Caption := IntToStr(ocnum);
        edObs.SetFocus;
      end
      else
      begin
        edOc.Text     := '';
        lbNum.Caption := '';
      end;
    end
    else
    begin
      Bco := TBco.Create;
      Bco.Ocorre_PesqMeio(edOc.Text);
      Bco.Destroy;

      if (DM1.cdsOc.RecordCount > 0) then
      begin
        edOc.Text     := DM1.cdsOcDESCR.Value;
        lbNum.Caption := DM1.cdsOcNUM.AsString;
        edObs.SetFocus;
      end
      else
      begin
        edOc.Text     := '';
        lbNum.Caption := '';
      end;
    end;
  end;


end;

procedure TNotas2.cbFiltroChange(Sender: TObject);
begin
    /// ---------- Tipos de Pesquisa -------------------------
    //  0 Por número
    //  1 Por CEP
    //  2 Por Localidade
    //  3 Por Destinatário
    //  4 Por valor
    if (cbFiltro.ItemIndex = 0) then panel4.Caption := 'Digite o número da Nota';
    if (cbFiltro.ItemIndex = 1) then panel4.Caption := 'Digite somente os cinco primeiros dígitos do CEP';
    if (cbFiltro.ItemIndex = 2) then panel4.Caption := 'Digite parte da Localidade';
    if (cbFiltro.ItemIndex = 3) then panel4.Caption := 'Digite parte do destinatário';
    if (cbFiltro.ItemIndex = 4) then panel4.Caption := 'Digite o Valor';


  edPesq.Text := '';
  edPesq.SetFocus;
end;

end.
