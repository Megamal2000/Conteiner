unit uDocCob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvExStdCtrls,
  JvEdit, JvValidateEdit, Vcl.ComCtrls, Vcl.Buttons, ppCtrls, ppBands, ppReport,
  ppStrtch, ppSubRpt, ppPrnabl, ppClass, ppCache, ppDesignLayer, ppParameter,
  ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppModule, raCodMod,
  System.ImageList, Vcl.ImgList;

type
  TDocCob = class(TForm)
    Panel1: TPanel;
    cbCli: TComboBox;
    Label1: TLabel;
    lbConta: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    edUlts: TJvValidateEdit;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    btGerar: TBitBtn;
    PanelInsere: TPanel;
    Label3: TLabel;
    cbConta: TComboBox;
    Label4: TLabel;
    LbEmissao: TLabel;
    Label5: TLabel;
    dtVenc: TDateTimePicker;
    Label6: TLabel;
    edObs: TEdit;
    btSalvar: TBitBtn;
    pb: TProgressBar;
    lbProcesso: TStaticText;
    btSelecionar: TBitBtn;
    lbCte: TLabel;
    PanelEdita: TPanel;
    btEdita: TBitBtn;
    btCalc: TBitBtn;
    btDesco: TBitBtn;
    btNF: TBitBtn;
    btRel: TBitBtn;
    PanelAlt1: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    a1cbConta: TComboBox;
    a1dtVenc: TDateTimePicker;
    a1edObs: TEdit;
    a1btSalvar: TBitBtn;
    a1dtEmissao: TDateTimePicker;
    PanelAlt2: TPanel;
    Label9: TLabel;
    Label13: TLabel;
    a2dtLimite: TDateTimePicker;
    a2btSalvar: TBitBtn;
    a2edValor: TJvValidateEdit;
    PanelAlt3: TPanel;
    Label12: TLabel;
    a3btSalvar: TBitBtn;
    a3edNum: TJvValidateEdit;
    Label14: TLabel;
    lbNcob: TLabel;
    RelCob: TppReport;
    pipCob2: TppDBPipeline;
    pipCTe: TppDBPipeline;
    pipNF: TppDBPipeline;
    ppParameterList1: TppParameterList;
    dsCob2: TJvDataSource;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    dsNF: TJvDataSource;
    btReenviar: TBitBtn;
    ImageList1: TImageList;
    ppLabel3: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    procedure cbCliChange(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure btSelecionarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure a1btSalvarClick(Sender: TObject);
    procedure a2btSalvarClick(Sender: TObject);
    procedure a3btSalvarClick(Sender: TObject);
    procedure btEditaClick(Sender: TObject);
    procedure btDescoClick(Sender: TObject);
    procedure btNFClick(Sender: TObject);
    procedure btRelClick(Sender: TObject);
    procedure btReenviarClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure set_idUser(i:Integer);
  end;

var
  DocCob: TDocCob;
  idCli, ContaCte, idUs:Integer;

implementation

{$R *.dfm}

uses uDM2, uBanco, uDM5, uDM4, global;

procedure Mostra_Cte(cob:Integer);
var Bco : TBco;
begin

  BCo := Tbco.Create;
  Bco.DOCCOB_Mostra_Cte(idCli, cob);
  Bco.Destroy;
end;

procedure Mostra_Cobs();
var Bco : TBco;
begin
  BCo := Tbco.Create;
  Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value);
  Bco.Destroy;
end;

procedure Novo(visivel:boolean);
begin
  DocCob.btSelecionar.Visible := visivel;
  DocCob.btGerar.Visible := visivel;
end;

procedure Altera(n:smallint);
begin
  with DocCob do
  begin
    PanelInsere.Visible := false;
    PanelAlt1.Visible := false;
    PanelAlt2.Visible := false;
    PanelAlt3.Visible := false;

    if n=1 then PanelAlt1.Visible := true;
    if n=2 then PanelAlt2.Visible := true;
    if n=3 then PanelAlt3.Visible := true;

  end;
end;

procedure Imprimir_DocCob();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with DocCob do
   begin
     doc := 'Lista de Rotas Completa';
     { carrega o arquivo }
     RelCob.Template.FileName := dirR+'\Rels\RelDOcCob.rtm';
     RelCob.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelCob.DeviceType := 'Screen';
     RelCob.ShowAutoSearchDialog  := False;
     RelCob.ShowCancelDialog := False;
     RelCob.ShowPrintDialog := False;
     RelCob.PrinterSetup.DocumentName := doc;

     // Complementos
     ppLabel2.Caption:= DM5.cdsCobID.AsString;
     ppLabel5.Caption:= cbCli.Items[cbCli.ItemIndex];

     { imprime a ordem de serviço }
     RelCob.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TDocCob.a1btSalvarClick(Sender: TObject);
  var Bco : TBco;
      idCobra, idCC:Integer;
      obs : String;
      dte, dtv : TDateTime;

begin
  idCobra := DM5.cdsCobID.Value;
  idCC := DM2.DBCp_leid(a1cbConta.Items[a1cbConta.ItemIndex], 'TB_CONTABANCO', 'DESCREVE');
  obs := a1edObs.Text;
  dte := a1dtEmissao.Date;
  dtv := a1dtVenc.Date;

  Bco := TBco.Create;
  Bco.DOCCOB_Altera(idCobra, idCC, dte, dtv, obs);
  Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value);
  Bco.Destroy;

  Altera(0);
end;

procedure TDocCob.a2btSalvarClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.DOCCOB_Altera_Desconto(DM5.cdsCobID.Value, a2edValor.Value, a2dtLimite.Date);
  Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value);
  Bco.Destroy;

  Altera(0);
end;

procedure TDocCob.a3btSalvarClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.DOCCOB_Altera_NFtransp(DM5.cdsCobID.Value, a3edNum.Value);
  Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value);
  Bco.Destroy;

  Altera(0);
end;

procedure TDocCob.btCalcClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.DOCCOB_Altera_Totais(DM5.cdsCobID.Value);
  Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value );
  Bco.Destroy;
end;

procedure TDocCob.btDescoClick(Sender: TObject);
begin
  a2edValor.Value := DM5.cdsCobDESCVALOR.AsFloat;
  a2dtLimite.DateTime := DM5.cdsCobDESCDTLIMITE.Value;
  ALtera(2);
end;

procedure TDocCob.btEditaClick(Sender: TObject);
begin
 if (a1cbConta.Items.Count = 0) then
  begin
    a1cbConta.Clear;
    DM2.DBCb_Preenche(a1cbConta, 'TB_ContaBanco', 'Descreve',' ativo = 1 ');
    a1cbConta.ItemIndex := 0;
  end;
  DM2.DBCp_Pos(a1cbConta, 'TB_ContaBanco', DM5.cdsCobLIGBANCO.AsString, 'DESCREVE');
  a1edObs.Text := DM5.cdsCobOBS.Value;
  a1dtEmissao.DateTime := DM5.cdsCobDTEMISSAO.Value;
  a1dtVenc.DateTime    := DM5.cdsCobDTVENC.Value;
  ALtera(1);
end;

procedure TDocCob.btGerarClick(Sender: TObject);

begin
 if (cbConta.Items.Count = 0) then
  begin
    cbConta.Clear;
    DM2.DBCb_Preenche(cbConta, 'TB_ContaBanco', 'Descreve',' ativo = 1 ');
    cbConta.ItemIndex := 0;
  end;
  LbEmissao.Caption := FormatDateTime('dd/MM/yyyy', Now);
  dtVenc.DateTime := Now + 15;
  edObs.Text := '';
  lbprocesso.Caption := '';
  PanelInsere.Visible := true;
end;

procedure TDocCob.btNFClick(Sender: TObject);
begin
  a3edNum.Value := DM5.cdsCobNFTRANSP.Value;
  ALtera(3);
end;

procedure TDocCob.btReenviarClick(Sender: TObject);

var i : Integer;
    bco : TBco;

begin
    if MessageDlg('Tem certeza que deseja ENVIAR o DOCCOB ' + DM5.cdsCobID.AsString + '? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := TBco.Create;
      Bco.DOCCOB_Altera_StatusENV(DM5.cdsCobID.Value, 0);
      Bco.DOCCOB_Mostra(idCli, DocCob.edUlts.Value);
      Bco.Destroy;
    end;
end;

procedure TDocCob.btRelClick(Sender: TObject);
begin
  Imprimir_DocCob;
end;

procedure TDocCob.btSalvarClick(Sender: TObject);
  var Parte, idCC,  idCobra, i, j : Integer;
      dtVe : TDatetime;
      obs, sTot, ListaReent, ListaDevol, ListaItem : String;
      Bco : TBco;
      contEntregue, contReent, contDevol, nOco : Integer;

begin
  Parte := 495;
  if idCli > 0 then
  begin
    with DocCob do
    begin
      idCC := DM2.DBCp_leid(cbConta.Items[cbConta.ItemIndex], 'TB_CONTABANCO', 'DESCREVE');
      dtVe := dtVenc.Date;
      obs  := edObs.Text;
    end;

    // MODO 1 - Todos os selecionados são inseriso - OK em maio/19
    {
    Bco := TBco.Create;
    idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
    // Inicia Looping para Selecionados
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        Bco.DOCCOB_Inclui_Conhec(idCobra, DM5.cdsCobCTeID.Value);
      end;
    Bco.Destroy;


    // MODO 2 - Selecionados de Parte em parte  são inseridos - OK em maio/19

    Bco := TBco.Create;
    j := 0;
    pb.Max := JvDBGrid2.SelectedRows.Count;
    pb.Position := 0;
    idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
    sTot :=  JvDBGrid2.SelectedRows.Count.ToString;
    // Inicia Looping para Selecioandos
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        j := j + 1;
        pb.Position := j;
        if (j mod parte = 0) then
        begin
          BCo.DOCCOB_Altera_Totais(idCobra);
          idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
        end;

        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        lbProcesso.Caption  := ' // '+j.ToString +' de '+sTot;
        Bco.DOCCOB_Inclui_Conhec(idCobra, DM5.cdsCobCTeNUMC.Value, DM5.cdsCobCTeLIGTRANSP.Value);
      end;
      BCo.DOCCOB_Altera_Totais(idCobra);
    Bco.Destroy;
    }
    //// MODO 3 - Separados por Tipo: Entregue, Reentrega ou devolução
    // contagem
    // Inicia Looping para Selecionados
    contEntregue := 0;
    contReent    := 0;
    contDevol    := 0;
    pb.Max := JvDBGrid2.SelectedRows.Count;
    sTot :=  JvDBGrid2.SelectedRows.Count.ToString;
    pb.Position := 0;
    ListaReent := DM2.Lista('TB_OCORRE', 'USO=2', 'NUM', true);
    ListaDevol := DM2.Lista('TB_OCORRE', 'USO=3', 'NUM', true);
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        pb.Position := i;
        lbProcesso.Caption  := ' // '+i.ToString +' de '+sTot;
        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        nOco := DM5.cdsCobCTeNOC.Value;
        if nOco=1 then contEntregue := contEntregue + 1
        else
        begin
          ListaItem := ','+nOco.ToString+',';
          if Pos(ListaItem, ListaReent)>0 then contReent    := contReent + 1;
          if Pos(ListaItem, ListaDevol)>0 then contDevol    := contDevol + 1;
        end;
      end;

    // Entregues
    if contEntregue>0 then
    begin
    Bco := TBco.Create;
    idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
    // Inicia Looping para Selecionados
    pb.Position := 0;
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        pb.Position := i;
        lbProcesso.Caption  := ' #Entregues '+i.ToString +' de '+sTot;
        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        nOco := DM5.cdsCobCTeNOC.Value;
        if nOco=1 then
          Bco.DOCCOB_Inclui_Conhec(idCobra, DM5.cdsCobCTeNUMC.Value, DM5.cdsCobCTeLigTRANSP.Value);
      end;
      Bco.DOCCOB_Altera_Totais(idCobra);
      Bco.Destroy;
    end;

    if contReent>0 then
    begin
    Bco := TBco.Create;
    idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
    // Inicia Looping para Selecionados
    pb.Position := 0;
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        pb.Position := i;
        lbProcesso.Caption  := ' #Reentregas '+i.ToString +' de '+sTot;
        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        nOco := DM5.cdsCobCTeNOC.Value;
        ListaItem := ','+nOco.ToString+',';
        if Pos(ListaItem, ListaReent)>0 then
          Bco.DOCCOB_Inclui_Conhec(idCobra, DM5.cdsCobCTeNUMC.Value, DM5.cdsCobCTeLigTRANSP.Value);
      end;
      Bco.DOCCOB_Altera_Totais(idCobra);
      Bco.Destroy;
    end;

    if contDevol>0 then
    begin
    Bco := TBco.Create;
    idCobra := Bco.DOCCOB_Insere(idcli,idUs, idCC, dtVe, obs);
    // Inicia Looping para Selecionados
    pb.Position := 0;
    if JvDBGrid2.SelectedRows.Count>0 then
     with JvDBGrid2.DataSource.DataSet do
      for i:=0 to JvDBGrid2.SelectedRows.Count-1 do
      begin
        pb.Position := i;
        lbProcesso.Caption  := ' #Devoluções '+i.ToString +' de '+sTot;
        GotoBookmark(JvDBGrid2.SelectedRows.Items[i]);
        nOco := DM5.cdsCobCTeNOC.Value;
        ListaItem := ','+nOco.ToString+',';
        if Pos(ListaItem, ListaDevol)>0 then
          Bco.DOCCOB_Inclui_Conhec(idCobra, DM5.cdsCobCTeNUMC.Value, DM5.cdsCobCTeLigTRANSP.Value);
      end;
      Bco.DOCCOB_Altera_Totais(idCobra);
      Bco.Destroy;
    end;

  end;
end;

procedure TDocCob.btSelecionarClick(Sender: TObject);
begin
  JvDBGrid2.SelectAll;
end;

procedure TDocCob.cbCliChange(Sender: TObject);
begin
  //
  if cbCli.ItemIndex > 0 then
  begin
    idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');
    Mostra_Cte(0);
    Mostra_Cobs;
    lbConta.Caption := '0';
    Novo(false);
    if DM5.cdsCobCTe.RecordCount>0 then
    begin
      lbConta.Caption := 'CT-e sem Cobrança '+DM5.cdsCobCTe.RecordCount.ToString;
      lbCTe.Caption := 'Mostrando sem Cobrança '+DM5.cdsCobCTe.RecordCount.ToString;
      Novo(true);
    end;
  end;
  Altera(0);
  PanelEdita.Visible := false;

end;

procedure TDocCob.Entrar;
begin
 if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    cbCli.Items.Append('<NENHUM>');
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 and cteemite=1 ');

    cbCli.ItemIndex := 0;
  end;
  lbConta.Caption := '';
  PanelInsere.Visible := false;
  Novo(false);
  Altera(0);
end;

procedure TDocCob.JvDBGrid1DblClick(Sender: TObject);
  var Bco: TBco;
      s : String;

begin
  // pega individual para REL
  Bco := TBco.Create;
  Bco.DOCCOB_MostraID(DM5.cdsCobID.Value);
  Bco.Destroy;

  if DM5.cdsCobSTATUS_ENV.Value = 1 then s := ' - Ok. ENVIADO. ';
  if DM5.cdsCobSTATUS_ENV.Value = 0 then s := ' - Aguardando Envio... ';
  if DM5.cdsCobSTATUS_ENV.Value = 9 then s := ' - Editando... ';

  Mostra_Cte(DM5.cdsCobID.Value);
  Novo(false);
  lbCte.Caption := 'DOCCOB nº '+DM5.cdsCobID.AsString+ ', mostrando '+DM5.cdsCobCTe.RecordCount.ToString+' CT-e';
  PanelInsere.Visible := false;
  lbnCob.Caption := DM5.cdsCobID.AsString + s;
  PanelEdita.Visible := true;
  Altera(0);
end;

procedure TDocCob.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field=DM5.cdsCobSTATUS_ENV then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);

    // Desenha o Quadrado
    if DM5.cdsCobSTATUS_ENV.Value=0 then ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+1,Rect.Top+1,0);
    if DM5.cdsCobSTATUS_ENV.Value=1 then ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+1,Rect.Top+1,1);
    if DM5.cdsCobSTATUS_ENV.Value=9 then ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+1,Rect.Top+1,2);

  end;
end;

procedure TDocCob.set_idUser(i: Integer);
begin
  idUs := i;
end;

end.
