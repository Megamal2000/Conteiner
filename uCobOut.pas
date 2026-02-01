unit uCobOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, Buttons, ExtCtrls;

type
  TCobOut = class(TForm)
    Panel1: TPanel;
    btNovo: TSpeedButton;
    btSalvar: TSpeedButton;
    btApagar: TSpeedButton;
    Panel2: TPanel;
    Label1: TLabel;
    edServ: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    cbCli: TComboBox;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure cbCliChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : Integer);
  end;

var
  CobOut: TCobOut;
  idC, idCob   : Integer;

implementation

{$R *.dfm}

uses uDM2, uDM3, uBanco;

{ TCobOut }

procedure TCobOut.set_idCli(i: Integer);
begin
  idC := i;
  idCob := 0;
end;

procedure Atualiza;

var Bco : TBco;

begin
  idC := DM2.DBCp_leid(CobOut.cbCli.Items[CobOut.cbCli.ItemIndex],'TB_CLIENTE', 'Nome');

  Bco := TBco.Create;
  Bco.CliCob_Mostrar(idC);
  Bco.Destroy;
end;

procedure TCobOut.FormActivate(Sender: TObject);
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  end;

  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idC),'Nome');
  edServ.Text := '';
  Atualiza;
end;



procedure TCobOut.btNovoClick(Sender: TObject);
begin
  idCob := 0;
  edServ.Text := '';
  Atualiza;
  edServ.SetFocus;
end;

procedure TCobOut.btApagarClick(Sender: TObject);

var Bco : TBco;

begin
  if (idCob > 0) then
  if MessageDlg('Tem certeza que deseja apagar o Serviço '+DM3.cdsCliCobSERVICO.Value+ ' ' ,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.CliCob_Apagar(idCob);
    Bco.Destroy;

    Atualiza;
  end;

end;

procedure TCobOut.DBGrid1DblClick(Sender: TObject);

begin

  if (DM3.cdsCliCobID.Value>1) then
  begin
    edServ.Text := DM3.cdsCliCobSERVICO.Value;
    idCob       := DM3.cdsCliCobID.Value;
  end
  else ShowMessage('Não pode alterar VALORES PADRÕES!');  
end;

procedure TCobOut.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  if (edServ.Text <> '') then
  begin
    if (idCob > 0) then
    begin
      Bco := TBco.Create;
      Bco.CliCob_Alterar(idCob, idC, edServ.Text);
      Bco.Destroy;
    end
    else
    begin
      Bco := TBco.Create;
      Bco.CliCob_Inserir(idC, edServ.Text);
      Bco.Destroy;
    end;
    Atualiza;
  end;

end;

procedure TCobOut.cbCliChange(Sender: TObject);
begin
  Atualiza;
end;

end.
