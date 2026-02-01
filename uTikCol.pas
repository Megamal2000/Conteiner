unit uTikCol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, DB,
  JvDataSource, StdCtrls, Buttons, ExtCtrls;

type
  TTikCol = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    pqNum: TEdit;
    pqData: TDateTimePicker;
    btAtual: TBitBtn;
    Panel2: TPanel;
    Label4: TLabel;
    lbMsg: TLabel;
    dvNum: TEdit;
    JvDBGrid1: TJvDBGrid;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Nodevolvida1: TMenuItem;
    N1: TMenuItem;
    Criarrecibotodas1: TMenuItem;
    CriarReciboSelecionadas1: TMenuItem;
    InserirNotanoRecibo1: TMenuItem;
    JvDataSource1: TJvDataSource;
    Label5: TLabel;
    lbCols: TLabel;
    procedure btAtualClick(Sender: TObject);
    procedure pqNumKeyPress(Sender: TObject; var Key: Char);
    procedure dvNumKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Nodevolvida1Click(Sender: TObject);
    procedure Criarrecibotodas1Click(Sender: TObject);
    procedure CriarReciboSelecionadas1Click(Sender: TObject);
    procedure InserirNotanoRecibo1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entra;
  end;

var
  TikCol: TTikCol;
  Conta1, Conta2 : Integer;
  Erro : Smallint;

implementation

{$R *.dfm}

uses uDM4, uDM2, uBanco, uNotas;

procedure Conta();
begin
  Conta1 := 0;
  Conta2 := 0;

  while not DM4.cdsCol.Eof do
  begin
    if (DM4.cdsColSTATUS_DEV.Value = 7) then Conta1 := Conta1 + 1;
    if (DM4.cdsColSTATUS_DEV.Value = 8) then Conta2 := Conta2 + 1;

    DM4.cdsCol.Next;
  end;

  TikCol.StatusBar1.Panels[0].Text := 'Não devolvidas '+IntToStr(Conta1);
  TikCol.StatusBar1.Panels[1].Text := 'Sem relatório '+IntToStr(Conta2);

end;


procedure Mostra;

var Bco : TBco;

begin
  // Mostrar todas as coletas com status 7 (devolução) ou 8
  Bco := TBco.Create;
  Bco.NotasVolta_MostraColetas();
  Bco.Destroy;

  TikCol.lbCols.Caption := IntToStr(DM4.cdsCol.RecordCount);
end;
{ TTikCol }

procedure TTikCol.Entra;
var Bco : TBco;

begin
  // Mostra as notas com devolução e status_dev = 0
  // Altera o Status para 1
  if (DM2.Conta('TB_NOTAF', 'origem = 2 and (STATUS_DEV = 0 or STATUS_DEV is NULL)') > 0) then
  begin
    Bco := TBco.Create;
    Bco.NotasVolta_SelecionaColeta();
    Bco.Destroy;
  end;

  // Mostrar todas as notas com status 1 (devolução) ou 2
  Mostra;
  Conta;
end;

procedure Pesquisa_Nota(numNF : Integer);

var num : Integer;
    achei : boolean;

begin
  TikCol.lbMsg.Caption := '';
  achei := false;
  DM4.cdsCol.First;
  while not DM4.cdsCol.Eof and not achei do
  begin
    // por número
    if (numNF = DM4.cdsColNUMNF.Value) then
      achei := true
    else
    DM4.cdsCol.Next;
  end;

  if not achei then
  begin
    DM4.cdsCol.First;
    Erro := 1;
    TikCol.lbMsg.Caption := 'Nota não encontrada nesta lista';
  end;

end;


procedure TTikCol.btAtualClick(Sender: TObject);
var Bco : TBco;

begin
  // Mostrar todas as Coletas com status 7 (devolução) ou 8
  Mostra;  
  Conta;
end;

procedure TTikCol.pqNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Pesquisa_Nota(StrToInt(pqNum.Text));
    pqNum.Text := '';
  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;

end;

procedure TTikCol.dvNumKeyPress(Sender: TObject; var Key: Char);
var Bco : TBco;

begin
  Erro := 0;
  if (Key = #13) then
  begin
    Pesquisa_Nota(StrToInt(dvNum.Text));

    if Erro = 1 then TikCol.lbMsg.Caption := 'Coleta ( '+dvNum.Text+' ) não encontrada nesta lista';
    if Erro = 0 then TikCol.lbMsg.Caption := 'Coleta ( '+dvNum.Text+' ) recebida ';

    if (Erro = 0) then
    begin
      Bco := Tbco.Create;
      Bco.NotasVolta_Marca(DM4.cdsColIDNF.Value, 8);
      Bco.NotasVolta_MostraColetas();
      Bco.Destroy;
      Mostra;
    end;  
    dvNum.Text := '';
  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;
end;

procedure TTikCol.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DM4.cdsColSTATUS_DEV.Value = 8) then
  begin
    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TTikCol.Nodevolvida1Click(Sender: TObject);
var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.NotasVolta_Marca(DM4.cdsColIDNF.Value, 7);
  Bco.NotasVolta_MostraColetas();
  Bco.Destroy;

end;

Procedure Todas;

var Bco : TBco;
    idCol : Integer;

begin
  Bco := TBco.Create;
  idCol := Bco.VoltaCol_Inserir();
  Bco.Destroy;

  DM4.cdsCol.First;
  while not DM4.cdsCol.Eof do
  begin
    if (DM4.cdsColSTATUS_DEV.Value = 8) then
    begin
      Bco := TBco.Create;
      Bco.VoltaCol_AdicionaItem(idCol, DM4.cdsColIDNF.Value);
      Bco.NotasVolta_Marca(DM4.cdsColIDNF.Value, 9);
      Bco.Destroy;
    end;
    DM4.cdsCol.Next;
  end;
end;



procedure TTikCol.Criarrecibotodas1Click(Sender: TObject);
begin
  if (Conta2 > 0) then
  begin
    Todas;
    Mostra;
    Conta;
  end
  else
    ShowMessage('Nenhuma Coleta DEVOLVIDA');
end;

procedure TTikCol.CriarReciboSelecionadas1Click(Sender: TObject);
var Bco : TBco;
    i, idCol : Integer;

begin
  Bco := TBco.Create;
  idCol:= Bco.VoltaCol_Inserir();
  Bco.Destroy;

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        if (DM4.cdsColSTATUS_DEV.Value = 8) then
        begin
          Bco := TBco.Create;
          Bco.VoltaCol_AdicionaItem(idCol, DM4.cdsColIDNF.Value);
          Bco.NotasVolta_Marca(DM4.cdsColIDNF.Value, 9);
          Bco.Destroy;
        end
          else ShowMessage('Coleta '+DM4.cdsColNUMNF.AsString+' não devolvida ');
      end;


end;

procedure TTikCol.InserirNotanoRecibo1Click(Sender: TObject);
var Bco : TBco;
    i, idCol : Integer;

begin
  Bco := TBco.Create;
  Bco.VoltaCol_MostraUlt(1);
  Bco.Destroy;

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        if (DM4.cdsColSTATUS_DEV.Value = 8) then
        begin
          Bco := TBco.Create;
          Bco.VoltaCol_AdicionaItem(idCol, DM4.cdsColIDNF.Value);
          Bco.NotasVolta_Marca(DM4.cdsColIDNF.Value, 9);
          Bco.Destroy;
        end
          else ShowMessage('Coleta '+DM4.cdsColNUMNF.AsString+' não devolvida ');
      end;

end;

procedure TTikCol.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM4.cdsColIDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
