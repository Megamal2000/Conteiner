unit uEnviaRest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.ExtCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.ComCtrls, Vcl.StdCtrls, Datasnap.DBClient;

type
  TEnviaRest = class(TForm)
    lbQual: TStaticText;
    lbProg: TStaticText;
    pb: TProgressBar;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Timer1: TTimer;
    RESTClient2: TRESTClient;
    RESTRequest2: TRESTRequest;
    RESTResponse2: TRESTResponse;
    StaticText1: TStaticText;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    numRoma : Integer;
    sIDnota : String;
    Reenviar: boolean;
    entDia : TDateTime;
    qtEnt, qtSai : Integer;
  public
    { Public declarations }
    procedure Entrar(Titulo:string; tipo : smallint);
    procedure set_numRoma(i:Integer);
    procedure set_reenviar(b : boolean);
    procedure set_dia(d : TDateTime);
    procedure set_ID(idNF:Integer);
    function get_Entradas:Integer;
    function get_Saidas:Integer;

  end;

var
  EnviaRest: TEnviaRest;
  tipoM:Integer;

CONST MAX_BLOCO = 10;

implementation

{$R *.dfm}

{ TEnviaRest }

uses uBanco, uRastreio, uSMSclasse, uREST, uDM1, uDM5;

procedure TEnviaRest.Entrar(Titulo:string; tipo : smallint);
begin
  tipoM := tipo;

  Timer1.Interval := 5000;
  lbQual.Caption := Titulo;
  lbProg.Caption := 'Aguarde...';
  Timer1.Enabled := true;
end;


procedure Enviar(CodJSON, Base:string; enviaSMS:boolean);
  var resp:string;
  i : integer;
  restTmp : TRest;
  diaOk : Boolean;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  diaOk := false;
  with EnviaRest do
  begin
    hoje := Date;
    dia := Date;
    diaOk := (dia>=hoje);

    RESTClient1.BaseURL := Base;
    RESTRequest1.Params.Items[0].Value  :=  QuotedStr(CodJSON);
    RESTRequest1.Execute;
    resp :=  RESTResponse1.JSONValue.ToString.Trim;

    restTmp := TRest.Create;
    if TipoM=9 then
    begin
      restTmp.Grava_Saida(resp);
      if enviaSMS then restTmp.Rastreio_SMS(resp, diaOk);
    end;
    restTmp.Destroy;
   end;
end;

procedure EnviarBaixa(CodJSON, Base:string);
  var resp:string;
  i : integer;
  restTmp : TRest;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  with EnviaRest do
  begin
    RESTClient1.BaseURL := Base;
    RESTRequest1.Params.Items[0].Value  :=  QuotedStr(CodJSON);
    RESTRequest1.Execute;
    resp :=  RESTResponse1.JSONValue.ToString.Trim;

    restTmp := TRest.Create;
    restTmp.Grava_SaidaB(resp);
    restTmp.Destroy;
  end;
end;

procedure Solicitar_SAC(Base:string);
  var resp:string;
  i : integer;
  restTmp : TRest;
  diaOk : Boolean;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  with EnviaRest do
  begin
    RESTClient2.BaseURL := Base;
    RESTRequest2.Execute;
    resp :=  RESTResponse2.JSONValue.ToString.Trim;

    restTmp := TRest.Create;
    restTmp.Grava_SaidaC(resp);
    restTmp.Destroy;
   end;
end;

procedure EnviarDados(CodJSON, Base:string);
  var resp:string;
  i : integer;
  restTmp : TRest;
  Bco : TBco;
  dia, hoje : TDatetime;

begin
  with EnviaRest do
  begin
    RESTClient1.BaseURL := Base;
    RESTRequest1.Params.Items[0].Value  :=  QuotedStr(CodJSON);
    RESTRequest1.Execute;
    resp :=  RESTResponse1.JSONValue.ToString.Trim;

    restTmp := TRest.Create;
    lbProg.Caption := lbProg.Caption + ' MARCANDO... ';
    Application.ProcessMessages;
    restTmp.Grava_SaidaD(resp);
    restTmp.Destroy;
  end;
end;



procedure Montagem1(idR:Integer; SMSok:boolean);

var     conta_env, romaAtual, idmot : Integer;
        sms : TSMS;
        restE : TRest;
        Bco : TBco;
        sCod, sP, sD, sDT, Base0 : String;

begin
  Bco := TBco.Create;
  Bco.REST_Notas(idR, EnviaRest.Reenviar);
  Bco.REST_Romaneio(idR);
  Bco.Destroy;



  if (DM5.cdsRestN.RecordCount > 0) then
  begin
    conta_env := 0;
    restE := TRest.Create;
    restE.Inicia;

    Base0 := restE.BaseURL1;
    if ((tipoM = 9) or (tipoM = 10)) then Base0 := restE.BaseURL11;
    EnviaRest.StaticText1.Caption := Base0;

    romaAtual := DM5.cdsRestRROMANEIO.Value;
    idmot     := DM5.cdsRestRLIGMOT.Value;
    sDT       := FormatDateTime('dd/MM/yyyy', DM5.cdsRestRDTROMA.AsDateTime );
    EnviaRest.pb.Min:=0;
    EnviaRest.pb.Max:=DM5.cdsRestN.RecordCount;
    EnviaRest.pb.Position := 0;

    DM5.cdsRestN.First;
    while not DM5.cdsRestN.Eof do
    begin
      if (conta_env<=MAX_BLOCO) then
      begin
        conta_env := conta_env + 1;
        EnviaRest.pb.Position := EnviaRest.pb.Position + 1;
        EnviaRest.lbProg.Caption := 'Preparando Nota '+conta_env.ToString + ' de ' + DM5.cdsRestN.RecordCount.ToString;
        Application.ProcessMessages;

        sP := '-';
        sD := '-';
        if (DM5.cdsRestNNUMPED.Value<> null) then sP := DM5.cdsRestNNUMPED.Value;
        if (DM5.cdsRestNDOCDEST.Value<> null) then sD := DM5.cdsRestNDOCDEST.Value;

        restE.CJ1_Notas[conta_env].idN := DM5.cdsRestNID.Value;
        restE.CJ1_Notas[conta_env].numN := DM5.cdsRestNNUMNF.Value;
        restE.CJ1_Notas[conta_env].numC := DM5.cdsRestNLIGCLI.Value;
        restE.CJ1_Notas[conta_env].vNF := DM5.cdsRestNVALOR.AsFloat;
        restE.CJ1_Notas[conta_env].doc := sD;
        restE.CJ1_Notas[conta_env].ped := sP;
      end
      else
      begin
        // Envia
        if conta_env > 0 then
        begin
          restE.CJ1_NotasConta := conta_env;
          sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot,  sDT);
          EnviaRest.lbProg.Caption := 'Enviando (parte)...';
          Enviar(sCod, Base0, SMSok);
        end;

        // Reinicia
        romaAtual := DM5.cdsRestRROMANEIO.Value;
        idmot     := DM5.cdsRestRLIGMOT.Value;
        restE.Limpar;
        conta_env := 1;



        sP := '-';
        sD := '-';
        if (DM5.cdsRestNNUMPED.Value<> null) then sP := DM5.cdsRestNNUMPED.Value;
        if (DM5.cdsRestNDOCDEST.Value<> null) then sD := DM5.cdsRestNDOCDEST.Value;

        restE.CJ1_Notas[conta_env].idN := DM5.cdsRestNID.Value;
        restE.CJ1_Notas[conta_env].numN := DM5.cdsRestNNUMNF.Value;
        restE.CJ1_Notas[conta_env].numC := DM5.cdsRestNLIGCLI.Value;
        restE.CJ1_Notas[conta_env].vNF := DM5.cdsRestNVALOR.AsFloat;
        restE.CJ1_Notas[conta_env].doc := sD;
        restE.CJ1_Notas[conta_env].ped := sP;
        sCod := '';
      end;
      DM5.cdsRestN.Next;
    end;
    if conta_env>0 then
    begin
      restE.CJ1_NotasConta := conta_env;
      sCod := restE.CriaJSON1_EnviaNota(romaAtual, idmot, sDT);
      EnviaRest.lbProg.Caption := 'Enviando...';
      Enviar(sCod, Base0, SMSok);
    end;
    restE.Destroy;
  end;
end;

// só notas
procedure Montagem2();

var     conta_env, romaAtual, idmot : Integer;
        sms : TSMS;
        restE : TRest;
        Bco : TBco;
        sCod, sP, sD, sDT, Base0 : String;

begin

  if (DM5.cdsRestN.RecordCount > 0) then
  begin
    conta_env := 0;
    restE := TRest.Create;
    restE.Inicia;

    Base0 := restE.BaseURL2;
    if ((tipoM = 11) or (tipoM = 16)) then Base0 := restE.BaseURL12;
    EnviaRest.StaticText1.Caption := Base0;

    EnviaRest.pb.Min:=0;
    EnviaRest.pb.Max:=DM5.cdsRestN.RecordCount;
    EnviaRest.pb.Position := 0;

    Bco := TBco.Create;

    DM5.cdsRestN.First;
    while not DM5.cdsRestN.Eof do
    begin
      if (conta_env<=MAX_BLOCO) then
      begin
        conta_env := conta_env + 1;
        EnviaRest.pb.Position := EnviaRest.pb.Position + 1;
        EnviaRest.lbProg.Caption := 'Preparando Nota '+conta_env.ToString + ' de ' + DM5.cdsRestN.RecordCount.ToString;
        Application.ProcessMessages;

        sP := '-';
        sD := '-';
        if (DM5.cdsRestNNUMPED.Value<> null) then sP := DM5.cdsRestNNUMPED.Value;
        if (DM5.cdsRestNDOCDEST.Value<> null) then sD := DM5.cdsRestNDOCDEST.Value;

        restE.CJ1_Notas[conta_env].idN := DM5.cdsRestNID.Value;
        restE.CJ1_Notas[conta_env].numN := DM5.cdsRestNNUMNF.Value;
        restE.CJ1_Notas[conta_env].numC := DM5.cdsRestNLIGCLI.Value;
        restE.CJ1_Notas[conta_env].vNF := DM5.cdsRestNVALOR.AsFloat;
        restE.CJ1_Notas[conta_env].doc := sD;
        restE.CJ1_Notas[conta_env].ped := sP;

        Bco.REST_Romaneio(DM5.cdsRestNNROMA.Value);
        romaAtual := DM5.cdsRestRROMANEIO.Value;
        idmot     := DM5.cdsRestRLIGMOT.Value;
        sDT       := FormatDateTime('dd/MM/yyyy', DM5.cdsRestRDTROMA.AsDateTime );

        restE.CJ2_Notas[conta_env].romanum := romaAtual;
        restE.CJ2_Notas[conta_env].romamot := idmot;
        restE.CJ2_Notas[conta_env].romadt  := sDT;

      end
      else
      begin
        // Envia
        if conta_env > 0 then
        begin
          restE.CJ1_NotasConta := conta_env;
          sCod := restE.CriaJSON2_EnviaNota();
          EnviaRest.lbProg.Caption := 'Enviando (parte)...';
          Enviar(sCod, Base0, false);
        end;

        // Reinicia
        restE.Limpar;
        conta_env := 1;

        sP := '-';
        sD := '-';
        if (DM5.cdsRestNNUMPED.Value<> null) then sP := DM5.cdsRestNNUMPED.Value;
        if (DM5.cdsRestNDOCDEST.Value<> null) then sD := DM5.cdsRestNDOCDEST.Value;

        restE.CJ1_Notas[conta_env].idN := DM5.cdsRestNID.Value;
        restE.CJ1_Notas[conta_env].numN := DM5.cdsRestNNUMNF.Value;
        restE.CJ1_Notas[conta_env].numC := DM5.cdsRestNLIGCLI.Value;
        restE.CJ1_Notas[conta_env].vNF := DM5.cdsRestNVALOR.AsFloat;
        restE.CJ1_Notas[conta_env].doc := sD;
        restE.CJ1_Notas[conta_env].ped := sP;

        Bco.REST_Romaneio(DM5.cdsRestNNROMA.Value);
        romaAtual := DM5.cdsRestRROMANEIO.Value;
        idmot     := DM5.cdsRestRLIGMOT.Value;
        sDT       := FormatDateTime('dd/MM/yyyy', DM5.cdsRestRDTROMA.AsDateTime );

        restE.CJ2_Notas[conta_env].romanum := romaAtual;
        restE.CJ2_Notas[conta_env].romamot := idmot;
        restE.CJ2_Notas[conta_env].romadt  := sDT;
        sCod := '';
      end;
      DM5.cdsRestN.Next;
    end;
    Bco.Destroy;

    if conta_env>0 then
    begin
      restE.CJ1_NotasConta := conta_env;
      sCod := restE.CriaJSON2_EnviaNota();
      EnviaRest.lbProg.Caption := 'Enviando...';
      Enviar(sCod, Base0, false);
    end;
    restE.Destroy;
  end;
end;

// baixas
procedure Montagem3();

 var
      Bco : TBco;
      restE : TRest;
      idNF, roma, nNf, st, nMot, idMoto:Integer;
      sDt, stHr, sPerm, sDoc, sR, sCod, sPartes, Base0, sRecebe : String;
      Resp_i, cont, Baixa2 : Integer;
      PARTE, contParte : Integer;

begin
  PARTE := MAX_BLOCO;  // Quantidade de Notas por vez

  with EnviaRest do
  begin
    pb.Visible := true;
    pb.Min := 1;
    Application.ProcessMessages;

    Resp_i := 0;


    if DM5.cdsRestB.RecordCount > 0 then
    begin
       pb.Max := DM5.cdsRestB.RecordCount;
       sPartes := '/'+ IntToStr(Trunc(DM5.cdsRestB.RecordCount/PARTE));

       restE := TRest.Create;
       restE.Inicia;

       Base0 := restE.BaseURL3;
       if ((tipoM = 12) or (tipoM = 13) or (tipoM = 17))  then Base0 := restE.BaseURL13;
       EnviaRest.StaticText1.Caption := Base0;


       cont := 0; contParte := 0;
       DM5.cdsRestB.First;
       while not DM5.cdsRestB.eof do
       begin
         cont := cont + 1;
         pb.Position := pb.Position + 1;
         Application.ProcessMessages;

         if (cont<=PARTE) then
         begin
           // Nota
           nMot := 0;
           idNf := DM5.cdsRestBID.Value;
           if (DM5.cdsRestBNOCORR.Value<> null) then nMot := DM5.cdsRestBNOCORR.Value;

           sDt  := FormatDateTime('yyyy-MM-dd',DM5.cdsRestBDTENT.Value);
           stHr := FormatDateTime('HH:mm',DM5.cdsRestBHRENT.Value);

           idMoto := 10;
           if DM5.cdsRestBBAIXA_FUNC.Value > 0 then idMoto := DM5.cdsRestBBAIXA_FUNC.Value;

           sRecebe := '';
           if (DM5.cdsRestBRECEBEDOR.Value<> null) then sRecebe := DM5.cdsRestBRECEBEDOR.Value;

           restE.CJ3_Baixas[cont].idN := idNf;
           restE.CJ3_Baixas[cont].numOc := nMot;
           restE.CJ3_Baixas[cont].entDT := sDt;
           restE.CJ3_Baixas[cont].entHR := stHr;
           restE.CJ3_Baixas[cont].origem := idMoto;
           restE.CJ3_Baixas[cont].recebedor := sRecebe;
         end
         else
         begin
           // Envia
           if cont > 0 then
           begin
              restE.CJ1_NotasConta := cont;
              sCod := restE.CriaJSON3_Baixa();
              contParte := contParte + 1;
              EnviaRest.lbProg.Caption := 'Enviando Baixa - Parte: ' + contParte.ToString + sPartes;
              Application.ProcessMessages;
              EnviarBaixa(sCod, Base0);
           end;

           // Reinicia
           restE.Limpar;
           cont := 1;

           // Nota
           nMot := 0;
           idNf := DM5.cdsRestBID.Value;
           if (DM5.cdsRestBNOCORR.Value<> null) then nMot := DM5.cdsRestBNOCORR.Value;

           sDt  := FormatDateTime('yyyy-MM-dd',DM5.cdsRestBDTENT.Value);
           stHr := FormatDateTime('HH:mm',DM5.cdsRestBHRENT.Value);

           idMoto := 10;
           if DM5.cdsRestBBAIXA_FUNC.Value > 0 then idMoto := DM5.cdsRestBBAIXA_FUNC.Value;

           restE.CJ3_Baixas[cont].idN := idNf;
           restE.CJ3_Baixas[cont].numOc := nMot;
           restE.CJ3_Baixas[cont].entDT := sDt;
           restE.CJ3_Baixas[cont].entHR := stHr;
           restE.CJ3_Baixas[cont].origem := idMoto;
           sCod := '';
         end;


          {
            // Altera os dados da Nota
            Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);
            //  nota alterada
            if Resp_i = 4 then
            begin
              if DM5.cdsRestBBAIXA_ORIG.Value = 11 then Baixa2 := 1;
              if DM5.cdsRestBBAIXA_ORIG.Value = 13 then Baixa2 := 3;
              Bco.Notas_MarcarBaixa2(DM5.cdsRestBID.Value, Baixa2);
            end;
            }

         DM5.cdsRestB.Next;
       end;
       // Envia
       if cont > 0 then
       begin
          restE.CJ1_NotasConta := cont;
          sCod := restE.CriaJSON3_Baixa();
          EnviaRest.lbProg.Caption := 'Enviando Baixa (fim)...';
          EnviarBaixa(sCod, Base0);
       end;
    end;
    pb.Visible := false;
  end;
end;


// Pega SAC não marcados
procedure Montagem4();
  var nCham : Integer;
      sBase : String;
      Bco : TBco;
      RestE : TRest;

begin
  Bco := TBco.Create;
  nCham := Bco.Config_SAC_Ult_Mostra;
  Bco.Destroy;
  //sBase := 'http://localhost:2902/api/Sac/'+nCham.ToString;
  //sBase := 'http://flaydel.log.br/portalauto/fdrest/api/sac/'+nCham.ToString;
  sBase := RestE.BaseURL4+'/'+nCham.ToString;

  with EnviaRest do
  begin
    lbProg.Caption := 'Solicitando Dados do SAC ...';
    Solicitar_SAC(sBase);
  end;

end;


procedure Montagem5();

 var
      Bco : TBco;
      restE : TRest;
      sDt, sCod, sPartes : String;
      Resp_i, cont, Baixa2 : Integer;
      PARTE, contParte : Integer;

begin
  PARTE := MAX_BLOCO;  // Quantidade de Notas por vez

  with EnviaRest do
  begin
    pb.Visible := true;
    pb.Min := 1;
    Application.ProcessMessages;

    Resp_i := 0;


    if DM5.cdsRestD.RecordCount > 0 then
    begin
       pb.Max := DM5.cdsRestD.RecordCount;
       sPartes := '/'+ IntToStr(Trunc(DM5.cdsRestD.RecordCount/PARTE));

       restE := TRest.Create;
       restE.Inicia;

       cont := 0; contParte := 0;
       DM5.cdsRestD.First;
       while not DM5.cdsRestD.eof do
       begin
         cont := cont + 1;
         pb.Position := pb.Position + 1;
         Application.ProcessMessages;

         if (cont<=PARTE) then
         begin
           // Nota
           sDt := FormatDateTime('yyyy-MM-dd', DM5.cdsRestDDTCRIA.AsDateTime);

           restE.CJ4_Dados[cont].ligcli  := DM5.cdsRestDLIGCLI.Value;
           restE.CJ4_Dados[cont].numnota := DM5.cdsRestDNUMNF.Value;
           restE.CJ4_Dados[cont].vlrnota := DM5.cdsRestDVALOR.AsFloat;
           restE.CJ4_Dados[cont].peso := DM5.cdsRestDPESO.AsFloat;
           restE.CJ4_Dados[cont].volume := DM5.cdsRestDVOLUME.Value;
           restE.CJ4_Dados[cont].ddoc := DM5.cdsRestDDOCDEST.Value;
           restE.CJ4_Dados[cont].numped := DM5.cdsRestDNUMPED.Value;
           restE.CJ4_Dados[cont].dtimporta := sDt;
         end
         else
         begin
           // Envia
           if cont > 0 then
           begin
              restE.CJ4_DadosConta := cont;
              sCod := restE.CriaJSON4_Dados();
              contParte := contParte + 1;
              EnviaRest.lbProg.Caption := 'Enviando Dados das Notas - Parte: ' + contParte.ToString + sPartes;
              Application.ProcessMessages;
              EnviarDados(sCod, restE.BaseURL5);
           end;

           // Reinicia
           restE.Limpar;
           cont := 1;

           // Nota
           sDt := FormatDateTime('yyyy-MM-dd', DM5.cdsRestDDTCRIA.AsDateTime);

           restE.CJ4_Dados[cont].ligcli  := DM5.cdsRestDLIGCLI.Value;
           restE.CJ4_Dados[cont].numnota := DM5.cdsRestDNUMNF.Value;
           restE.CJ4_Dados[cont].vlrnota := DM5.cdsRestDVALOR.AsFloat;
           restE.CJ4_Dados[cont].peso := DM5.cdsRestDPESO.AsFloat;
           restE.CJ4_Dados[cont].volume := DM5.cdsRestDVOLUME.Value;
           restE.CJ4_Dados[cont].ddoc := DM5.cdsRestDDOCDEST.Value;
           restE.CJ4_Dados[cont].numped := DM5.cdsRestDNUMPED.Value;
           restE.CJ4_Dados[cont].dtimporta := sDt;
           sCod := '';
         end;


          {
            // Altera os dados da Nota
            Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);
            //  nota alterada
            if Resp_i = 4 then
            begin
              if DM5.cdsRestBBAIXA_ORIG.Value = 11 then Baixa2 := 1;
              if DM5.cdsRestBBAIXA_ORIG.Value = 13 then Baixa2 := 3;
              Bco.Notas_MarcarBaixa2(DM5.cdsRestBID.Value, Baixa2);
            end;
            }

         DM5.cdsRestD.Next;
       end;
       // Envia
       if cont > 0 then
       begin
          restE.CJ4_DadosConta := cont;
          sCod := restE.CriaJSON4_Dados();
          contParte := contParte + 1;
          EnviaRest.lbProg.Caption := 'Enviando Dados das Notas (fim) ... ';
          Application.ProcessMessages;
          EnviarDados(sCod, restE.BaseURL5);
       end;
    end;
    pb.Visible := false;
  end;
end;

function TEnviaRest.get_Entradas:Integer;
begin
  result := qtEnt;
end;

function TEnviaRest.get_Saidas:Integer;
begin
  result := qtSai;
end;

procedure TEnviaRest.set_dia(d: TDateTime);
begin
  entDia := d;
end;

procedure TEnviaRest.set_ID(idNF: Integer);
begin
  sIDnota := IntToStr(idNF);
end;

procedure TEnviaRest.set_numRoma(i: Integer);
begin
  numRoma := i;
end;

procedure TEnviaRest.set_reenviar(b: boolean);
begin
  Reenviar := b;
end;

procedure TEnviaRest.Timer1Timer(Sender: TObject);
  var Bco : TBco;
begin
  Timer1.Enabled := false;
  if (tipoM = 1) then Montagem1(numRoma, true); // Romaneio
  if (tipoM = 2) then
  begin
    Bco := TBco.Create;
    Bco.REST_NotasDia(entDia, Reenviar);
    Bco.Destroy;
    Montagem2(); // Notas no geral
  end;
  if (tipoM = 3) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaAlterados;
    Bco.Destroy;
    Montagem3(); // Baixas
  end;
  if (tipoM = 4) then Montagem1(numRoma, false); // Romaneio

  if (tipoM = 5) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaRoma(numRoma);
    Bco.Destroy;
    Montagem3(); // Baixas
  end;
  if (tipoM = 6) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaDia(entDia);
    Bco.Destroy;
    Montagem3(); // Baixas
  end;
  // SAC
  if (tipoM = 7) then Montagem4();

    if (tipoM = 8) then
  begin
    Bco := TBco.Create;
    Bco.REST_dadosWEB_Mostra(5);
    Bco.Destroy;
    Montagem5(); // Baixas
  end;

  // LocaWEB
  if (tipoM = 9) then Montagem1(numRoma, true); // Romaneio
  if (tipoM = 10) then Montagem1(numRoma, false); // Romaneio
  if (tipoM = 11) then
  begin
    Bco := TBco.Create;
    Bco.REST_NotasDia(entDia, Reenviar);
    Bco.Destroy;
    Montagem2(); // Notas no geral
  end;
   if (tipoM = 12) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaRoma(numRoma);
    Bco.Destroy;
    Montagem3(); // Baixas
  end;
  if (tipoM = 13) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaDia(entDia);
    Bco.Destroy;
    Montagem3(); // Baixas
  end;
  // KingHost - UMA Nota
  if (tipoM = 14) then
  begin
    Bco := TBco.Create;
    Bco.REST_NotasSEL(sIDnota, Reenviar);
    Bco.Destroy;
    Montagem2(); // Notas no geral
  end;

  if (tipoM = 15) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaNotas(sIDnota);
    Bco.Destroy;
    Montagem3(); // Notas no geral
  end;


  // LocaWEB - uma nota
  if (tipoM = 16) then
  begin
    Bco := TBco.Create;
    Bco.REST_NotasSEL(sIDnota, Reenviar);
    Bco.Destroy;
    Montagem2(); // Notas no geral
  end;

  if (tipoM = 17) then
  begin
    Bco := TBco.Create;
    Bco.REST_BaixaNotas(sIDnota);
    Bco.Destroy;
    Montagem3(); // Notas no geral
  end;

  EnviaRest.ModalResult := mrOk;
end;


end.
