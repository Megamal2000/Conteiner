unit uAvisoCfg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, JvSpeedbar, JvExExtCtrls,
  JvExtComponent, JvExStdCtrls, JvEdit, JvValidateEdit, JvExControls,
  JvSpin, DateUtils, uAvisos;

type
  TavisoCfg = class(TForm)
    StatusBar1: TStatusBar;
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    Panel1: TPanel;
    Label1: TLabel;
    dtEv: TDateTimePicker;
    Label2: TLabel;
    edDesc: TEdit;
    GroupBox1: TGroupBox;
    ckRep: TCheckBox;
    cbRepete: TComboBox;
    Spin: TJvSpinButton;
    Label3: TLabel;
    vez: TJvValidateEdit;
    vlrEv: TJvValidateEdit;
    Label4: TLabel;
    lbResp: TLabel;
    Label5: TLabel;
    Avisar: TJvValidateEdit;
    btPesq: TJvSpeedItem;
    procedure SpinBottomClick(Sender: TObject);
    procedure SpinTopClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure ckRepClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edDescKeyPress(Sender: TObject; var Key: Char);
    procedure vlrEvKeyPress(Sender: TObject; var Key: Char);
    procedure AvisarKeyPress(Sender: TObject; var Key: Char);
    procedure btPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
    procedure Carregar;
    procedure set_idAg(i : integer);
  end;

var
  avisoCfg: TavisoCfg;
  idAg : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM4, uAvisoPQ;

procedure TavisoCfg.SpinBottomClick(Sender: TObject);
begin
  if (vez.Value>0) then vez.Value := vez.Value - 1;
end;

procedure TavisoCfg.SpinTopClick(Sender: TObject);
begin
  vez.Value := vez.Value + 1;
end;

procedure Repete_cfg(b : boolean);

begin
  with AvisoCfg do
  begin
    cbRepete.ItemIndex := 0;
    vez.Value := 0;

    cbRepete.Enabled   := b;
    vez.Enabled := b;
    Spin.Enabled := b;

    if not b then StatusBar1.Panels[2].Text := ''
      else StatusBar1.Panels[2].Text := 'Insira -1 para repetir indefinidamente';
  end;
end;

procedure Limpar();

begin
  with AvisoCfg do
  begin
    edDesc.Text := '';
    dtEv.DateTime := Now;
    vlrEv.Value := 0;
    ckRep.Checked := false;
    Repete_cfg(false);
    lbResp.Caption := '';
  end;
end;

procedure TavisoCfg.btNovoClick(Sender: TObject);
begin
  idAg := 0;
  Limpar;
end;

procedure TavisoCfg.ckRepClick(Sender: TObject);
begin
  Repete_cfg(ckRep.Checked);
end;

procedure TavisoCfg.Entrar;
begin
  idAg := 0;
  Limpar;
  edDesc.SetFocus;
end;

procedure Gravar_Avisos(repete:boolean; tipo, n : Integer);

var
    Avs : TAviso;

begin
  with AvisoCfg do
  begin
    Avs := TAviso.Create;
    Avs.Gravar_Avisos(dtEv.DateTime, repete, tipo, n, idAg);
    Avs.Destroy;
  end;
end;

procedure Salvar;

var Bco : TBco;
    flag, tipo : Smallint;

begin
  with AvisoCfg do
  begin
  if (ckRep.Checked) then flag := 1 else flag := 0;
  tipo := cbRepete.ItemIndex;
  // Salva
    Bco := TBco.Create;

    if (idAg = 0) then
    begin
      Bco.Agenda_Inserir(dtEv.DateTime, edDesc.Text,vlrEv.Value,flag,vez.Value,tipo, Avisar.Value );
      idAg := Bco.Agenda_MostrarUlt;
      Gravar_Avisos(ckRep.Checked, cbRepete.ItemIndex, vez.Value);
      edDesc.SetFocus;
    end
    else
    begin
      Bco.Agenda_MostrarID(idAg);
      Bco.Agenda_Alterar(idAg,dtEv.DateTime, edDesc.Text,vlrEv.Value,flag,tipo,vez.Value,Avisar.Value);
      if ((DM4.cdsAgendaREPETIR_TIPO.Value <> cbRepete.ItemIndex) or (DM4.cdsAgendaREPETIR_VEZES.Value <> vez.Value)) then
      begin
        Bco.Aviso_ApagarTodos(idAg);
        Gravar_Avisos(ckRep.Checked, cbRepete.ItemIndex, vez.Value);
      end;
    end;
    Bco.Destroy;
  end;
end;

procedure TavisoCfg.btSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TavisoCfg.set_idAg(i: integer);
begin
  idAg := i;
end;

procedure TavisoCfg.edDescKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then vlrEv.SetFocus;
end;

procedure TavisoCfg.vlrEvKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Avisar.SetFocus;
end;

procedure TavisoCfg.AvisarKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Salvar;
end;

procedure TavisoCfg.btPesqClick(Sender: TObject);
begin
  AvisoPQ.Show;
end;

procedure TavisoCfg.Carregar;

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Agenda_MostrarID(idAg);
  Bco.Destroy;

  with AvisoCfg do
  begin
    dtEv.DateTime := DM4.cdsAgendaDIA.Value;
    edDesc.Text   := DM4.cdsAgendaDESCR.Value;
    vlrEv.Value   := DM4.cdsAgendaVALORPREV.AsFloat;
    Avisar.Value  := DM4.cdsAgendaAVISO_DIAS.Value;

    ckRep.Checked      := (DM4.cdsAgendaREPETIR_FLAG.value=1);
    cbRepete.itemIndex := DM4.cdsAgendaREPETIR_TIPO.Value;
    vez.Value          := DM4.cdsAgendaREPETIR_VEZES.Value;
  end;

end;

end.
