unit uNotasCOM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid;

type
  TNotasCOM = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbTipo: TLabel;
    lbPer: TLabel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_dados(tipo:Integer; dt1, dt2:TDateTime);
  end;

var
  NotasCOM: TNotasCOM;
  nfTipo : Integer;
  dta, dtb : TDateTime;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM3;

procedure TNotasCOM.set_dados(tipo: Integer; dt1, dt2: TDateTime);

begin
  nfTipo := tipo;
  dta := dt1;
  dtb := dt2;

  if (nfTipo = 1) then lbTipo.Caption := 'Entrada Manual';
  if (nfTipo = 3) then lbTipo.Caption := 'Notas Importadas (EDI)';
  if (nfTipo = 2) then lbTipo.Caption := 'Coletas';
  if (nfTipo = 4) then lbTipo.Caption := 'Reentregas';

  if (dta = dtb) then lbPer.Caption := 'dia: '+FormatDateTime('dd/MM/yyyy', dta)
    else lbPer.Caption := 'entre: '+FormatDateTime('dd/MM/yyyy', dta) + ' e '+FormatDateTime('dd/MM/yyyy', dtb);

end;

procedure TNotasCOM.FormActivate(Sender: TObject);

var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Notas_MostraDia(nfTipo, dta, dtb);
  Bco.Destroy;

  StatusBar1.Panels.Items[0].Text := 'Notas: '+IntToStr(DM3.cdsNF.RecordCount);
end;

end.
