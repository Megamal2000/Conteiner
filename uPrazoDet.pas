unit uPrazoDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ExtCtrls, StdCtrls, Buttons;

type
  TPrazoDet = class(TForm)
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label1: TLabel;
    Label2: TLabel;
    lbDatas: TLabel;
    lbCli: TLabel;
    Label5: TLabel;
    lbTot: TLabel;
    btExcel: TBitBtn;
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure get_DTi(d : TDateTime);
    procedure get_DTf(d : TDateTime);
    procedure get_idCli(i : Integer);
  end;

var
  PrazoDet: TPrazoDet;
  dti, dtf: TDateTime;
  idC : Integer;
implementation

{$R *.dfm}

uses uBanco, uDM4, uNotas, uLib;

{ TPrazoDet }

procedure TPrazoDet.Entrar;

var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.EstatC_PrazoDet(dti, dtf, idC);
  Bco.Destroy;

  lbTot.Caption := IntToStr(Dm4.cdsPrazo.RecordCount);

end;

procedure TPrazoDet.get_DTf(d: TDateTime);
begin
  dtf := d;
end;

procedure TPrazoDet.get_DTi(d: TDateTime);
begin
  dti := d;
end;

procedure TPrazoDet.get_idCli(i: Integer);
begin
  idC := i;
end;

procedure TPrazoDet.JvDBGrid1DblClick(Sender: TObject);
begin
 // Notas.Show;
  NotasP.Entrar;
  NotasP.set_idNota(DM4.cdsPrazoIDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TPrazoDet.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM4.cdsPrazo.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TPrazoDet.btExcelClick(Sender: TObject);

var usa:TMarco;
begin
  // Exporta para Excel
  usa := TMarco.Create;
  usa.Exporta_Excel(',3,4,5,',DM4.cdsPrazo);
  usa.Destroy;
end;

end.
