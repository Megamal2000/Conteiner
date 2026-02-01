unit upqCarM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TpqCarM = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btPesq: TBitBtn;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    lbMot: TLabel;
    btMot: TBitBtn;
    Panel2: TPanel;
    lbRec: TLabel;
    lbDesp: TLabel;
    lbLucro: TLabel;
    lbRomas: TLabel;
    procedure btPesqClick(Sender: TObject);
    procedure btMotClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure set_IdMot(i : Integer);
  end;

var
  pqCarM: TpqCarM;
  idMot : Integer;

implementation

{$R *.dfm}

uses uDM4, uBanco, upsqFuncs;

procedure TpqCarM.Entrar;
begin
  idMot := 0;
  dat1.DateTime := Now - 30;
  dat2.DateTime := Now;
  lbMot.Caption := '';

  lbRomas.Caption := '';
  lbrec.Caption   := '';
  lbDesp.Caption  := '';
  lbLucro.Caption := '';

end;

procedure TpqCarM.set_IdMot(i: Integer);
begin
  idMot := i;
end;

procedure TpqCarM.btPesqClick(Sender: TObject);

var Bco : TBco;
    conta : Integer;
    r, d, luc : double;

begin
  if (idMot > 0) then
  begin
    DM4.cdsPQcar.IndexName := '';
    Bco := TBco.Create;
    Bco.CarroF_PesqMotor(dat1.DateTime , dat2.DateTime , idMot);
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
      lbDesp.Caption  := FormatFloat('#,##0.00', d);
      lbLucro.Caption := FormatFloat('#,##0.00', luc);

    end;
  end
  else ShowMessage('Selecione um Motorista!');
end;

procedure TpqCarM.btMotClick(Sender: TObject);
begin
  psqFuncs.set_tipo(1);
  psqFuncs.set_saida(7);
  psqFuncs.Show;
end;

procedure TpqCarM.JvDBGrid1TitleClick(Column: TColumn);
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

procedure TpqCarM.FormActivate(Sender: TObject);
begin
  Dm4.cdsPQcar.Active := false;

  lbRomas.Caption := '';
  lbrec.Caption   := '';
  lbDesp.Caption  := '';
  lbLucro.Caption := '';  
end;

end.
