unit uRel4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, ExtCtrls,
  Menus, ImgList, ComCtrls, Buttons, ComObj;

type
  TRel4 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbNF: TLabel;
    Label2: TLabel;
    lbNAO: TLabel;
    btExcel: TBitBtn;
    btAtual: TBitBtn;
    dtRel: TDateTimePicker;
    ImageList1: TImageList;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    procedure Button1Click(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure btAtualClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idRel(i : Integer);
    procedure Entrar;
  end;

var
  Rel4: TRel4;
  idRel : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM3, uBanco;

procedure TRel4.set_idRel(i: Integer);
begin
  idRel := i;
end;

procedure TRel4.Entrar;
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Relatorio_Notas(idRel);
  Bco.Destroy;

end;
procedure TRel4.Button1Click(Sender: TObject);
begin
  Entrar;
end;

procedure TRel4.btExcelClick(Sender: TObject);

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
 DM1.cdsRomaR.First;
 for linha := 0 to DM1.cdsRomaR.RecordCount - 1 do
 begin
   for coluna := 1 to DM1.cdsRomaR.FieldCount do
   begin
     if (coluna = 3) then
     begin
      if not (DM1.cdsRomaR.Fields[2].isNull) then
      begin
        //valorcampo := FormatDateTime('dd/MM/yyyy',DM1.cdsRomaR.Fields[2].AsDateTime);
        dt := DM1.cdsRomaR.Fields[2].AsDateTime;
        planilha.cells[linha + 2,coluna] :=  dt;
      end;
     end
     else
     begin
       valorcampo := DM1.cdsRomaR.Fields[coluna - 1].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna] :=  valorCampo;
     end;
   end;
   DM1.cdsRomaR.Next;
 end;
 // Títulos
 for coluna := 1 to DM1.cdsRomaR.FieldCount do
 begin
   valorcampo := DM1.cdsRomaR.Fields[coluna - 1].DisplayLabel;
   planilha.cells[1,coluna] := valorcampo;
 end;
 planilha.columns.Autofit;
end;


procedure TRel4.btAtualClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Romaneio_NotasRel(dtRel.DateTime);
  Bco.Destroy;
  lbNF.Caption := intToStr(DM1.cdsRomaR.RecordCount);
//  lbRoma.Caption := IntToStr(DM2.Conta('TB_ROMA', 'dtRoma = '+ QuotedStr( FormatDateTime('yyyy-MM-dd', dtRoma.DateTime))));


end;

procedure TRel4.FormActivate(Sender: TObject);
begin
  dtRel.DateTime := Now -1;
end;

end.
