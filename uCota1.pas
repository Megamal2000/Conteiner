unit uCota1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ExtCtrls, StdCtrls, JvExControls, JvArrowButton,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, DB, JvDataSource,
  JvExStdCtrls, JvEdit, JvValidateEdit, ImgList, ComObj;

type
  TCota1 = class(TForm)
    Panel1: TPanel;
    btNovo: TSpeedButton;
    PopupMenu1: TPopupMenu;
    Negociando1: TMenuItem;
    Aprovado1: TMenuItem;
    Reprovado1: TMenuItem;
    Bevel1: TBevel;
    cbCli: TComboBox;
    Label1: TLabel;
    btPesq: TSpeedButton;
    cbSt: TComboBox;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edDest: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    vlNum: TJvValidateEdit;
    Pesq2: TSpeedButton;
    Pesq3: TSpeedButton;
    ImageList1: TImageList;
    Cobrado1: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Pesq4: TSpeedButton;
    btExcel: TBitBtn;
    procedure btPesqClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure Pesq2Click(Sender: TObject);
    procedure Pesq3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Negociando1Click(Sender: TObject);
    procedure Aprovado1Click(Sender: TObject);
    procedure Reprovado1Click(Sender: TObject);
    procedure Cobrado1Click(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure Pesq4Click(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Padroes(pCli, pSt : Integer);
    procedure Entrar;
    procedure Pesquisar;
  end;

var
  Cota1: TCota1;
  padraoCli, padraoStatus: Integer;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco, uCota2;

procedure Pesquisa;

var Bco : TBco;

begin
  DM4.cdsCot.IndexName := '';
  Bco := Tbco.Create;
  Bco.Cotacao_Pesq(padraoCli, padraoStatus);
  Bco.Destroy;
end;

{ TCota1 }

procedure TCota1.Entrar;
begin
  cbCli.Clear;
  cbCli.Items.Append('[ Todos - Clientes ]');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome','');
  cbCli.ItemIndex := 0;
  cbSt.ItemIndex  := 0;
  dt1.DateTime := Now - 30;
  dt2.DateTime := Now;

  Pesquisa;
end;

procedure TCota1.Padroes(pCli, pSt: Integer);
begin
  padraoCli := pCli;
  padraoStatus := pSt;

end;

procedure TCota1.btPesqClick(Sender: TObject);
begin
  padraoCli := 0;
  if (cbCli.ItemIndex > 0) then
    padraoCli    := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');
  padraoStatus := cbST.ItemIndex;
  Pesquisa;
end;

procedure TCota1.btNovoClick(Sender: TObject);
begin
  Cota2.Entrar(1);
  Cota2.Show;
end;

procedure TCota1.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsCot.RecordCount > 0) then
  begin
    Cota2.Entrar(2);
    Cota2.Show;
  end;
end;

procedure TCota1.Pesquisar;
begin
  Pesquisa;
end;

procedure TCota1.Pesq2Click(Sender: TObject);
var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.Cotacao_PesqDEST(edDEST.Text);
  Bco.Destroy;
end;

procedure TCota1.Pesq3Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.Cotacao_MostraID(vlNum.Value);
  Bco.Destroy;
end;

procedure TCota1.FormActivate(Sender: TObject);
begin
  edDest.Text := '';
  vlNum.Value := 0;
end;

procedure TCota1.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.Field=DM4.cdsCotSTATUS then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);

    // Desenha o Quadrado 0=Negociando
    ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left-1,Rect.Top+1,0);

    // Desenha o check sobre o quadrado quando ativo = ‘S’
    if DM4.cdsCotSTATUS.Value = 1 then //1=Aprovado
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left-1,Rect.Top+1,1);
    if DM4.cdsCotSTATUS.Value = 2 then //2=reprovado
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left-1,Rect.Top+1,2);

  end;
end;

procedure Marca_Status(n : Smallint);

var Bco : TBco;

begin
  bco := TBco.Create;
  Bco.Cotacao_AltStatus(DM4.cdsCotID.Value, n);
  Bco.Destroy;
end;

procedure TCota1.Negociando1Click(Sender: TObject);
begin
  Marca_Status(0);
end;

procedure TCota1.Aprovado1Click(Sender: TObject);
begin
  Marca_Status(1);
end;

procedure TCota1.Reprovado1Click(Sender: TObject);
begin
  Marca_Status(2);
end;

procedure TCota1.Cobrado1Click(Sender: TObject);
begin
  Marca_Status(3);
end;

procedure TCota1.JvDBGrid1TitleClick(Column: TColumn);

var sIndeXName : String;
    Options:TIndexOptions;

begin
  // Marca a Coluna e Ordena
  if DM4.cdsCot.IndexName = Column.FieldName + '_ASC' then
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

  if (DM4.cdsCot.IndexDefs.IndexOf(sIndexName) < 0) then
    DM4.cdsCot.AddIndex(sIndexName, Column.FieldName, Options);

  DM4.cdsCot.IndexName := sIndexName;

end;

procedure TCota1.Pesq4Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.Cotacao_PesqDatas(dt1.DateTime, dt2.DateTime);
  Bco.Destroy;
end;

procedure Excel_Cotacao();

var linha, coluna : integer;
    planilha : variant;
    valorcampo : string;
    dt : TDateTime;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;


 // Títulos
 planilha.cells[1,1] := 'Cotação';
 planilha.cells[1,2] := 'Número NF';
 planilha.cells[1,3] := 'Valor NF';
 planilha.cells[1,4] := 'Quant Vol';
 planilha.cells[1,5] := 'Peso';
 planilha.cells[1,6] := 'CEP';
 planilha.cells[1,7] := 'Localidade';
 planilha.cells[1,8] := 'Valor Cotação';
 planilha.cells[1,9] := 'Data Serviço';
 planilha.cells[1,10] := 'Destinatário';
 planilha.cells[1,11] := 'Obs';
 planilha.cells[1,12] := 'Status';

 // Dados
 DM4.cdsCot.First;
 for linha := 0 to DM4.cdsCot.RecordCount - 1 do
 begin
   // Cotação = id
   valorcampo := DM4.cdsCot.Fields[0].AsString;
   planilha.cells[linha + 2,1] :=  valorCampo;

   // Cotação = id
   valorcampo := DM4.cdsCot.Fields[3].AsString;
   planilha.cells[linha + 2,2] :=  valorCampo;

   // Valor NF
   valorcampo := DM4.cdsCot.Fields[4].AsString;
   if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
   planilha.cells[linha + 2,3] :=  valorCampo;

   // Volume
   valorcampo := DM4.cdsCot.Fields[5].AsString;
   if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
   planilha.cells[linha + 2,4] :=  valorCampo;

   // Peso
   valorcampo := DM4.cdsCot.Fields[6].AsString;
   if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
   planilha.cells[linha + 2,5] :=  valorCampo;

   // CEP
   valorcampo := DM4.cdsCot.Fields[7].AsString;
   planilha.cells[linha + 2,6] :=  valorCampo;

   // LOCALIDADE
   valorcampo := DM4.cdsCot.Fields[18].AsString;
   planilha.cells[linha + 2,7] :=  valorCampo;

   // Valor Cotação
   valorcampo := DM4.cdsCot.Fields[11].AsString;
   if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
   planilha.cells[linha + 2,8] :=  valorCampo;

   // Data Serviço
   dt := DM4.cdsCot.Fields[19].AsDateTime;
   planilha.cells[linha + 2,9] :=  dt;

   // Destinatário
   valorcampo := DM4.cdsCot.Fields[16].AsString;
   planilha.cells[linha + 2,10] :=  valorCampo;

   // Status
   valorcampo := DM4.cdsCot.Fields[15].AsString;
   planilha.cells[linha + 2,11] :=  valorCampo;

   // Status
   valorcampo := DM4.cdsCot.Fields[12].AsString;
   planilha.cells[linha + 2,12] :=  valorCampo;
   DM4.cdsCot.Next;
 end;
 planilha.columns.Autofit;
end;


procedure TCota1.btExcelClick(Sender: TObject);
begin
  if (DM4.cdsCot.RecordCount > 0) then
    Excel_Cotacao;
end;

end.
