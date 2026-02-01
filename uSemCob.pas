unit uSemCob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, DB, JvDataSource;

type
  TSemCob = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btSemBaixa: TBitBtn;
    btDevolvidos: TBitBtn;
    btSemCob: TBitBtn;
    Pesquisar: TBitBtn;
    lbSemCob: TLabel;
    lbDevolvidos: TLabel;
    lbSembaixa: TLabel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    procedure dat1Change(Sender: TObject);
    procedure PesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;

  end;

var
  SemCob: TSemCob;
  dia1, dia2 : TDateTime;

implementation

{$R *.dfm}

uses uBanco, uDM4;

procedure Limpar();
begin
  with SemCob do
  begin
    lbSemCob.Caption     := '';
    lbDevolvidos.Caption := '';
    lbSembaixa.Caption   := '';
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := '';

  end;
end;


{ TSemCob }

procedure TSemCob.Entrar;
begin
  Limpar;
  dat1.DateTime := Now - 7;
  dat2.DateTime := Now;
end;

procedure TSemCob.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 7;
end;

procedure Pesq(d1,d2 : TDateTime);

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.NotasSC_MostraCob(d1,d2);
  semCob.lbDevolvidos.Caption := IntToStr(Bco.NotasSC_ContaDevol(d1,d2));
  Bco.Destroy;

  semCob.lbSemCob.Caption := IntToStr(DM4.cdsSCob.RecordCount);
end;


procedure TSemCob.PesquisarClick(Sender: TObject);
begin
  dia1 := dat1.DateTime;
  dia2 := dat2.DateTime;

  StatusBar1.Panels[0].Text := 'Pesquisa de '+FormatDateTime('dd/MMM/yy', dia1) + ' até '+FormatDateTime('dd/MMM/yy', dia2);
  Pesq(dia1, dia2);

end;

end.
