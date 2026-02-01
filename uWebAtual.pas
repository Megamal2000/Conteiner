unit uWebAtual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, JvDataSource, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, ComCtrls, StdCtrls, JvExStdCtrls, JvEdit, JvValidateEdit,
  JvExControls, JvSpecialProgress, Buttons;

type
  TWebAtual = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    dat: TDateTimePicker;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Panel3: TPanel;
    lbTarefa: TLabel;
    barP: TJvSpecialProgress;
    btPesq1: TBitBtn;
    btPesq2: TBitBtn;
    btEnviar: TBitBtn;
    edNum: TEdit;
    Panel4: TPanel;
    btUMA: TBitBtn;
    Label3: TLabel;
    lbNota: TLabel;
    ckBaixas: TCheckBox;
    procedure btPesq1Click(Sender: TObject);
    procedure btPesq2Click(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure btEnviarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btUMAClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  WebAtual: TWebAtual;
  numRoma, tipoPesq, idNF : Integer;

implementation

{$R *.dfm}

// Alterei em 18/09/2016 o service1 para service (com destdoc)
uses uBanco, uDM4, uRoma, service, uEnviaRest, uEnviarRest2;

procedure NotaSelecionada();

begin
  WebAtual.lbNota.Caption := DM4.cdsWEBcNUMNF.AsString;
  idNF :=  DM4.cdsWEBcID.Value;
end;

procedure TWebAtual.btPesq1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.WebAt_Pesq1(dat.DateTime);
  Bco.Destroy;
  StatusBar1.Panels[0].Text := 'Pesquisa por DATA';
  StatusBar1.Panels[1].Text := DM4.cdsWEBc.RecordCount.ToString+' notas';
  tipoPesq := 1;
  lbTarefa.Caption := 'Pesquisa por DATA';

  DM4.cdsWEBc.First;
  NotaSelecionada;
end;

procedure Pesquisa_Roma(n:String);

var Bco : TBco;
    nR : Integer;
    rm : TRoma;

begin
  rm := TRoma.Create;
  nR := rm.Pesquisa_Romaneio(n);
  rm.Destroy;
  numRoma := nR;

  if (nR > 0) then
  begin
    Bco := TBco.Create;
    Bco.WebAt_Pesq2(nR);
    Bco.Destroy;

    WebAtual.StatusBar1.Panels[0].Text := 'Pesquisa por Romaneio ('+n+')';
    WebAtual.StatusBar1.Panels[1].Text := DM4.cdsWEBc.RecordCount.ToString+' notas';
    tipoPesq := 2;

  end;
  WebAtual.lbTarefa.Caption := 'Pesquisa por Romaneio';

  DM4.cdsWEBc.First;
  NotaSelecionada;

end;


procedure TWebAtual.btPesq2Click(Sender: TObject);

begin
  Pesquisa_Roma(edNum.Text);
end;



procedure TWebAtual.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if (edNum.Text <> '') then Pesquisa_Roma(edNum.Text);
  if not(Key in ['0'..'9',Chr(8),'/']) then Key := #0;
end;

procedure TWebAtual.Entrar;
begin
  lbNota.Caption := '-';
  idNF := 0;
end;
   {
procedure Enviar1;
var p, resp : Integer;
    idMot, Baixa2 : Integer;
    doc : string;
    Bco : tbco;
begin
  with WebAtual do
  begin
    barP.Minimum := 1;
    barP.Maximum := DM4.cdsWEBc.RecordCount;

    p := 0;
    barP.Position := 1;

    Bco := TBco.Create;
    Panel3.Visible := true;
    DM4.cdsWEBc.First;
    while not DM4.cdsWEBc.Eof do
    begin
      p := p + 1;
      barP.Position := p;
      // envia a nota fiscal
      idMot := 0;
      if (DM4.cdsWEBcLIGMOT.Value <> null) then idMot := DM4.cdsWEBcLIGMOT.AsInteger;
      doc := '';
      if (DM4.cdsWEBcDOCDEST.Value <> null) then doc := DM4.cdsWEBcDOCDEST.Value;

      // Alterado de GetService1Soap para GetServiceSoap em 18/09/2016
      resp := GetServiceSoap().Registra_Entrega2(DM4.cdsWEBcROMANEIO.AsInteger,DM4.cdsWEBcNUMNF.AsInteger,DM4.cdsWEBcSTATUS_ENT.Value,FormatDateTime('dd/MM/yyyy',DM4.cdsWEBcDTENT.AsDateTime), FormatDateTime('HH:mm',DM4.cdsWEBcHRENT.AsDateTime),DM4.cdsWEBcNOCORR.Value,'2458229467',idMot, doc);

      if resp = 4 then
       begin
         if DM4.cdsWEBcBAIXA_ORIG.Value = 11 then Baixa2 := 1;
         if DM4.cdsWEBcBAIXA_ORIG.Value = 13 then Baixa2 := 3;
         Bco.Notas_MarcarBaixa2(DM4.cdsWEBcID.Value, Baixa2);
       end;
      //if (resp > 0) then ShowMessage('Resposta '+ IntToStr(resp));
      DM4.cdsWEBc.Next;
    end;
    Bco.Destroy;
    DM4.cdsWEBc.First;
    Panel3.Visible := false;
  end;
end;
    }
function EnviarDia():boolean;
  var resp : boolean;

begin
  {
  EnviaRest.Entrar('[KH] Envia Dia '+FormatDateTime('dd/MM/yyyy',WebAtual.dat.DateTime) , 2);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  EnviaRest.set_dia(WebAtual.dat.DateTime);
   }
  EnviarRest2.Entrar;
  EnviarRest2.set_TipoEnvio('Dia');
  EnviarRest2.set_DiaEnvia(WebAtual.dat.DateTime);
  EnviarRest2.set_Reenvia(not WebAtual.ckBaixas.Checked);
  resp := false;
  if EnviarRest2.ShowModal = mrOk then resp := true;
  result := resp;
end;

procedure BaixaDia();
begin
{
  EnviaRest.Entrar('[KH] Baixa dia '+FormatDateTime('dd/MM/yyyy',WebAtual.dat.DateTime) , 6);
  EnviaRest.set_dia(WebAtual.dat.DateTime);
  EnviaRest.ShowModal;
 }
  EnviarRest2.Entrar;
  EnviarRest2.set_TipoEnvio('BaixaDia');
  EnviarRest2.set_DiaEnvia(WebAtual.dat.DateTime);
  EnviarRest2.ShowModal;

end;

function EnviarRomaneio():boolean;
  var resp : boolean;

begin
{
  EnviaRest.Entrar('[KH] Envia Romaneio '+WebAtual.edNum.Text, 4);
  EnviaRest.set_numRoma(numRoma);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  }
  EnviarRest2.Entrar;
  EnviarRest2.set_TipoEnvio('Romaneio');
  EnviarRest2.set_NumRoma(numRoma);
  EnviarRest2.set_Reenvia(not WebAtual.ckBaixas.Checked);
  resp := false;
  if EnviarRest2.ShowModal = mrOk then resp := true;
  result := resp;
end;

procedure BaixaRomaneio();

begin
{
  EnviaRest.Entrar('[KH] Baixa Romaneio '+WebAtual.edNum.Text, 5);
  EnviaRest.set_numRoma(numRoma);
  EnviaRest.ShowModal;
 }
  EnviarRest2.Entrar;
  EnviarRest2.set_TipoEnvio('BaixaRomaneio');
  EnviarRest2.set_NumRoma(numRoma);
  EnviarRest2.ShowModal;

end;

function EnviarUMA():boolean;
  var resp : boolean;

begin
  EnviaRest.Entrar('[KH] Enviar Nota '+WebAtual.lbNota.Caption , 14);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  EnviaRest.set_ID(idNF);
  resp := false;
  if EnviaRest.ShowModal = mrOk then resp := true;
  result := resp;

end;

procedure BaixaUMA();
begin
  EnviaRest.Entrar('[KH] Envia Baixa da Nota '+WebAtual.lbNota.Caption , 15);
  EnviaRest.set_ID(idNF);
  EnviaRest.ShowModal;
end;

function EnviarDiaLW():boolean;
  var resp : boolean;

begin
  EnviaRest.Entrar('[LW] Envia Dia '+FormatDateTime('dd/MM/yyyy',WebAtual.dat.DateTime) , 11);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  EnviaRest.set_dia(WebAtual.dat.DateTime);
  resp := false;
  if EnviaRest.ShowModal = mrOk then resp := true;
  result := resp;

end;

procedure BaixaDiaLW();
begin
  EnviaRest.Entrar('[LW] Baixa dia '+FormatDateTime('dd/MM/yyyy',WebAtual.dat.DateTime) , 13);
  EnviaRest.set_dia(WebAtual.dat.DateTime);
  EnviaRest.ShowModal;
end;


function EnviarUMA_LW():boolean;
  var resp : boolean;

begin
  EnviaRest.Entrar('[LW] Enviar Nota '+WebAtual.lbNota.Caption , 16);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  EnviaRest.set_ID(idNF);
  resp := false;
  if EnviaRest.ShowModal = mrOk then resp := true;
  result := resp;

end;

procedure BaixaUMA_LW();
begin
  EnviaRest.Entrar('[LW] Envia Baixa da Nota '+WebAtual.lbNota.Caption , 17);
  EnviaRest.set_ID(idNF);
  EnviaRest.ShowModal;
end;

function EnviarRomaneioLW():boolean;
  var resp : boolean;

begin
  EnviaRest.Entrar('[LW] Envia Romaneio '+WebAtual.edNum.Text, 10);
  EnviaRest.set_numRoma(numRoma);
  EnviaRest.set_reenviar(not WebAtual.ckBaixas.Checked);
  resp := false;
  if EnviaRest.ShowModal = mrOk then resp := true;
  result := resp;
end;

procedure BaixaRomaneioLW();
begin
  EnviaRest.Entrar('[LW] Baixa Romaneio '+WebAtual.edNum.Text, 12);
  EnviaRest.set_numRoma(numRoma);
  EnviaRest.ShowModal;
end;

procedure TWebAtual.btUMAClick(Sender: TObject);
begin
//  try
//  if EnviarUMA then BaixaUMA;
//  finally
//   EnviaRest.Close;
//   ShowMessage('Continuar...');
//  end;

  try
    if EnviarUMA_LW then BaixaUMA_LW;
  finally
    EnviaRest.Close;
    //ShowMessage('Continuar...');
  end;

end;


procedure TWebAtual.btEnviarClick(Sender: TObject);

begin
  if (DM4.cdsWEBc.RecordCount>0) then
  begin
    // por dia
    if (tipoPesq=1) then
    begin
      try
        if EnviarDia then BaixaDia;
      finally
        EnviarRest2.Close;
        //ShowMessage('Continuar...');
      end;

        {
      try
        if EnviarDiaLW then BaixaDiaLW;
      finally
        EnviaRest.Close;
        ShowMessage('Continuar...');      end;
        }
    end;

    // por Romaneio
    if (tipoPesq=2) then
    begin
      try
        if EnviarRomaneio then BaixaRomaneio;
      finally
        EnviarRest2.Close;
      //  ShowMessage('Continuar...');        '
      end;
        {
      try
        if EnviarRomaneioLW then BaixaRomaneioLW;
      finally
        EnviaRest.Close;
        ShowMessage('Continuar...');
      end;
      }
    end;

  end;
  DM4.cdsWEBc.Active := false;
  edNum.Text := '';
end;

procedure TWebAtual.FormActivate(Sender: TObject);
begin
  Panel3.Visible := false;
end;

procedure TWebAtual.JvDBGrid1CellClick(Column: TColumn);
begin
  NotaSelecionada;
end;

procedure TWebAtual.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DM4.cdsWEBcFLAG_GERAL.Value > 5) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsitalic];
    JvDBGrid1.Canvas.Font.Color := clRed;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

end.
