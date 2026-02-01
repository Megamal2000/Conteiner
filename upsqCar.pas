unit upsqCar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, DB,
  JvDataSource, Buttons, StdCtrls;

type
  TpsqCar = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    edCarro: TEdit;
    SpeedButton1: TSpeedButton;
    JvDataSource1: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    procedure edCarroKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  psqCar: TpsqCar;

implementation

{$R *.dfm}

uses uDM4, uBanco, ucadFuncs;

procedure Procura_Carro(car : String);
var Bco : TBco;

begin
  if (car <> '') then
  begin
    Bco := TBco.Create;
    Bco.Pesq_Carro(car);
    Bco.Destroy;
  end;
end;


procedure TpsqCar.edCarroKeyPress(Sender: TObject; var Key: Char);


begin
  if (key = #13) then
  begin
    Procura_Carro(edCarro.Text);
    edCarro.Text := '';
  end;
end;

procedure TpsqCar.SpeedButton1Click(Sender: TObject);
begin
    Procura_Carro(edCarro.Text);
    edCarro.Text := '';
end;

procedure TpsqCar.FormActivate(Sender: TObject);
begin
  edCarro.Text := '';
end;

procedure TpsqCar.JvDBGrid1DblClick(Sender: TObject);
begin
  cadFuncs.set_idFuncs(DM4.cdsCarroID.Value);
  cadFuncs.Show;
end;

end.
