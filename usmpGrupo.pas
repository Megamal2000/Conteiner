unit usmpGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvSpeedbar, ExtCtrls, JvExExtCtrls, JvExtComponent, StdCtrls,
  Grids, DBGrids, DB, JvExStdCtrls, JvEdit, JvValidateEdit, Buttons,
  JvExDBGrids, JvDBGrid, JvDataSource;

type
  TsmpGrupo = class(TForm)
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Label5: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    lbQG: TLabel;
    Panel4: TPanel;
    GridCli: TJvDBGrid;
    GridGrupo: TJvDBGrid;
    GridProd: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbQP: TLabel;
    btNovoG: TSpeedButton;
    btDelG: TSpeedButton;
    btNovoP: TSpeedButton;
    btDelP: TSpeedButton;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edDesc: TEdit;
    edNum: TJvValidateEdit;
    DataSource1: TDataSource;
    lbCli: TLabel;
    btSalvaGRP: TBitBtn;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure edDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure GridCliCellClick(Column: TColumn);
    procedure GridGrupoCellClick(Column: TColumn);
    procedure btNovoGClick(Sender: TObject);
    procedure btSalvaGRPClick(Sender: TObject);
    procedure GridGrupoDblClick(Sender: TObject);
  private
    { Private declarations }
    idGrupo : integer;
  public
    { Public declarations }
    procedure set_idCli(i : Integer);


  end;

var
  smpGrupo: TsmpGrupo;
  mCli, mGrupo : integer;

implementation

{$R *.dfm}

uses uDM1, uBanco, Global;

procedure Limpar;

begin
  with smpGrupo do
  begin
    GridGrupo.Visible := False;
    GridProd.Visible  := False;
    mGrupo            :=  0;
    lbQG.Caption      := '0';
    Panel5.Visible    := false;
  end;

end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Grupo_Mostra(mCli);
  bco.Grupo_Conta(mCli);

  bco.Destroy;
end;


procedure Salvar;

var bco : Tbco;

begin
  bco := TBco.Create;

  with smpGrupo do
  begin
    // Novo
    if (mGrupo = 0) then
    begin
      bco.Grupo_Insere(mCli, edNum.Value, edDesc.Text);
    end;

    if (mGrupo > 0) then
    begin
      bco.Grupo_Altera(mGrupo, edNum.Value, edDesc.Text);
    end;
    mGrupo := 0;

  end;
  bco.Destroy;
  smpGrupo.edDesc.Text := '';
  smpGrupo.edNum.Value  := 0;
  smpGrupo.edNum.SetFocus;
  Atualiza;
end;


procedure TsmpGrupo.btNovoClick(Sender: TObject);
begin
  edNum.Value := 0;
  edDesc.Text := '';
  edNum.SetFocus;
  idGrupo := 0;
end;

procedure TsmpGrupo.btSalvarClick(Sender: TObject);
begin
  if (edDesc.Text <> '') and (edNum.Value  > 0) then Salvar;
end;

procedure TsmpGrupo.btApagarClick(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (idGrupo>0) then bco.Grupo_Apaga(idGrupo);
  bco.Destroy;
  Atualiza;

  edNum.Value := 0;
  edDesc.Text := '';
  edNum.SetFocus;
  idGrupo := 0;

end;

procedure TsmpGrupo.edDescKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    if (edDesc.Text <> '') and (edNum.Value > 0) then Salvar;
end;

procedure TsmpGrupo.FormActivate(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;

  bco.Cliente_MostraId(idCli);
  smpGrupo.Panel1.Caption := DM1.cdsCliNOME.Value;

  Atualiza;
  edDesc.Text := '';
end;

procedure TsmpGrupo.DBGrid1DblClick(Sender: TObject);
begin
  edNum.Value := DM1.cdsGrupoNUM.Value;
  edDesc.Text := DM1.cdsGrupoDESCRICAO.Value;
  idGrupo     := DM1.cdsGrupoID.Value;
end;


procedure TsmpGrupo.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then edDesc.SetFocus;
end;

procedure TsmpGrupo.set_idCli(i: Integer);

var Bco : TBco;
begin
  mCli := i;

  Bco := TBco.Create;
  Bco.Cliente_GrupoProd;
  Bco.Destroy;

  Limpar;
end;

procedure TsmpGrupo.GridCliCellClick(Column: TColumn);

var bco : Tbco;

begin
  mcli := DM1.cdsCli2ID.Value;
  bco := TBco.Create;
  bco.GrupoProd_Grupos(mCli);
  Bco.Destroy;

  lbQG.Caption := IntToStr(DM1.cdsGrupo.RecordCount);

  GridGrupo.Visible := false;
  if (DM1.cdsGrupo.RecordCount > 0) then
  begin
    GridGrupo.Visible := true;
    DM1.cdsGrupo.First;
    mGrupo := DM1.cdsGrupoID.Value;
    lbCli.Caption := DM1.cdsCli2NOME.Value;
  end;
end;

procedure TsmpGrupo.GridGrupoCellClick(Column: TColumn);

var bco : Tbco;

begin
  mGrupo := DM1.cdsGrupoID.Value;

  bco := TBco.Create;
  bco.GrupoProd_Produtos(mGrupo);
  bco.Destroy;

  lbQP.Caption := IntToStr(DM1.cdsProd.RecordCount);
end;

procedure TsmpGrupo.btNovoGClick(Sender: TObject);
begin
  edNum.Value := 0;
  edDesc.Text := '';
  panel5.Visible := true;
  mGrupo := 0;
end;

procedure TsmpGrupo.btSalvaGRPClick(Sender: TObject);
begin
  Salvar;
  Panel5.Visible := false;
end;

procedure TsmpGrupo.GridGrupoDblClick(Sender: TObject);

var bco : Tbco;

begin

  edNum.Value    := DM1.cdsGrupoNUM.Value;
  edDesc.Text    := DM1.cdsGrupoDESCRICAO.Value;
  mGrupo         := DM1.cdsGrupoID.Value;

  Panel5.Visible := true;

end;

end.
