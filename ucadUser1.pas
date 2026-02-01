unit ucadUser1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, ExtCtrls, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, Grids, DBGrids;

type
  TcadUser1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    cbTipo: TComboBox;
    DBGrid1: TDBGrid;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    btSenha: TJvSpeedItem;
    rgStatus: TRadioGroup;
    DataSource1: TDataSource;
    Label3: TLabel;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btSenhaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_id(i : integer);
  end;

var
  cadUser1: TcadUser1;
  id_User : Integer;

implementation

{$R *.dfm}

uses uBanco, ucadUser2, uDM2;

procedure Limpar;

begin
  cadUser1.edNome.Text := '';
  cadUser1.cbTipo.ItemIndex := 0;
  cadUser1.rgStatus.ItemIndex:= 1;
end;

procedure Atualiza;

var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Usuarios_Mostra;
end;


procedure Salvar;

var bco : Tbco;

begin
  bco := TBco.Create;

  // Novo
  if (id_User = 0) then
  begin
    bco.Usuarios_Insere(cadUser1.edNome.Text,cadUser1.cbTipo.ItemIndex,cadUser1.rgStatus.ItemIndex);
  end;

  if (id_User > 0) then
  begin
    bco.Usuarios_Altera(id_User,cadUser1.edNome.Text,cadUser1.cbTipo.ItemIndex,cadUser1.rgStatus.ItemIndex );
  end;

  Atualiza;
end;



procedure TcadUser1.btNovoClick(Sender: TObject);
begin
  Limpar;
  edNome.SetFocus;
  id_User := 0;

end;

procedure TcadUser1.set_id(i: integer);
begin
  id_User := i;
end;

procedure TcadUser1.btSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TcadUser1.btApagarClick(Sender: TObject);
var bco : Tbco;

begin
  bco := TBco.Create;
  bco.Usuarios_Apaga(id_User);
  Atualiza;
end;

procedure TcadUser1.btSenhaClick(Sender: TObject);
begin
  if (id_User > 0) then
  begin
    cadUser2.lbUser.Caption := DM2.cdsUserLOGIN.Value;
    cadUser2.set_id(id_User);
    cadUser2.Show;
  end
  else ShowMessage('Selecione um usuário');

end;

procedure TcadUser1.FormActivate(Sender: TObject);
begin
  Limpar;
  Atualiza;
end;

procedure TcadUser1.DBGrid1DblClick(Sender: TObject);
begin
  id_User             := DM2.cdsUserID.Value;
  edNome.Text         := DM2.cdsUserLOGIN.Value;
  cbTipo.ItemIndex    := DM2.cdsUserNIVEL.Value;
  rgStatus.ItemIndex  := DM2.cdsUserUSSTATUS.Value;
end;

procedure TcadUser1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DM2.cdsUserUSSTATUS.Value = 0) then
  begin
    DBGrid1.Canvas.Font.Color := clGray;
    DBGrid1.Canvas.FillRect(rect);
    DBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
  {
  if (DM2.cdsUserUSSTATUS.Value = 1) then
  begin
    DBGrid1.Canvas.Font.Style := DBGrid1.Canvas.Font.Style + [fsitalic];
    DBGrid1.Canvas.Font.Color := clGray;
    DBGrid1.Canvas.FillRect(rect);
    DBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
  }
  if (DM2.cdsUserUSSTATUS.Value = 2) then
  begin
    DBGrid1.Canvas.Font.Style := DBGrid1.Canvas.Font.Style + [fsStrikeOut];
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.FillRect(rect);
    DBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;

end;

end.
