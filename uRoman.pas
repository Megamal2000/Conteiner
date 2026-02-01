unit uRoman;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  ComCtrls, Buttons, DB, Grids, DBGrids, uBanco,  ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppParameter, ppDB, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, Menus, JvExDBGrids, JvDBGrid, ImgList,
  ppBarCod, jpeg, JvMemoryDataset, ppModule, raCodMod, ppDesignLayer,
  System.ImageList, JvDataSource, JvExControls, JvNavigationPane, ppStrtch,
  ppSubRpt;

type
  TRoman = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    lbNum: TLabel;
    Label3: TLabel;
    lbAno: TLabel;
    Data: TLabel;
    Bevel2: TBevel;
    btMot: TSpeedButton;
    btAjud: TSpeedButton;
    btReg: TSpeedButton;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btNovo: TSpeedButton;
    btProc: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Rodape: TStatusBar;
    Label8: TLabel;
    edNota: TEdit;
    cbSaida: TComboBox;
    lbMot: TLabel;
    lbAjud: TLabel;
    lbReg: TLabel;
    DataSource1: TDataSource;
    btImp: TSpeedButton;
    Label9: TLabel;
    btSalvar: TBitBtn;
    ListaErros: TListBox;
    lbErros: TLabel;
    RelRom: TppReport;
    pipRom: TppDBPipeline;
    ppParameterList1: TppParameterList;
    dtRm: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    RetirarNota1: TMenuItem;
    lbMin: TLabel;
    JvDBGrid1: TJvDBGrid;
    lbQtN: TLabel;
    Label10: TLabel;
    edCUB: TEdit;
    edNum: TEdit;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label12: TLabel;
    btEspecial: TSpeedButton;
    Panel3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    cbCli: TComboBox;
    Label15: TLabel;
    DBGrid1: TDBGrid;
    btCno: TSpeedButton;
    btCok: TSpeedButton;
    ImageList1: TImageList;
    DataSource2: TDataSource;
    lbEsp: TLabel;
    cbCarF: TComboBox;
    btCombina: TSpeedButton;
    vCombina: TJvValidateEdit;
    lbCombina: TLabel;
    vFrete: TJvValidateEdit;
    btFrete: TSpeedButton;
    lbFrete: TLabel;
    lbImp2: TLabel;
    AtualizaValoresFrete1: TMenuItem;
    N1: TMenuItem;
    ImprimeRecibos1: TMenuItem;
    RelREC: TppReport;
    ppDBPipeline1: TppDBPipeline;
    btRec: TSpeedButton;
    Label16: TLabel;
    DataSource3: TDataSource;
    ckTodosRec: TCheckBox;
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
    ppParameterList2: TppParameterList;
    TabFONEdest: TStringField;
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
    ppDBText17: TppDBText;
    ppLabel27: TppLabel;
    ppDBText18: TppDBText;
    ppLabel28: TppLabel;
    ppDBText19: TppDBText;
    ppLabel29: TppLabel;
    ppLabel31: TppLabel;
    ppFooterBand2: TppFooterBand;
    raCodeModule1: TraCodeModule;
    TabPeso: TFloatField;
    Label17: TLabel;
    edCUB2: TEdit;
    ppLabel32: TppLabel;
    ppLine9: TppLine;
    ppLine13: TppLine;
    PanelComb: TPanel;
    Label18: TLabel;
    lbQuant: TLabel;
    lbNotas: TLabel;
    Label19: TLabel;
    vNFcomb: TJvValidateEdit;
    btCancel: TBitBtn;
    btGrava: TBitBtn;
    N2: TMenuItem;
    FreteCombinadoNF1: TMenuItem;
    btFinalizar: TBitBtn;
    memoObs: TMemo;
    btSalvaObs: TSpeedButton;
    LbObs: TLabel;
    Label20: TLabel;
    FreteFixoNF1: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppLabel6: TppLabel;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel33: TppLabel;
    ppImage1: TppImage;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine5: TppLine;
    ppDBText20: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine6: TppLine;
    ppLabel15: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppLine7: TppLine;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel13: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDBText21: TppDBText;
    quantPanel: TPanel;
    JvNavPanelHeader1: TJvNavPanelHeader;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    LbCli: TLabel;
    quantFechar: TSpeedButton;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    pipRomSub1: TppDBPipeline;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppDBCalc4: TppDBCalc;
    procedure btNovoClick(Sender: TObject);
    procedure btProcClick(Sender: TObject);
    procedure btMotClick(Sender: TObject);
    procedure btAjudClick(Sender: TObject);
    procedure edNotaKeyPress(Sender: TObject; var Key: Char);
    procedure vNumKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvarClick(Sender: TObject);
    procedure btRegClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RetirarNota1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure edCUBKeyPress(Sender: TObject; var Key: Char);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btEspecialClick(Sender: TObject);
    procedure btCnoClick(Sender: TObject);
    procedure btCokClick(Sender: TObject);
    procedure cbCliChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCombinaClick(Sender: TObject);
    procedure btFreteClick(Sender: TObject);
    procedure AtualizaValoresFrete1Click(Sender: TObject);
    procedure ImprimeRecibos1Click(Sender: TObject);
    procedure ppDBPipeline1DataChange(Sender: TObject);
    procedure btRecClick(Sender: TObject);
    procedure edCUB2KeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure FreteCombinadoNF1Click(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btGravaClick(Sender: TObject);
    procedure btFinalizarClick(Sender: TObject);
    procedure btSalvaObsClick(Sender: TObject);
    procedure memoObsChange(Sender: TObject);
    procedure FreteFixoNF1Click(Sender: TObject);
    procedure RodapeDblClick(Sender: TObject);
    procedure quantFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idRoma(i:Integer);
    procedure Entrar;
    procedure set_idM(i : Integer);
    procedure set_idA(i : Integer);
    procedure set_idR(i : Integer);
    procedure set_idNota(i : integer);
    procedure set_nreg(i : Integer);
    procedure set_MostraNum(b : boolean);
  end;

var
  Roman: TRoman;
  idRoma, idNota, idM, idA, idR, nreg, numRoma : Integer;
  Bco : TBco;
  MostraN : boolean;
  nObs:Smallint;
implementation

{$R *.dfm}

uses uDM1, uDM2, uRoma, upsqFuncs, uNotasPQ, uNotas, uRegiaoPQ, uReet, uLib,
  uRomaPQ, uDM3, uCteOut, uDM4, uRastreio, Global, uEnviaRest, uEnviarRest2;

{ TRoman }


procedure Limpar;

var usa : TMarco;
begin
  with Roman do
  begin
    lbNum.Caption := '';
    lbAno.Caption := '';
    lbMot.Caption := '';
    lbAjud.Caption:= '';
    lbReg.Caption := '';
    lbMin.Caption := '';

    usa := TMarco.Create;
    usa.Le_INI;

    dtRm.DateTime     := usa.get_dtSis;
    usa.Destroy;
    
    idRoma := 0;
    idNota := 0;
    idM    := 0;
    idA    := 0;
    idR    := 0;

    vFrete.Value := 0;
    vCombina.Value := 0;
    memoObs.Clear;
  end;
end;


procedure Gravar_Obs();
   var Bco : TBco;
       nID : Integer;
begin
  nID := DM1.cdsRomaID.Value;

  Bco := TBco.Create;
  Bco.Roma_Obs_Grava(nID , idUser , DM1.cdsRomaNUM.Value, Roman.memoObs.Text);
  Bco.Destroy;
end;

procedure Preencher_Obs();
   var Bco : TBco;
       s : String;
begin
  nObs := 0;
  Bco := TBco.Create;
  s :=  Bco.Roma_Obs_Mostra(DM1.cdsRomaID.Value);
  Roman.memoObs.Text := s;
  Bco.Destroy;
  if length(s) > 2 then nObs := 1;

end;

procedure Preencher();

var Rm : TRoma;
    n  : Integer;

begin

  Rm := TRoma.Create;
  Bco := TBco.Create;
  with Roman do
  begin
    idM := 0;
    idA := 0;
    idR := 0;

    vCombina.Visible  := False;
    btCombina.Visible := False;
    lbCombina.Visible := False;

    vFrete.Visible    := false;
    btFrete.Visible   := false;
    lbFrete.Visible   := false;

    n := Rm.Converte_BDNum(DM1.cdsRomaNUM.Value);
    lbNum.Caption := IntToStr(n);
    lbAno.Caption := IntToStr(Rm.Pega_Ano(DM1.cdsRomaNUM.Value));
    lbMin.Caption := '[ '+DM1.cdsRomaMinuta.AsString+' ]';

    if (DM1.cdsRomaLIGMOT.Value <> null) then
    begin
      idM := DM1.cdsRomaLIGMOT.Value;
      Bco.Funcs_MostraId(idM);
      lbMot.Caption := DM1.cdsFuncsNOME.Value;

      lbMot.Caption := lbMot.Caption + ' / ' + bco.Func_Tel(DM1.cdsRomaLIGMOT.Value);



    end
    else
      lbMot.Caption := '-';

    if (DM1.cdsRomaLIGAJUD.Value <> null) then
    begin
      idA := DM1.cdsRomaLIGAjud.Value;
      Bco.Funcs_MostraId(idA);
      lbAjud.Caption := DM1.cdsFuncsNOME.Value;
    end
    else
      lbAjud.Caption:= '-';

    if (DM1.cdsRomaLIGREG.Value <> null) then
    begin
      idR := DM1.cdsRomaLIGREG.Value;
      Bco.Regiao_MostraId(idR);
      lbReg.Caption := DM1.cdsRegDESCR.Value;
      nreg := DM1.cdsRegCLASS.Value;
    end
    else
      lbReg.Caption := '-';
      dtRm.DateTime := DM1.cdsRomaDTROMA.Value;
    if (DM1.cdsRomaTIPO_CARRO.Value <> null) then
      cbSaida.ItemIndex := DM1.cdsRomaTIPO_CARRO.Value;

    // Carro Flaydel
    if ((DM1.cdsRomaligCARF.Value <> null) and (DM1.cdsRomaligCARF.Value > 0)) then
      DM2.DBCp_Pos(cbCarF, 'TB_CARRO', DM1.cdsRomaLIGCARF.AsString, 'Placa')
    else
      cbCarF.ItemIndex := 0;



    // Carro Especial
    if (DM1.cdsRomaEXTRANUM.Value = 0) then lbEsp.Caption := '';
    if (DM1.cdsRomaEXTRANUM.Value = 1) then lbEsp.Caption := 'EXTRA';
    if (DM1.cdsRomaEXTRANUM.Value > 1) then lbEsp.Caption := '@';

    if (DM1.cdsRomaVCOMBINA.Value> 0) then
    begin
      vCombina.Value := DM1.cdsRomaVCOMBINA.AsFloat;
      lbCombina.Visible:= True;
    end;

    if (DM1.cdsRomaVFRETECOMB.Value> 0) then
    begin
      vFrete.Value := DM1.cdsRomaVFRETECOMB.AsFloat;
      lbFrete.Visible:= True;
    end;


    Preencher_Obs;

  end;
  Rm.Destroy;
  Bco.Destroy;
end;


procedure Atualiza_Grid(nr : Integer; dtR : TDateTime);

var Rm : TRoma;
    x  : Integer;

begin
      x := nr;
      if (x < 2011000000) then
      begin
        Rm  := TRoma.Create;
        x   := Rm.Converte_NumBD(nr, dtR);
        Rm.Destroy;
      end;

      Bco := TBco.Create;
      Bco.Romaneio_MostraNum(x);
      Bco.Romaneio_MostraNotas(x);
      Bco.Romaneio_Soma(x);
      Bco.Destroy;
      Roman.Rodape.Panels[0].Text := 'Quantidade: '+IntToStr(DM1.cdsRomaNF.RecordCount)+' notas';
      Roman.Rodape.Panels[1].Text := 'Peso Total: '+DM2.cdsTMP.Fields[0].AsString; // peso

end;

procedure R_Procura();

begin
  Limpar;
  Atualiza_Grid(numRoma, Now);
  if (DM1.cdsRomaNUM.Value > 0) then
  begin
    idRoma := DM1.cdsRomaNUM.Value;
    Preencher;
    Roman.Rodape.Panels[2].Text := 'Romaneio ok';
    Atualiza_Grid(numRoma, DM1.cdsRomaDTROMA.Value);
    if (Roman.Showing) then Roman.edNota.setFocus;
  end
  else
    Roman.Rodape.Panels[2].Text := 'Romaneio NÃO ENCONTRADO';

end;

procedure Pesq_Roma(R : String);

var Rm : Troma;

begin
  Rm := Troma.Create;
  numRoma := Rm.Pesquisa_Romaneio(R);
  Rm.Destroy;

  R_Procura;
  Roman.edNum.Text := '';
  Roman.edNota.SetFocus;
end;

procedure R_Novo();
begin
  Limpar;
  Bco := TBco.Create;
  Bco.Romaneio_Insere;
  Bco.Romaneio_RecuperaID();
  Bco.Destroy;
  idRoma := DM1.cdsRomaNUM.Value;
  numRoma := idRoma;
  Preencher;

  Roman.Rodape.Panels[2].Text := 'NOVO Romaneio inserido';
  Atualiza_Grid(numRoma, Now);
  Roman.edNota.SetFocus;
end;





procedure TRoman.set_idRoma(i: Integer);
begin
  idRoma := i;
  numRoma := i;
end;

procedure TRoman.btNovoClick(Sender: TObject);
begin
  R_Novo;
end;

procedure TRoman.btProcClick(Sender: TObject);
begin
  lbQtN.Caption := '';
  R_Procura;
end;

procedure TRoman.Entrar;

var Bco : TBco;
    usa : TMarco;

begin
  PanelComb.Visible := false;
  lbImp2.Visible := False;
  // idRoma é o Numero
  if (idRoma = 0) then
  begin
    Bco := TBco.Create;
    Bco.Romaneio_MostraUlt;
    Bco.Destroy;
    idRoma := DM1.cdsRomaNUM.Value;
    numRoma := DM1.cdsRomaNUM.Value;
  end;
  usa := TMarco.Create;
  if (cbSaida.Items.Count = 0) then
    usa.Combo_Preenche(cbSaida, 'mlsaida.mzi');
  usa.Destroy;
  cbSaida.ItemIndex := 0;
  cbCarF.Items.Clear;
  cbCarF.Items.Append('<particular>');
  DM2.DBCb_Preenche(cbCarF, 'TB_CARRO', 'Placa', '');

  Preencher;
  Atualiza_Grid(DM1.cdsRomaNUM.Value , DM1.cdsRomaDTROMA.Value);

end;

procedure TRoman.btMotClick(Sender: TObject);
begin
  psqFuncs.set_tipo(1); // Motoristas
  psqFuncs.set_saida(2);
  psqFuncs.Show;
end;

procedure TRoman.set_idA(i: Integer);
begin
  idA := i;
end;

procedure TRoman.set_idM(i: Integer);
begin
  idM := i;
end;

procedure TRoman.set_idR(i: Integer);
begin
  idR := i;
end;



procedure TRoman.btAjudClick(Sender: TObject);
begin
  psqFuncs.set_tipo(2); // Ajudantes
  psqFuncs.set_saida(3);
  psqFuncs.Show;
end;

procedure InserirNF();

var Rm : TRoma;
    nr : integer;
    Rast : TRastreio;

begin
   // EVENTO NF - Rastreio
  Rast := TRastreio.Create;
  Rast.Insere_Romaneio(DM1.cdsNotasNUMNF.Value,DM1.cdsNotasLIGCLI.Value,DM1.cdsRomaNUM.Value);
  Rast.Destroy;


  if (DM1.cdsNotasNROMA.Value = 0) then
  begin
    Bco := TBco.Create;
    Bco.Romaneio_InsereNota(DM1.cdsNotasID.Value, DM1.cdsRomaNUM.Value);
    // Prioridade para Reentregas
    if DM1.cdsNotasORIGEM.Value = 4 then  Bco.Notas_Prioridade(DM1.cdsNotasID.Value, 1);
    Bco.Romaneio_MostraNotas(DM1.cdsRomaNUM.Value);

    Roman.Rodape.Panels[2].Text := 'Nota '+Roman.edNota.Text+' inserida';
    Bco.Destroy;
  end
  else
  begin
    {
    // Criar Reentrega a partir de nota já entregue

    Reet.set_idNota(DM1.cdsNotasID.Value);
    if (Reet.ShowModal = mrOk) then
    begin
      Bco := TBco.Create;
      Bco.Romaneio_InsereNota(DM1.cdsNotasID.Value, DM1.cdsRomaNUM.Value);
      Bco.Romaneio_MostraNotas(DM1.cdsRomaNUM.Value);

      Roman.Rodape.Panels[2].Text := 'Nota '+Roman.edNota.Text+' inserida';
      Bco.Destroy;
    end;
    }
    ShowMessage('Nota já entregue. '+#13+'Não é possível inserí-la !');
  end;
  Bco := TBco.Create;

  if (nreg > 0) then Bco.Romaneio_NotasRegiao(idRoma, nreg-1);
  Bco.Romaneio_NotasCarro(idRoma, DM1.cdsRomaTIPO_CARRO.Value);
  Bco.Destroy;

end;

function SoNumeros(no : String): Integer;

var i, p : Integer;
    s : String;
begin
  s := '';
  p := pos('-', no)-1;
  if (p > 0) then s := copy(no, 1, p) else s := no;
  i := StrToInt(s);
  SoNumeros := i;

end;

procedure Analise_TipoNF(Ocorrencia: integer);

var t : smallint;
    Rast : TRastreio;

begin
  Bco := TBco.Create;
  Bco.Ocorre_PesqNum(Ocorrencia);
  Bco.Destroy;
  {
    Uso = 1 : Entrga Realizada
    Uso = 2 : reentrega
    Uso = 3 : devolução
  }
  t := DM1.cdsOcUSO.Value; // classificaçao do USO
{
  if (Ocorrencia in [3,4,8,9,16,45,77]) then
  t := 2; // devolução
  if (Ocorrencia in [1,36,39]) then
    t := 3; // pedido finalizado Obs.: 39 = coleta realizada
{ TODO -oMarco -cCuidado : Rever procedimento de IA do Romaneio. }
  with Roman do
  begin
    // reentrega
    if (t = 2) then
    begin
      Bco := TBco.Create;
      Bco.Notas_Reentrega(DM1.cdsNotasID.Value);
      Bco.Notas_MarcarProxRoma(DM1.cdsNotasID.Value , DM1.cdsRomaNUM.Value);

      Bco.Notas_MostraNum(DM1.cdsNotasNUMNF.Value);
      Bco.Destroy;

      DM1.cdsNotas.First;
      while ((DM1.cdsNotasNROMA.Value <> 0) and (not DM1.cdsNotas.Eof)) do DM1.cdsNotas.Next;

      InserirNF;

      Rodape.Panels[2].Text := 'Nota '+DM1.cdsNotasNUMNF.AsString+' = Reentrega';
      ListaErros.Items.Append(DM1.cdsNotasNUMNF.AsString + ' reent');
    end
    else
    if (t= 3) then // devolução
    begin
      Rodape.Panels[2].Text := 'Nota '+DM1.cdsNotasNUMNF.AsString+' = Devolução';
      ListaErros.Items.Append(DM1.cdsNotasNUMNF.asString+ ' devol');
      InserirNF;

      //ShowMessage('Nota devolvida');
    end
    else
    if (t= 1) then // entrega realizada
    begin
      Rodape.Panels[2].Text := 'Nota '+DM1.cdsNotasNUMNF.AsString+' = Finalizada';
      ListaErros.Items.Append(DM1.cdsNotasNUMNF.asString+ ' final');
      InserirNF;
      //ShowMessage('Nota finalizada');
    end
    else
    ShowMessage('SEM base para analisar');
  end;
end;


procedure TRoman.edNotaKeyPress(Sender: TObject; var Key: Char);

var n, qNotas, repete, outro : Integer;
    ok : Integer;
    Rm : TRoma;
    opcaoNF : Smallint;
    Rast : TRastreio;

begin

  if(key = #13) then
  begin
    // Existe Romaneio selecionado???
    if (idRoma > 0) then
    begin
      // Retira o hifen se existir
      n := SoNumeros(edNota.Text);
      Rodape.Panels[1].Text := IntToStr(n);
      Bco := TBco.Create;
      Bco.Notas_MostraNum(n);
      Bco.Destroy;

      qNotas := DM1.cdsNotas.RecordCount;

      // =====================================
      // Não existem Notas
      if (qNotas = 0) then // 1. Não existem NOTAS com o número N
      begin
        ListaErros.Items.Append(IntToStr(n)+ ' ne');
        Rodape.Panels[2].Text := 'Nota '+IntToStr(n)+' não existe no Banco de Dados';
        NotasP.Entrar;
        NotasP.set_origem(1);
        NotasP.set_idNota(0);
        NotasP.Edit1.Text := IntToStr(n);

        if (NotasP.ShowModal = mrOK) then
        begin
          Bco := TBco.Create;
          Bco.Notas_MostraNum(n);
          Bco.Destroy;

          InserirNF;
          Atualiza_Grid(numRoma, Now);
          Rodape.Panels[2].Text := 'Nota '+IntToStr(n)+' INSERIDA';
        end;
      end
      else
      begin  // A nota Existe ...
        // ===== OPCOES ============
        outro  := DM2.Conta('TB_NOTAF', 'NUMNF = '+IntToStr(n)+ ' and NROMA = 0');
        // Existe apenas UMA e NAO possui ROMANEIO
        if (qNotas = 1) and (outro = 1) then opcaoNF := 1;
        // Existe apenas UMA e possui ROMANEIO
        if (qNotas = 1) and (outro = 0) then opcaoNF := 2;
        // Existem varias e apenas uma SEM ROMANEIO
        if (qNotas > 1) and (outro = 1) then opcaoNF := 3;
        // Existem varias e com mais de uma SEM ROMANEIO
        if (qNotas > 1) and (outro > 1) then opcaoNF := 4;
        // Existem varias e todas com ROMANEIO
        if (qNotas > 1) and (outro = 0) then opcaoNF := 5;

        // Existe apenas UMA Nota sem Romaneio
        if (opcaoNF = 1) then
        begin
          InserirNF;
          Atualiza_Grid(numRoma, Now);
          Rodape.Panels[2].Text := 'Nota '+IntToStr(n)+' INSERIDA';
        end;

        // Existe apenas UMA e possui ROMANEIO
        if (opcaoNF = 2) then
        begin
          repete := DM2.Conta('TB_NOTAF', 'NUMNF = '+IntToStr(n)+ ' and NROMA <> '+DM1.cdsRomaNUM.AsString);
          if (repete = 0) then // já existe neste romaneio
          begin
            ListaErros.Items.Append(IntToStr(n)+ ' rep');
            Rodape.Panels[2].Text := 'Nota '+IntToStr(n)+' já existe neste Romaneio';
          end
          else
          begin // Apenas UMA em outro Romaneio // Possivel Reentrega
            Rm := TRoma.Create;
            n := Rm.Converte_BDNum(DM1.cdsRomaNUM.Value);
            Rm.Destroy;
            if (DM1.cdsNotasNOCORR.Value = 0) then //ShowMessage('Está em outro Romaneio: '+IntToStr(n))
            begin
              InserirNF;
            end
            else
              Analise_TipoNF(DM1.cdsNotasNOCORR.Value);
          end;
        end;

        // Existem varias e apenas uma SEM ROMANEIO
        if (opcaoNF = 3) then
        begin
          ok := 0;
          DM1.cdsNotas.First;
          while not DM1.cdsNotas.Eof and (ok = 0) do
          begin
            if (DM1.cdsNotasNROMA.Value = 0) then ok := DM1.cdsNotasID.Value;
            DM1.cdsNotas.Next;
          end;

          if ok>0 then
          begin
            Bco := TBco.Create;
            Bco.Notas_MostraId(ok);
            Bco.Destroy;

            InserirNF;
          end;
        end;


        // Existem varias e com mais de uma SEM ROMANEIO
        if (opcaoNF = 4) then
        begin
          // várias com mais de uma sem romaneio
          NotasPQ.Label2.Caption := Dm1.cdsNotasNUMNF.AsString;
          NotasPQ.set_saida(2);
          if (NotasPQ.ShowModal = mrOk) then
          begin
            Bco := TBco.Create;
            Bco.Notas_MostraId(idNota);
            Bco.Destroy;
            InserirNF;
            Atualiza_Grid(numRoma, Now);
          end;
        end;

        // Existem varias e todas com ROMANEIO
        if (opcaoNF = 5) then
        begin
          repete := DM2.Conta('TB_NOTAF', 'NUMNF = '+IntToStr(n)+ ' and NROMA <> '+DM1.cdsRomaNUM.AsString);
          if (repete = 0) then // já existe neste romaneio
          begin
            ListaErros.Items.Append(IntToStr(n)+ ' rep');
            Rodape.Panels[2].Text := 'Nota '+IntToStr(n)+' já existe neste Romaneio';
          end
          else
          begin // Várias em outros Romaneios // Possivel Reentrega
            // Pega última
            DM1.cdsNotas.Last;
            Rm := TRoma.Create;
            n := Rm.Converte_BDNum(DM1.cdsRomaNUM.Value);
            Rm.Destroy;
            Analise_TipoNF(DM1.cdsNotasNOCORR.Value);
          end;

        end;

      end;  // Nota Existe

      // Atualiza a Lista

      edNota.Text := '';
    end
    else ShowMessage('Selecione ou Crie um Romaneio');
  end;
  if not(Key in ['0'..'9',Chr(8), '-']) then Key := #0;

end;

procedure TRoman.vNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then R_Procura;
end;

procedure TRoman.btSalvaObsClick(Sender: TObject);
begin
  if Length(memoObs.Text) > 2 then
  begin
    Gravar_Obs;
    LbObs.Caption := 'SALVO';
  end
  else LbObs.Caption := 'Escreva';
end;

procedure TRoman.btSalvarClick(Sender: TObject);

var nCarro, nCarF : Integer;

begin
  nCarro := cbSaida.ItemIndex;
  nCarF := 0;
  if (cbCarF.ItemIndex>0) then nCarF := DM2.DBCp_leid(cbCarF.Items[cbCarF.itemIndex],'TB_CARRO','Placa');

  Bco := TBco.Create;
  if (idM = null) then idM := 0;
  if (idA = null) then idA := 0;
  if (idR = null) then idR := 0;

  if (idRoma > 0) then
  begin
    Bco.Romaneio_Altera(idRoma, idM, idA, idR, 0,dtRm.DateTime, nCarro, nCarF);
    Bco.Romaneio_NotasCarro(idRoma, nCarro);
  end;
  if (nreg > 0) then Bco.Romaneio_NotasRegiao(idRoma, nreg-1);
  //ShowMessage('idR '+ IntToStr(idRoma)+'- '+IntToStr(idM)+'- '+IntToStr(idA)+'- '+IntToStr(idr)+'- '+IntToStr(idM));
  Bco.Destroy;
  R_Procura;
end;

procedure TRoman.btRegClick(Sender: TObject);
begin
  RegiaoPQ.Show;

end;

Procedure Imprime();

var doc  : String;
    dirR : String;
    arq  : String;

begin
   GetDir(0, dirR);
   with Roman do
   begin
     doc := 'Romaneio '+Dm1.cdsRomaNUM.AsString;
     { carrega o arquivo }
     // anterior
     //arq := '\Rels\Roman4.rtm';
     //if (lbImp2.Visible) then arq := '\Rels\Roman4t.rtm';
     arq := '\Rels\Roman5.rtm';
     if (quantPanel.Visible = true) then
          arq := '\Rels\Roman5a.rtm';

     RelRom.Template.FileName := dirR+arq;
     RelRom.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelRom.DeviceType := 'Screen';
     RelRom.ShowAutoSearchDialog  := False;
     RelRom.ShowCancelDialog := False;
     RelRom.ShowPrintDialog := False;
     RelRom.PrinterSetup.DocumentName := doc;

     ppLabel6.Caption := lbNum.Caption;
     ppLabel17.Caption:= FormatDateTime('dd/MM/yyyy', DM1.cdsRomaDTROMA.Value);

     ppLabel19.Caption:= lbMot.Caption;
     ppLabel20.Caption:= lbAjud.Caption;
     ppLabel22.Caption:= FormatFloat('#,##0',DM1.cdsRomaMINUTA.Value);
     ppLabel33.Caption:= cbCarF.Items[cbCarF.ItemIndex];

     if (quantPanel.Visible = true) then
        ppSubReport1.Visible := True;



     { imprime a ordem de serviço }
     RelRom.PrintReport;

     {Fecha os arquivos}
   end;
end;

procedure TRoman.btImpClick(Sender: TObject);
begin
  Imprime;
end;

procedure TRoman.DBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.Show;
end;

procedure TRoman.RetirarNota1Click(Sender: TObject);

var Rast : TRastreio;
    i : Integer;
    sLista : String;
begin
   slista := '';
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));


        if (DM1.cdsRomaNFNOCORR.Value = 0) then
        begin
          Bco := TBco.Create;
          Bco.Romaneio_InsereNota(DM1.cdsRomaNFID.Value, 0);
          Bco.Destroy;
          // EVENTO NF - Rastreio
          Rast := TRastreio.Create;
          Rast.Retira_Romaneio(DM1.cdsRomaNFNUMNF.Value ,DM1.cdsRomaNFidCli.value, DM1.cdsRomaNUM.Value);
          Rast.Destroy;


        end
        else sLista := sLista + ' ' +            DM1.cdsRomaNFNUMNF.AsString;
      end;
      if (length(sLista) > 2) then ShowMessage('Nota com Baixa. NÃO pode ser retirada do Romaneio'+#13 + sLista);
      Atualiza_Grid(numRoma, Now);
      edNota.SetFocus;

end;

procedure TRoman.RodapeDblClick(Sender: TObject);
  var Bco : TBco;
begin
  lbCli.Caption := 'Cliente selecionado: '+ DM1.cdsRomaNFIDCLI.AsString;
  Bco := TBco.Create;
  Bco.Romaneio_Doc(DM1.cdsRomaNFNROMA.Value, DM1.cdsRomaNFIDCLI.Value);
  Bco.Destroy;

  quantPanel.Visible := true;

end;

procedure TRoman.set_idNota(i: integer);
begin
  idNota := i;
end;

procedure TRoman.set_nreg(i: Integer);
begin
  nreg := i;
end;

procedure TRoman.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM1.cdsRomaNFID.Value);
  NotasP.AbreNf;
  NotasP.Show;
  if (NotasP.Panel2.Enabled) then NotasP.edHora.SetFocus;

end;

procedure TRoman.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var tipoENT : Smallint;

begin
  if Column.Field=DM1.cdsRomaNFSTATUS_ENT then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);
    // Desenha o Quadrado
    ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+5,Rect.Top+1,0);

    // Desenha o check sobre o quadrado quando ativo = ‘S’
    if DM1.cdsRomaNFSTATUS_ENT.Value  > 0 then //' then // Cadastro está ativo
    begin
      Bco := TBco.Create;
      Bco.Ocorre_PesqNum(DM1.cdsRomaNFNOCORR.Value);
      Bco.Destroy;
      {
        0 = Branco
        1 = sem Baixa
        2 = baixa (entregue)
        3 = reentrega
        4 = Devolução
      }
      tipoENT := DM1.cdsOcUSO.Value + 1;
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+5,Rect.Top+1,tipoENT);
    end
    else
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+5,Rect.Top+1,1);
  end
  else
  begin
    if (DM1.cdsRomaNFPrioridade.Value > 0 ) or (DM1.cdsRomaNFCONTAREENT.Value > 0 ) then
    begin
      JvDBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.FillRect(rect);
      JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
    end;
  end;
end;

procedure TRoman.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM1.cdsRomaNF.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TRoman.memoObsChange(Sender: TObject);
begin
  lbObs.Caption := Length( memoObs.Text ).ToString;
end;

procedure TRoman.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  vCombina.Visible  := False;
  btCombina.Visible := False;

  vFrete.Visible    := False;
  btFrete.Visible   := False;

  if (MostraN) and (idRoma > 0) then
  begin
    lbQtN.Caption := '';
    R_Procura;
    Atualiza_Grid(DM1.cdsRomaNUM.Value , DM1.cdsRomaDTROMA.Value);
    MostraN := False;
  end;
end;

procedure TRoman.set_MostraNum(b: boolean);
begin
  MostraN := b;
end;

procedure TRoman.edCUB2KeyPress(Sender: TObject; var Key: Char);
var x , vol, peso, a : double;
    Bco : TBco ;

begin
  if (key = #13) then
  begin
    if (edCUB2.Text <> '') then
    begin
      a := StrToFloat(edCUB2.Text)/300;
      vol := a*300 ;  // calcula NOVO PESO
      peso := DM1.cdsRomaNFPESO.AsFloat;

      x := vol;
      if (peso > vol) then x := peso;

      Bco := TBco.Create;
      Bco.Notas_MarcarCubagem(DM1.cdsRomaNFID.Value , a, x);
      Bco.Destroy;

      Atualiza_Grid(DM1.cdsRomaNUM.Value , DM1.cdsRomaDTROMA.Value);

    end;
    edCUB2.Text := '';
  end;
  if not(Key in ['0'..'9',Chr(8), ',', '-']) then Key := #0;

end;

procedure TRoman.edCUBKeyPress(Sender: TObject; var Key: Char);

var x , vol, peso, a : double;
    Bco : TBco ;

begin
  if (key = #13) then
  begin
    if (edCUB.Text <> '') then
    begin
      a := StrToFloat(edCUB.Text);
      vol := a * 300;  // calcula NOVO PESO
      peso := DM1.cdsRomaNFPESO.AsFloat;

      x := vol;
      if (peso > vol) then x := peso;
      
      Bco := TBco.Create;
      Bco.Notas_MarcarCubagem(DM1.cdsRomaNFID.Value , StrToFloat(edCUB.Text), x);
      Bco.Destroy;

      Atualiza_Grid(DM1.cdsRomaNUM.Value , DM1.cdsRomaDTROMA.Value);

    end;
    edCUB.Text := '';
  end;
  if not(Key in ['0'..'9',Chr(8), ',', '-']) then Key := #0;

end;

procedure TRoman.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if (edNum.Text <> '') then Pesq_Roma(edNum.Text);
  if not(Key in ['0'..'9',Chr(8),'/']) then Key := #0;
end;

procedure TRoman.SpeedButton2Click(Sender: TObject);
begin
  if (lbNum.Caption  <> '') then Pesq_Roma(lbNum.Caption);
end;

procedure TRoman.quantFecharClick(Sender: TObject);
begin
  quantPanel.Visible := false;
end;

{
 =======================================
 Painel - Carro Especial
 =======================================

}
procedure Atualiza;

var Bco : TBco;
    idClie : Integer;

begin
  idClie := DM2.DBCp_leid(Roman.cbCli.Items[Roman.cbCli.ItemIndex],'TB_CLIENTE', 'Nome');

  Bco := TBco.Create;
  Bco.CliCob_Mostrar(idClie);
  Bco.Destroy;
end;

procedure TRoman.btEspecialClick(Sender: TObject);
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  end;

  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idC),'Nome');
  Atualiza;
  Panel3.Visible := true;
end;

procedure TRoman.btCancelClick(Sender: TObject);
begin
  PanelComb.Visible := false;
end;

procedure TRoman.btCnoClick(Sender: TObject);
begin
  Panel3.Visible := false;
end;

procedure TRoman.btCokClick(Sender: TObject);

var Bco : TBco;
    idClie : Integer;

begin
  if (idRoma > 0) then
  begin
    idClie := DM2.DBCp_leid(Roman.cbCli.Items[Roman.cbCli.ItemIndex],'TB_CLIENTE', 'Nome');

    Bco := TBco.Create;
    Bco.CliCob_AlterarRomaneio(idClie, idRoma, DM3.cdsCliCobID.Value);
    Bco.Destroy;
  end;
  Panel3.Visible := false;
end;

procedure TRoman.cbCliChange(Sender: TObject);
begin
  Atualiza;
end;
// Fim - Carro Especial ====================================

procedure TRoman.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  if (DM3.cdsCliCobID.Value = DM1.cdsRomaEXTRANUM.Value) then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.DefaultDrawColumnCell(Rect,DatacOl, Column, State);
  end;
end;

procedure TRoman.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (key = VK_F2) then
  begin
    vCombina.Visible  := True;
    btCombina.Visible := True;
    lbCombina.Visible := False;
  end;

  if (Shift = [ssCtrl]) and (key = VK_F9) then
  begin
    vFrete.Visible  := True;
    btFrete.Visible := True;
    lbFrete.Visible := False;
  end;

  if (Shift = [ssAlt]) and (key = VK_F7) then
    lbImp2.Visible := True;

end;

procedure TRoman.FreteCombinadoNF1Click(Sender: TObject);
   var i, erro, ncli : Integer;
begin
  if JvDBGrid1.SelectedRows.Count>0 then
  begin
    lbNotas.Caption := '';
    Label19.Caption := 'Frete Combinado';
    vCombina.Value := 0;
    nCli := DM1.cdsRomaNFIDCLI.Value;
    erro := 0;
    lbQuant.Caption := JvDBGrid1.SelectedRows.Count.ToString;
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid1.SelectedRows.Items[i]);
        if ncli <> DM1.cdsRomaNFIDCLI.Value then erro := 1;
        DM2.Altera_Status('TB_NOTAF','TIPO_COB', DM1.cdsRomaNFID.Value, 7);
        lbNotas.Caption := lbNotas.Caption + DM1.cdsRomaNFNUMNF.AsString +  ' ' ;
        //if DM1.cdsRomaNFVALOR.Value>0  then vCombina.Value := DM1.cdsRomaNFVALOR.Value;
      end;

    if erro = 0 then PanelComb.Visible := true
      else ShowMessage('Notas de Clientes diferentes!');
  end
  else
    ShowMessage('SEM notas selecionadas');
end;

procedure TRoman.FreteFixoNF1Click(Sender: TObject);
   var i, erro, ncli : Integer;
begin
  if JvDBGrid1.SelectedRows.Count>0 then
  begin
    lbNotas.Caption := '';
    Label19.Caption := 'Frete Fixo';
    vCombina.Value := 0;
    nCli := DM1.cdsRomaNFIDCLI.Value;
    erro := 0;
    lbQuant.Caption := JvDBGrid1.SelectedRows.Count.ToString;
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid1.SelectedRows.Items[i]);
        if ncli <> DM1.cdsRomaNFIDCLI.Value then erro := 1;
        DM2.Altera_Status('TB_NOTAF','TIPO_COB', DM1.cdsRomaNFID.Value, 8);
        lbNotas.Caption := lbNotas.Caption + DM1.cdsRomaNFNUMNF.AsString +  ' ' ;
        //if DM1.cdsRomaNFVALOR.Value>0  then vCombina.Value := DM1.cdsRomaNFVALOR.Value;
      end;

    if erro = 0 then PanelComb.Visible := true
      else ShowMessage('Notas de Clientes diferentes!');
  end
  else
    ShowMessage('SEM notas selecionadas');


end;

procedure TRoman.btCombinaClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Romaneio_SalvaCombinado(DM1.cdsRomaNUM.Value,vCombina.Value);
  Bco.Destroy;
end;


procedure TRoman.btFreteClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Romaneio_SalvaFreteCombinado(DM1.cdsRomaNUM.Value,vFrete.Value);
  Bco.Destroy;
end;

procedure TRoman.btGravaClick(Sender: TObject);

var Bco : TBco;

begin

    if JvDBGrid1.SelectedRows.Count = 1 then
    begin

      Bco := TBco.Create;
      Bco.Notas_AlterarNFcomb(DM1.cdsRomaNFID.Value, vNFcomb.value);
      Bco.Destroy;
    end;

    if JvDBGrid1.SelectedRows.Count > 1 then
    begin

    end;

    PanelComb.Visible := false;

    if JvDBGrid1.SelectedRows.Count = 0 then
      ShowMessage('Selecione alguma nota para Inserir Valor')

end;

procedure TRoman.AtualizaValoresFrete1Click(Sender: TObject);
begin
  CteOut.set_idNF(DM1.cdsRomaNFID.Value);
  CteOut.lbCli.Caption := DM1.cdsRomaNFNOME.Value;
  CteOut.Show;
end;

{
Procedure Monta_recibos;

var Bco : TBco;

begin

  Bco := TBco.Create;
  if (Roman.ckTodosRec.Checked) then
    Bco.Romaneio_MostraNotasRec(DM1.cdsRomaNUM.Value)
  else
    Bco.Romaneio_MostraNotasRecFiltro(DM1.cdsRomaNUM.Value);
  Bco.Destroy;

  with Roman do
  begin
    Tab.Active := False;
    Tab.EmptyTable;
    Tab.Active := True;

   // ShowMessage(IntToStr(DM1.cdsRecb.RecordCount));
    DM1.cdsRecb.First;
    while not DM1.cdsRecb.Eof do
    begin
      Bco := TBco.Create;
      Bco.Espelho_Mostra(DM1.cdsRecbLigCli.Value, DM1.cdsRecbNUMNF.Value );
      Bco.Destroy;

      Tab.Insert;
      TabNUMNF.Value    := DM1.cdsRecbNUMNF.Value;
      TabNRoma.Value    := DM1.cdsRecbNROMA.Value;
      TabNOMECli.Value  := DM1.cdsRecbNOME.Value;
      TabNOMEDest.Value := DM1.cdsRecbNOMEDEST.Value;
      TabFONEDest.Value := DM1.cdsRecbFONEDEST.Value;
      if (DM1.cdsRecbPESO.Value <> null) then
          TabPeso.Value   := DM1.cdsRecbPESO.Value;

      if (DM4.cdsEspelho.RecordCount > 0) then
      begin
        if (DM4.cdsEspelhoVOLUME.Value <> null) then
          TabVOLUME.Value  := DM4.cdsEspelhoVOLUME.Value;
        TabEndereco.Value := DM4.cdsEspelhoENDERECO.Value;
        if (DM4.cdsEspelhoNumero.Value <> null) then
          TabNumero.Value  := DM4.cdsEspelhoNUMERO.Value;
        TabComplem.Value  := DM4.cdsEspelhoCOMPLEMENTO.Value;
        TabBairro.Value   := DM4.cdsEspelhoBAIRRO.Value;
        TabCidade.Value   := DM4.cdsEspelhoCIDADE.Value;
        TabCEP.Value      := DM4.cdsEspelhoCEP.Value;
      end;
      Tab.Post;

      DM1.cdsRecb.Next;
    end;
  end;

end;
}

function  Procura_Recibo(nNF:Integer):boolean;

var resp : boolean;

begin
  resp := false;
  with Roman do
  begin
    DM1.cdsRecb.First;
    while (not DM1.cdsRecb.Eof) and not resp do if (DM1.cdsRecbNUMNF.Value = nNF) then resp := true else DM1.cdsRecb.Next;
  end;

  Procura_Recibo:= resp;
end;


Procedure Monta_recibos2;

var Bco : TBco;
    i : integer;

begin

  Bco := TBco.Create;
  Bco.Romaneio_MostraNotasRec(DM1.cdsRomaNUM.Value);
  Bco.Destroy;

  if (Roman.ckTodosRec.Checked) then Roman.JvDBGrid1.SelectAll;


  with Roman do
  begin
    Tab.Active := False;
    Tab.EmptyTable;
    Tab.Active := True;

   if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

        if (Procura_Recibo(DM1.cdsRomaNFNUMNF.Value)) then
        begin

          Bco := TBco.Create;
          Bco.Espelho_Mostra(DM1.cdsRecbLigCli.Value, DM1.cdsRecbNUMNF.Value );
          Bco.Destroy;

          Tab.Insert;
          TabNUMNF.Value    := DM1.cdsRecbNUMNF.Value;
          TabNRoma.Value    := DM1.cdsRecbNROMA.Value;
          TabNOMECli.Value  := DM1.cdsRecbNOME.Value;
          TabNOMEDest.Value := DM1.cdsRecbNOMEDEST.Value;
          TabFONEDest.Value := DM1.cdsRecbFONEDEST.Value;
          if (DM1.cdsRecbPESO.AsFloat <> null) then
              TabPeso.Value   := DM1.cdsRecbPESO.AsFloat;

          if (DM4.cdsEspelho.RecordCount > 0) then
          begin
            if (DM4.cdsEspelhoVOLUME.Value <> null) then
              TabVOLUME.Value  := DM4.cdsEspelhoVOLUME.Value;
            TabEndereco.Value := DM4.cdsEspelhoENDERECO.Value;
            if (DM4.cdsEspelhoNumero.Value <> null) then
              TabNumero.Value  := DM4.cdsEspelhoNUMERO.Value;
            TabComplem.Value  := DM4.cdsEspelhoCOMPLEMENTO.Value;
            TabBairro.Value   := DM4.cdsEspelhoBAIRRO.Value;
            TabCidade.Value   := DM4.cdsEspelhoCIDADE.Value;
            TabCEP.Value      := DM4.cdsEspelhoCEP.Value;
          end;
          Tab.Post;
        end;

      end;
  end;

end;


Procedure Imprime_Recibos(para:smallint);

var doc  : String;
    dirR : String;
    arq  : String;


begin
   GetDir(0, dirR);
   with Roman do
   begin
   {
     Bco := TBco.Create;
     if (ckTodosRec.Checked) then
       Bco.Romaneio_MostraNotasRec(DM1.cdsRomaNUM.Value)
     else
       Bco.Romaneio_MostraNotasRecFiltro(DM1.cdsRomaNUM.Value);
     Bco.Destroy;
     }
     Monta_recibos2;

     doc := 'Recibos de '+Dm1.cdsRomaNUM.AsString;
     { carrega o arquivo }
     arq := '\Rels\RelFDrec2.rtm';
     relREC.Template.FileName := dirR+arq;
     relREC.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     if (para=0) then relREC.DeviceType := 'Screen';
     if (para=1) then relREC.DeviceType := 'Printer';
     relREC.ShowAutoSearchDialog  := False;
     relREC.ShowCancelDialog := False;
     relREC.ShowPrintDialog := False;
     relREC.PrinterSetup.DocumentName := doc;


     { imprime a ordem de serviço }
     relREC.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TRoman.ImprimeRecibos1Click(Sender: TObject);
begin
  Imprime_Recibos(0);

{
  if (DM1.cdsRomaNF.RecordCount > 0) then
  begin
    DM1.cdsRomaNF.First;
    while not DM1.cdsRomaNF.Eof do
    begin

      DM1.cdsRomaNF.Next;
    end;
  end
  else ShowMessage('Romaneio Vazio!');
  }
end;

procedure EnviarR1();
begin
  with Roman do
  if (DM1.cdsRoma.RecordCount> 0) then
  begin
    if MessageDlg('Deseja imprimir TODOS os recibos?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          JvDBGrid1.SelectAll;
          Imprime_Recibos(1);
        end;


    EnviaRest.Entrar('[KH] Envia Romaneio '+lbNum.Caption, 1);
    EnviaRest.set_numRoma(DM1.cdsRomaNUM.Value);
    EnviaRest.set_reenviar(false);
    EnviaRest.ShowModal;

    EnviaRest.Entrar('[LW] Envia Romaneio '+lbNum.Caption, 9);
    EnviaRest.set_numRoma(DM1.cdsRomaNUM.Value);
    EnviaRest.set_reenviar(false);
    EnviaRest.ShowModal;
  end
  else ShowMessage('Romaneio vazio');

end;

procedure EnviarR2();
begin
  with Roman do
  if (DM1.cdsRoma.RecordCount> 0) then
  begin
    if MessageDlg('Deseja imprimir TODOS os recibos?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          JvDBGrid1.SelectAll;
          Imprime_Recibos(1);
        end;


    EnviarRest2.Entrar;
    EnviarRest2.set_TipoEnvio('Romaneio');
    EnviarRest2.set_NumRoma(DM1.cdsRomaNFNROMA.Value);
    EnviarRest2.set_Reenvia(true);
    EnviarRest2.ShowModal;
  end
  else ShowMessage('Romaneio vazio');

end;

procedure TRoman.btFinalizarClick(Sender: TObject);
begin
  EnviarR2;
end;

procedure TRoman.ppDBPipeline1DataChange(Sender: TObject);
begin
  if (DM1.cdsRomaNFORIGEM.Value = 2) then
  begin
    ppLabel23.Caption := 'Coleta';
    ppLabel26.Caption := 'COLETA SOLICITADA POR ';
  end
  else
  begin
    ppLabel26.Caption := 'RECEBEMOS OS PRODUTOS DA NOTA FISCAL AO LADO EMITIDA POR';
    ppLabel23.Caption := 'Nota Fiscal';
  end;
end;

procedure TRoman.btRecClick(Sender: TObject);
begin
  Imprime_Recibos(0);
end;

end.
