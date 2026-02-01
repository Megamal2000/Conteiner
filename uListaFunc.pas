unit uListaFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons,
  ExtCtrls, ppPrnabl, ppClass, ppCtrls, ppBands, ppDB, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDBPipe, ppDesignLayer, ppParameter;

type
  TListaFunc = class(TForm)
    Panel1: TPanel;
    btMostrar: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    btExcel: TBitBtn;
    BitBtn1: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    procedure btMostrarClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaFunc: TListaFunc;

implementation

{$R *.dfm}

uses uBanco, uDM3, ComObj;

procedure TListaFunc.btMostrarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Funcs_Lista;
  Bco.Destroy;
end;

procedure TListaFunc.btExcelClick(Sender: TObject);
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

 // Dados
 DM3.cdsFuncLi.First;
 for linha := 0 to DM3.cdsFuncLi.RecordCount - 1 do
 begin
   for coluna := 1 to DM3.cdsFuncLi.FieldCount do
   if (coluna in [6,5,8,11]) then
   begin
       dt := DM3.cdsFuncLi.Fields[coluna - 1].AsDateTime;
       planilha.cells[linha + 2,coluna] :=  dt;
   end
   else
   begin
       valorcampo := DM3.cdsFuncLi.Fields[coluna - 1].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna] :=  valorCampo;
    end;
   DM3.cdsFuncLi.Next;
 end;
 // Títulos
 for coluna := 1 to DM3.cdsFuncLi.FieldCount do
 begin
   valorcampo := DM3.cdsFuncLi.Fields[coluna - 1].DisplayLabel;
   planilha.cells[1,coluna] := valorcampo;
 end;
 planilha.columns.Autofit;
end;


end.
