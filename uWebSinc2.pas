unit uWebSinc2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.StdCtrls, Vcl.ExtCtrls, JvDataSource;

type
  TWEBsinc2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LbQT: TLabel;
    Label2: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  WEBsinc2: TWEBsinc2;

implementation

{$R *.dfm}

{ TWEBsinc2 }

uses uBanco, uDM5, uNotas;

procedure Abrir;
  var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.WebAt_Pesq5a;
  Bco.Destroy;
end;


procedure TWEBsinc2.Entrar;
begin

  Abrir;
end;

procedure TWEBsinc2.JvDBGrid1DblClick(Sender: TObject);
begin
  // Procurar nota

    NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM5.cdsWebSID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TWEBsinc2.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM5.cdsWebS.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

end.
