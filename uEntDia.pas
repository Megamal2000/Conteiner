unit uEntDia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, DB, ExtCtrls;

type
  TEntDia = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DiaE: TDateTimePicker;
    Shape1: TShape;
    Label2: TLabel;
    DataSource1: TDataSource;
    JvDBGrid1: TJvDBGrid;
    StatusBar1: TStatusBar;
    btPesq: TBitBtn;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntDia: TEntDia;

implementation

{$R *.dfm}

uses uBanco, uDM4;

procedure TEntDia.btPesqClick(Sender: TObject);

var Bco : TBco;
    soma : double;
begin
  Bco := TBco.Create;
  Bco.Notas_MostraDia_Cli(diaE.DateTime);
  Bco.Destroy;

  soma := 0 ;
  DM4.cdsOrig.First;
  if (DM4.cdsOrig.RecordCount > 0) then
    while not(DM4.cdsOrig.Eof) do
    begin
      soma := soma + DM4.cdsOrigNOTAS.Value;
      DM4.cdsOrig.Next;
    end;  

  StatusBar1.Panels[0].Text := 'Total de Notas = '+FormatFloat('#,##0', soma);

end;

procedure TEntDia.JvDBGrid1CellClick(Column: TColumn);

var soma : double;
    cliSel : String;

begin
  soma := 0;

  StatusBar1.Panels[2].Text := '';

  if (DM4.cdsOrig.RecordCount > 0) then
  begin
    cliSel := DM4.cdsOrigNOME.Value;
    DM4.cdsOrig.First;
    while not(DM4.cdsOrig.Eof) do
    begin
      if (cliSel = DM4.cdsOrigNOME.value) then soma := soma + DM4.cdsOrigNOTAS.Value;
      DM4.cdsOrig.Next;
    end;
    StatusBar1.Panels[2].Text := 'Total do Cliente = '+FormatFloat('#,##0', soma);
  end;
end;

end.
