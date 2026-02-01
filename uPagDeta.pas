unit uPagDeta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppCtrls, ppBands, ppStrtch, ppSubRpt, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter, ppModule, raCodMod, ppVar;

type
  TPagDeta = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    Label1: TLabel;
    cbMot: TComboBox;
    Label2: TLabel;
    dia1: TDateTimePicker;
    dia2: TDateTimePicker;
    btMostrar: TBitBtn;
    btImp: TBitBtn;
    Label3: TLabel;
    lbNR: TLabel;
    Label5: TLabel;
    lbNNF: TLabel;
    RelPagD: TppReport;
    ppDBPipeline1: TppDBPipeline;
    JvDataSource3: TJvDataSource;
    ppDBPipeline2: TppDBPipeline;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLbMot: TppLabel;
    ppLabel3: TppLabel;
    ppLbDT1: TppLabel;
    ppLbDT2: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine1: TppLine;
    raCodeModule1: TraCodeModule;
    raCodeModule2: TraCodeModule;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    procedure dia1Change(Sender: TObject);
    procedure btMostrarClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  PagDeta: TPagDeta;


implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5;

procedure Limpar();
begin
  with PagDeta do
  begin
    lbNR.Caption := '0';
    lbNNf.Caption := '0';
    dia1.DateTime := Now - 15;
    dia2.DateTime := Now;
  end;
end;

procedure Imprimir_RelDetalhes();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with PagDeta do
   begin
     doc := 'Detalhes de Ocorrências';
     { carrega o arquivo }
     RelPagD.Template.FileName := dirR+'\Rels\RelPagD.rtm';
     RelPagD.Template.LoadFromFile;
     { Configurações do tipo de impressão }
     RelPagD.DeviceType := 'Screen';
     RelPagD.ShowAutoSearchDialog  := False;
     RelPagD.ShowCancelDialog := False;
     RelPagD.ShowPrintDialog := False;
     RelPagD.PrinterSetup.DocumentName := doc;

     ppLbDT1.Caption:= FormatDateTime('dd/MM/yyyy', dia1.DateTime);
     ppLbDT2.Caption:= FormatDateTime('dd/MM/yyyy', dia2.DateTime);
     ppLbMOT.Caption:= cbMot.Items[cbMot.ItemIndex];
     { imprime }
     RelPagD.PrintReport;

     {Fecha os arquivos}
   end;

end;


{ TPagDeta }

procedure TPagDeta.btImpClick(Sender: TObject);
begin
  Imprimir_RelDetalhes;
end;

procedure TPagDeta.btMostrarClick(Sender: TObject);
var idMot, tot : Integer;
    dt1, dt2 : TDateTime;
    Bco : TBco;

begin
  // Entradas
  idMot := DM2.DBCp_leid(cbMot.Items[cbMot.ItemIndex], 'TB_FUNCS','NOME');
  dt1   := dia1.Date;
  dt2   := dia2.Date;

  Bco := TBco.Create;
  Bco.Funcs_Detalhes_Mostrar1(idMot, dt1, dt2);
  Bco.Funcs_Detalhes_Mostrar2(idMot, dt1, dt2);
  Bco.Funcs_Detalhes_Mostrar3(idMot, dt1);
  Bco.Destroy;

  // Conta
  if (DM5.cdsfuD1.RecordCount>0) then
  begin
    tot := 0;
    DM5.cdsfuD1.First;
    while not DM5.cdsfuD1.Eof do
    begin
      tot := tot + DM5.cdsfuD1QTNOTAS.Value;
      DM5.cdsfuD1.Next;
    end;

    lbNR.Caption := DM5.cdsfuD1.RecordCount.ToString;
    lbNNF.Caption := tot.ToString;
  end;
end;

procedure TPagDeta.dia1Change(Sender: TObject);
begin
  dia2.DateTime := dia1.DateTime + 15;
end;

procedure TPagDeta.Entrar;
begin
  Limpar;
  cbMot.Clear;
  DM2.DBCb_Preenche(cbMot, 'TB_FUNCS', 'NOME', 'TIPO = 1 and ATIVO=1');
  cbMot.ItemIndex := 0;
end;

procedure TPagDeta.JvDBGrid1CellClick(Column: TColumn);
var idMot : Integer;
    dt1 : TDateTime;
    Bco : TBco;

begin
  // Entradas
  idMot := DM2.DBCp_leid(cbMot.Items[cbMot.ItemIndex], 'TB_FUNCS','NOME');
  dt1   := DM5.cdsfuD1DTROMA.AsDateTime;

  Bco := TBco.Create;
  Bco.Funcs_Detalhes_Mostrar3(idMot, dt1);
  Bco.Destroy;
end;

procedure TPagDeta.JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DM5.cdsfuD3NOCORR.Value=20) then
  if not (gdSelected in State) then
  begin
    JvDBGrid2.Canvas.Brush.Color := clYellow;
    //JvDBGrid2.Canvas.Font.Style := JvDBGrid2.Canvas.Font.Style + [fsitalic];
    //JvDBGrid2.Canvas.Font.Color := clGray;
    JvDBGrid2.Canvas.FillRect(rect);
    JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

end.
