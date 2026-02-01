unit uNFsegue2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls;

type
  TNFsegue2 = class(TForm)
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    dtF: TDateTimePicker;
    btMostrar: TBitBtn;
    Label2: TLabel;
    procedure btMostrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NFsegue2: TNFsegue2;

implementation

{$R *.dfm}

uses uBanco, uDM5;

procedure TNFsegue2.btMostrarClick(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Fases_Retiradas(dtF.DateTime);
  Bco.Destroy;

  StatusBar1.Panels[0].Text := 'Notas '+IntToStr(DM5.cdsINT.RecordCount);
end;

end.
