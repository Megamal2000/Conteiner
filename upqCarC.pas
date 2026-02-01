unit upqCarC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, JvDataSource, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, ComCtrls, Buttons, ExtCtrls;

type
  TpqCarC = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btPesq: TBitBtn;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Label2: TLabel;
    cbCar: TComboBox;
    Panel2: TPanel;
    lbRomas: TLabel;
    lbRec: TLabel;
    lbDesp: TLabel;
    lbLucro: TLabel;
    procedure btPesqClick(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  pqCarC: TpqCarC;
  idCar : Integer;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco;

procedure TpqCarC.Entrar;
begin
  if (cbCar.Items.Count = 0) then
  begin
    dat1.DateTime := Now - 30;
    dat2.DateTime := Now;
    cbCar.Clear;
    DM2.DBCb_Preenche(cbCar, 'TB_CARRO', 'Placa', '');

    lbRomas.Caption  := '';
    lbrec.Caption    := '';
    lbDesp.Caption   := '';
    lbLucro.Caption  := '';

  end;
end;


procedure TpqCarC.btPesqClick(Sender: TObject);

var Bco : TBco;
    conta : Integer;
    r, d, luc : double;

begin
  idCar := DM2.DBCp_leid(cbCar.Items[cbCar.ItemIndex], 'TB_CARRO', 'Placa');

  if (idCar > 0) then
  begin
    DM4.cdsPQcar.IndexName := '';
    Bco := TBco.Create;
    Bco.CarroF_PesqCarro(dat1.DateTime , dat2.DateTime , idCar);
    Bco.Destroy;

    if (DM4.cdsPQcar.RecordCount>0) then
    begin
      r := 0;
      d := 0;
      luc := 0;
      conta := 0;
      DM4.cdsPQcar.First;
      while not DM4.cdsPQcar.eof do
      begin
        conta := conta + 1;
        r := DM4.cdsPQcarFRETE.AsFloat+ r;
        d := DM4.cdsPQcarVPAG.AsFloat+d;
        luc := DM4.cdsPQcarLUCRO.AsFloat+luc;

        DM4.cdsPQcar.Next;
      end;
      DM4.cdsPQcar.First;
      lbRomas.Caption := IntToStr(conta);
      lbrec.Caption   := FormatFloat('#,##0.00', r);
      lbDesp.Caption   := FormatFloat('#,##0.00', d);
      lbLucro.Caption   := FormatFloat('#,##0.00', luc);

    end;
  end;

end;

procedure TpqCarC.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 30;
end;

procedure TpqCarC.JvDBGrid1TitleClick(Column: TColumn);
var sIndeXName : String;
    Options:TIndexOptions;

begin
  // Marca a Coluna e Ordena
  if DM4.cdsPQcar.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
    JvDBGrid1.SortMarker := smDown;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
    JvDBGrid1.SortMarker := smUp;
  end;

  if (DM4.cdsPQcar.IndexDefs.IndexOf(sIndexName) < 0) then
    DM4.cdsPQcar.AddIndex(sIndexName, Column.FieldName, Options);

  DM4.cdsPQcar.IndexName := sIndexName;

end;

procedure TpqCarC.FormActivate(Sender: TObject);
begin
  DM4.cdsPQcar.Active := false;
end;

end.
