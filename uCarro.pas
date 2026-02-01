unit uCarro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, Grids, DBGrids, Mask, JvExDBGrids, JvDBGrid, ComCtrls;

type
  TCarro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cbTipo: TComboBox;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    DataSource1: TDataSource;
    edPlaca: TMaskEdit;
    edChassi: TMaskEdit;
    Label3: TLabel;
    JvDBGrid1: TJvDBGrid;
    StatusBar1: TStatusBar;
    Label4: TLabel;
    edLibera: TEdit;
    procedure btNovoClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar();
  end;

var
  Carro: TCarro;
  idCar : integer;

implementation

{$R *.dfm}

uses uDM4, uBanco, uLib;

procedure Limpar();
begin
  Carro.edPlaca.Text := '';
  Carro.edChassi.Text := '';
  Carro.cbTipo.ItemIndex := 0;
  Carro.edLibera.Text  := '';
end;

procedure Carregar();

var usa : TMarco;

begin
  Carro.edPlaca.Text     := DM4.cdsCarPLACA.Value;
  Carro.edChassi.Text    := DM4.cdsCarCHASSI.Value;
  Carro.edLibera.Text    := DM4.cdsCarCODLIBERA.Value;
  usa := TMarco.Create;
  usa.Combo_Pos(Carro.cbTipo, DM4.cdsCarTIPO.Value);
  usa.Destroy;
end;

{ TCarro }

procedure TCarro.Entrar;

var d:String;
    usa : TMarco;
    Bco : TBco;

begin
  getDir(0,d);
  if (cbTipo.Items.Count=0) then
  begin
    cbTipo.Items.Clear;
    usa := TMarco.Create;
    usa.Combo_Preenche(cbTipo, 'MLcarros.mzi');
    usa.Destroy;
  end;
  idCar := 0;
  Limpar;

  Bco := TBco.Create;
  Bco.CarroF_Mostra;
  Bco.Destroy;
end;



procedure TCarro.btNovoClick(Sender: TObject);
begin
  idCar := 0;
  Limpar;
  edPlaca.SetFocus;
end;

procedure TCarro.btApagarClick(Sender: TObject);

var Bco : TBco;

begin
  if (idCar>0) then
  if MessageDlg('Tem certeza que deseja apagar este carro?'+#13+DM4.cdsCarTIPO.Value+'  '+DM4.cdsCarPLACA.Value,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Bco := TBco.Create;
        Bco.CarroF_Apaga(idCar);
        Bco.CarroF_Mostra;
        Bco.Destroy;
      end;

end;

procedure TCarro.btSalvarClick(Sender: TObject);

var BCo : TBco;

begin
  if (idCar>0) then
  begin
    Bco := TBco.Create;
    Bco.CarroF_Altera(idCar, edPlaca.Text, cbTipo.Items[cbTipo.ItemIndex],edChassi.Text, edLibera.Text);
    Bco.CarroF_Mostra;
    Bco.Destroy;
    idCar := 0;
  end
  else
  begin
    Bco := TBco.Create;
    Bco.CarroF_Insere( edPlaca.Text, cbTipo.Items[cbTipo.ItemIndex],edChassi.Text, edLibera.Text);
    Bco.CarroF_Mostra;
    Bco.Destroy;
  end;

  Limpar;

end;

procedure TCarro.JvDBGrid1DblClick(Sender: TObject);

begin
  idCar := DM4.cdsCarID.Value;
  Carregar;
end;

end.
