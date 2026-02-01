unit uRomaRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, ComObj, ComCtrls;

type
  TRomaRes = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    lbNF: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    lbRoma: TLabel;
    btExcel: TBitBtn;
    btAtual: TBitBtn;
    dtRoma: TDateTimePicker;
    cbCli: TComboBox;
    procedure btExcelClick(Sender: TObject);
    procedure btAtualClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  RomaRes: TRomaRes;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco;





procedure TRomaRes.btExcelClick(Sender: TObject);

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

procedure TRomaRes.Entrar;

var idCli : Integer;

begin
  cbCli.Clear;
  cbCli.Items.Append('<Todos>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  idCli := DM2.get_cliNum;
  
  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli),'Nome');
end;

procedure TRomaRes.btAtualClick(Sender: TObject);

var Bco : TBco;
    idCli : Integer;

begin

  if (cbCli.ItemIndex = 0) then idCli := 0;
  if (cbCli.ItemIndex > 0) then
      idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

  Bco := TBco.Create;
  Bco.Romaneio_NotasR(dtRoma.DateTime, idCli);
  Bco.Destroy;
  lbNF.Caption := intToStr(DM1.cdsRomaR.RecordCount);
  lbRoma.Caption := IntToStr(DM2.Conta('TB_ROMA', 'dtRoma = '+ QuotedStr( FormatDateTime('yyyy-MM-dd', dtRoma.DateTime))));
end;

procedure TRomaRes.FormActivate(Sender: TObject);
begin
  dtRoma.DateTime := Now - 1;
end;

end.
