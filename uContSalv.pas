unit uContSalv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls, DB, JvDataSource, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, Mask, JvExMask, JvSpin;

type
  TContSalv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label3: TLabel;
    vAno: TJvSpinEdit;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Bevel1: TBevel;
    Label2: TLabel;
    edDesc: TEdit;
    Label4: TLabel;
    dtPrev: TDateTimePicker;
    btInsere: TSpeedButton;
    btPesq: TBitBtn;
    btNovo: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure btPesqClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btInsereClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
    procedure set_idCred2(i : Integer);
  end;

var
  ContSalv: TContSalv;
  idCli, idCred2 : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM3, DateUtils, uContCob;

procedure TContSalv.set_idCli(i: Integer);
begin
  idCli   := i;
end;

procedure TContSalv.set_idCred2(i: Integer);
begin
  idCred2 := i;
end;

procedure Mostra;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Credito2_MostraAno(idCli, ContSalv.vAno.AsInteger);
  Bco.Destroy;
end;

procedure Carrega;

begin
  idCred2 := DM3.cdsCred2ID.Value;
  ContSalv.edDesc.Text     := DM3.cdsCred2DESCR.Value;
  ContSalv.dtPrev.DateTime := DM3.cdsCred2DATAPREV.AsDateTime;
end;

Function Converte_Double(n : String): Double;

var s : String;
    resp : Double;
    i : integer;

begin
  s := '';
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + ',';
  end;
  resp := StrToFloat(s);

  Converte_Double := resp;
end;


procedure Salvar_Num;

var Bco : TBco;
    km : Integer;
    KmC, HoraC, SegNotas,  Hora,
    vCalc, vMensal, vKm, vHora, vSeg, vDesp : Double;
    dt1, dt2 : TDateTime;

begin
  Bco := TBco.Create;

  // Entradas ------------------
  with ContCob do
  begin
    km       := StrToInt(lbkma.Caption);
    Hora     := Converte_Double(lbHra.Caption);

    kmC      := Converte_Double(lbKmb.Caption);
    HoraC    := Converte_Double(lbHrb.Caption);
    SegNotas := Converte_Double(lbSegb.Caption);

    vMensal  := Converte_Double(lbMes.Caption);
    vKm      := Converte_Double(lbKmc.Caption);
    vHora    := Converte_Double(lbHrc.Caption);
    vSeg     := Converte_Double(lbSegc.Caption);
    vDesp    := Converte_Double(lbDesc.Caption);
    vCalc    := Converte_Double(lbTot.Caption);

    dt1      := dat1.DateTime;
    dt2      := dat2.DateTime;
  end;

  // Processamento
  if (idCred2 > 0) then
  begin
    // ALTERAR
    Bco.Credito2_Altera(idCred2, ContSalv.edDesc.Text,ContSalv.dtPrev.DateTime, Km, Hora, VMensal, KmC, vKm, HoraC, vHora, SegNotas, vSeg, vCalc, vDesp, dt1, dt2);
    Bco.Credito2_MarcaDias(idCred2,idCli, dt1, dt2);
  end;

  Bco.Destroy;
end;

procedure Salvar_Desc;

var Bco : TBco;

begin
  Bco := TBco.Create;

  // Processamento
  if (idCred2 = 0) then
    // NOVO
    Bco.Credito2_InsereD(idCli, ContSalv.edDesc.Text,ContSalv.dtPrev.DateTime)
  else
    Bco.Credito2_AlteraD(idCred2, ContSalv.edDesc.Text,ContSalv.dtPrev.DateTime);

  Bco.Destroy;
end;


procedure TContSalv.FormActivate(Sender: TObject);

begin
  vAno.Value := YearOf(Now);
  dtPrev.DateTime := Now + 15;
  Mostra;
end;

procedure TContSalv.btPesqClick(Sender: TObject);

begin
  Mostra;
end;

procedure TContSalv.btNovoClick(Sender: TObject);
begin
  edDesc.Text := '';
  edDesc.SetFocus;
  idCred2 := 0;
end;

procedure TContSalv.btInsereClick(Sender: TObject);
begin
  Salvar_Desc;
  Mostra;
end;

procedure TContSalv.JvDBGrid1DblClick(Sender: TObject);

var ok : Boolean;

begin
  ok := false;

  if (DM3.cdsCred2.RecordCount > 0) then
  begin
    if (DM3.cdsCred2KM.Value = null) then ok := true;

    if not ok then
      if MessageDlg('Este procedimento apagará dados existentes'+#13+DM3.cdsCred2DESCR.Value+#13+'Deseja continuar?',    mtConfirmation, [mbYes, mbNo],0) = mrYes then ok := true;

    if ok then
    begin
      carrega;
      Salvar_Num;
      edDesc.Text := '';
      ContSalv.Hide;
    end;
  end;
end;

procedure TContSalv.JvDBGrid1CellClick(Column: TColumn);
begin
  if (DM3.cdsCred2.RecordCount > 0) then carrega;
end;

end.
