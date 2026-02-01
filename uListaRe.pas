unit uListaRe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, ComObj;

type
  TListaRe = class(TForm)
    Rodape: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    dtR: TDateTimePicker;
    btPesq: TBitBtn;
    DataSource1: TDataSource;
    btrefaz: TSpeedButton;
    btExcel: TSpeedButton;
    procedure btPesqClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btrefazClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaRe: TListaRe;

implementation

{$R *.dfm}

uses uBanco, uDM3, uDM2, uNotas;

procedure TListaRe.btPesqClick(Sender: TObject);

var Bco : TBco;
    nao : Integer;

begin
  Bco := TBco.Create;
  Bco.Notas_ListaReent(dtR.DateTime);
  bco.Destroy;

  nao := 0;
  DM3.cdsProx.First;
  while not DM3.cdsProx.Eof do
  begin
    if (DM3.cdsProxPROX.AsInteger = 0) then nao := nao + 1;
    DM3.cdsProx.Next;
  end;
  DM3.cdsProx.First;

  ListaRe.Rodape.Panels[0].Text := 'Encontradas '+IntToStr(DM3.cdsProx.RecordCount)+' reentregas';
  ListaRe.Rodape.Panels[1].Text := 'Não encaminhadas: '+IntToStr(nao)+' ';

end;

procedure TListaRe.FormActivate(Sender: TObject);
begin
  dtR.DateTime := Now;

end;

procedure TListaRe.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not (gdSelected in State) then
    if (DM3.cdsProxProx.AsInteger = 0) then
    begin
      JvDBGrid1.Canvas.Font.Color := clRed;
    end
    else
      JvDBGrid1.Canvas.Font.Color := clGray;

    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
end;

procedure TListaRe.btExcelClick(Sender: TObject);

var linha, coluna, linha2 : integer;
    planilha : variant;
    valorcampo : string;
    dt : TDateTime;

begin
 if (DM3.cdsProx.RecordCount > 0) then
 begin
   planilha:= CreateoleObject('Excel.Application');
   planilha.WorkBooks.add(1);
   planilha.caption := 'Exportando dados do dbGrid para o Excel';
   planilha.visible := true;

   // Dados
   DM3.cdsProx.First;
   for linha := 0 to DM3.cdsProx.RecordCount - 1 do
   begin
     for coluna := 1 to DM3.cdsProx.FieldCount do
     if (DM3.cdsProxProx.AsInteger = 0) then
     begin
         valorcampo := DM3.cdsProx.Fields[coluna - 1].AsString;
         if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
         planilha.cells[linha + 3,coluna] :=  valorCampo;
     end;
     DM3.cdsProx.Next;
   end;

   // Títulos
   for coluna := 1 to DM3.cdsProx.FieldCount do
   begin
     valorcampo := DM3.cdsProx.Fields[coluna - 1].DisplayLabel;
     planilha.cells[2,coluna] := valorcampo;
   end;
   planilha.columns.Autofit;
     // 1a Linha
     valorcampo := 'FLAYDEL LOG - Notas Pendentes '+FormatDateTime('dd/MM/yyyy ddd',Now);
     planilha.cells[1,1] := valorcampo;

 end
 else ShowMessage('Sem dados');
end;

procedure TListaRe.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM3.cdsProxIDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TListaRe.btrefazClick(Sender: TObject);

var Bco : TBco;

begin
  if DM3.cdsProx.RecordCount> 0 then
  begin
    Bco := TBco.Create;
    DM3.cdsProx.First;
    while not DM3.cdsProx.Eof do
    begin
      if DM3.cdsProxPROXROMA.Value = 0 then
        Bco.Notas_RefazProxRoma(DM3.cdsProxNUMNF.Value,DM3.cdsProxLIGCLI.Value);

      DM3.cdsProx.Next;
    end;
    bco.Destroy ;
  end;
end;

end.
