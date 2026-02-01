unit uOcorreNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls, uBanco,
  DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls;

type
  TOcorreNF = class(TForm)
    Panel1: TPanel;
    numM: TJvValidateEdit;
    lbMotivo: TLabel;
    Label1: TLabel;
    lbQT: TLabel;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    Hoje: TDateTimePicker;
    procedure numMKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbreOc(numOc:Integer);
  end;

var
  OcorreNF: TOcorreNF;
  Bco : TBco;

implementation

{$R *.dfm}

uses uDM1, uDM2, uDM3, uNotas;

procedure Busca(n : Integer; dat : TDateTime);

var nts : Integer;
begin
  if (n>0) then
  begin
    Bco := TBco.Create;
    Bco.Ocorre_PesqNum(n);
    Bco.Ocorre_PesqNF(n,dat);
    Bco.Create;

    nts := DM3.cdsNFoc.recordCount;
    OcorreNF.lbMotivo.Caption := DM1.cdsOcDESCR.Value;
    OcorreNF.lbQT.Caption     := IntToStr(nts);
  end;
end;


procedure TOcorreNF.numMKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then  busca(numM.Value, Hoje.DateTime );
end;

procedure TOcorreNF.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM3.cdsNFocID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TOcorreNF.AbreOc(numOc:Integer);
begin
  Busca(numOc, Now);
  Hoje.DateTime := Now;
end;

procedure TOcorreNF.FormActivate(Sender: TObject);
begin
  Hoje.DateTime := Now;
end;

end.
