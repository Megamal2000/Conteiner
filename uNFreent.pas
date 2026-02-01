unit uNFreent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, JvDataSource, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, StdCtrls, Buttons, ComCtrls, JvMemoryDataset, JvExControls,
  JvSpecialProgress;

type
  TNFreent = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtR: TDateTimePicker;
    btPesq: TBitBtn;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    pg: TJvSpecialProgress;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  NFreent: TNFreent;

implementation

{$R *.dfm}

uses uBanco, uDM4, uNotasPQ;

{ TNFreent }

procedure Pesq_dia(dt:TdateTime);

var Bco : TBco;
    s : String;


begin
  Bco := TBco.Create;
  Bco.NotasReent_MostraDia(dt);
  Bco.Destroy;

  s := '';
  if (DM4.cdsNFre2.RecordCount > 0) then
  begin
    DM4.cdsNFre2.First;
    while not DM4.cdsNFre2.Eof do
    begin
      s := s + 'Reent['+DM4.cdsNFre2CONTAREENT.AsString+']: '+DM4.cdsNFre2QT.AsString+ ' notas / ';
      DM4.cdsNFre2.Next;
    end;
  end;
  NFreent.Panel2.Caption := '>> ' + s;

end;


procedure TNFreent.Entrar;
begin
  Pesq_Dia(Now);
  dtR.DateTime := Now;
end;

procedure TNFreent.btPesqClick(Sender: TObject);
begin
  Pesq_dia(dtR.DateTime);
end;

procedure TNFreent.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsNFre.RecordCount > 0) then
  begin
    NotasPQ.Label2.Caption := DM4.cdsNFreNUMNF.AsString;
    NotasPQ.SHow;
  end;  
end;

end.
