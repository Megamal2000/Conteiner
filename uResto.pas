unit uResto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid;

type
  TResto = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label2: TLabel;
    lbQt: TLabel;
    DataSource1: TDataSource;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Resto: TResto;

implementation

{$R *.dfm}

uses uDM3, uBanco;

procedure TResto.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Controle_Mostra_Restante;
  Bco.Destroy;

  lbQt.Caption := IntToStr(DM3.vcC3.RecordCount);
end;

end.
