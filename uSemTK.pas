unit uSemTK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls,
  Buttons, ExtCtrls;

type
  TSemTK = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dt1: TDateTimePicker;
    btPesq: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    Rodape: TStatusBar;
    dt2: TDateTimePicker;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SemTK: TSemTK;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM3, uNotas, uDM1;

procedure Mostra();

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_SemMarca(SemTK.dt1.DateTime,SemTK.dt2.DateTime);
  bco.Destroy;
end;


procedure TSemTK.btPesqClick(Sender: TObject);
begin
  Mostra;
end;

procedure TSemTK.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM3.cdsProxIDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
