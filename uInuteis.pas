unit uInuteis;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ComCtrls,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls;

type
  TInuteis = class(TForm)
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    dia: TDateTimePicker;
    btSalvar: TSpeedButton;
    btApagar: TSpeedButton;
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Inuteis: TInuteis;
  idInutil : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM5;

procedure Mostra();
  var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Prazo2Inuteis_Mostra(0);
  Bco.Destroy;
end;

procedure Limpa;

begin
  idInutil := 0;
  Inuteis.dia.DateTime := Now;
  Mostra;
end;

procedure TInuteis.btApagarClick(Sender: TObject);
  var Bco : Tbco;
begin
  // Apaga
  if idInutil = 0 then
  begin
    if MessageDlg('Tem certeza que deseja APAGAR a data'+FormatDateTime('dd/MM/yy',dia.DateTime)+ '?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := TBco.Create;
      BCo.Prazo2Inuteis_Apagar(idInutil);
      Bco.Destroy;
    end;
  end
  else ShowMessage('Selecione uma data com duplo clique antes');
end;

procedure TInuteis.btSalvarClick(Sender: TObject);
  var Bco : Tbco;

begin
  // Salvar
  Bco := TBco.Create;
  if idInutil = 0 then
    Bco.Prazo2Inuteis_Inserir(dia.DateTime)
  else
    Bco.Prazo2Inuteis_Alterar(idInutil, dia.DateTime);
  Bco.Destroy;

  Limpa;
end;

procedure TInuteis.Entrar;
begin
  Limpa;
end;

procedure TInuteis.JvDBGrid1DblClick(Sender: TObject);
begin
  idInutil := DM5.cdsInuID.Value;
  dia.DateTime := DM5.cdsInuDIA_INUTIL.Value;
end;

end.
