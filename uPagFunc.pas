unit uPagFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TPagFunc = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbMot: TLabel;
    Panel2: TPanel;
    cbLocal: TComboBox;
    Panel3: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    vInicio: TJvValidateEdit;
    vFim: TJvValidateEdit;
    vFXmot: TJvValidateEdit;
    vFXajud: TJvValidateEdit;
    vAcima: TJvValidateEdit;
    vACmot: TJvValidateEdit;
    vACajud: TJvValidateEdit;
    vACntx: TJvValidateEdit;
    btSalvar1: TBitBtn;
    btSalvar2: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btNovo: TBitBtn;
    vMinimo: TJvValidateEdit;
    Label11: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    lbLimite: TLabel;
    Bevel1: TBevel;
    Label15: TLabel;
    pvInic: TJvValidateEdit;
    pvFim: TJvValidateEdit;
    pvValor: TJvValidateEdit;
    Label16: TLabel;
    Label17: TLabel;
    JvDBGrid2: TJvDBGrid;
    ckUtilPeso: TCheckBox;
    Bevel2: TBevel;
    brDelPg1: TSpeedButton;
    btPesoN: TSpeedButton;
    btPesoS: TSpeedButton;
    btPesoDel: TSpeedButton;
    DataSource1: TDataSource;
    lbQt1: TLabel;
    lbQt2: TLabel;
    btCopiar: TBitBtn;
    Panel6: TPanel;
    Label18: TLabel;
    cbMot: TComboBox;
    btCopiaCancel: TBitBtn;
    btCopiaOK: TBitBtn;
    lbM: TLabel;
    procedure vInicioKeyPress(Sender: TObject; var Key: Char);
    procedure vFimKeyPress(Sender: TObject; var Key: Char);
    procedure vFXmotKeyPress(Sender: TObject; var Key: Char);
    procedure vFXajudKeyPress(Sender: TObject; var Key: Char);
    procedure vAcimaKeyPress(Sender: TObject; var Key: Char);
    procedure vACmotKeyPress(Sender: TObject; var Key: Char);
    procedure vACajudKeyPress(Sender: TObject; var Key: Char);
    procedure vACntxKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure cbLocalCloseUp(Sender: TObject);
    procedure btSalvar1Click(Sender: TObject);
    procedure btSalvar2Click(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btNovoClick(Sender: TObject);
    procedure brDelPg1Click(Sender: TObject);
    procedure btPesoDelClick(Sender: TObject);
    procedure btPesoNClick(Sender: TObject);
    procedure btPesoSClick(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure btCopiarClick(Sender: TObject);
    procedure btCopiaCancelClick(Sender: TObject);
    procedure btCopiaOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idMot(i : Integer);
  end;

var
  PagFunc: TPagFunc;
  idMot, idP1, idP2, idP5 : integer;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDM2, uDM3, uDM4;

{ TPagFunc }

procedure TPagFunc.set_idMot(i: Integer);
begin
  idMot := i;
end;

procedure TPagFunc.brDelPg1Click(Sender: TObject);
var Bco : TBco;

begin

  if MessageDlg('Tem certeza que deseja APAGAR a Faixa '+DM3.cdsPag1INICIO.AsString+' até '+DM3.cdsPag1FIM.AsString+ '?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    BCo.PagFaixa_Apagar(idP1);
    Bco.PagFaixa_Mostrar(idMot, cbLocal.ItemIndex);
    Bco.Destroy;
    PagFunc.lbQt1.Caption := IntToStr(DM3.cdsPag1.RecordCount);
  end;
end;

procedure TPagFunc.vInicioKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vFim.SetFocus;
end;

procedure TPagFunc.vFimKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vFXmot.SetFocus;
end;

procedure TPagFunc.vFXmotKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vFXajud.SetFocus;
end;

procedure TPagFunc.vFXajudKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then btSalvar1.SetFocus;
end;

procedure TPagFunc.vAcimaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vACmot.SetFocus;
end;

procedure TPagFunc.vACmotKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vACajud.SetFocus;
end;

procedure TPagFunc.vACajudKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then vACntx.SetFocus;
end;

procedure TPagFunc.vACntxKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then btSalvar2.SetFocus;
end;

procedure Limpar1();
begin
  with PagFunc do
  begin
    vInicio.Value := 0;
    vFim.Value    := 0;
    vFXmot.Value  := 0;
    vFXajud.Value := 0;
    vInicio.SetFocus;
  end;
end;

procedure Limpar2();
begin
  with PagFunc do
  begin
    vAcima.Value  := 0;
    vACntx.Value  := 0;
    vACmot.Value  := 0;
    vACajud.Value := 0;
    vAcima.SetFocus;
  end;
end;

procedure Limpar5();
begin
  with PagFunc do
  begin
    pvInic.Value   := 0;
    pvFim.Value    := 0;
    pvValor.Value  := 0;
    pvInic.SetFocus;
  end;
end;


procedure Preencher1();
begin
  with PagFunc do
  begin
    vInicio.Value := DM3.cdsPag1INICIO.Value;
    vFim.Value    := DM3.cdsPag1FIM.Value;
    vFXmot.Value  := DM3.cdsPag1VALORMOT.AsFloat;
    vFXajud.Value := DM3.cdsPag1VALORAJUD.AsFloat;
    vInicio.SetFocus;
  end;
end;

procedure Preencher2();
begin
  with PagFunc do
  begin
    vAcima.Value  := DM3.cdsPag2ACIMADE.Value;
    lbLimite.Caption := DM3.cdsPag2ACIMADE.AsString;
    vACntx.Value  := DM3.cdsPag2NOTA_EXTRA.AsFloat;
    vACmot.Value  := DM3.cdsPag2VALORMOT.AsFloat;
    vACajud.Value := DM3.cdsPag2VALORAJUD.AsFloat;
    vMinimo.Value := DM3.cdsPag2VMINIMO.AsFloat;
    ckUtilPeso.Checked := (DM3.cdsPag2USAPESO.Value = 1);
    vAcima.SetFocus;
  end;
end;

procedure Preencher5();
begin
  with PagFunc do
  begin
    pvInic.Value   := DM3.cdsPag5INICIO.AsFloat;
    pvFim.Value    := DM3.cdsPag5FIM.AsFloat;
    pvValor.Value  := DM3.cdsPag5VALOR.AsFloat;
    pvInic.SetFocus;
  end;
end;


Procedure Carregar;

var Bco : TBco;

begin
  PagFunc.lbM.Caption := idMot.ToString;
  PagFunc.Panel6.Visible := false;
  Bco := TBco.Create;
  bco.PagFaixa_Mostrar(idMot, PagFunc.cbLocal.ItemIndex);
  bco.PagFaixaMais_Mostrar(idMot, PagFunc.cbLocal.ItemIndex);
  bco.PagFaixaPeso_Mostrar(idMot, PagFunc.cbLocal.ItemIndex);
  Bco.Destroy;
  PagFunc.lbQt1.Caption := IntToStr(DM3.cdsPag1.RecordCount);
  PagFunc.lbQt2.Caption := IntToStr(DM3.cdsPag5.RecordCount);
  Limpar2;
  Limpar1;
  idP2 := 0;
  if (DM3.cdsPag2.RecordCount > 0) then
  begin
    Preencher2;
    idP2 := DM3.cdsPag2ID.Value;
  end;
end;

procedure TPagFunc.FormActivate(Sender: TObject);

begin
  Carregar;
end;

procedure TPagFunc.cbLocalCloseUp(Sender: TObject);
begin
  Carregar;
end;

procedure TPagFunc.btSalvar1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;

  if (idP1 > 0) then
    bco.PagFaixa_Alterar(idP1, cbLocal.ItemIndex, vInicio.Value, vFim.Value, vFXmot.Value, vFXajud.Value)
  else
    bco.Pagfaixa_Inserir(idMot,cbLocal.ItemIndex, vInicio.Value, vFim.Value, vFXmot.Value, vFXajud.Value);

  bco.PagFaixa_Mostrar(idMot, cbLocal.ItemIndex);
  PagFunc.lbQt1.Caption := IntToStr(DM3.cdsPag1.RecordCount);

  Limpar1;
  Bco.Destroy;
  idP1 := 0;
end;

procedure TPagFunc.btSalvar2Click(Sender: TObject);

var Bco : TBco;
    iPeso : Smallint;

begin
  iPeso := 0;
  if (ckUtilPeso.Checked) then iPeso := 1;

  Bco := TBco.Create;

  if (idP2 > 0) then
    bco.PagFaixaMais_Alterar(idP2, cbLocal.ItemIndex, vAcima.Value, vACmot.Value, vACajud.Value, vACntx.Value, vMinimo.Value, iPeso)
  else
    bco.PagFaixaMais_Inserir(idMot,cbLocal.ItemIndex, vAcima.Value, vACmot.Value, vACajud.Value, vACntx.Value, vMinimo.Value, iPeso);

  bco.PagFaixaMais_Mostrar(idMot, cbLocal.ItemIndex);
  idP2 := DM3.cdsPag2ID.Value;
  Bco.Destroy;
  vInicio.SetFocus;
end;

procedure TPagFunc.JvDBGrid1CellClick(Column: TColumn);
begin
  Preencher1;
  idP1 := DM3.cdsPag1ID.Value;
end;

procedure TPagFunc.JvDBGrid2CellClick(Column: TColumn);
begin
  Preencher5;
  idP5 := DM3.cdsPag5ID.Value;
end;

procedure TPagFunc.btCopiaCancelClick(Sender: TObject);
begin
  Panel6.Visible := false;
end;

procedure TPagFunc.btCopiaOKClick(Sender: TObject);
  var Bco: TBco;
      idMotOrig : Integer;
begin
  if MessageDlg('Este procedimento apagará os valores atuais antes de copiar. Deseja Continuar? ',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    idMotOrig := DM2.DBCp_leid(cbMot.Items[cbMot.ItemIndex], 'TB_FUNCS', 'NOME');

    Bco := TBco.Create;
    Bco.Pagamento_CopiaDados(idMotOrig, idMot);
    Bco.Destroy;
  end;

  Panel6.Visible := false;
  ShowMessage('Cópia terminada!');
  Carregar;
end;

procedure TPagFunc.btCopiarClick(Sender: TObject);
begin
  Panel6.Visible := true;
  cbMot.Clear;
  DM2.DBCb_Preenche(cbMot,'TB_FUNCS', 'NOME', 'TIPO=1 and ATIVO=1 and ID<>'+ idMot.ToString);
  cbMot.ItemIndex := 0;
end;

procedure TPagFunc.btNovoClick(Sender: TObject);
begin
  Limpar1;
  idP1 := 0;
end;

procedure TPagFunc.btPesoDelClick(Sender: TObject);
var Bco : TBco;

begin

  if MessageDlg('Tem certeza que deseja APAGAR a Faixa '+DM3.cdsPag5INICIO.AsString+' até '+DM3.cdsPag5FIM.AsString+ '?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    BCo.PagFaixaPeso_Apagar(idP5);
    Bco.PagFaixaPeso_Mostrar(idMot, cbLocal.ItemIndex);
    Bco.Destroy;
    PagFunc.lbQt2.Caption := IntToStr(DM3.cdsPag5.RecordCount);

  end;

end;

procedure TPagFunc.btPesoNClick(Sender: TObject);
begin
  Limpar5;
  idP5 := 0;
end;

procedure TPagFunc.btPesoSClick(Sender: TObject);

var Bco : TBco;


begin
  Bco := TBco.Create;

  if (idP5 > 0) then
    bco.PagFaixaPeso_Alterar(idP5, cbLocal.ItemIndex, pvInic.Value, pvFim.Value, pvValor.Value)
  else
    bco.PagfaixaPeso_Inserir(idMot,cbLocal.ItemIndex, pvInic.Value, pvFim.Value, pvValor.Value);

  bco.PagFaixaPeso_Mostrar(idMot, cbLocal.ItemIndex);
  PagFunc.lbQt2.Caption := IntToStr(DM3.cdsPag5.RecordCount);
  Limpar5;
  Bco.Destroy;
  idP5 := 0;


end;

end.
