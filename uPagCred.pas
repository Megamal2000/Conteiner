unit uPagCred;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, StdCtrls,
  JvExStdCtrls, JvEdit, JvValidateEdit, Buttons, ExtCtrls;

type
  TPagCred = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    lbMot:  TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btSubNovo: TSpeedButton;
    btSubSalvar: TSpeedButton;
    btSubApagar: TSpeedButton;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btMot: TBitBtn;
    btAtualiza: TBitBtn;
    dtVale: TDateTimePicker;
    vValor: TJvValidateEdit;
    rd1: TRadioButton;
    rd2: TRadioButton;
    rd3: TRadioButton;
    edOut: TEdit;
    Rodape: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    procedure btAtualizaClick(Sender: TObject);
    procedure btSubApagarClick(Sender: TObject);
    procedure btSubSalvarClick(Sender: TObject);
    procedure btSubNovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idM(i : integer);
    procedure set_sair(i : Smallint);
  end;

var
  PagCred: TPagCred;
  idMot, idV  : Integer;
  vTot   : Double;
  saida  : Smallint;

implementation

{$R *.dfm}

{ TPagCred }

uses uDM4, uBanco, uPagDiv;


procedure Limpar();
begin

  if (DM4.cdsCred.RecordCount > 0) then
    PagCred.dtVale.DateTime := DM4.cdsCredDATA.Value
  else
    PagCred.dtVale.DateTime := pagCred.dat1.DateTime;

  PagCred.rd1.Checked := True;
  PagCred.edOut.Text := '';
  PagCred.vValor.Value := 0;

end;

procedure Atualiza();

var Bco : TBco;

begin
  if (idMot > 0) then
  begin
    Bco := TBco.Create;
    Bco.CredMot_MostraDatas(idMot, PagCred.dat1.DateTime, PagCred.dat2.DateTime);
    Bco.Destroy;

    PagCred.Rodape.Panels[0].Text := 'Creds: '+IntToStr(DM4.cdsCred.RecordCount);
    if (DM4.cdsCred.RecordCount>0) then
    begin
      vTot := 0;
      DM4.cdsCred.First;
      while not DM4.cdsCred.Eof do
      begin
        vTot := vTot + DM4.cdsCredVALOR.AsFloat;
        DM4.cdsCred.Next;
      end;
      DM4.cdsCred.First;
      PagCred.Rodape.Panels[2].Text := 'Total: '+FormatFloat('#,##0.00', vTot);
    end;
  end
  else ShowMessage('Escolha um Motorista');

end;

procedure TPagCred.set_idM(i: integer);
begin
  idMot := i;
end;

procedure TPagCred.set_sair(i: Smallint);
begin
  saida := i;
end;

procedure TPagCred.btAtualizaClick(Sender: TObject);
begin
  Atualiza;
end;

procedure TPagCred.btSubApagarClick(Sender: TObject);
var Bco : TBco;

begin
  if (idV > 0) then
  begin
    if MessageDlg('Tem certeza que deseja apagar o '+DM4.cdsCredDESCR.Value +' ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := TBco.Create;
      Bco.CredMot_Apaga(idV);
      Bco.Destroy;
      Atualiza;
    end;
  end
  else ShowMessage('Selecione um Reembolso');

end;

procedure TPagCred.btSubSalvarClick(Sender: TObject);

var Bco : TBco;
    tip : Integer;
    descricao : String;

begin
  if (rd1.Checked) then
  begin
    tip := 1;
    descricao := rd1.Caption;
  end;
  if (rd2.Checked) then
  begin
    tip := 2;
    descricao := rd2.Caption;
  end;
  if (rd3.Checked) then
  begin
    tip := 3;
    descricao := edOut.Text;
  end;
  Bco := TBco.Create;
  if (idV = 0) then
     Bco.CredMot_Insere(idMot, tip, dtVale.DateTime,  descricao,vValor.Value)
   else
     Bco.CredMot_Altera(idV, tip, dtVale.DateTime,  descricao,vValor.Value);
  Bco.Destroy;
  Atualiza;
end;

procedure TPagCred.btSubNovoClick(Sender: TObject);
begin
  Limpar;
  idV := 0;
end;

procedure TPagCred.FormActivate(Sender: TObject);
begin
  Limpar;
  idV := 0;
end;

procedure TPagCred.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsCred.RecordCount > 0) then
  begin
    idV := DM4.cdsCredID.Value;
    dtVale.DateTime := DM4.cdsCredDATA.Value;
    vValor.Value := DM4.cdsCredVALOR.AsFloat;
    if (DM4.cdsCredTIPO.Value = 1) then
    begin
      rd1.Checked := true;
      edOut.Text := '';
    end;

    if (DM4.cdsCredTIPO.Value = 2) then
    begin
      rd2.Checked := true;
      edOut.Text := '';
    end;

    if (DM4.cdsCredTIPO.Value = 3) then
    begin
      rd3.Checked := true;
      edOut.Text := DM4.cdsCredDESCR.Value;
    end;

  end;

end;

procedure TPagCred.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (saida = 1) then
  begin
    PagDiv.set_Cred(vTot);
    PagDiv.Show;

  end;
end;

end.
