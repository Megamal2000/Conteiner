unit uNivel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, JvMemoryDataset, ComCtrls,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, ComObj;

type
  TNivel = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    JvDBGrid1: TJvDBGrid;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    dia1: TDateTimePicker;
    dia2: TDateTimePicker;
    DataSource1: TDataSource;
    Tab: TJvMemoryData;
    TabDias: TSmallintField;
    TabNotas: TIntegerField;
    TabPorcentagem: TFloatField;
    btPesq: TBitBtn;
    lbTot: TLabel;
    btExcel: TBitBtn;
    procedure btPesqClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Nivel: TNivel;

implementation

{$R *.dfm}

uses uEstatistica, uDM2;

procedure TNivel.Entrar;
begin
  dia1.DateTime := Now - 30;
  dia2.DateTime := Now;
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  cbCli.ItemIndex := 1;
end;

procedure Excel_Nivel();

var linha, coluna, x : integer;
    planilha : variant;
    valorcampo : string;
    dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

 planilha.WorkBooks[1].Sheets[1].Cells[1,2]:= 'Transportes Flaydel';
 planilha.WorkBooks[1].Sheets[1].Cells[2,2]:= Now;
 // Títulos
 planilha.cells[4,2] := 'Dias';
 planilha.cells[4,3] := 'Notas';
 planilha.cells[4,4] := 'Porcentagem';

 // Dados
 Nivel.tab.First;
 for linha := 0 to Nivel.tab.RecordCount - 1 do
 begin
   // DIA
   valorcampo := Nivel.Tab.Fields[0].AsString;
   planilha.cells[linha + 5,2] :=  valorCampo;

   // Notas
   valorcampo := Nivel.Tab.Fields[1].AsString;
   planilha.cells[linha + 5,3] :=  valorCampo;

   // Porcentagem
   valorcampo :=  FormatFloat('##0.0', Nivel.Tab.Fields[2].AsVariant);
   if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
   planilha.cells[linha + 5,4] :=  valorCampo;

   Nivel.Tab.Next;
 end;
  // Formata os cabeçalhos

  for x:=1 to 10 do
  begin
    planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
    planilha.WorkBooks[1].Sheets[1].Cells[4,x].Font.Color := clNavy;
  end;

    // Linas 1 e 2
  planilha.WorkBooks[1].Sheets[1].Cells[1,2].Font.Size := 16;
  planilha.WorkBooks[1].Sheets[1].Cells[2,2].Font.Color:= clBlue;

 planilha.columns.Autofit;
end;


procedure TNivel.btPesqClick(Sender: TObject);

var Estat : TEstat;
    idC : integer;
    x : Integer;

begin
  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

  Estat := TEstat.Create;
  Estat.Inicio;
  Estat.set_idCli(idC);
  Estat.set_dt1(dia1.DateTime);
  Estat.set_dt2(dia2.DateTime);
  Estat.Nivel_Entregas;
  Estat.Nivel_Analise;

  Tab.Active := false;
  Tab.EmptyTable;
  Tab.Active := true;

  for x:= 15 downto 0 do
  begin
     if (Estat.get_dia(x) > 0)  then
     begin
       Tab.Insert;
       TabDias.Value  := x;
       TabNotas.Value := Estat.get_dia(x);
       TabPorcentagem.Value := (100 *Estat.get_dia(x) ) / Estat.get_Tot;
       Tab.Post;
     end;

  end;
  lbTot.Caption := IntToStr( Estat.get_Tot() );
  Estat.Destroy;
end;

procedure TNivel.btExcelClick(Sender: TObject);
begin
  Excel_Nivel;
end;

end.
