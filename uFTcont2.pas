unit uFTcont2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls,
  JvMemoryDataset, StdCtrls, Buttons;

type
  TFTcont2 = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    Tab: TJvMemoryData;
    TabSel: TBooleanField;
    TabNum: TIntegerField;
    TabRoma: TIntegerField;
    TabNotas: TIntegerField;
    TabTotalNF: TFloatField;
    Label1: TLabel;
    Label2: TLabel;
    lbCli: TLabel;
    lbMot: TLabel;
    btTodos: TBitBtn;
    btNenhum: TBitBtn;
    lbConta: TLabel;
    btSalvar: TBitBtn;
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btTodosClick(Sender: TObject);
    procedure btNenhumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
    procedure set_idMot(i : Integer);
    procedure set_Datas(d1, d2 : TDateTime);
    procedure Entra;
  end;

var
  FTcont2: TFTcont2;
  idCli, iDMot : Integer;
  dt1, dt2 : TDateTime;

implementation

{$R *.dfm}

uses uBanco, uDM3;


procedure TFTcont2.set_Datas(d1, d2: TDateTime);
begin
  dt1 := d1;
  dt2 := d2;
end;

procedure TFTcont2.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure TFTcont2.set_idMot(i: Integer);
begin
  idMot := i;
end;

procedure TFTcont2.Entra;

var Bco : TBco;

begin
{
  Bco := TBco.Create;
  Bco.FreteContratoDia_Romaneios(idCli, iDMot, dt1, dt2);
  Bco.Destroy;

  tab.EmptyTable;
  tab.Open;
  DM3.cdsRomaC.First;
  while not DM3.cdsRomaC.Eof do
  begin
    tab.Insert;
    TabSel.Value := False;
    TabNum.Value := DM3.cdsRomaCNUM.Value;
    TabRoma.Value:= DM3.cdsRomaCROMANEIO.AsInteger;
    TabNotas.Value := DM3.cdsRomaCCOUNT.Value;
    TabTotalNF.Value := DM3.cdsRomaCSUM.AsFloat;
    Tab.Post;
    DM3.cdsRomaC.Next;
  end;
  lbConta.Caption := IntToStr(Tab.RecordCount);
}  
end;

procedure TFTcont2.JvDBGrid1DblClick(Sender: TObject);
begin
  Tab.Edit;
  TabSel.Value := not TabSel.Value;
  Tab.Post;
end;


procedure Marca_tab(b : Boolean);

begin
  with FTCont2 do
  begin
    Tab.First;
    While not Tab.Eof do
    begin
      Tab.Edit;
      TabSel.Value := b;
      Tab.Post;

      Tab.Next;
    end;
    Tab.First;
  end;
end;
procedure TFTcont2.btTodosClick(Sender: TObject);
begin
  Marca_tab(true);
end;

procedure TFTcont2.btNenhumClick(Sender: TObject);
begin
  Marca_tab(False);
end;

end.
