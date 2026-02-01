unit uStokContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, JvgButton, ComCtrls, StdCtrls, ExtCtrls, JvExControls,
   Grids, DBGrids, JvExDBGrids, JvDBGrid, DB, System.ImageList;

type
  TstokContrato = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    JvgButton1: TJvgButton;
    ImageList1: TImageList;
    lbCli: TLabel;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    procedure JvgButton1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
    procedure Entrar;
  end;

var
  stokContrato: TstokContrato;
  idCli : integer;

implementation

{$R *.dfm}

uses uDM4, uBanco, uprinc, uStokCV;

procedure Atualiza;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Stok_Contrato_MostraLista(idCli);
  Bco.Destroy;
end;

procedure TstokContrato.set_idCli(i: Integer);
begin
  idCli := i;
end;

procedure TstokContrato.JvgButton1Click(Sender: TObject);

var dt1, dt2 : TdateTime;
    Bco : TBco;
    idU : Integer;

begin
  if MessageDlg('Tem certeza que deseja inserir um novo Contrato?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dt1 := Now;
    dt2 := Now + 365;
    idU := StrToInt(Princ.LbUserID.Caption);
    //idU := 1;

    Bco := TBco.Create;
    Bco.Stok_Contrato_Insere(idU, idCli, Now, dt1, dt2);
    Bco.Destroy;
    
    Atualiza;
  end;

end;

procedure TstokContrato.Entrar;
begin
  Atualiza;
end;

procedure TstokContrato.JvDBGrid1DblClick(Sender: TObject);
begin
  StokCV.Label20.Caption := lbCli.Caption;
  StokCV.set_idCli(idCli);
  StokCV.set_idCont(DM4.cdsStokDID.Value);
  StokCV.Entrar;
  StokCV.Show;
end;

end.
