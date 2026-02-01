unit uVisualEst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DB, Grids, DBGrids;

type
  TVisualEst = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label2: TLabel;
    lbProd: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VisualEst: TVisualEst;

implementation

{$R *.dfm}

uses uDM1, uDM2;

end.
