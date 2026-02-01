unit uAvisoPQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid;

type
  TAvisoPQ = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edDescr: TEdit;
    btPesq: TBitBtn;
    Label2: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    Label3: TLabel;
    cbVer: TComboBox;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    procedure btPesqClick(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure edDescrKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AvisoPQ: TAvisoPQ;

implementation

{$R *.dfm}

uses uBanco, uDM4, uAvisoCfg;

procedure TAvisoPQ.btPesqClick(Sender: TObject);

var Bco : TBco;

begin
  if (edDescr.Text <> '') then
  begin
    Bco := TBco.Create;
    Bco.Aviso_PQdescr(edDescr.Text);
    Bco.Destroy;
  end
  else
  begin
    Bco := TBco.Create;
    Bco.Aviso_PQdatas(dat1.DateTime, dat2.DateTime);
    Bco.Destroy;
  end;

end;

procedure TAvisoPQ.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 7;
  edDescr.Text := '';
end;

procedure TAvisoPQ.edDescrKeyPress(Sender: TObject; var Key: Char);

var Bco : TBco;

begin
  if (key = #13) then
  if (edDescr.Text <> '') then
  begin
    Bco := TBco.Create;
    Bco.Aviso_PQdescr(edDescr.Text);
    Bco.Destroy;
  end;
end;

procedure TAvisoPQ.JvDBGrid1DblClick(Sender: TObject);
begin
  AvisoCfg.set_idAg(DM4.cdsPQavIDAG.Value);
  AvisoCfg.Carregar;
  AvisoCfg.Show;
end;

end.
