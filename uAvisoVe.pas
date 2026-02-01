unit uAvisoVe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, DB, DBCtrls, dbcgrids, JvExControls,
  JvGradientHeaderPanel, JvGradient, ExtCtrls;

type
  TavisoVe = class(TForm)
    JvGradient1: TJvGradient;
    Titulo: TJvGradientHeaderPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DataSource1: TDataSource;
    DBText3: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    pOk: TPanel;
    pCancela: TPanel;
    procedure pOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entra;
  end;

var
  avisoVe: TavisoVe;

implementation

{$R *.dfm}

uses uBanco, uDM4;

{ TavisoVe }

procedure TavisoVe.Entra;

var Bco : TBco;

begin
  Bco := Tbco.Create;
  Bco.Aviso_Agora;
  Bco.Create;

  Titulo.LabelCaption := 'Hoje: '+FormatDateTime('dd/MMM/yyyy ddd', Now);
  Label2.Caption := IntToStr(DM4.cdsAvisoM.RecordCount);

end;


procedure Marcar_AvisoNormal();

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Aviso_Marcar(DM4.cdsAvisoMID.Value, 1);
  Bco.Destroy;
end;

procedure Marcar_AvisoDin();

begin

end;


procedure TavisoVe.pOkClick(Sender: TObject);

var s : String;

begin
  if (DM4.cdsAvisoMVALORPREV.Value = 0) then
    s := 'Deseja marcar o aviso '+QuotedStr(DM4.cdsAvisoMDESCR.Value)+ ' como lido?'
  else
    s := 'Deseja receber o aviso '+QuotedStr(DM4.cdsAvisoMDESCR.Value)+ ' com valor de '+FormatFloat('#,##0.00', DM4.cdsAvisoMVALORPREV.AsFloat)+'?';

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
  if (DM4.cdsAvisoMVALORPREV.Value = 0) then
    Marcar_AvisoNormal
  else
    Marcar_AvisoDin;
  end;
end;

end.
