unit uNFManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, JvMemoryDataset, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TNfManual = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    ckFaixa: TCheckBox;
    Bevel1: TBevel;
    ckNotas: TCheckBox;
    Bevel2: TBevel;
    ckVol: TCheckBox;
    Panel3: TPanel;
    Label3: TLabel;
    edNota: TEdit;
    Label4: TLabel;
    edVol: TEdit;
    edCEP: TEdit;
    Label5: TLabel;
    Panel4: TPanel;
    btFim: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabERRO: TSmallintField;
    TabmNNOTA: TIntegerField;
    TabmVOLUME: TIntegerField;
    TabmCEP: TStringField;
    TabmIDC: TIntegerField;
    TabNomeCli: TStringField;
    lbErro: TLabel;
    btIniciar: TBitBtn;
    fInic: TJvValidateEdit;
    fFim: TJvValidateEdit;
    fNotas: TJvValidateEdit;
    fVols: TJvValidateEdit;
    procedure ckFaixaClick(Sender: TObject);
    procedure ckNotasClick(Sender: TObject);
    procedure ckVolClick(Sender: TObject);
    procedure edNotaKeyPress(Sender: TObject; var Key: Char);
    procedure edVolKeyPress(Sender: TObject; var Key: Char);
    procedure edCEPKeyPress(Sender: TObject; var Key: Char);
    procedure btIniciarClick(Sender: TObject);
    procedure btFimClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ENtrar;
  end;

var
  NfManual: TNfManual;
  totVOL : integer;

implementation

{$R *.dfm}

uses uBanco, uDM2;

procedure Limpar();
begin
  with NFmanual do
  begin
    ckFaixa.Checked := false;
    ckNotas.Checked := false;
    ckVol.Checked := false;

    ckFaixa.Font.color := clBlack;
    cknotas.Font.color := clBlack;
    ckVol.Font.color := clBlack;

    fInic.Value := 0;
    fFim.Value  := 0;
    fNotas.Value:= 0;
    fVols.Value := 0;

    edNota.Text     := '';
    edVol.Text      := '';
    edCEP.Text      := '';
  end;
end;

procedure Habilita(b : Boolean);
begin
  with NFmanual do
  begin
    btIniciar.Enabled := not b;
    btFim.Enabled := b;
    edNota.Enabled := b;
    edVol.Enabled := b;
    edCEP.Enabled := b;

  end;
end;

procedure Verifica_Nota(nNF, idCli:Integer);

begin

end;

procedure Insere_Nota();

  var ne : Smallint;
      idc, idu,  Vol : Integer;
      ers : String;

begin
  ne := 0;

  with NFmanual do
  begin
    idc := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex],'TB_CLIENTE', 'NOME');
    if Length(edNota.Text) < 1 then ne := 1;
    if Length(edVol.Text) < 1 then ne := 2;
    if Length(edCEP.Text) < 1 then ne := 3;

    if ne = 0  then
    begin
      Tab.First;
      Tab.Insert;

      Vol :=  StrToInt(edVol.Text);
      totVOL := totVol + Vol;

      // Filtros
      if (ckFaixa.checked) then
      if (TabmNNOTA.Value < fInic.Value) or (TabmNNOTA.Value > fFim.Value)  then ne := 5;

      if (ckNotas.checked) then
      if (Tab.RecordCount > fNotas.value) then ne := 6;

      if (ckVol.checked) then
      if (totVOL > fVols.value) then ne := 7;

      TabERRO.Value    := ne;
      TabNomeCli.Value := cbCli.Items[cbCli.ItemIndex];

      TabmNNOTA.Value  := StrToInt(edNota.Text);
      TabmVOLUME.Value := Vol;
      TabmCEP.Value := edCEP.Text;
      TabmIDC.Value := idc;

      Tab.Post;
      edCEP.Text   := '';
      edVol.Text   := '';
      edNota.Text  := '';
      edNota.SetFocus;

    end
    else
    begin
      if ne = 1 then ers := ' NOTA';
      if ne = 2 then ers := ' VOLUME';
      if ne = 3 then ers := ' CEP';

      lbErro.Caption := 'É necessário preencher o campo '+ ers;
    end;

  end;
end;

procedure Grava_Notas();
  var Bco : TBco;
      idC, serie : Integer;
begin
  with NFManual do
  if Tab.RecordCount>0 then
  begin
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');

    Bco := TBco.Create;
    serie := Bco.Notas_SeriePadrao(idC);
    Bco.Destroy;

    tab.First;
    while not Tab.Eof do
    begin
      Bco := TBco.Create;
      if (TabERRO.Value = 0) then
        if (Not Bco.Notas_Existe(idC, TabmNNOTA.Value, 0, 0 )) then
          Bco.Notas_Inserir(idC, TabmNNOTA.Value, TabmVOLUME.Value, 0,0, TabmCEP.Value, '', 0, 1, 0, '', '', '','', serie, 0)
        else
        begin
          Tab.Edit;
          TabERRO.Value := 1;
          Tab.Post;
        end;
      Bco.Destroy;

      Tab.Next;
    end;

  end;
end;

procedure TNfManual.btFimClick(Sender: TObject);
begin
  Habilita(false);
  Grava_Notas;
  Tab.Active := false;
  tab.EmptyTable;
  Tab.Active := true;
end;

procedure TNfManual.btIniciarClick(Sender: TObject);
begin
  if MessageDlg('Este processo apagará TODAS AS NOTAS na tela'+#13+'Deseja continuar:' ,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Habilita(true);
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;
    edNota.SetFocus;
  end;
end;

procedure TNfManual.ckFaixaClick(Sender: TObject);
begin
  fInic.SetFocus;
end;

procedure TNfManual.ckNotasClick(Sender: TObject);
begin
  fNotas.SetFocus;
end;

procedure TNfManual.ckVolClick(Sender: TObject);
begin
  fVols.Value;
end;



procedure TNfManual.edCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    if  Length(edCEP.Text) > 0 then Insere_Nota;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TNfManual.edNotaKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    if  Length(edNota.Text) > 0 then edVol.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;

procedure TNfManual.edVolKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    if  Length(edVol.Text) > 0 then edCEP.SetFocus;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;

procedure TNfManual.ENtrar;
begin
  Limpar;
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  Habilita(false);

end;

end.
