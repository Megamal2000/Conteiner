unit uWEBsinc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  JvProgressBar, Data.DB, JvMemoryDataset;

type
  TWEBsinc = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    lbNFs: TLabel;
    btSinc: TBitBtn;
    pb: TJvGradientProgressBar;
    Tab: TJvMemoryData;
    SpeedButton1: TSpeedButton;
    procedure btSincClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     N_sem : integer;
     procedure Entrar;
  end;

var
  WEBsinc: TWEBsinc;


implementation

{$R *.dfm}

uses uBanco, uDM1, service, uDM4, uEnviaRest, uWebSinc2;

{ TWEBsinc }
{
procedure Sincroniza0;
  var
      Bco : TBco;
      idNF, roma, nNf, st, nMot, idMoto:Integer;
      sDt, stHr, sPerm, sDoc : String;
      Resp_i, cont, Baixa2 : Integer;
begin
  with WEBsinc do
  begin
    pb.Visible := true;
    pb.Min := 1;

    Resp_i := 0;

    Bco := TBco.Create;
    Bco.WebAt_Pesq4;

    if DM4.cdsWEBc.RecordCount > 0 then
    begin
       pb.Max := DM4.cdsWEBc.RecordCount;

       cont := 0;
       DM4.cdsWEBc.First;
       while not DM4.cdsWEBc.eof do
       begin
         cont := cont + 1;
         pb.Position := cont;
         //Application.ProcessMessages;

          if DM4.cdsWEBcNOCORR.Value> 0 then
          begin
            // Nota
            idNf := DM4.cdsWEBcID.Value;
            nNf  := DM4.cdsWEBcNUMNF.Value;
            st   := DM4.cdsWEBcSTATUS_ENT.Value;
            nMot := DM4.cdsWEBcNOCORR.Value;

            sDt  := FormatDateTime('yyyy-MM-dd',DM4.cdsWEBcDTENT.Value);
            stHr := FormatDateTime('HH:mm',DM4.cdsWEBcHRENT.Value);
            sPerm:= '2458229467';
            sDoc := DM4.cdsWEBcDOCDEST.Value;
            // Romaneio
            roma := DM4.cdsWEBcROMANEIO.Value;
            idMoto := DM4.cdsWEBcLIGMOT.Value;

                 // Altera os dados da Nota
            Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);
            //  nota alterada
            if Resp_i = 4 then
            begin
              if DM4.cdsWEBcBAIXA_ORIG.Value = 11 then Baixa2 := 1;
              if DM4.cdsWEBcBAIXA_ORIG.Value = 13 then Baixa2 := 3;
              Bco.Notas_MarcarBaixa2(DM4.cdsWEBcID.Value, Baixa2);
            end;

          end;
          DM4.cdsWEBc.Next;
       end;

    end;
    pb.Visible := false;
    Bco.Destroy;
  end;

  //WEBsinc.hide;
end;


// usando Duas pesquisas Web Service
procedure Sincroniza1;
  var
      Bco : TBco;
      idNF, roma, nNf, st, nMot, idMoto:Integer;
      sDt, stHr, sPerm, sDoc, sR : String;
      Resp_i, cont, Baixa2 : Integer;
begin
  with WEBsinc do
  begin
    pb.Visible := true;
    pb.Min := 1;
    Application.ProcessMessages;

    Resp_i := 0;

    Bco := TBco.Create;
    Bco.WebAt_Pesq5;

    if DM1.cdsNotas.RecordCount > 0 then
    begin
       pb.Max := DM1.cdsNotas.RecordCount;

       cont := 0;
       DM1.cdsNotas.First;
       while not DM1.cdsNotas.eof do
       begin
         cont := cont + 1;
         pb.Position := cont;
         Application.ProcessMessages;

          if DM1.cdsNotasNOCORR.Value> 0 then
          begin
            // Nota
            st := 0;  nMot := 0;
            idNf := DM1.cdsNotasID.Value;
            nNf  := DM1.cdsNotasNUMNF.Value;
            if (DM1.cdsNotasSTATUS_ENT.Value<> null) then st := DM1.cdsNotasSTATUS_ENT.Value;
            if (DM1.cdsNotasNOCORR.Value<> null) then nMot := DM1.cdsNotasNOCORR.Value;

            sDt  := FormatDateTime('yyyy-MM-dd',DM1.cdsNotasDTENT.Value);
            stHr := FormatDateTime('HH:mm',DM1.cdsNotasHRENT.Value);
            sPerm:= '2458229467';
            sDoc := DM1.cdsNotasDOCDEST.Value;
            // Romaneio
            roma := 0;
            if DM1.cdsNotasNROMA.Value <> null then
            begin
              sR := DM1.cdsNotasNROMA.AsString;
              if sR.Length>5  then roma := StrToInt(copy(sR, 5, 10));
            end;
            idMoto := 10;

            // Altera os dados da Nota
            Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);
            //  nota alterada
            if Resp_i = 4 then
            begin
              if DM1.cdsNotasBAIXA_ORIG.Value = 11 then Baixa2 := 1;
              if DM1.cdsNotasBAIXA_ORIG.Value = 13 then Baixa2 := 3;
              Bco.Notas_MarcarBaixa2(DM1.cdsNotasID.Value, Baixa2);
            end;

          end;
          DM1.cdsNotas.Next;
       end;

    end;
    pb.Visible := false;
    Bco.Destroy;
  end;

  //WEBsinc.hide;
end;

// usando REST
procedure Sincroniza2;
  var
      Bco : TBco;
      idNF, roma, nNf, st, nMot, idMoto:Integer;
      sDt, stHr, sPerm, sDoc, sR : String;
      Resp_i, cont, Baixa2 : Integer;
begin
  with WEBsinc do
  begin
    pb.Visible := true;
    pb.Min := 1;
    Application.ProcessMessages;

    Resp_i := 0;

    Bco := TBco.Create;
    Bco.WebAt_Pesq5;

    if DM1.cdsNotas.RecordCount > 0 then
    begin
       pb.Max := DM1.cdsNotas.RecordCount;

       cont := 0;
       DM1.cdsNotas.First;
       while not DM1.cdsNotas.eof do
       begin
         cont := cont + 1;
         pb.Position := cont;
         Application.ProcessMessages;

          if DM1.cdsNotasNOCORR.Value> 0 then
          begin
            // Nota
            st := 0;  nMot := 0;
            idNf := DM1.cdsNotasID.Value;
            nNf  := DM1.cdsNotasNUMNF.Value;
            if (DM1.cdsNotasSTATUS_ENT.Value<> null) then st := DM1.cdsNotasSTATUS_ENT.Value;
            if (DM1.cdsNotasNOCORR.Value<> null) then nMot := DM1.cdsNotasNOCORR.Value;

            sDt  := FormatDateTime('yyyy-MM-dd',DM1.cdsNotasDTENT.Value);
            stHr := FormatDateTime('HH:mm',DM1.cdsNotasHRENT.Value);
            sPerm:= '2458229467';
            sDoc := DM1.cdsNotasDOCDEST.Value;
            // Romaneio
            roma := 0;
            if DM1.cdsNotasNROMA.Value <> null then
            begin
              sR := DM1.cdsNotasNROMA.AsString;
              if sR.Length>5  then roma := StrToInt(copy(sR, 5, 10));
            end;
            idMoto := 10;

            // Altera os dados da Nota
            Resp_i := GetServiceSoap().Registra_Entrega3(idNf, roma, nNf,  st, sDT, stHr, nMot, sPerm, idMoto, sDoc);
            //  nota alterada
            if Resp_i = 4 then
            begin
              if DM1.cdsNotasBAIXA_ORIG.Value = 11 then Baixa2 := 1;
              if DM1.cdsNotasBAIXA_ORIG.Value = 13 then Baixa2 := 3;
              Bco.Notas_MarcarBaixa2(DM1.cdsNotasID.Value, Baixa2);
            end;

          end;
          DM1.cdsNotas.Next;
                                                                                       end;

    end;
    pb.Visible := false;
    Bco.Destroy;
  end;

  //WEBsinc.hide;
end;
 }
procedure Atualiza();
  var Bco : tbco;
begin
  with WEBsinc do
  begin
    pb.Visible := false;

    Bco := TBco.Create;
    N_sem := Bco.Config_BaixaQT_Mostra;
    if N_sem = 0 then
    begin
      N_sem := Bco.Notas_semWEB;
      Bco.Config_BaixaQT_Altera(N_sem);
    end;
    Bco.Destroy;

    if N_sem>0 then  lbNFs.Caption := N_sem.ToString + ' notas';
  end;
end;

procedure SincronizaREST;
  var Bco : tbco;
begin
  EnviaRest.Entrar('Envia Baixas ', 3);
  EnviaRest.ShowModal;
  with WEBsinc do
  begin
    Bco := TBco.Create;
    N_sem := Bco.Notas_semWEB;
    Bco.Config_BaixaQT_Altera(N_sem);
    Bco.Destroy;
    if N_sem>0 then  lbNFs.Caption := N_sem.ToString + ' notas';
  end;
end;

procedure TWEBsinc.btSincClick(Sender: TObject);
begin
  SincronizaREST;
end;

procedure TWEBsinc.Entrar;

begin
  Atualiza;
end;

procedure TWEBsinc.SpeedButton1Click(Sender: TObject);
begin
  WEBSinc2.LbQT.Caption := lbNFs.Caption;
  WEBSinc2.Entrar;
  WebSinc2.Show;
end;

end.
