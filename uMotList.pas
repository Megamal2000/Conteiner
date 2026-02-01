unit uMotList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, ExtCtrls, DB,
  JvDataSource, StdCtrls, ComObj, Buttons;

type
  TMotList = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btExcel: TBitBtn;
    Label1: TLabel;
    btSelA: TBitBtn;
    btSelD: TBitBtn;
    ckAtivos: TCheckBox;
    procedure btExcelClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSelAClick(Sender: TObject);
    procedure btSelDClick(Sender: TObject);
    procedure ckAtivosClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  MotList: TMotList;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM4, ucadFuncs;

{ TMotList }

procedure AlterarStatus(ativo:Integer);
  var i : Integer;
begin
  with MotList do
  begin
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        DM2.Altera_Status('TB_FUNCS', 'ATIVO', DM4.cdsMotID.Value, ativo);
      end;
  end;
end;

procedure TMotList.btSelAClick(Sender: TObject);
begin
  AlterarStatus(1);
end;

procedure TMotList.btSelDClick(Sender: TObject);
begin
  AlterarStatus(0);
end;

procedure TMotList.ckAtivosClick(Sender: TObject);
  var Bco : TBco;
begin
  Bco := TBco.Create;

  if (ckAtivos.Checked) then
    Bco.Funcs_ListaFat(1)
  else
    Bco.Funcs_ListaFat(0);

  Bco.Destroy;

end;

procedure TMotList.Entrar;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Funcs_ListaMotoristas;
  Bco.Destroy;
end;

procedure TMotList.JvDBGrid1DblClick(Sender: TObject);
begin
  cadFuncs.set_idFuncs(DM4.cdsMotID.Value);
  cadFuncs.Show;
end;

procedure TMotList.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
if (DM4.cdsMotATIVO.Value = 0) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TMotList.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM4.cdsMot.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TMotList.btExcelClick(Sender: TObject);

var linha, coluna : integer;
    planilha : variant;
    valorcampo : string;
    dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

 // Dados
 DM4.cdsMot.First;
 for linha := 0 to DM4.cdsMot.RecordCount - 1 do
 begin
   for coluna := 1 to DM4.cdsMot.FieldCount  - 1 do
   begin
     if (coluna = 4) or (coluna = 5) then
     begin
      if not (DM4.cdsMot.Fields[coluna-1].isNull) then
      begin
        //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
        dt := DM4.cdsMot.Fields[coluna-1].AsDateTime;
        planilha.cells[linha + 2,coluna] :=  dt;
      end;
     end
     else
     begin
       valorcampo := DM4.cdsMot.Fields[coluna - 1].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna] :=  valorCampo;
     end;
   end;
   DM4.cdsMot.Next;
 end;
 // Títulos
 for coluna := 1 to DM4.cdsMot.FieldCount do
 begin
   valorcampo := DM4.cdsMot.Fields[coluna - 1].DisplayLabel;
   planilha.cells[1,coluna] := valorcampo;
 end;
 planilha.columns.Autofit;

end;

end.
