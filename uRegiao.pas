unit uRegiao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, Grids, DBGrids, Buttons;

type
  TRegiao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edRegiao: TEdit;
    rgLocal: TRadioGroup;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    btNovo: TSpeedButton;
    btSalvar: TSpeedButton;
    btApagar: TSpeedButton;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure set_idReg(i : Integer);
  end;

var
  Regiao: TRegiao;
  idReg : Integer;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco;

procedure Limpar();
begin
  Regiao.edRegiao.Text := '';
  Regiao.rgLocal.ItemIndex := 0;
  idReg := 0;
end;


procedure TRegiao.Entrar;

var Bco : TBco;

begin
  Limpar;
  Bco := TBco.Create;
  Bco.Regiao_Mostra;
  Bco.Destroy;
end;

procedure TRegiao.btNovoClick(Sender: TObject);
begin
  Limpar;
end;

procedure TRegiao.set_idReg(i : Integer);
begin
  idReg := i;
end;

procedure TRegiao.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  {
    Regioes
      SP  = 1
      GSP = 2
      INT = 3
      OUT = 4
    }
  if (idReg = 0) then Bco.Regiao_Insere(edRegiao.Text, rgLocal.ItemIndex + 1)
    else Bco.Regiao_Altera(idReg, edRegiao.Text, rgLocal.ItemIndex + 1);

  Bco.Regiao_Mostra;  
  Bco.Destroy;


end;

procedure TRegiao.btApagarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  if (idReg > 0) then
  begin
    if MessageDlg('Tem certeza que deseja apagar essa Região?'+#13+DM1.cdsRegDESCR.Value,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    Bco.Regiao_Apaga(DM1.cdsRegID.Value);
  end
  else ShowMessage('Nenhuma Reigião Selecionada');  
  Bco.Destroy;
end;

procedure TRegiao.DBGrid1DblClick(Sender: TObject);
begin
  edRegiao.Text := DM1.cdsRegDESCR.Value;
  rgLocal.ItemIndex := DM1.cdsRegCLASS.Value - 1;
  idReg := DM1.cdsRegID.Value;
end;

end.
