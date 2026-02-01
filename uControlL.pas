unit uControlL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls,
  StdCtrls, Buttons, ExtCtrls, ppCtrls, ppVar, ppPrnabl, ppClass, ppDB,
  ppBands, ppCache, ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppDesignLayer,
  ppParameter, System.ImageList;

type
  TControlL = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbReent: TLabel;
    Label2: TLabel;
    lbDevol: TLabel;
    btImprimir: TBitBtn;
    btAtual: TBitBtn;
    dtRoma: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    ImageList1: TImageList;
    lbTotal: TLabel;
    RelReent: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    ppDBCalc1: TppDBCalc;
    btReent: TBitBtn;
    btExcel: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btAtualClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btImprimirClick(Sender: TObject);
    procedure btReentClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlL: TControlL;

implementation

{$R *.dfm}

uses uDm1, uDM2, uDM3, uBanco, uRastreio, uNotas, uLib;

procedure TControlL.FormActivate(Sender: TObject);
begin
  dtRoma.DateTime := Now - 1;
end;

procedure Atualiza;

var tot_reent, tot_devol, total, i : Integer;
    Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Controle_Mostra_Reent(ControlL.dtRoma.DateTime);
  Bco.Destroy;

  if (DM3.vcC4.RecordCount > 0) then
  begin
    tot_reent := 0;
    tot_devol := 0;
    total     := DM3.vcC4.RecordCount;


    DM3.vcC4.First;
    for i := 1 to total do
    begin

      if (DM3.vcC4tipotxt.Value = 'Reentrega') then tot_reent := tot_reent + 1
        else tot_devol := tot_devol + 1;
      DM3.vcC4.Next;
    end;

    ControlL.lbReent.Caption := IntToStr(tot_reent);
    ControlL.lbDevol.Caption := IntToStr(tot_devol);
    ControlL.lbTotal.Caption := IntToStr(total);

  end;
end;

procedure TControlL.btAtualClick(Sender: TObject);
begin
  Atualiza;
end;

procedure TControlL.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM3.vcC4idNF.Value);
  NotasP.AbreNf;
  NotasP.Show;


end;

procedure TControlL.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not (gdSelected in State) then
    if (DM3.vcC4tipotxt.Value = 'Reentrega') then
    begin
      JvDBGrid1.Canvas.Font.Color := clGray;
    end
    else
      JvDBGrid1.Canvas.Font.Color := clRed;

    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);

end;

procedure TControlL.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM3.vcC4.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ControlL do
   begin
     doc := 'Lista Reentregas';
     { carrega o arquivo }
     RelReent.Template.FileName := dirR+'\Rels\Reent.rtm';
     RelReent.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelReent.DeviceType := 'Screen';
     RelReent.ShowAutoSearchDialog  := False;
     RelReent.ShowCancelDialog := False;
     RelReent.ShowPrintDialog := False;
     RelReent.PrinterSetup.DocumentName := doc;

//     ppLabel17.Caption:= FormatDateTime('dd/MM/yyyy', DM1.cdsRomaDTROMA.Value);

     { imprime a ordem de serviço }
     RelReent.PrintReport;

     {Fecha os arquivos}
   end;
end;

procedure TControlL.btExcelClick(Sender: TObject);
  var usa : TMarco;
begin
  usa := TMarco.Create;
  usa.Exporta_Excel(',dtRoma,', DM3.vcC4);
  usa.Destroy;
end;

procedure TControlL.btImprimirClick(Sender: TObject);
begin
  Imprime;
end;

procedure TControlL.btReentClick(Sender: TObject);

var Bco : TBco;
    Rast: TRastreio;
    i, idNota : Integer;
    ok : boolean;

begin
  if MessageDlg('Este procedimento duplicará as Notas Selecionadas.'+#13+'Tem certeza que deseja criar essas Reentregas?'+ #13 +'(Notas com Reentrega existente não serão criadas)',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin

    if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

        idNota := DM3.vcC4idNF.Value;

        Bco := TBco.Create;
        Bco.Notas_MostraId(idNota);
        ok := Bco.Notas_Existe_Reentrega(idNota, DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.value);
        if Not(ok) then Bco.Notas_Reentrega(idNota);
        Bco.Destroy;
        // EVENTO NF - Rastreio
        if not ok then
        begin
          Rast := TRastreio.Create;
          Rast.set_ocor(DM1.cdsNotasNUMNF.Value, DM1.cdsNotasLIGCLI.Value, DM1.cdsNotasSERIENF.Value,  evrReent);
          Rast.Destroy;
        end;
      end;

  end;

end;

end.
