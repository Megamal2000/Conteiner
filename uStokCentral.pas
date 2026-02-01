unit uStokCentral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, JvExControls,
   DB, JvDataSource, ExtCtrls, StdCtrls, DBCtrls, dbcgrids;

type
  TstkCentral = class(TForm)
    StatusBar1: TStatusBar;
    JvDataSource1: TJvDataSource;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    Bevel1: TBevel;
    Panel1: TPanel;
    Panel2: TPanel;
    Bevel2: TBevel;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  stkCentral: TstkCentral;

implementation

{$R *.dfm}

uses uBanco, uDM4;

procedure TstkCentral.FormActivate(Sender: TObject);
begin
  DM4.cdsStokC.Active := false;
  DM4.cdsStokC.Active := true;
  StatusBar1.Panels[1].Text := IntToStr(DM4.cdsStokC.RecordCount);

end;

end.
