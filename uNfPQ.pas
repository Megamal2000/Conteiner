unit uNfPQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, JvMemoryDataset, ppDB,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport, ppModule,
  raCodMod, ppBands, jpeg, ppCtrls, ppBarCod, ppPrnabl, ppCache,
  ppParameter, Menus, ppDesignLayer;

type
  TnfPQ = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Bevel1: TBevel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btPesq: TBitBtn;
    btImp: TBitBtn;
    StatusBar1: TStatusBar;
    JvDataSource1: TJvDataSource;
    RelREC: TppReport;
    ppDBPipeline1: TppDBPipeline;
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
    JvDataSource2: TJvDataSource;
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
    ppFooterBand2: TppFooterBand;
    raCodeModule1: TraCodeModule;
    edNum: TEdit;
    TabID: TIntegerField;
    PopupMenu1: TPopupMenu;
    Desmarcarimpresso1: TMenuItem;
    Marcarcomoimpresso1: TMenuItem;
    ppDBText6: TppDBText;
    TabFONEdest: TStringField;
    ppLabel1: TppLabel;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppDBText8: TppDBText;
    TabPeso: TFloatField;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    JvDBGrid1: TJvDBGrid;
    procedure btImpClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Desmarcarimpresso1Click(Sender: TObject);
    procedure Marcarcomoimpresso1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  nfPQ: TnfPQ;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco, uAguarde;


procedure TnfPQ.Entrar;
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    cbcli.Items.Append('<Todos>');
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
    dt1.DateTime := Now-7;
    dt2.DateTime := Now;
    edNum.Text   := '';
  end;
end;

Procedure Monta_recibos;

var Bco : TBco;
i : Integer;

begin

  with NfPQ do
  begin
    Tab.Active := False;
    Tab.EmptyTable;
    Tab.Active := True;

   // ShowMessage(IntToStr(DM1.cdsRecb.RecordCount));
  // Usar só os selecionados
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

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

procedure Marcar_IMP();

var Bco : TBco;
begin
  with NfPQ do
  begin
    if MessageDlg('Quer marcar como já impresso?'+#13+IntToStr(Tab.RecordCount)+'Notas',
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
   with NfPQ do
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
     Marcar_IMP;


     {Fecha os arquivos}
   end;
end;




procedure TnfPQ.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 3;
  edNum.Text := '';
end;


procedure pesquisa();

var Bco : TBco;
    idC : integer;

begin
  with NfPQ do
  begin
    idC := 0;
    if (cbCli.ItemIndex > 0) then
      idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

    Bco := TBco.Create;
    if (edNum.Text='') then
    begin
      Bco.Notas_PesquisaCLI(idC, dt1.DateTime, dt2.DateTime);
      StatusBar1.Panels[1].Text := 'Pesquisa entre datas';
    end
    else
    begin
      Bco.Notas_PesquisaNFI(idC, StrToInt(edNum.Text));
      StatusBar1.Panels[1].Text := 'Pesquisa a partir da NF '+edNum.Text;
      edNum.Text := '';
    end;
    Bco.Destroy;
    if (DM4.cdsNFp.RecordCount > 0) then
      StatusBar1.Panels[0].Text := IntToStr(DM4.cdsNFp.RecordCount)+' notas encontradas'
    else
      StatusBar1.Panels[0].Text := 'Nenhuma NOTA encontrada';


    

  end;

end;

procedure TnfPQ.btImpClick(Sender: TObject);


begin
  Imprime_Recibos;
  pesquisa;
end;

procedure TnfPQ.btPesqClick(Sender: TObject);

begin
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then
    pesquisa;
end;

procedure TnfPQ.JvDBGrid1TitleClick(Column: TColumn);

var sIndeXName : String;
    Options:TIndexOptions;

begin
  // Marca a Coluna e Ordena
    // Marca a Coluna e Ordena
  DM4.cdsNFp.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
  JvDBGrid1.SortMarker := smUp;
  {
  DM4.cdsNFp.IndexFieldNames := Column.FieldName;
  if DM4.cdsNFp.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
    JvDBGrid1.SortMarker := smDown;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
    JvDBGrid1.SortMarker := smUp;
  end;

  if (DM4.cdsNFp.IndexDefs.IndexOf(sIndexName) < 0) then
    DM4.cdsNFp.AddIndex(sIndexName, Column.FieldName, Options);

  DM4.cdsNFp.IndexName := sIndexName;
}
end;

procedure TnfPQ.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
      pesquisa;
  end;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TnfPQ.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DM4.cdsNFpFLAG_IMP.Value = 1) then
  begin
    JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsItalic];
    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;

end;

procedure MarcarManual(marca:integer);

var i : Integer;
    Bco : TBco;

begin
  with NfPQ do
  begin
  Bco := TBco.Create;
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Bco.Notas_setIMP(DM4.cdsNFpID.Value , marca);
      end;

   Bco.Destroy;
   end;
   pesquisa;
end;



procedure TnfPQ.Desmarcarimpresso1Click(Sender: TObject);


begin
  MarcarManual(0);
end;

procedure TnfPQ.Marcarcomoimpresso1Click(Sender: TObject);

begin
  MarcarManual(1);
end;

end.
