unit uPagVe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, ExtCtrls, DateUtils, Buttons;

type
  TPagVe = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edAno: TEdit;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    SpeedButton1: TSpeedButton;
    btCriar: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btCriarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  PagVe: TPagVe;

implementation

{$R *.dfm}

uses uDM4, uBanco, uPagLista, uPagR1;

procedure Mostra_Ano();

var Ano : integer;

begin
  Ano := YearOf(Now);
  PagVe.edAno.Text := IntToStr(Ano);
end;


{ TPagVe }
procedure Pesq(nAno : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.PagGrupo_GrupoLista(nAno);
  Bco.Destroy;
end;


procedure TPagVe.Entrar;
begin
  Mostra_Ano;
  Pesq(YearOf(Now));
end;

procedure TPagVe.SpeedButton1Click(Sender: TObject);
begin

  Pesq(StrToint(edAno.Text));
end;

procedure TPagVe.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsPagG.RecordCount > 0) then
  begin
    PagLista.Entrar(DM4.cdsPagGID.Value);
    PagLista.Show;
  end;
end;

procedure TPagVe.btCriarClick(Sender: TObject);
begin
  PagR1.set_idLista(0);
  PagR1.dat1.DateTime := Now-30;
  PagR1.dat2.DateTime := Now;
  PagR1.Show;
end;

end.
