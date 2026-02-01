unit uWebSEM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Data.DB;

type
  TWebSEM = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    Shape1: TShape;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebSEM: TWebSEM;

implementation

{$R *.dfm}

end.
