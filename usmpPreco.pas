unit usmpPreco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, JvSpeedbar, ExtCtrls, JvExExtCtrls,
  JvExtComponent, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TsmpPreco = class(TForm)
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    vNum: TJvValidateEdit;
    vPeq: TJvValidateEdit;
    vMedio: TJvValidateEdit;
    edServico: TEdit;
    Label5: TLabel;
    vGrande: TJvValidateEdit;
    Label6: TLabel;
    vEspecial: TJvValidateEdit;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure vNumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edServicoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vPeqKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vMedioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure vGrandeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vEspecialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    idServ, idUser : Integer;

  public
    { Public declarations }
    procedure set_idUser(i : integer);
  end;

var
  smpPreco: TsmpPreco;

implementation

{$R *.dfm}

uses uDM1, uBanco;

procedure Limpar;

begin
  with smpPreco do
  begin
    vNum.Text := '';
    edServico.Text := '';
    vPeq.Text := '';
    vGrande.Text := '';
    idServ := 0;
  end;
end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Valores_Mostra;
  bco.Destroy;
end;


procedure Salvar;

var bco : Tbco;

begin
  bco := TBco.Create;

  with smpPreco do
  begin
    // Novo
    if (idServ = 0) then
    begin
      bco.Valores_Insere(edServico.Text,vPeq.Value, vMedio.Value, vGrande.Value, vEspecial.Value, vNum.Value, idUser);
    end;

    if (idServ > 0) then
    begin
      bco.Valores_Altera(idServ, edServico.Text,vPeq.Value, vMedio.Value, vGrande.Value, vEspecial.Value, vNum.Value, idUser );
    end;
  end;
  bco.Destroy;
  Limpar;
  smpPreco.vNum.SetFocus;
  Atualiza;
end;

procedure TsmpPreco.set_idUser(i: integer);
begin
  idUser := i;
end;



procedure TsmpPreco.btNovoClick(Sender: TObject);
begin
  Limpar;
  vNum.SetFocus;
end;

procedure TsmpPreco.btSalvarClick(Sender: TObject);
begin
  if (vNum.Text <> '') and (edServico.Text <> '') and
     (vPeq.Text <> '') and (vGrande.Text <> '') then
     Salvar;
end;

procedure TsmpPreco.btApagarClick(Sender: TObject);

var bco : Tbco;

begin
  bco := TBco.Create;
  if (idServ>0) then bco.Valores_Apaga(idServ);
  bco.Destroy;
  Atualiza;
end;

procedure TsmpPreco.vNumKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then edServico.SetFocus;
end;

procedure TsmpPreco.edServicoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then vPeq.SetFocus;
end;

procedure TsmpPreco.vPeqKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then vMedio.SetFocus;
end;

procedure TsmpPreco.vMedioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then vGrande.SetFocus;
end;

procedure TsmpPreco.FormActivate(Sender: TObject);
begin
  Atualiza;
end;

procedure TsmpPreco.DBGrid1DblClick(Sender: TObject);


begin
  idServ := DM1.cdsValoresID.Value;
  vNum.Value     := DM1.cdsValoresNUM.Value;
  edServico.Text := DM1.cdsValoresSERVICO.Value;
  vPeq.Value     := DM1.cdsValoresVALORP.AsFloat;
  vGrande.Value  := DM1.cdsValoresVALORG.AsFloat;

end;

procedure TsmpPreco.vGrandeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then vEspecial.SetFocus;
end;

procedure TsmpPreco.vEspecialKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
  begin
  if (vNum.Text <> '') and (edServico.Text <> '') and
     (vPeq.Text <> '') and (vGrande.Text <> '') then
     Salvar;
  end;
end;

end.
