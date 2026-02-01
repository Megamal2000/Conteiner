unit uTikDev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Buttons, Menus;

type
  TTikDev = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label1: TLabel;
    Label3: TLabel;
    pqNum: TEdit;
    pqData: TDateTimePicker;
    btAtual: TBitBtn;
    Label4: TLabel;
    dvNum: TEdit;
    lbMsg: TLabel;
    PopupMenu1: TPopupMenu;
    Nodevolvida1: TMenuItem;
    N1: TMenuItem;
    Criarrecibotodas1: TMenuItem;
    CriarReciboSelecionadas1: TMenuItem;
    InserirNotanoRecibo1: TMenuItem;
    Label5: TLabel;
    lbNota: TLabel;
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
  TikDev: TTikDev;
  Erro : Smallint;
  conta1, conta2 : Integer;
  // Erros
  // 0=sem / 1=nao encontrada / 2=já recebida


implementation

{$R *.dfm}

uses uDM2, uDM3, uDM4, uBanco, uNotas;



procedure Conta();
begin
  Conta1 := 0;
  Conta2 := 0;

  DM3.cdsDev1.First;
  while not DM3.cdsDev1.Eof do
  begin
    if (DM3.cdsDev1STATUS_DEV.Value = 1) then Conta1 := Conta1 + 1;
    if (DM3.cdsDev1STATUS_DEV.Value = 2) then Conta2 := Conta2 + 1;

    DM3.cdsDev1.Next;
  end;

  TikDev.StatusBar1.Panels[0].Text := 'Não devolvidas '+IntToStr(Conta1);
  TikDev.StatusBar1.Panels[1].Text := 'Sem relatório '+IntToStr(Conta2);

end;


procedure Mostra;

var Bco : TBco;

begin
  // Mostrar todas as notas com status 1 (devolução) ou 2
  Bco := TBco.Create;
  Bco.NotasVolta_MostraDevol();
  Bco.Destroy;

  TikDev.lbNota.Caption := IntToStr(DM3.cdsDev1.RecordCount);
end;

procedure TTikDev.Entra;

var Bco : TBco;

begin
  // Mostra as notas com devolução e status_dev = 0
  // Altera o Status para 1
  //if (DM2.Conta('TB_NOTAF', 'status_dev = 0 or status_dev is null') > 0) then
  begin
    Bco := TBco.Create;
    Bco.NotasVolta_SelecionaDevol();
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
  TikDev.lbMsg.Caption := '';
  achei := false;
  DM3.cdsDev1.First;
  while not DM3.cdsDev1.Eof and not achei do
  begin
    // por número
    if (numNF = DM3.cdsDev1NUMNF.Value) then
      achei := true
    else
    DM3.cdsDev1.Next;
  end;

  if not achei then
  begin
    DM3.cdsDev1.First;
    Erro := 1;
    TikDev.lbMsg.Caption := 'Nota não encontrada nesta lista';
  end;

end;




procedure TTikDev.btAtualClick(Sender: TObject);

var Bco : TBco;

begin
  // Mostrar todas as notas com status 1 (devolução) ou 2
  Bco := TBco.Create;
  Bco.NotasVolta_MostraDevol();
  Bco.Destroy;
  Conta;
end;

procedure TTikDev.pqNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Pesquisa_Nota(StrToInt(pqNum.Text));
    pqNum.Text := '';
  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;

end;

function SoNumeros(no : String): Integer;

var i, p : Integer;
    s : String;
begin
  s := '';
  p := pos('-', no)-1;
  if (p > 0) then s := copy(no, 1, p) else s := no;
  i := StrToInt(s);
  SoNumeros := i;

end;

procedure TTikDev.dvNumKeyPress(Sender: TObject; var Key: Char);

var Bco : TBco;
    n : Integer;

begin
  Erro := 0;
  if (Key = #13) then
  begin
    Pesquisa_Nota(SoNumeros(dvNum.Text));

    if Erro = 1 then TikDev.lbMsg.Caption := 'Nota ( '+dvNum.Text+' ) não encontrada nesta lista';
    if Erro = 0 then TikDev.lbMsg.Caption := 'Nota ( '+dvNum.Text+' ) recebida ';

    if (Erro = 0) then
    begin
      Bco := Tbco.Create;
      Bco.NotasVolta_Marca(DM3.cdsDev1IDNF.Value, 2);
      Bco.NotasVolta_MostraDevol();
      Bco.Destroy;
      Mostra;
    end;  
    dvNum.Text := '';
  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;

end;

procedure TTikDev.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DM3.cdsDev1STATUS_DEV.Value = 2) then
  begin

    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;

end;

procedure TTikDev.Nodevolvida1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.NotasVolta_Marca(DM3.cdsDev1IDNF.Value, 1);
  Bco.NotasVolta_MostraDevol();
  Bco.Destroy;
end;

Procedure Todas;

var Bco : TBco;
    idDev : Integer;

begin
  Bco := TBco.Create;
  idDev := Bco.VoltaDev_Inserir();
  Bco.Destroy;

  DM3.cdsDev1.First;
  while not DM3.cdsDev1.Eof do
  begin
    if (DM3.cdsDev1STATUS_DEV.Value = 2) then
    begin
      Bco := TBco.Create;
      Bco.VoltaDev_AdicionaItem(idDev, DM3.cdsDev1IDNF.Value);
      Bco.NotasVolta_Marca(DM3.cdsDev1IDNF.Value, 3);
      Bco.Destroy;
    end;
    DM3.cdsDev1.Next;
  end;
end;


procedure TTikDev.Criarrecibotodas1Click(Sender: TObject);

begin
  Conta;
  if (Conta2 > 0) then
  begin
    Todas;
    Mostra;
    Conta;
  end
  else
    ShowMessage('Nenhuma Nota DEVOLVIDA');  

end;

procedure TTikDev.CriarReciboSelecionadas1Click(Sender: TObject);

var Bco : TBco;
    i, idDev : Integer;

begin
  Bco := TBco.Create;
  idDev:= Bco.VoltaDev_Inserir();
  Bco.Destroy;

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        if (DM3.cdsDev1STATUS_DEV.Value = 2) then
        begin
          Bco := TBco.Create;
          Bco.VoltaDev_AdicionaItem(idDev, DM3.cdsDev1IDNF.Value);
          Bco.NotasVolta_Marca(DM3.cdsDev1IDNF.Value, 3);
          Bco.Destroy;
        end
          else ShowMessage('Nota '+DM3.cdsDev1NUMNF.AsString+' não devolvida ');  
      end;
  Mostra;
  Conta;
end;


procedure TTikDev.InserirNotanoRecibo1Click(Sender: TObject);
var Bco : TBco;
    i, idDev : Integer;

begin
  Bco := TBco.Create;
  Bco.VoltaDev_MostraUlt(1);
  Bco.Destroy;

  idDev := DM3.cdsDev2NUMDEV.Value;

  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        if (DM3.cdsDev1STATUS_DEV.Value = 2) then
        begin
          Bco := TBco.Create;
          Bco.VoltaDev_AdicionaItem(idDev, DM3.cdsDev1IDNF.Value);
          Bco.NotasVolta_Marca(DM3.cdsDev1IDNF.Value, 3);
          Bco.Destroy;
        end
          else ShowMessage('Nota '+DM3.cdsDev1NUMNF.AsString+' não devolvida ');  
      end;
  Mostra;
  Conta;
end;

procedure TTikDev.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM3.cdsDev1IDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
