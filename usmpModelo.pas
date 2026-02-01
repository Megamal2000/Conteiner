unit usmpModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvSpeedbar, ExtCtrls, JvExExtCtrls, JvExtComponent, Grids,
  DBGrids, StdCtrls, DB;

type
  TsmpModelo = class(TForm)
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    Label1: TLabel;
    Label2: TLabel;
    edModelo: TEdit;
    cbTamanho: TComboBox;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edModeloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbTamanhoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    idModelo : integer;
  public
    { Public declarations }
  end;

var
  smpModelo: TsmpModelo;

implementation

{$R *.dfm}

uses uDM1, uBanco;

procedure Limpar;

begin
  with smpModelo do
  begin
    edModelo.Text := '';
    cbTamanho.ItemIndex := 0;
    idModelo := 0;
  end;
end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Modelos_Mostra;
  bco.Destroy;
end;


procedure Salvar;

var bco : Tbco;

begin
  bco := TBco.Create;

  with smpModelo do
  begin
    // Novo
    if (idModelo = 0) then
    begin
      bco.Modelos_Insere(edModelo.Text, cbTamanho.ItemIndex);
    end;

    if (idModelo > 0) then
    begin
      bco.Modelos_Altera(idModelo, edModelo.Text, cbTamanho.ItemIndex);
    end;
  end;
  bco.Destroy;
  Limpar;
  smpModelo.edModelo.SetFocus;
  Atualiza;
end;


procedure TsmpModelo.btNovoClick(Sender: TObject);
begin
  Limpar;
  edModelo.SetFocus;
end;

procedure TsmpModelo.btSalvarClick(Sender: TObject);
begin
  if (edModelo.Text <> '') then Salvar;
end;

procedure TsmpModelo.btApagarClick(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (idModelo>0) then bco.Modelos_Apaga(idModelo);
  bco.Destroy;
  Atualiza;
end;

procedure TsmpModelo.DBGrid1DblClick(Sender: TObject);
begin
  edModelo.Text := DM1.cdsModelosMODELO.Value;
  cbTamanho.ItemIndex := DM1.cdsModelosTAMANHO.Value;
  idModelo := DM1.cdsModelosID.Value;
end;

procedure TsmpModelo.edModeloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then cbTamanho.SetFocus;
end;

procedure TsmpModelo.cbTamanhoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    if (edModelo.Text <> '') then Salvar;
end;

procedure TsmpModelo.FormActivate(Sender: TObject);
begin
  Limpar;
  edModelo.SetFocus;
  Atualiza;
end;

end.
