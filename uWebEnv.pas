unit uWebEnv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus,
  JvExDBGrids, JvDBGrid, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, Datasnap.DBClient;

type
  TWebEnv = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtPesq: TDateTimePicker;
    Rodape: TStatusBar;
    btAtual: TBitBtn;
    DataSource1: TDataSource;
    btEnviar: TButton;
    PopupMenu1: TPopupMenu;
    Enviar1: TMenuItem;
    JvDBGrid1: TJvDBGrid;
    N1: TMenuItem;
    Desmarcarselecionadas1: TMenuItem;
    EnviarSelecionadas1: TMenuItem;
    RespMemo: TRichEdit;
    num: TStaticText;
    btEnviar2: TBitBtn;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    ClientDataSet1: TClientDataSet;
    procedure btAtualClick(Sender: TObject);
    procedure btEnviarClick(Sender: TObject);
    procedure Enviar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Desmarcarselecionadas1Click(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure EnviarSelecionadas1Click(Sender: TObject);
    procedure btEnviar2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebEnv: TWebEnv;
  ct, contaSMS : Integer;

implementation

{$R *.dfm}

// Alterado WEBSERVICE de Service1 para Service
uses uDM1, uDM2, uDM3, uBanco, Service, uSMSclasse, uRastreio, uREST;

Procedure Total_sem();
  var sem:Integer;
begin
    sem := DM2.Conta('TB_NOTAF', 'status_web <> 6 and dtNota >= '+QuotedStr(FormatDateTime('yyyy-MM-dd', Now-180)) );
    WebEnv.Rodape.Panels[2].Text := 'NF não enviadas: ' + IntToStr(sem);
    WebEnv.btEnviar.Enabled := false;
    if sem > 0  then WebEnv.btEnviar.Enabled := true;
    
end;

procedure ContaNao();

var conta_nf, conta_env, sem:Integer;

begin
    conta_env := 0;
    conta_nf  := 0;

    DM3.vcWeb.First;
    while not DM3.vcWeb.Eof do
    begin
      conta_nf := conta_nf + 1;
      if (DM3.vcWebstatus_web.Value <> 6) then conta_env := conta_env + 1;

      DM3.vcWeb.Next;
    end;


    DM3.vcWeb.First;
    WebEnv.Rodape.Panels[0].Text := 'Notas do DIA: '+IntToStr(conta_nf);
    WebEnv.Rodape.Panels[1].Text := 'NF não enviadas DIA: '+IntToStr(conta_env);
    WebEnv.Rodape.Panels[2].Text := '-';
    WebEnv.num.Caption := conta_env.ToString;
end;

procedure Atualiza();
var
    Bco : TBco;
begin
  DM3.vcWeb.IndexName := '';
  Bco := TBco.Create;
  Bco.WS_Notas_Mostra(WebEnv.dtPesq.DateTime);
  Bco.Destroy;
  ContaNao;
end;


procedure TWebEnv.btAtualClick(Sender: TObject);

begin
  respMemo.Clear;
  respMemo.Lines.Append('Atualizando...');
  Atualiza;
  Total_sem;
  btEnviar2.Enabled := true;
end;

/// ENVIO via WebService ----------------------------
procedure Envia(tipo : Integer);

var resp, id : integer;
    Bco : TBco;
    idMot : Integer;
    doc : string;
    sms : TSMS;
    hoje : TDateTime;
    Rast : TRastreio;

begin
  idMot := 0;
  if (DM3.vcWebLIGMOT.Value <> null) then idMot := DM3.vcWebLIGMOT.AsInteger;
  doc := '';
  if (DM3.vcWebDOCDEST.Value <> null) then doc := DM3.vcWebDOCDEST.Value;

  resp := GetServiceSoap().Entrada_Notas_ID(DM3.vcWebLigCli.Value, DM3.vcWebnumNF.Value, DM3.vcWebRomaneio.AsInteger, FormatDateTime('dd/MM/yyyy', DM3.vcWebdtRoma.Value),DM3.vcWebvalor.AsFloat,tipo,'2743579981',doc, idMot, DM3.vcWebIDN.Value);
  Bco := TBco.Create;
  Bco.WS_MarcaResp(DM3.vcWebidN.Value , resp);
  Bco.Destroy;

  // EVENTO NF - Rastreio
  Rast := TRastreio.Create;
  Rast.set_ocor(DM3.vcWebnumNF.Value, DM3.vcWebLigCli.Value, 0, evrNaWEB);
  Rast.Destroy;


  hoje := Date;
  if (resp = 6) then
  if (WebEnv.dtPesq.DateTime >= hoje) then
  begin
    // Enviar SMS
    sms := TSMS.Create;
    ct := ct + sms.EnviarID(DM3.vcWebIDN.Value);
    contaSMS := contaSMS + 1;
    sms.Destroy;
  end;
end;

procedure Enviar2(CodJSON, Base:string);
  var resp:string;
  i : integer;
  restTmp : TRest;
  diaOk : Boolean;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  diaOk := false;
  with WebEnv do
  begin
    hoje := Date;
    dia := dtPesq.DateTime;
    diaOk := (dia>=hoje);

    RESTClient1.BaseURL := Base;
    RESTRequest1.Params.Items[0].Value  :=  QuotedStr(CodJSON);
    RESTRequest1.Execute;
    resp :=  RESTResponse1.JSONValue.ToString.Trim;

    restTmp := TRest.Create;
    restTmp.Grava_Saida(resp);
    restTmp.Rastreio_SMS(resp, diaOk);
    restTmp.Destroy;
   end;
end;

Procedure Preparar2();

var     conta_env, romaAtual, idmot, total_R, total_N : Integer;
        sms : TSMS;
        restE : TRest;
        sCod : String;

begin
  with WebEnv do
  begin
    respMemo.Clear;
    respMemo.Lines.Append('Iniciando ENVIO ...');
    contaSMS  := 0;

    if (DM3.vcWeb.RecordCount > 0) then
    begin
      conta_env := 0;
      total_R := 0;
      total_N := 0;
      restE := TRest.Create;
      restE.Inicia;
      romaAtual := DM3.vcWebROMANEIO.Value;
      idmot     := DM3.vcWebLIGMOT.Value;
      DM3.vcWeb.First;
      while not DM3.vcWeb.Eof do
      begin
        if (DM3.vcWebstatus_ent.Value = 0) and (DM3.vcWebstatus_web.Value  = 0) then
        begin
          if (romaAtual = DM3.vcWebROMANEIO.Value) and (conta_env<300) then
          begin
            conta_env := conta_env + 1;
            restE.CJ1_Notas[conta_env].idN := DM3.vcWebIDN.Value;
            restE.CJ1_Notas[conta_env].numN := DM3.vcWebNUMNF.Value;
            restE.CJ1_Notas[conta_env].numC := DM3.vcWebLIGCLI.Value;
            restE.CJ1_Notas[conta_env].vNF := DM3.vcWebVALOR.AsFloat;
            restE.CJ1_Notas[conta_env].doc := DM3.vcWebDOCDEST.Value;
            restE.CJ1_Notas[conta_env].ped := DM3.vcWebNUMPED.Value;
          end
          else
          begin
            // Envia
            if conta_env > 0 then
            begin
              total_R := total_R + 1;
              total_N := total_N + conta_env;
              restE.CJ1_NotasConta := conta_env;
              sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot, FormatDateTime('dd/MM/yyyy', dtPesq.DateTime));
              //sCod := QuotedStrsCod.Replace('\','');
              Enviar2(sCod, restE.BaseURL1);

              RespMemo.Lines.Append(' ...:> Romaneio: '+ romaAtual.ToString+ ' com '+conta_env.ToString+ ' notas');
              //RespMemo.Lines.Append( sCod );
            end;

            // Reinicia
            romaAtual := DM3.vcWebROMANEIO.Value;
            idmot     := DM3.vcWebLIGMOT.Value;
            restE.Limpar;
            conta_env := 1;
            restE.CJ1_Notas[conta_env].idN := DM3.vcWebIDN.Value;
            restE.CJ1_Notas[conta_env].numN := DM3.vcWebNUMNF.Value;
            restE.CJ1_Notas[conta_env].numC := DM3.vcWebLIGCLI.Value;
            restE.CJ1_Notas[conta_env].vNF := DM3.vcWebVALOR.AsFloat;
            restE.CJ1_Notas[conta_env].doc := DM3.vcWebDOCDEST.Value;
            restE.CJ1_Notas[conta_env].ped := DM3.vcWebNUMPED.Value;
            sCod := '';
          end;
        end;
        DM3.vcWeb.Next;
      end;
      if conta_env>0 then
      begin
        total_R := total_R + 1;
        total_N := total_N + conta_env;
        restE.CJ1_NotasConta := conta_env;
        sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot, FormatDateTime('dd/MM/yyyy', dtPesq.DateTime));

        Enviar2(sCod, restE.BaseURL1);

        RespMemo.Lines.Append(' ...:> Romaneio: '+ romaAtual.ToString+ ' com '+conta_env.ToString+ ' notas');
        //RespMemo.Lines.Append( sCod );
      end;
      RespMemo.Lines.Append(' ###*> Total Romaneios: '+ total_R.ToString+ ' // Total notas '+Total_N.ToString+ ' ');

      //Atualiza;
      Rodape.Panels[2].Text := 'Terminado o envio de '+IntToStr(conta_env)+' notas';
      restE.Destroy;
    end
    else
    begin
      Rodape.Panels[2].Text := 'Sem Notas';
      RespMemo.Lines.Append(' *** SEM notas !');
    end;

    if (contaSMS > 0) then
    begin
      sms := TSMS.Create;
      sms.Monta_FraseTRANSP(contaSMS);
      sms.Destroy;
    end;
  end; // with
end;

procedure Enviar3(CodJSON, Base:string);
  var resp:string;
  i : integer;
  restTmp : TRest;
  diaOk : Boolean;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  diaOk := false;
  with WebEnv do
  begin
    hoje := Date;
    dia := dtPesq.DateTime;
    diaOk := (dia>=hoje);

    RESTClient1.BaseURL := Base;
    RESTRequest1.Params.Items[0].Value  :=  QuotedStr(CodJSON);
    RESTRequest1.Execute;
    resp :=  RESTResponse1.JSONValue.ToString.Trim;
   end;
end;

Procedure Preparar3();

var     conta_env, romaAtual, idmot, total_R, total_N : Integer;
        sms : TSMS;
        restE : TRest;
        sCod, BaseLW : String;

begin
  with WebEnv do
  begin
    respMemo.Clear;
    respMemo.Lines.Append('Iniciando ENVIO ...');
    contaSMS  := 0;


    if (DM3.vcWeb.RecordCount > 0) then
    begin
      conta_env := 0;
      total_R := 0;
      total_N := 0;
      restE := TRest.Create;
      restE.Inicia;
      BaseLW := restE.BaseURL11;

      romaAtual := DM3.vcWebROMANEIO.Value;
      idmot     := DM3.vcWebLIGMOT.Value;
      DM3.vcWeb.First;
      while not DM3.vcWeb.Eof do
      begin
        if (DM3.vcWebstatus_ent.Value = 0) and (DM3.vcWebstatus_web.Value  = 0) then
        begin
          if (romaAtual = DM3.vcWebROMANEIO.Value) and (conta_env<300) then
          begin
            conta_env := conta_env + 1;
            restE.CJ1_Notas[conta_env].idN := DM3.vcWebIDN.Value;
            restE.CJ1_Notas[conta_env].numN := DM3.vcWebNUMNF.Value;
            restE.CJ1_Notas[conta_env].numC := DM3.vcWebLIGCLI.Value;
            restE.CJ1_Notas[conta_env].vNF := DM3.vcWebVALOR.AsFloat;
            restE.CJ1_Notas[conta_env].doc := DM3.vcWebDOCDEST.Value;
            restE.CJ1_Notas[conta_env].ped := DM3.vcWebNUMPED.Value;
          end
          else
          begin
            // Envia
            if conta_env > 0 then
            begin
              total_R := total_R + 1;
              total_N := total_N + conta_env;
              restE.CJ1_NotasConta := conta_env;
              sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot, FormatDateTime('dd/MM/yyyy', dtPesq.DateTime));
              //sCod := QuotedStrsCod.Replace('\','');
              Enviar3(sCod, BaseLW);

              RespMemo.Lines.Append(' ...:> Romaneio: '+ romaAtual.ToString+ ' com '+conta_env.ToString+ ' notas');
              //RespMemo.Lines.Append( sCod );
            end;

            // Reinicia
            romaAtual := DM3.vcWebROMANEIO.Value;
            idmot     := DM3.vcWebLIGMOT.Value;
            restE.Limpar;
            conta_env := 1;
            restE.CJ1_Notas[conta_env].idN := DM3.vcWebIDN.Value;
            restE.CJ1_Notas[conta_env].numN := DM3.vcWebNUMNF.Value;
            restE.CJ1_Notas[conta_env].numC := DM3.vcWebLIGCLI.Value;
            restE.CJ1_Notas[conta_env].vNF := DM3.vcWebVALOR.AsFloat;
            restE.CJ1_Notas[conta_env].doc := DM3.vcWebDOCDEST.Value;
            restE.CJ1_Notas[conta_env].ped := DM3.vcWebNUMPED.Value;
            sCod := '';
          end;
        end;
        DM3.vcWeb.Next;
      end;
      if conta_env>0 then
      begin
        total_R := total_R + 1;
        total_N := total_N + conta_env;
        restE.CJ1_NotasConta := conta_env;
        sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot, FormatDateTime('dd/MM/yyyy', dtPesq.DateTime));

        Enviar3(sCod, BaseLW);

        RespMemo.Lines.Append(' ...:> Romaneio: '+ romaAtual.ToString+ ' com '+conta_env.ToString+ ' notas');
        //RespMemo.Lines.Append( sCod );
      end;
      RespMemo.Lines.Append(' ###*> Total Romaneios: '+ total_R.ToString+ ' // Total notas '+Total_N.ToString+ ' ');

      //Atualiza;
      Rodape.Panels[2].Text := 'Terminado o envio de '+IntToStr(conta_env)+' notas';
      restE.Destroy;
    end
    else
    begin
      Rodape.Panels[2].Text := 'Sem Notas';
      RespMemo.Lines.Append(' *** SEM notas !');
    end;

    if (contaSMS > 0) then
    begin
      sms := TSMS.Create;
      sms.Monta_FraseTRANSP(contaSMS);
      sms.Destroy;
    end;
  end; // with
end;


procedure TWebEnv.btEnviar2Click(Sender: TObject);

begin
  Preparar2();
  //Preparar3();  envia para LW
end;





procedure TWebEnv.btEnviarClick(Sender: TObject);

var     conta_env : Integer;
        sms : TSMS;

begin
  respMemo.Clear;
  respMemo.Lines.Append('Iniciando ENVIO ...');

  if (DM3.vcWeb.RecordCount > 0) then
  begin
    conta_env := 0;
    contaSMS  := 0;
    DM3.vcWeb.First;
    while not DM3.vcWeb.Eof do
    begin
      if (DM3.vcWebstatus_ent.Value = 0) and (DM3.vcWebstatus_web.Value  = 0) then
      begin
        try
          WebEnv.RespMemo.Lines.Append('Enviando nota: '+DM3.vcWebNUMNF.AsString);
          Envia(0);
        except
          on e : Exception do
          begin
            WebEnv.respMemo.Lines.Append(e.message);
            WebEnv.RespMemo.Lines.Append('ERRO: reiniciando...');
            Atualiza;
          end;
        end;
        conta_env := conta_env + 1;
      end;
      DM3.vcWeb.Next;
    end;
    Atualiza;
    Rodape.Panels[2].Text := 'Terminado o envio de '+IntToStr(conta_env)+' notas';

  end
  else Rodape.Panels[2].Text := 'Sem Notas';

  if (contaSMS > 0) then
  begin
    sms := TSMS.Create;
    sms.Monta_FraseTRANSP(contaSMS);
    sms.Destroy;
  end;

end;

procedure TWebEnv.Enviar1Click(Sender: TObject);
begin
  Envia(0);
end;

procedure EnviaREST;

var resp, id : integer;
    Bco : TBco;
    idMot : Integer;
    doc : string;
    sms : TSMS;
    hoje : TDateTime;
    Rast : TRastreio;

begin
  idMot := 0;
  if (DM3.vcWebLIGMOT.Value <> null) then idMot := DM3.vcWebLIGMOT.AsInteger;
  doc := '';
  if (DM3.vcWebDOCDEST.Value <> null) then doc := DM3.vcWebDOCDEST.Value;

  //resp := GetServiceSoap().Entrada_Notas_ID(DM3.vcWebLigCli.Value, DM3.vcWebnumNF.Value, DM3.vcWebRomaneio.AsInteger, FormatDateTime('dd/MM/yyyy', DM3.vcWebdtRoma.Value),DM3.vcWebvalor.AsFloat,tipo,'2743579981',doc, idMot, DM3.vcWebIDN.Value);
  Bco := TBco.Create;
  Bco.WS_MarcaResp(DM3.vcWebidN.Value , resp);
  Bco.Destroy;

  // EVENTO NF - Rastreio
  Rast := TRastreio.Create;
  Rast.set_ocor(DM3.vcWebnumNF.Value, DM3.vcWebLigCli.Value, 0, evrNaWEB);
  Rast.Destroy;


  hoje := Date;
  if (resp = 6) then
  if (WebEnv.dtPesq.DateTime >= hoje) then
  begin
    // Enviar SMS
    sms := TSMS.Create;
    ct := ct + sms.EnviarID(DM3.vcWebIDN.Value);
    contaSMS := contaSMS + 1;
    sms.Destroy;
  end;
end;


procedure TWebEnv.FormActivate(Sender: TObject);
begin
  dtPesq.DateTime := Now;
end;

procedure TWebEnv.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not (gdSelected in State) then
    if (DM3.vcWebstatus_web.Value = 6) then
    begin
      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
      JvDBGrid1.Canvas.Font.Color := clGray;
    end
    else
    begin
      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := [];
      JvDBGrid1.Canvas.Font.Color := clBlue;
    end;


    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);

end;

procedure TWebEnv.Desmarcarselecionadas1Click(Sender: TObject);

var Bco : TBco;
    i : Integer;

begin
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

          Bco := TBco.Create;
          Bco.WS_MarcaResp(DM3.vcWebidN.Value , 0);
          Bco.Destroy;
      end;
end;

procedure TWebEnv.JvDBGrid1TitleClick(Column: TColumn);

var sIndeXName : String;
    Options:TIndexOptions;
    
begin
  // Marca a Coluna e Ordena
  if DM3.vcWeb.IndexName = Column.FieldName + '_ASC' then
  begin
    sIndexName := Column.FieldName + '_DESC';
    Options := [ixDescending];
    JvDBGrid1.SortMarker := smDown;
  end
  else
  begin
    sIndexName := Column.FieldName + '_ASC';
    Options := [];
    JvDBGrid1.SortMarker := smUp;
  end;

  if (DM3.vcWeb.IndexDefs.IndexOf(sIndexName) < 0) then
    DM3.vcWeb.AddIndex(sIndexName, Column.FieldName, Options);

  DM3.vcWeb.IndexName := sIndexName;
end;

procedure TWebEnv.EnviarSelecionadas1Click(Sender: TObject);
var Bco : TBco;
    i : Integer;

begin
  if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

        Envia(0);
      end;
   Atualiza;
end;

end.
