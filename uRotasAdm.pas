unit uRotasAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls, JvEdit, JvValidateEdit,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppDB, ppCache, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, ppModule, raCodMod, ppStrtch,
  ppSubRpt, ppParameter, JvMemoryDataset, jpeg, ppBarCod, ppDesignLayer,
  Vcl.Menus;

type
  TRotasAdm = class(TForm)
    Panel1: TPanel;
    btaRot: TBitBtn;
    pb1: TProgressBar;
    lbaNotasSem: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btdNovo: TSpeedButton;
    eddRoma: TJvValidateEdit;
    btdSalva: TSpeedButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    cbeRota: TComboBox;
    bteRota: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    lbfNF: TLabel;
    Label11: TLabel;
    edfCEP: TEdit;
    btfSalva: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    btgPassa: TSpeedButton;
    btgMostra: TSpeedButton;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RelRotas: TppReport;
    pipeRotas: TppDBPipeline;
    RelNotas: TppReport;
    pipeNotas: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel12: TppLabel;
    ppLine4: TppLine;
    JvDBGrid3: TJvDBGrid;
    JvDataSource3: TJvDataSource;
    lbcRota: TLabel;
    btcSel: TSpeedButton;
    BitBtn4: TBitBtn;
    RelREC: TppReport;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    JvDataSource4: TJvDataSource;
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
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppShape1: TppShape;
    ppLine5: TppLine;
    ppLabel23: TppLabel;
    ppLine6: TppLine;
    ppLine8: TppLine;
    ppDBText8: TppDBText;
    ppLabel26: TppLabel;
    ppDBText9: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel30: TppLabel;
    ppDBBarCode1: TppDBBarCode;
    ppLine12: TppLine;
    ppDBText10: TppDBText;
    ppImage2: TppImage;
    ppLabel24: TppLabel;
    ppLine14: TppLine;
    ppLabel25: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppLabel13: TppLabel;
    ppDBText19: TppDBText;
    ppLabel14: TppLabel;
    ppDBText20: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppFooterBand3: TppFooterBand;
    lbRtot: TLabel;
    lbDesc: TLabel;
    btCorrige: TBitBtn;
    lbSelec: TLabel;
    PopupMenu1: TPopupMenu;
    RetirardoRoteirizador1: TMenuItem;
    Panel8: TPanel;
    JvDBGrid4: TJvDBGrid;
    JvDataSource5: TJvDataSource;
    btTodos: TBitBtn;
    btSelecionados: TBitBtn;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btaRotClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btdNovoClick(Sender: TObject);
    procedure btdSalvaClick(Sender: TObject);
    procedure bteRotaClick(Sender: TObject);
    procedure btgPassaClick(Sender: TObject);
    procedure btgMostraClick(Sender: TObject);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure btfSalvaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btcBipClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btcSelClick(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btCorrigeClick(Sender: TObject);
    procedure JvDBGrid2TitleClick(Column: TColumn);
    procedure JvDBGrid2AfterPaint(Sender: TObject);
    procedure RetirardoRoteirizador1Click(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btSelecionadosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  RotasAdm: TRotasAdm;
  idRotaSel, idNotaSel, idNFmin : Integer;
  ContaPosicao:TbookMark;
implementation

{$R *.dfm}

uses uBanco, uRoma, uDM2, uDM5, uDM1, uBipCEP, uRoman, uDM4, uNotas, uRastreio;


{ TRotasAdm }

procedure SelCEP(b:boolean);
begin
  with RotasAdm do
  begin
    btfSalva.Enabled := b;
    lbfNF.Caption := '-';
    edfCEP.Text := '';
  end;
end;


procedure PreencherCombo();

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Rotas_Mostra;
  Bco.Destroy;

  RotasAdm.cbeRota.Clear;
  DM2.DBCb_Preenche(RotasAdm.cbeRota,'TB_ROTA', 'ROTA', '');
end;

procedure Limpar();
begin
  with RotasAdm do
  begin
    eddRoma.Value := 0;
    cbeRota.ItemIndex := 0;
    edfCEP.Text := '';
    lbfNF.Caption := '';
    SelCEP(false);
    lbcRota.Caption := '';
  end;
end;



procedure Mostrar_Contagem;

var Bco : TBco;
    tot, i : Integer;
begin
  // Acessando os dados

  Bco := TBco.Create;
  Bco.Rotas_adm_Conta;
  BCo.Destroy;

  if RotasAdm.Visible then RotasAdm.JvDBGrid1.SetFocus;
  tot := 0;
  DM5.cdsRconta.First;
  for i := 1 to DM5.cdsRconta.RecordCount do
  begin
    tot := tot + DM5.cdsRcontaQT.Value;
    DM5.cdsRconta.Next;
  end;

  DM5.cdsRconta.GotoBookmark(ContaPosicao);
  RotasAdm.lbRtot.Caption := IntToStr(DM5.cdsRconta.RecordCount)+ ' ['+IntToStr(tot)+']';
end;

procedure Contar();
  var Bco : TBco;
     sem : Integer;
begin
  Bco := TBco.Create;
  sem := Bco.Rotas_adm_SEM_Conta;
  Bco.Destroy;
  RotasAdm.lbaNotasSem.Caption := 'Notas sem Rotas: '+IntToStr(sem);
end;

procedure Mostrar_Sem;

var Bco : TBco;
    sem : integer;
begin
  // Acessando os dados
  Bco := TBco.Create;
  idNFmin := BCo.Config_DTP_MostraN;
  RotasAdm.lbDesc.Caption := idNFmin.ToString;
  //Bco.Rotas_adm_SEM('');
  sem := Bco.Rotas_adm_SEM_Conta;
  BCo.Destroy;

  RotasAdm.lbaNotasSem.Caption := 'Notas sem Rotas: '+IntToStr(sem);
end;

procedure Mostrar_Notas(idR:Integer);

var Bco : TBco;

begin
  // Acessando os dados
  Bco := TBco.Create;
  Bco.Rotas_adm_Mostra(idR);
  Bco.Rotas_CEPs_MostraRot(idR);
  BCo.Destroy;
end;

procedure Mostrar_Descartes;

var Bco : TBco;

begin
  // Acessando os dados
  Bco := TBco.Create;
  Bco.Rotas_adm_Mostra(-1);
  Bco.Destroy;

  RotasAdm.lbDesc.Caption := 'Notas Descartadas: '+IntToStr(DM5.cdsRmostra.RecordCount);
end;



procedure TRotasAdm.Entrar;

begin
  Limpar;
  PreencherCombo;
  Mostrar_Sem;
  Mostrar_Contagem;
  //Mostrar_Descartes;
  //Mostrar_Notas(9998); // mostrar nada
end;

function altera_CEP(CEP:String):Integer;
  var sCEP, s : String;
      i, nCEP:Integer;

begin
  if Pos('-', CEP)> 0 then
  begin
    sCEP := '';
    s :=  CEP;
    for i := 1 to Length(s) do
      if (s[i] in ['0'..'9']) then sCEP := sCEP + s[i];
  end
  else sCEP := CEP;

  nCEP := 0;
  try
    nCEP := StrToInt(Trim(copy('00'+sCEP, 1, 7)));
  except
    nCEP := -2;
  end;

  result := nCEP;
end;

procedure Roteirizar();
var Bco : TBco;
    Rast : TRastreio;
    achei : boolean;
    nCEP, i : Integer;
    sCEP, s : String;
begin
  with RotasAdm do
  if (DM5.cdsRsem.RecordCount > 0) then
  begin
    Bco := TBco.Create;
    Bco.Rotas_CEPs_Mostra;

    pb1.Min := 1;
    pb1.Position := 1;
    pb1.Max := DM5.cdsRsem.RecordCount + 1;
    nCEP := 0;
    DM5.cdsRsem.First;
    while not DM5.cdsRsem.eof do
    begin
      pb1.Position := pb1.Position + 1;
      achei := false;
      DM5.cdsRCEP.First;
      while (not DM5.cdsRCEP.Eof) and (not achei) do
      begin
      {
        if Pos('-', DM5.cdsRSemCEP.Value)> 0 then
        begin
          sCEP := '';
          s :=  DM5.cdsRSemCEP.Value;
          for i := 1 to Length(s) do
            if (s[i] in ['0'..'9']) then sCEP := sCEP + s[i];


        end
        else sCEP := DM5.cdsRSemCEP.Value;

        nCEP := StrToInt(Trim(copy('00'+sCEP, 1, 7)));
        }
        if nCEp<>-2 then
        begin
          nCEP := altera_CEP(DM5.cdsRSemCEP.Value);
          if nCEP > 0 then
          begin
            if (nCEP >= DM5.cdsRCEPCEPINIC.Value) and (nCEP <= DM5.cdsRCEPCEPFIM.Value) then
            begin
              achei := true;
              Bco.Rotas_adm_passaRota(DM5.cdsRsemID.Value, DM5.cdsRCEPLigRota.value);
              // EVENTO NF - Rastreio
              Rast := TRastreio.Create;
              Rast.set_ocor(DM5.cdsRsemNUMNF.Value, DM5.cdsRsemLigCli.Value,DM5.cdsRsemSerieNF.Value, evrNaTransp);
              Rast.Destroy;

            end;
          end else ShowMessage('Erro NotaF: '+ DM5.cdsRsemNUMNF.AsString + ' - CEP incorreto: ' + DM5.cdsRSemCEP.Value+ #13+ 'Anote o número da NOTA para correção posterior');
        end;

        DM5.cdsRCEP.Next;
      end;
      if (not achei) then Bco.Rotas_adm_passaRota(DM5.cdsRsemID.Value, 9999);
      DM5.cdsRsem.Next;
    end;
    Bco.Destroy;
    Pb1.Position := 1;
    Mostrar_Contagem;
    Mostrar_Sem;
    lbaNotasSem.Caption := 'Notas sem Rotas: '+IntToStr(DM5.cdsRsem.RecordCount);
  end;

end;

procedure TRotasAdm.btaRotClick(Sender: TObject);
  var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Rotas_adm_SEM_Cli;
  Bco.Destroy;

  Panel8.Visible := true;
end;

procedure TRotasAdm.JvDBGrid1CellClick(Column: TColumn);
begin
  ContaPosicao :=  DM5.cdsRconta.GetBookmark;
  idRotaSel := DM5.cdsRcontaLIGROT.Value;
  Mostrar_Notas(idRotaSel);
  btgPassa.Enabled := true;
  SelCEP(false);
  RotasAdm.lbcRota.Caption := DM5.cdsRcontaROTA.Value + ' - ' + DM5.cdsRcontaQT.AsString;
  // para ERRO
  btCorrige.Visible := false;
  if (idRotaSel = 9999) then btCorrige.Visible := true;
end;

procedure Insere_Notas_Romaneio(nRoma:integer);


var i : Integer;
    Bco : Tbco;
    Rast : Trastreio;
    
begin
  with RotasAdm do
  begin
  if JvDBGrid2.SelectedRows.Count>0 then
    with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));

          Bco := TBco.Create;
          Bco.Romaneio_InsereNota(DM5.cdsRmostraID.Value, nRoma);

          // Prioridade para Reentregas
          if DM5.cdsRmostraORIGEM.Value =4  then Bco.Notas_Prioridade(DM5.cdsRmostraID.Value, 1);
          Bco.Destroy;
          // EVENTO NF - Rastreio
          Rast := TRastreio.Create;
          Rast.Insere_Romaneio(DM5.cdsRmostraNUMNF.Value ,DM5.cdsRmostraLIGCLI.Value , nRoma);
          Rast.Destroy;
      end;




      ShowMessage(IntToStr(JvDBGrid2.SelectedRows.Count)+ ' notas passadas com SUCESSO');
  end;
end;

procedure Passa_Notas_Rota(nRota:integer);


var i : Integer;
    Bco : Tbco;
    Rast : TRastreio;

begin
  with RotasAdm do
  begin
  if JvDBGrid2.SelectedRows.Count>0 then
    with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));

          Bco := TBco.Create;
          Bco.Rotas_adm_passaRota(DM5.cdsRmostraID.Value, nRota);
          Bco.Destroy;

          // Descarte
          if (nRota = -1) then
          begin
            // EVENTO NF - Rastreio
            Rast := TRastreio.Create;
            Rast.set_ocor(DM5.cdsRmostraNUMNF.Value, DM5.cdsRmostraLigCli.Value,0, evrDescarteROT);
            Rast.Destroy;
          end;
      end;
      ShowMessage(IntToStr(JvDBGrid2.SelectedRows.Count)+ ' notas passadas com SUCESSO');
  end;
end;



procedure TRotasAdm.btdNovoClick(Sender: TObject);

var Bco : TBco;
    nR : Integer;
begin
  if MessageDlg('Tem certeza que deseja passar essas Notas para um NOVO Romaneio?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    btdNovo.Enabled := false;
    Bco := TBco.Create;
    Bco.Romaneio_Insere;
    nR:=Bco.Romaneio_RecuperaID();
    Bco.Destroy;

    Insere_Notas_Romaneio(DM1.cdsRomaNUM.Value);

    Mostrar_Contagem;
    Mostrar_Notas(idRotaSel);


    Roman.set_idRoma(0);
    Roman.Entrar;
    Roman.Show;
    btdNovo.Enabled := true;

  end;
end;

procedure TRotasAdm.btdSalvaClick(Sender: TObject);
var Rom : TRoma;
    nR, x : Integer;
    Bco : TBco;
    existe : boolean;
begin
  if MessageDlg('Tem certeza que deseja passar essas Notas para o Romaneio '+IntToStr(eddRoma.Value)+ '?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    btdSalva.Enabled := false;
    x := eddRoma.Value;
    Rom := TRoma.Create;
    nR := Rom.Converte_NumBD(x, Now);
    Rom.Destroy;
    Bco := TBco.Create;
    existe := Bco.Romaneio_Existe(nR);
    Bco.Destroy;

    if existe then
    begin
      Insere_Notas_Romaneio(nR);
      Mostrar_Contagem;
      Mostrar_Notas(idRotaSel);
      Roman.set_idRoma(nR);
      Roman.set_MostraNum(true);
      Roman.Entrar;
      Roman.Show;
    end
    else ShowMessage('Romaneio núm. '+eddRoma.Text+' não existe ');
    btdSalva.Enabled := true;

  end;

end;

procedure TRotasAdm.bteRotaClick(Sender: TObject);

var idRo : Integer;

begin
  if MessageDlg('Tem certeza que deseja passar essas Notas para a ROTA '+cbeRota.Items[cbeRota.itemindex]+'?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    idRo := DM2.DBCp_leid(cbeRota.Items[cbeRota.itemindex], 'TB_ROTA', 'ROTA');
    if (idRo <> idRotaSel) then
    begin
      Passa_Notas_Rota(idRo);
      Mostrar_Notas(idRotaSel);
      Mostrar_Contagem;
    end
    else ShowMessage('Não posso passar para mesma Rota');
  end;

end;

procedure TRotasAdm.btgPassaClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja DESCARTAR essas Notas?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
      Passa_Notas_Rota(-1);
      Mostrar_Descartes;
      Mostrar_Notas(idRotaSel);
      Mostrar_Contagem;
  end;

end;

procedure TRotasAdm.btSelecionadosClick(Sender: TObject);
  var Bco : TBco;
      lista, item : string;
      i : integer;
begin
  lista := '';

  if JvDBGrid4.SelectedRows.Count>0 then
  begin
    if JvDBGrid4.SelectedRows.Count <> DM5.cdsRcli.RecordCount then
    begin
    with JvDBGrid4.DataSource.DataSet do
      for i:=0 to JvDBGrid4.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid4.SelectedRows.Items[i]));
        // Faz a lista
        if i > 0  then item := ',' + DM5.cdsRcliLIGCLI.AsString
        else item := DM5.cdsRcliLIGCLI.AsString;
        lista := lista + item;
      end;
      //ShowMessage(lista);
      Bco := TBco.Create;
      Bco.Rotas_adm_SEM(lista);
      Bco.Destroy;
      Roteirizar;
      Contar;
    end
    else ShowMessage('Utilize o botão TODOS para fazer a lista inteira');
  end
  else ShowMessage('Selecione alguns Clientes!');
  Panel8.Visible := false;

end;




procedure TRotasAdm.btTodosClick(Sender: TObject);
  var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Rotas_adm_SEM('');
  Bco.Destroy;
  Roteirizar;
  Contar;

  Panel8.Visible := false;

end;

procedure TRotasAdm.btgMostraClick(Sender: TObject);
begin
  Mostrar_Descartes;
  lbcRota.Caption :='DESCARTES';
  btgPassa.Enabled := false;
end;

procedure TRotasAdm.JvDBGrid2DblClick(Sender: TObject);
begin
  if (DM5.cdsRmostra.RecordCount > 0) then
  begin
    NotasP.Entrar;
    NotasP.set_idNota(DM5.cdsRmostraID.value);
    NotasP.AbreNf;
    NotasP.Show;
  end;
end;

procedure TRotasAdm.btfSalvaClick(Sender: TObject);

var Bco : TBco;
begin
  if (length(edfCEP.Text)>4) then
  begin
    Bco := TBco.Create;
    Bco.Rotas_adm_altCEP(idNotaSel, edfCEP.Text);
    Bco.Destroy;
    Mostrar_Notas(idRotaSel);
  end
  else ShowMessage('CEP muito curto');
end;

procedure Imprimir_Rotas();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with RotasAdm do
   begin
     doc := 'Lista de Rotas';
     { carrega o arquivo }
     RelRotas.Template.FileName := dirR+'\Rels\RelRotas.rtm';
     RelRotas.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelRotas.DeviceType := 'Screen';
     RelRotas.ShowAutoSearchDialog  := False;
     RelRotas.ShowCancelDialog := False;
     RelRotas.ShowPrintDialog := False;
     RelRotas.PrinterSetup.DocumentName := doc;

     // Complementos
     //ppLabel4.Caption:= FormatDateTime('dd/MM/yyyy', dat1.DateTime);

     { imprime a ordem de serviço }
     RelRotas.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure Imprimir_RotNotas();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with RotasAdm do
   begin
     doc := 'Lista de Notas na Rota';
     { carrega o arquivo }
     RelNotas.Template.FileName := dirR+'\Rels\RelRotNotas.rtm';
     RelNotas.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelNotas.DeviceType := 'Screen';
     RelNotas.ShowAutoSearchDialog  := False;
     RelNotas.ShowCancelDialog := False;
     RelNotas.ShowPrintDialog := False;
     RelNotas.PrinterSetup.DocumentName := doc;

     // Complementos
     ppLabel7.Caption:= DM5.cdsRcontaROTA.value;

     { imprime a ordem de serviço }
     RelNotas.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TRotasAdm.BitBtn1Click(Sender: TObject);
begin
  Imprimir_Rotas;
end;

procedure TRotasAdm.BitBtn2Click(Sender: TObject);
begin
  DM5.cdsRmostra.IndexFieldNames := 'CEP';
  JvDBGrid2.SortedField := 'CEP';
  Imprimir_RotNotas;
end;

procedure TRotasAdm.btcBipClick(Sender: TObject);
begin
  BipCEP.Show;
end;

/// IMPRIMIR R E CI I B O S
Procedure Monta_recibos;

var Bco : TBco;
    i : Integer;
    achei : boolean;

begin
  Bco := TBco.Create;
  Bco.Notas_PesquisaRota(idRotaSel);
  Bco.Destroy;

  with RotasAdm do
  begin
    Tab.Active := False;
    Tab.EmptyTable;
    Tab.Active := True;

   // ShowMessage(IntToStr(DM1.cdsRecb.RecordCount));
  // Usar só os selecionados
  if JvDBGrid2.SelectedRows.Count>0 then
    with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));
        // procura os selecionados
        achei := false;
        DM4.cdsNFp.First;
        while (not DM4.cdsNFp.Eof) and (not achei) do
        begin
          if (DM5.cdsRmostraID.Value = DM4.cdsNFpID.Value) then achei := true
           else DM4.cdsNFp.Next;
        end;
        if (achei) then
        begin
          Bco := TBco.Create;
          Bco.Espelho_Mostra(DM4.cdsNFpLigCLI.Value, DM4.cdsNFpNUMNF.Value );
          Bco.Destroy;

          Tab.Insert;
          TabID.Value       := DM4.cdsNFpID.Value;
          TabNUMNF.Value    := DM4.cdsNFpNUMNF.Value;
          TabNRoma.Value    := DM4.cdsNFpNROMA.Value;
          TabNOMECli.Value  := DM4.cdsNFpNOME.Value;
          TabNOMEDest.Value := DM4.cdsNFpNOMEDEST.Value;
          TabFONEdest.Value := DM4.cdsNFpFONEDEST.Value;
          if (DM4.cdsNFpPESO.AsFloat <> null) then
            TabPeso.Value   := DM4.cdsNFpPESO.AsFloat;
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

procedure Marcar_IMP();

var Bco : TBco;
begin
  with RotasAdm do
  begin
    if MessageDlg('Quer marcar como já impresso?'+#13+' >> '+IntToStr(Tab.RecordCount)+' Notas',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Bco := TBCo.Create;
        Tab.First;
        while not Tab.Eof do
        begin
          Bco.Notas_setIMP(TabID.Value, 1);
          Tab.Next;
        end;
        Bco.Destroy;
      end;
  end;
end;

Procedure Imprime_Recibos();

var doc  : String;
    dirR : String;
    arq  : String;


begin
   GetDir(0, dirR);
   with RotasAdm do
   begin

     Monta_recibos;

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



procedure TRotasAdm.BitBtn4Click(Sender: TObject);
begin
  if (DM5.cdsRmostra.RecordCount>0) then
  begin
    //Monta_recibos;
    Imprime_Recibos;
    Marcar_IMP;
  end;
end;

procedure TRotasAdm.btcSelClick(Sender: TObject);
begin
  JvDBGrid2.SelectAll;
end;

procedure TRotasAdm.JvDBGrid2AfterPaint(Sender: TObject);
begin
  lbSelec.Caption := 'Selecionados '+ IntToStr(JvDBGrid2.SelectedRows.Count);
end;

procedure TRotasAdm.JvDBGrid2CellClick(Column: TColumn);
begin
  idNotaSel := DM5.cdsRmostraID.Value;
  SelCEP(true);
  lbfNF.Caption := DM5.cdsRmostraNUMNF.AsString;
  edfCEP.Text := DM5.cdsRmostraCEP.Value;
end;

procedure TRotasAdm.JvDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    if (DM5.cdsRmostraFLAG_IMP.Value = 1) then
    begin
      //JvDBGrid2.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsItalic];
      //JvDBGrid2.Canvas.Font.Color := clGray;
      JvDBGrid2.Canvas.Brush.Color := clSilver;
      JvDBGrid2.Canvas.FillRect(rect);
      JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
    end;
    if (DM5.cdsRmostraORIGEM.Value = 4) then
    begin
      //JvDBGrid2.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsItalic];
      JvDBGrid2.Canvas.Font.Color := clGreen;
      //JvDBGrid2.Canvas.Brush.Color := clSilver;
      JvDBGrid2.Canvas.FillRect(rect);
      JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
    end;


  end;
end;

procedure TRotasAdm.btCorrigeClick(Sender: TObject);

var achei : boolean;
    nCEP:Integer;
    Bco : TBco;

begin
    Bco := TBco.Create;
    Bco.Rotas_CEPs_Mostra;

    DM5.cdsRmostra.First;
    while not DM5.cdsRmostra.eof do
    begin
      pb1.Position := pb1.Position + 1;
      achei := false;
      DM5.cdsRCEP.First;
      while (not DM5.cdsRCEP.Eof) and (not achei) do
      begin
        nCEP := StrToInt(Trim(copy('00'+DM5.cdsRmostraCEP.Value, 1, 7)));
        if (nCEP >= DM5.cdsRCEPCEPINIC.Value) and (nCEP <= DM5.cdsRCEPCEPFIM.Value) then
        begin
          achei := true;
          Bco.Rotas_adm_passaRota(DM5.cdsRmostraID.Value, DM5.cdsRCEPLigRota.value);
        end;
        DM5.cdsRCEP.Next;
      end;
      if (not achei) then Bco.Rotas_adm_passaRota(DM5.cdsRmostraID.Value, 9999);
      DM5.cdsRmostra.Next;
    end;
    Bco.Destroy;
    Mostrar_Notas(idRotaSel);
    Mostrar_Contagem;
end;

procedure TRotasAdm.JvDBGrid2TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM5.cdsRmostra.IndexFieldNames := Column.FieldName;
  JvDBGrid2.SortedField := Column.FieldName;
end;

procedure TRotasAdm.RetirardoRoteirizador1Click(Sender: TObject);
var i : Integer;
    Bco : TBco;
begin
  if idRotaSel = 9999  then
  begin
    Bco := TBco.Create;
    // Usar só os selecionados
    if JvDBGrid2.SelectedRows.Count>0 then
      with JvDBGrid2.DataSource.DataSet do
        for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
        begin
          GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));
          Bco.Rotas_adm_passaRota(DM5.cdsRmostraID.Value, 0);
        end;
    Bco.Destroy;
  end
  else ShowMessage('Só podem ser retiradas notas com ERRO!');

end;

procedure TRotasAdm.SpeedButton1Click(Sender: TObject);
begin
  Panel8.Visible := false;
end;

end.
