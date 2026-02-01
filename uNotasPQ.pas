unit uNotasPQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, JvExDBGrids, JvDBGrid;

type
  TNotasPQ = class(TForm)
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    DataSource1: TDataSource;
    Grid: TJvDBGrid;
    Label3: TLabel;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure GridDblClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure set_saida(i : smallint);
  end;

var
  NotasPQ: TNotasPQ;
  saida : Smallint;
implementation

{$R *.dfm}

uses uDM3, uNotas, uBanco, uRoman, uDM1, uDM4;

procedure ProcuraNF();
begin
  if (saida = 1) then NotasP.set_idNota(DM3.vcNFpidN.Value);
  if (saida = 2) then Roman.set_idNota(DM3.vcNFpidN.Value);

  NotasPQ.ModalResult := mrOk;
end;


procedure TNotasPQ.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  Grid.Canvas.Brush.Color := clLtGray;
  if not (gdSelected in State) then Grid.Canvas.Brush.Color := clWhite;

  if (DM3.vcNFpnRoma.Value = 0 ) then Grid.Canvas.Font.Color := clBlue
    else Grid.Canvas.Font.Color := clOlive;
  Grid.DefaultDrawColumnCell(Rect,DatacOl, Column, State);

end;

procedure TNotasPQ.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#27 then NotasPQ.ModalResult := mrCancel;

  if Key=#13 then ProcuraNF;
end;

procedure TNotasPQ.FormActivate(Sender: TObject);

var Bco : TBco;
    idnot, nnot : Integer;

begin
  nnot := StrToInt(Label2.Caption);

  Bco := TBco.Create;
  if (Label3.Caption = 'PARTE') then
  begin
    idnot := Bco.Config_DTP_MostraN;
    bco.Notas_MostraNum2Novo(idNot, nnot);
  end
  else
    bco.Notas_MostraNumNovo(nnot);

  Bco.Destroy;
end;

procedure TNotasPQ.set_saida(i: smallint);
begin
  saida := i;
end;

procedure TNotasPQ.GridDblClick(Sender: TObject);
begin
  ProcuraNF;
end;




end.
