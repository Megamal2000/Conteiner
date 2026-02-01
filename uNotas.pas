unit uNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, ExtCtrls, Mask, Buttons, uDM5,
  ComCtrls, DB, JvExStdCtrls, JvEdit, JvValidateEdit, ImgList, jpeg, Shellapi,
  JvGIF, ppComm, ppRelatv, ppProd, ppClass, ppReport, JvMemoryDataset,
  JvDataSource, ppDB, ppDBPipe, ppModule, raCodMod, ppBands, ppCtrls,
  ppBarCod, ppPrnabl, ppCache, ppParameter, ppDesignLayer, Vcl.DBCGrids,
  Vcl.Grids, Vcl.DBGrids;

type
  TNotasP = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label8: TLabel;
    Edpesq: TEdit;
    Panel2: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label11: TLabel;
    lblRel: TLabel;
    BtOcorre: TSpeedButton;
    lblQuant: TLabel;
    Panel3: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BtRetira: TSpeedButton;
    BtNovo: TSpeedButton;
    BtReent: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Label12: TLabel;
    BtMarcaDevol: TSpeedButton;
    BtMarcaReent: TSpeedButton;
    cbInserir: TCheckBox;
    Edit1: TEdit;
    lbPed: TLabel;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    edHora: TMaskEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    cbCli: TComboBox;
    cbEnt: TComboBox;
    dtEnt: TDateTimePicker;
    lbNum: TLabel;
    vEdit4: TJvValidateEdit;
    vEdit5: TJvValidateEdit;
    Image1: TImage;
    lbMot: TLabel;
    cbColeta: TCheckBox;
    lbTel: TLabel;
    //vEdit2: TCurrencyEdit;
    //vEdit3: TCurrencyEdit;
    SpeedButton2: TSpeedButton;
    btSim: TSpeedButton;
    Label10: TLabel;
    edDest: TEdit;
    btSalvar: TSpeedButton;
    vEdit2: TJvValidateEdit;
    vEdit3: TJvValidateEdit;
    lbOrigem: TLabel;
    imgBaixa1: TImage;
    lbBaixa: TLabel;
    lbbaixaUser: TLabel;
    imgBaixa2: TImage;
    imgBaixa3: TImage;
    BtMarcaChat: TSpeedButton;
    Label15: TLabel;
    edFone: TEdit;
    btDet: TBitBtn;
    lbCria: TLabel;
    ckNaoPaga: TCheckBox;
    btSalva2: TBitBtn;
    Label16: TLabel;
    edDOC: TEdit;
    btSem: TSpeedButton;
    btRecibos: TBitBtn;
    relREC: TppReport;
    ppDBPipeline1: TppDBPipeline;
    dsTab: TJvDataSource;
    Tab: TJvMemoryData;
    TabNUMNF: TIntegerField;
    TabNRoma: TIntegerField;
    TabNOMECli: TStringField;
    TabNOMEDest: TStringField;
    TabVOLUME: TIntegerField;
    TabEndereco: TStringField;
    TabNumero: TIntegerField;
    TabComplem: TStringField;
    TabBairro: TStringField;
    TabCidade: TStringField;
    TabCEP: TStringField;
    TabID: TIntegerField;
    TabFONEdest: TStringField;
    TabPeso: TFloatField;
    ppParameterList1: TppParameterList;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLabel23: TppLabel;
    ppLine2: TppLine;
    ppLine8: TppLine;
    ppDBText1: TppDBText;
    ppLabel26: TppLabel;
    ppDBText2: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel30: TppLabel;
    ppDBBarCode1: TppDBBarCode;
    ppLine12: TppLine;
    ppDBText3: TppDBText;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppLine14: TppLine;
    ppLabel25: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText6: TppDBText;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppDBText8: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppFooterBand2: TppFooterBand;
    raCodeModule1: TraCodeModule;
    btHist: TSpeedButton;
    btpende: TSpeedButton;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    Label17: TLabel;
    MemoObs: TMemo;
    btObs2: TSpeedButton;
    DBText1: TDBText;
    DBText2: TDBText;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    lbobsnum: TLabel;
    DataSource2: TDataSource;
    lbOCOR: TLabel;
    Panel7: TPanel;
    cbPrior: TComboBox;
    procedure EdpesqEnter(Sender: TObject);
    procedure EdpesqKeyPress(Sender: TObject; var Key: Char);
    procedure BtNovoClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure vEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure vEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure vEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure vEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure BtRetiraClick(Sender: TObject);
    procedure BtReentClick(Sender: TObject);
    procedure edHoraKeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure cbEntCloseUp(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure dtEntKeyPress(Sender: TObject; var Key: Char);
    procedure dtEntCloseUp(Sender: TObject);
    procedure BtOcorreClick(Sender: TObject);
    procedure cbColetaClick(Sender: TObject);
    procedure vEdit2Enter(Sender: TObject);
    procedure Label1DblClick(Sender: TObject);
    procedure btSimClick(Sender: TObject);
    procedure BtMarcaDevolClick(Sender: TObject);
    procedure edDestKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvarClick(Sender: TObject);
    procedure BtMarcaChatClick(Sender: TObject);
    procedure btDetClick(Sender: TObject);
    procedure btSalva2Click(Sender: TObject);
    procedure btSemClick(Sender: TObject);
    procedure btRecibosClick(Sender: TObject);
    procedure btHistClick(Sender: TObject);
    procedure btpendeClick(Sender: TObject);
    procedure MemoObsChange(Sender: TObject);
    procedure btObs2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar();
    procedure set_idNota(i : integer);
    procedure set_origem(i : integer);
    procedure Mostrar_Nota_id(idN : Integer);
    procedure AbreNf;
    procedure PesqExterna(sNF:String);
  end;

var
  NotasP : TNotasP;
  idNota, nOcorre, idC, origem, idCliAnterior, BaixaFeita : Integer;

  // origem =1 veio de Romaneio

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM3,  uBanco, uLib, Global, uNotasPQ, uRoma, uOcorrePQ,
  uAguarde, uPrinc, uSimula, uFotoT, uCteDet, uRastreio, uDM4, uNFsegue;

procedure Obs2_Mostra();
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Obs2_Mostra(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.value);
  Bco.Destroy;
end;

procedure Obs2_Insere();
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Obs2_Inserir(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.value,idUser, 0, NotasP.MemoObs.Text);
  Bco.Destroy;
end;

procedure Preencher();

var usa : TMarco;
    sTMP : String;
    Bco : Tbco;
    idUs : Integer;

begin

  usa := TMarco.Create;
  with NotasP do
  begin
    // Minimo
    Edit1.Text      := DM1.cdsNotasNUMNF.AsString;
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

    // Cliente
    DM2.DBCp_Pos(cbCli, 'TB_Cliente',DM1.cdsNotasLIGCLI.AsString , 'Nome');
    usa.Combo_Pos(cbEnt, DM1.cdsNotasENTREGUE.Value);
    idCliAnterior := DM1.cdsNotasLIGCLI.Value;

    // Resultado da Nota
    lbNum.Caption   := '';
    Edit8.Text      := '';
    Edit9.Text      := '';
    Edit10.Text     := '';
    cbEnt.ItemIndex := 0;

    edHora.Text := '__:__';
    dtEnt.DateTime := Now;


    LbOrigem.Caption := '';
    if (DM1.cdsNotasOrigem.Value = 1) then lborigem.Caption := 'Manual';
    if (DM1.cdsNotasOrigem.Value = 2) then lborigem.Caption := 'Coleta';
    if (DM1.cdsNotasOrigem.Value = 3) then lborigem.Caption := 'Importada EDI';
    if (DM1.cdsNotasOrigem.Value = 4) then lborigem.Caption := 'Reentrega';
    if (DM1.cdsNotasOrigem.Value = 5) then lborigem.Caption := 'Importada XML';
    if (DM1.cdsNotasOrigem.Value = 6) then lborigem.Caption := 'Manual/Completada';

    if (DM1.cdsNotasDTCRIA.AsString <> null) then
      lbCria.Caption := FormatDateTime('dd/MM/yyyy ddd HH:mm', DM1.cdsNotasDTCRIA.AsDateTime);

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

    btSem.Visible := false;
    if (DM1.cdsNotasSTATUS_ENT.Value > 0) then
    begin

      cbEnt.ItemIndex :=   DM1.cdsNotasSTATUS_ENT.Value;
      if (DM1.cdsNotasNOCORR.Value > 0) then
      begin
        btSem.Visible := true;

        BaixaFeita := DM1.cdsNotasNOCORR.Value;
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

      if (DM1.cdsNotasBAIXA_ORIG.Value = 11) then
      begin
        lbBaixa.Caption     := 'Flaydel x-WEB';
        lbbaixaUser.Caption := DM2.cdsUserLOGIN.Value;
        imgBaixa1.Visible   := true;
        imgBaixa2.Visible   := false;
        imgBaixa3.Visible   := false;
      end;

      if (DM1.cdsNotasBAIXA_ORIG.Value = 13) then
      begin
        lbBaixa.Caption     := 'Fd/Alt x-WEB';
        lbbaixaUser.Caption := DM2.cdsUserLOGIN.Value;
        imgBaixa3.Visible   := true;
      end;


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

      if (DM1.cdsNotasBAIXA_ORIG.Value = 4) then
      begin
        lbBaixa.Caption     := 'Flaydel/Apagado';
        lbbaixaUser.Caption := DM2.cdsUserLOGIN.Value;
        imgBaixa3.Visible   := true;
      end;
      if (Length(DM1.cdsNotasDTOCOREN.AsString)> 1) then
        lbOCOR.Caption := FormatDateTime('yyMMdd HHmm', DM1.cdsNotasDTOCOREN.AsDateTime);
    end;

    cbPrior.ItemIndex := DM1.cdsNotasPRIORIDADE.Value;


    // Obs2
    MemoObs.Clear;
    Obs2_Mostra;

  end;
end;

procedure BuscaId(idNF : Integer);

var Bco : TBco;
    Rm : TRoma;
    nRoma : integer;

begin
  if (idNF > 0) then
  begin
    Bco := TBco.Create;
    Bco.Notas_MostraId(idNF);
    Bco.Notas_Geral(idNF);
    Bco.Destroy;

    Preencher;
    with NotasP do
    begin
       if (DM1.cdsNotasNROMA.Value = 0) then
        begin
          Bco := TBco.Create;
          Bco.NotasFora_PesqNFid(idNota);
          Bco.Destroy;

          BtRetira.Visible := False;
          Panel2.Enabled   := False;
          Label8.Caption   := 'Nota Localizada (sem Romaneio)';
          if (DM3.cdsFora.RecordCount > 0) then
             Label8.Caption   := Label8.Caption + #13+ DM3.cdsForaEVDESC.Value;
          lbMot.Caption    := '';
          dtEnt.DateTime   := DM3.vcNFgdtRoma.Value;
          Panel2.Color     := clgray;

        end
        else
        begin
          // Converte Numero Romaneio
          Rm := TRoma.Create;
          nRoma :=   Rm.Converte_BDNum(DM1.cdsNotasNROMA.Value);
          Rm.Destroy;

          BtRetira.Visible := True;
          Panel2.Enabled   := True;
          Label8.Caption   := 'Romaneio nº '+IntToStr(nRoma)+ ' ['+FormatDateTime('dd/MM/yyyy',DM3.vcNFgdtRoma.Value)+']';
          lbMot.Caption    := DM3.vcNFgMotorista.Value;
          if (DM3.vcNFgLIGMOT.Value <> null) then
          begin
            bco := TBco.Create;
            lbtel.Caption := bco.Func_Tel(DM3.vcNFgLIGMOT.Value);
            bco.Destroy;

          end
          else lbTel.Caption := '';
          if (DM1.cdsNotasDTENT.Value <> null) then
          if (DM1.cdsNotasDTENT.Value > 0) then
             dtEnt.DateTime := DM1.cdsNotasDTENT.Value
               else dtEnt.DateTime := DM3.vcNFgdtRoma.Value;
          Panel2.Color     := clBtnFace;

          if (DM1.cdsNotasSTATUS_TKT.Value = 0) then
          begin
            Panel2.Enabled := True;
            Image1.Visible := false;
            btSem.Visible  := True;
          end
          else
          begin
            Image1.Visible := true;
            Panel2.Enabled := False;
            Panel2.Color   := $00A4A4FF;
            btSem.Visible  := false;
          end;

        end;
     end;
  end;
end;


procedure TNotasP.EdpesqEnter(Sender: TObject);
begin
  EdPesq.Text := '';
end;

procedure Limpar();
begin
  with NotasP do
  begin
    Edit1.Text := '';
    vEdit2.Value := 0;
    vEdit3.Value := 0;
    vEdit4.Value := 0;
    vEdit5.Value := 0;
    Edit6.Text := '';
    Edit7.Text := '';
    edDest.Text := '';
    edFone.Text := '';
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

    edDest.Text := '';
    edFone.Text := '';
    edDOC.Text  := '';

    lbOCOR.Caption := '';
   end;
end;

procedure Pesq_Nota(sNum:String; idNF : integer);

var Bco : TBco;
    Num_Pesquisar, num, todos : Integer;
    nRoma : Integer;
    Rm : TRoma;
    rDT : TDateTime;
    rMot : Integer;

begin
  todos := 0; // mostra só os últimos
  if (copy(Uppercase(sNum), 1,1) = 'T') then
  begin
    sNum := copy(sNum, 2, length(sNum)-1);
    todos := 1;
  end;

  num:= StrToInt(sNum);

  Bco := TBco.Create;
  idNota := idNF;
  with NotasP do
  begin
    lblQuant.Visible := False;

   // if (EdPesq.Text <> '') then
    begin
      Num_Pesquisar := num;
      EdPesq.Text := '';
      if (num > 0) then
      begin
         { TODO : Configurar data e conversao para Numero da nota }
        idNFpesquisa := Bco.Config_DTP_MostraN;
         { TODO : Configurar data e conversao para Numero da nota }
        if (todos = 1) then Bco.Notas_MostraNum(Num_Pesquisar)
          else Bco.Notas_MostraNum2(idNFpesquisa, Num_Pesquisar);

        /// --------------------- Nota não encontrada -------------------------
        if (DM1.cdsNotas.RecordCount = 0) then
        begin
          Limpar;
          idNota := 0;
          BtRetira.Visible := False;
          Panel2.Enabled   := False;
          Label8.Caption := 'Número de nota não localizado';
          Panel2.Color     := clgray;
        end;

        /// --------------------- UMA Nota encontrada -------------------------
        if (DM1.cdsNotas.RecordCount = 1) then
        begin
          Limpar;
          idNota := DM1.cdsNotasID.Value;
          vEdit2.setfocus;
        end;


        /// --------------------- VARIAS Notas encontradas -----------------------
        if (DM1.cdsNotas.RecordCount > 1) then
        begin
          NotasPQ.set_saida(1);
          NotasPQ.Label2.Caption := DM1.cdsNotasNUMNF.AsString;
          if (todos = 1) then NotasPQ.Label3.Caption := 'TODOS' else NotasPQ.Label3.Caption := 'PARTE';
          NotasPQ.ShowModal;

          LblQuant.Visible := true;
          LblQuant.Caption := 'Este Número possui '+IntToStr(DM3.vcNFp.RecordCount)+' Notas. Verifique Reentrega';
        end;
      end;  // num > 0

      if (idNota > 0) then
      begin
        Bco.Notas_MostraId(idNota);
        // Procura outros dados
        //Bco.Notas_Geral(idNota);
        rMot := 0;

        if DM1.cdsNotasNROMA.Value>0 then
        begin
          Bco.Romaneio_MostraMot(DM1.cdsNotasNROMA.Value);
          rDT := DM2.cdsTMP.Fields[0].AsDateTime;
          rMot:= DM2.cdsTMP.Fields[1].AsInteger;
        end;

        Preencher;

        if (DM1.cdsNotasNROMA.Value = 0) then
        begin
          Bco.NotasFora_PesqNFid(idNota);

          BtRetira.Visible := False;
          Panel2.Enabled   := False;
          Label8.Caption   := 'Nota Localizada (sem Romaneio)';
          if (DM3.cdsFora.RecordCount > 0) then
             Label8.Caption   := Label8.Caption + #13+ DM3.cdsForaEVDESC.Value;
          lbMot.Caption    := '';
          dtEnt.DateTime   := rDT;
          Panel2.Color     := clgray;
          vEdit2.SetFocus;
        end
        else
        begin
          // Converte Numero Romaneio
          Rm := TRoma.Create;
          nRoma :=   Rm.Converte_BDNum(DM1.cdsNotasNROMA.Value);
          Rm.Destroy;

          BtRetira.Visible := True;
          Panel2.Enabled   := True;
          Label8.Caption   := 'Romaneio nº '+IntToStr(nRoma)+ ' ['+FormatDateTime('dd/MM/yyyy',rDT)+']';
          lbMot.Caption    := Bco.Funcs_Nome(rMot);

          if (rMot <> null) then
          begin
            bco := TBco.Create;
            lbtel.Caption := bco.Func_Tel(rMot);
            bco.Destroy;

          end;
          if (DM1.cdsNotasDTENT.Value <> null) then
          if (DM1.cdsNotasDTENT.Value > 0) then
             dtEnt.DateTime := DM1.cdsNotasDTENT.Value
               else dtEnt.DateTime := rDT;
          Panel2.Color     := clBtnFace;
          edHora.SetFocus;
        end;
      end;



      if (DM1.cdsNotasSTATUS_TKT.Value = 0) then
      begin
        Panel2.Enabled := True;
        Image1.Visible := false;
      end
      else
      begin
        Image1.Visible := true;
        Panel2.Enabled := False;
        Panel2.Color   := $008B8BB8;
      end;
    end; //ed = vazio
  end; // with

end; // fim procedure




procedure TNotasP.EdpesqKeyPress(Sender: TObject; var Key: Char);


begin
  idNFpesquisa := 590992;
  if (Key=#13) then
    if (EdPesq.Text <> '') then
    begin
      Pesq_Nota(EdPesq.Text, 0)
    end;
  if not(Key in ['0'..'9',Chr(8), 't', 'T']) then Key := #0;

end;

procedure SalvarN();

var Bco : TBco;
    Rast : TRastreio;
    nOrigem, nDev, serie : Integer;
    SalvarOK : Smallint;

begin
  // Origem = 1 NF // Origem = 2 Coleta
  if (NotasP.cbColeta.Checked) then
  begin
    nOrigem := 2;
    nDev    := 6;
  end
  else
  begin
    nOrigem := 1;
    nDev    := 0;
  end;

  Bco := TBco.Create;
  with NotasP do
  begin
    idC := DM2.DBCp_leid(cbCli.items[cbCli.itemIndex],'TB_Cliente','Nome');
    if (idNota = 0) then
    begin
      SalvarOK := 1;
      if (Bco.Notas_Existe(idC,StrToInt(Edit1.text),0,0) ) then
      begin
        SalvarOK := 0;
        ShowMessage('Essa nota já existe. Verifique Cliente e Número');
      end;

      if cbCli.ItemIndex = 0 then
      begin
        SalvarOK := 0;
        ShowMessage('Não posso criar nota SEM CLIENTE');
      end;

      if (SalvarOK = 1) then
      begin
        serie := Bco.Notas_SeriePadrao(idC);
        Bco.Notas_Inserir(idC, StrToInt(Edit1.text),vEdit4.Value, vEdit2.Value,vEdit3.Value, Edit6.Text, Edit7.Text, vEdit5.Value, nOrigem,0, edDest.Text, edFone.Text, edDoc.text, '' ,serie, cbPrior.ItemIndex);
        if (nOrigem = 1) then
        begin
          // EVENTO NF - Rastreio
          Rast := TRastreio.Create;
          Rast.set_ocor(StrToInt(Edit1.Text), idC,0, evrDigitado,idUser);
          Rast.Destroy;
        end;

        Bco.Notas_MostraNum(StrToInt(Edit1.text));
        DM1.cdsNotas.Last;
        idNota := Dm1.cdsNotasID.Value;
      end;
    end
    else
      Bco.Notas_Alterar(idNota, StrToInt(Edit1.text),vEdit4.Value, vEdit2.Value,vEdit3.Value, Edit6.Text, Edit7.Text, vEdit5.Value, idC, nOrigem, edDest.Text, edFone.Text, edDOC.Text, cbPrior.ItemIndex);
      if (idCliAnterior <> idC) then Bco.Notas_Unica_AltCli(StrToInt(Edit1.text),idCliAnterior, idC);
  end;
  Bco.Destroy;
end;

procedure SalvarNR();

var Bco : TBco;
    dt : String;
    Baixa_Tipo, idUs, nOc : Integer;
    Rast : TRastreio;
    erro : Smallint;

begin
  Bco := TBco.Create;
  with NotasP do
  begin
    erro :=0;
    Baixa_Tipo := 11;
    if (DM1.cdsNotasBaixa_Orig.Value = 2) then Baixa_Tipo := 13;

    idUs := StrToInt(princ.LbUserID.Caption);
    nOc := StrToInt(lbNum.Caption);

    dt := FormatDateTime('yyyy-MM-dd', dtEnt.DateTime);
    if DM1.cdsNotasDTCRIA.AsDateTime > dtEnt.DateTime then  erro := 2;
    if erro = 2  then
      if MessageDlg('A data de baixa é menor ou igual a data de criação da Nota.' + #13 + 'Deseja continuar assim mesmo? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then erro := 0;
    if (idNota > 0) and (erro = 0) then
    begin
      Bco.Notas_Entregas_Alterar(idNota,dt, edhora.Text, Edit8.Text, edit9.Text, cbEnt.Items[cbEnt.Itemindex], StrToInt(lbNum.Caption));
      Bco.Notas_MarcarBaixa(idNota, idUs, Baixa_Tipo );
      Bco.NotasVolta_Marca(idNota, 0);
      // VER TRIGGER if (StrToInt(lbNum.Caption) = 1) then Bco.Notas_Unica_AltStatus(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value, 1);
      if BaixaFeita<>nOc then
      begin
        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.Insere_Baixa(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value, nOc, idUs );
        Rast.Destroy;
        BaixaFeita := nOc;
      end;

    end;
  end;
  Bco.Destroy;
  if (NotasP.cbEnt.ItemIndex > 0) then
    DM2.Altera_Status('TB_NOTAF', 'STATUS_ENT', idNota, NotasP.cbEnt.ItemIndex);
end;



procedure TNotasP.Entrar;

var usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  idCli        := usa.get_cliNumero;
  usa.Destroy;
  //ShowMessage('CLI '+IntToStr(idCli));
  Limpar;
  cbCli.Items.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome', ' ativo = 1 ');
  cbCli.ItemIndex := 1;
  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli), 'Nome');
  idC := idCli;
  Baixafeita:=0;  // tem que ser diferente de zero
end;

procedure TNotasP.BtNovoClick(Sender: TObject);
begin
  Limpar;
  idNota := 0;

  BtRetira.Visible := False;
  Panel2.Enabled := False;
  Label8.Caption := 'Inserir Nota Fiscal Nova';
  Panel2.Color   := clgray;

  Edit1.SetFocus;

end;

procedure TNotasP.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then vEdit2.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TNotasP.vEdit2KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '.') then key := ',' ;
  if (key = #13) then vEdit3.SetFocus;
end;

procedure TNotasP.vEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = '.') then key := ',' ;
  if (key = #13) then vEdit4.SetFocus;
end;

procedure TNotasP.vEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then vEdit5.SetFocus;
end;

procedure TNotasP.vEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Edit6.SetFocus;
end;

procedure TNotasP.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Edit7.SetFocus;
end;

procedure TNotasP.Edit7KeyPress(Sender: TObject; var Key: Char);

begin
  if (key = #13) then EdDest.SetFocus;
end;

procedure TNotasP.set_idNota(i : integer);
begin
  idNota := i;
end;

procedure TNotasP.set_origem(i: integer);
begin
  origem := i;
end;

procedure TNotasP.btObs2Click(Sender: TObject);
begin
  if Length(MemoObs.Text) > 3 then
    Obs2_Insere;

  Obs2_Mostra;
  MemoObs.Clear;
end;

procedure TNotasP.FormActivate(Sender: TObject);
begin
  if (origem = 1) then vEdit2.SetFocus;

end;

procedure TNotasP.BtRetiraClick(Sender: TObject);

var Bco : TBco;
    Rast: TRastreio;

begin
  if (DM1.cdsNotasNOCORR.Value = 0) then
  begin
    Bco := TBco.Create;
    Bco.Romaneio_InsereNota(idNota, 0);
    Bco.WS_MarcaResp(idNota, 0);
    Bco.Destroy;
    // EVENTO NF - Rastreio
    Rast := TRastreio.Create;
    Rast.Retira_Romaneio(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value, DM1.cdsNotasNROMA.Value);
    Rast.Destroy;
  end
  else ShowMessage('Nota com Baixa. NÃO pode ser retirada do Romaneio');

end;

procedure TNotasP.MemoObsChange(Sender: TObject);
begin
  lbobsnum.Caption := (80 - Length(MemoObs.Text)).ToString;
end;

procedure TNotasP.Mostrar_Nota_id(idN: Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_MostraId(idN);
  Bco.Destroy;
  idNota := idN;
  Preencher;
end;

procedure TNotasP.PesqExterna(sNF: String);
begin
  Pesq_Nota(sNF, 0);
end;

procedure TNotasP.BtReentClick(Sender: TObject);

var Bco : TBco;
    Rast: TRastreio;

begin
  if MessageDlg('Este procedimento duplicará a Nota.'+#13+'Tem certeza que deseja criar a Reentrega?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.Notas_Reentrega(idNota);
    Bco.Destroy;
    // EVENTO NF - Rastreio
    Rast := TRastreio.Create;
    Rast.set_ocor(StrToInt(Edit1.Text), idC, 0,  evrReent);
    Rast.Destroy;
  end;
end;

procedure TNotasP.edHoraKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    if (Length(Trim(edHora.Text)) = 5) then
    begin
      if (DM1.cdsNotasSTATUS_ENT.Value = 0) then
      begin
        cbEnt.ItemIndex := 1;
        lbNum.Caption := '001';
        Edit8.Text := 'Entrega Realizada Normalmente *';
        SalvarNR;
        Edit9.SetFocus;
      end
      else
      begin
        if (Length(LbNum.Caption)=0) then lbNum.Caption := '001';

        SalvarNR;
        Edit8.SetFocus;
      end;
    end else edPesq.SetFocus;  
  end;
end;

procedure TNotasP.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edHora.Text <> '00:00') then
  begin
    SalvarNR;
    edit9.SetFocus;
  end;
end;

procedure TNotasP.cbEntCloseUp(Sender: TObject);

begin
  if (cbEnt.ItemIndex > 0) then
    DM2.Altera_Status('TB_NOTAF', 'STATUS_ENT', idNota, cbEnt.ItemIndex);
end;

procedure TNotasP.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edHora.Text <> '00:00') then
  begin
    SalvarNR;
    dtEnt.SetFocus;
  end;
end;

procedure TNotasP.dtEntKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) and (edHora.Text <> '00:00') then
  begin
    SalvarNR;
    edPesq.SetFocus;
  end;
end;

procedure TNotasP.dtEntCloseUp(Sender: TObject);
begin
  if (edHora.Text <> '00:00') then
  begin
    SalvarNR;
    edPesq.SetFocus;
  end;

end;

procedure TNotasP.BtOcorreClick(Sender: TObject);

var sTMP : String;

begin
  if (OcorrePQ.ShowModal = mrOk) then
  begin
    sTMP := '000'+DM1.cdsOcNUM.AsString;

    lbNum.Caption := copy(sTMP,Length(sTMP)-2,Length(sTMP));
    Edit8.Text := DM1.cdsOcDESCR.Value;
    Edit8.SetFocus;
    Edit8.SelStart := Length(Edit8.Text);


    if (DM1.cdsOcUSO.Value = 2) or (DM1.cdsOcUSO.Value = 3) then
      cbEnt.ItemIndex := 2;
    if (DM1.cdsOcUSO.Value = 1) then cbEnt.ItemIndex := 1;

  end;
end;

procedure TNotasP.AbreNf;
begin
  Limpar;
  BuscaId(idNota);
end;

procedure TNotasP.cbColetaClick(Sender: TObject);
begin
    if (cbColeta.Checked) then
    begin
      cbColeta.Font.Color := clRed;
    end
    else
    begin
      cbColeta.Font.Color := clGray;
    end;
end;

procedure TNotasP.vEdit2Enter(Sender: TObject);
begin
  vEdit2.SelectAll;
end;

procedure TNotasP.Label1DblClick(Sender: TObject);
begin
  if (Panel2.Enabled = false) then
  if (copy(Princ.Rodape.Panels[1].Text,1,13)  = 'Administrador') or (copy(Princ.Rodape.Panels[1].Text,1,13)  = 'Gerente') then
  if MessageDlg('Deseja desbloquear?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Panel2.Enabled := True;
    Panel2.Color := clGreen;
  end;
end;

procedure TNotasP.btSimClick(Sender: TObject);

var idC: Integer;

begin
  if (idNota > 0) then
  begin
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.Itemindex], 'TB_CLIENTE', 'NOME');
    //DM2.DBCp_Pos(Simula.cbCli, 'TB_Cliente',IntToStr(idC), 'NOME');
    Simula.set_idC(idC);
    Simula.totNotas.Value := vEdit2.Value;
    Simula.vlPeso.Value   := vEdit3.Value;
    Simula.cbLocal.ItemIndex := DM1.cdsNotasTIPOLOCAL.Value;
    Simula.Show;
  end;
end;

procedure TNotasP.BtMarcaDevolClick(Sender: TObject);
begin
  FotoT.Show;
  FotoT.Entrega(DM1.cdsNotasNROMA.Value, DM1.cdsNotasIMGREC.Value, cbCli.Items[cbCli.itemIndex]);

end;

procedure TNotasP.edDestKeyPress(Sender: TObject; var Key: Char);

var nCli : Integer;

begin
  if (key = #13) then
  begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
    begin
      if (origem = 1) then
      begin
        idNota := 0;
        SalvarN;
        NotasP.ModalResult := mrOk;
        origem := 0;
      end
      else
      begin
        SalvarN;

        if (cbinserir.Checked = false) then
        begin
           edPesq.SetFocus;
        end
        else
        begin
          nCli := cbCli.ItemIndex;
          Limpar;
          cbCli.ItemIndex := nCli;
          Edit1.SetFocus;
          idNota := 0;
        end;
      end;
    end; // Aguarde
  end;
end;

procedure TNotasP.btSalvarClick(Sender: TObject);

var nCli : Integer;

begin
  begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
    begin
      if (origem = 1) then
      begin
        idNota := 0;
        SalvarN;
        NotasP.ModalResult := mrOk;
        origem := 0;
      end
      else
      begin
        SalvarN;

        if (cbinserir.Checked = false) then
        begin
           edPesq.SetFocus;
        end
        else
        begin
          nCli := cbCli.ItemIndex;
          Limpar;
          cbCli.ItemIndex := nCli;
          Edit1.SetFocus;
          idNota := 0;
        end;
      end;
    end; // Aguarde
  end;

end;

procedure TNotasP.BtMarcaChatClick(Sender: TObject);
var s_url : String;
begin
  if (DM1.cdsNotasNCHAM.Value > 0) then
  begin
    s_url := 'http://flaydel.log.br/portalweb/fdchat//appConversa.aspx?idx='+DM1.cdsNotasNCHAM.AsString;
    ShellExecute(Handle, 'open', PChar(s_url), '', '', 1);
  end;
end;

procedure TNotasP.btDetClick(Sender: TObject);
begin
        CteDet.Entrar(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value);
        CteDet.Show;
end;

procedure TNotasP.btSalva2Click(Sender: TObject);
begin
  if (edHora.Text <> '00:00') then
  begin
    SalvarNR;
    edPesq.SetFocus;
  end;
end;

procedure TNotasP.btSemClick(Sender: TObject);

var Bco : TBco;
    idUs : Integer;
    Rast : TRastreio;

begin
  if (idNota > 0) then
  if MessageDlg('Tem certeza que deseja RETIRAR a baixa nessa nota?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DM2.Altera_Status('TB_NOTAF', 'STATUS_ENT', idNota, 0);
      DM2.Altera_Status('TB_NOTAF', 'STATUS_EDI', idNota, 0);
      DM2.Altera_Status('TB_NOTAF', 'NOCORR'    , idNota, 0);

      idUs := StrToInt(princ.LbUserID.Caption);

      Bco := TBco.Create;
      Bco.Notas_MarcarBaixa(idNota, idUs, 4); // Tipo=4 Flaydel/Apagado
      Bco.Destroy;

      // EVENTO NF - Rastreio
      Rast := TRastreio.Create;
      Rast.set_ocor(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value ,DM1.cdsNotasSERIENF.Value, evrRetiraBaixa,idUs);
      Rast.Destroy;

      BuscaID(idNota);
    end;

end;
Procedure Imprime_Recibos();

var doc  : String;
    dirR : String;
    arq  : String;
    Bco : tBco;

begin
   GetDir(0, dirR);
   with NotasP do
   begin

     //Monta_recibos;
     Tab.Active := False;
     Tab.EmptyTable;
     Tab.Active := True;


      Bco := TBco.Create;
      Bco.Espelho_Mostra(DM1.cdsNotasLigCli.Value, DM1.cdsNotasNUMNF.Value );
      Bco.Destroy;

      Tab.Insert;
      TabID.Value       := DM1.cdsNotasID.Value;
      TabNUMNF.Value    := DM1.cdsNotasNUMNF.Value;
      TabNRoma.Value    := DM1.cdsNotasNROMA.Value;
      TabNOMECli.Value  := cbCli.Items[cbCli.ItemIndex];
      TabNOMEDest.Value := DM1.cdsNotasNOMEDEST.Value;
      TabFONEdest.Value := DM1.cdsNotasFONEDEST.Value;
      if (DM1.cdsNotasPESO.AsFloat <> null) then
        TabPeso.Value   := DM1.cdsNotasPESO.AsFloat;

         // Espelho

      if (DM4.cdsEspelho.RecordCount > 0) then
      begin
        if (DM4.cdsEspelhoVOLUME.Value <> null) then
          TabVOLUME.Value  := DM4.cdsEspelhoVOLUME.Value;
        TabEndereco.Value := DM4.cdsEspelhoENDERECO.Value;
        if (DM4.cdsEspelhoNumero.Value <> null) then
        TabNumero.Value   := DM4.cdsEspelhoNUMERO.Value;
        TabComplem.Value  := DM4.cdsEspelhoCOMPLEMENTO.Value;
        TabBairro.Value   := DM4.cdsEspelhoBAIRRO.Value;
        TabCidade.Value   := DM4.cdsEspelhoCIDADE.Value;
        TabCEP.Value      := DM4.cdsEspelhoCEP.Value;
      end;
      Tab.Post;

     doc := 'Recibos de Notas ';
     { carrega o arquivo }
     arq := '\Rels\RelFDrec2.rtm';
     relREC.Template.FileName := dirR+arq;
     relREC.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     relREC.DeviceType := 'Screen';
     relREC.ShowAutoSearchDialog  := False;
     relREC.ShowCancelDialog := False;
     relREC.ShowPrintDialog := False;
     relREC.PrinterSetup.DocumentName := doc;


     { imprime a ordem de serviço }
     relREC.PrintReport;
     //Marcar_IMP;


     {Fecha os arquivos}
   end;
end;


procedure TNotasP.btpendeClick(Sender: TObject);
var s : String;
    Bco : TBco;
    Rast : TRastreio;
begin
  if (Dm1.cdsNotasNROMA.Value = 0) then
  begin
  if MessageDlg('A pendência não permitirá que a nota seja roteirizada ou colocada em um Romaneio.'+#13+'Tem certeza que deseja colocar a Nota na lista de pendências?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    s := InputBox('Pendência', 'Digite o motivo ', '');
    s := copy(s, 1, 54);
    if length(s) > 3 then
    begin
      Bco := TBco.Create;
      Bco.Notas_AlteraObs(DM1.cdsNotasID.Value, s);
      Bco.Notas_MarcaPendencia(DM1.cdsNotasID.Value, 2);
      Bco.Destroy;

      // EVENTO NF - Rastreio
      Rast := TRastreio.Create;
      Rast.set_ocor(StrToInt(Edit1.Text), DM1.cdsNotasLIGCLI.Value,0, evrPendeAguarde,idUser);
      Rast.Destroy;
    end;
  end;
  end
  else ShowMessage('Notas com Romaneios não podem ser colocadas na pendência. '+#13+ 'Crie uma reentrega ou retire do romaneio');

end;

procedure TNotasP.btRecibosClick(Sender: TObject);
begin
  Imprime_Recibos;
end;

procedure TNotasP.btHistClick(Sender: TObject);
begin
  if  (DM1.cdsNotas.RecordCount > 0) then
  begin
    NFsegue.Entrar;
    NFsegue.AjustaCli(DM1.cdsNotasLIGCLI.Value);
    NFsegue.MostrarNF(DM1.cdsNotasLIGCLI.Value, DM1.cdsNotasNUMNF.Value);
    NFsegue.Show;
  end
  else ShowMessage('Sem Nota');  
end;

end.
