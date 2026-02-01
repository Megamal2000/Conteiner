unit uWebRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, xmldom, XMLIntf,
  msxmldom, XMLDoc, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, System.JSON, DB, DBClient;

type
  TWebRec = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    pb: TProgressBar;
    btAtual: TBitBtn;
    Label2: TLabel;
    dtRm: TDateTimePicker;
    Memo1: TMemo;
    XMLDocument1: TXMLDocument;
    btReceber: TBitBtn;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Baixas: TClientDataSet;
    procedure btAtualClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btReceberClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebRec: TWebRec;

implementation

{$R *.dfm}

uses uDM1, uBanco, service1, uRoma, uRastreio, uLib, uREST;

function Le_Hora(h : String):String;

var hr, min, resp, s, tmp : String;
    i : Integer;
begin
  hr  := '00';
  min := '00';
  tmp := '';

  s := copy(h, 3, length(h));
  for i := 1 to length(s) do
  begin
    if (s[i] in ['0'..'9']) then tmp := tmp + s[i];

    if (s[i] = 'H') then
    begin
      hr := hr + tmp;
      tmp := '';
    end;

    if (s[i] = 'M') then
    begin
      min := min + tmp;
      tmp := '';
    end;

    if (s[i] = 'S') then
      tmp := '';
  end;
  hr := copy(hr , length(hr) -1 , length(hr));
  min:= copy(min, length(min) -1, length(min));

  resp := hr + ':'+min;
  Le_Hora := resp;
end;

procedure Atualiza();

var resp, dirP : String;
    Bco : TBco;
    Rm : TRoma;
    Rast:TRastreio;

    no, noDoc, noTab, noDat,
    i, j, k, nR  : Integer;
    dat, datD, datM, datA : String;
    sNota, sRoma, st, mot, he, sCli : String;

    conta_mot : Integer;

begin
  GetDir(0, dirP);
  with WebRec do
  begin
    Label1.Caption := 'Aguarde...';
    btAtual.Enabled := false;
    conta_mot := 0;
    resp := '<M>';

    resp := GetService1Soap().Sistema_XML(FormatDateTime('dd/MM/yyyy',Webrec.dtRm.DateTime), '7020856032');

    Memo1.Clear;
    Memo1.Lines.Append(resp);
    Memo1.Lines.SaveToFile(dirP+'\xml\Romaneio XML '+FormatDateTime('yyyy MM dd',WebRec.dtRm.DateTime)+ '.XML');

    if (Length(resp) < 16) then
    begin
      Label1.Caption := 'Nenhuma Nota Atualizada';
      Memo1.Clear;
      Memo1.Lines.Append('Sem NOTAS');
    end  
    else
    begin

      XMLDocument1.LoadFromFile(dirP+'\xml\Romaneio XML '+FormatDateTime('yyyy MM dd',WebRec.dtRm.DateTime)+ '.XML');
      //XMLDocument1.ChildNodes[0].ChildNodes[0].item

      Memo1.Clear;
      Memo1.Lines.Append('Iniciando o Recebimento em '+FormatDateTime('HH:mm', Now));
      Memo1.Lines.Append('...');
      noDoc := XMLDocument1.ChildNodes[0].ChildNodes.Count;
      pb.Min := 0;
      pb.Max := noDoc-1;
      for i := 0 to noDoc - 1 do
      begin
        pb.Position := i;
        Label1.Caption := 'Atualizando '+IntToStr(i) + ' de '+ IntToStr(noDoc);
        noTab := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes.Count;
        for j := 0 to noTab - 1 do
        begin
          sCli  := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nCli'].NodeValue;
          sRoma := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nRoma'].NodeValue;
          sNota := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nNota'].NodeValue;
          st    := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['status'].NodeValue;
          mot   := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['nMotivo'].NodeValue;
          he    := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes['horae'].NodeValue;

          if (UpperCase(XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes[j].NodeName) = 'DATAE') then
          begin

            noDat := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes[0].ChildNodes.Count;
            for k := 0 to noDat - 1 do
            begin
              datA := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes[j].ChildNodes['Year'].NodeValue;
              datM := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes[j].ChildNodes['Month'].NodeValue;
              datD := XMLDocument1.ChildNodes[0].ChildNodes[i].ChildNodes[j].ChildNodes['Day'].NodeValue;

              datM := '00'+datM;
              datM := copy(datM,length(datM)-1, length(datM));
              dat := datA+'-'+datM+'-'+datD;
            end; // k

          end; // if

        end; // j
        nR := StrToInt(sRoma);
        Rm := TRoma.Create;
        nR := Rm.Converte_NumBD(nR, dtRm.DateTime);
        Rm.Destroy;
        sRoma := IntToStr(nR);

        he := Le_Hora(he);
        Memo1.Lines.Append('>> '+IntToStr(i)+' R: '+sRoma+' N: '+sNota+' D: '+dat+' S: '+st+' M: '+mot+' H: '+he);

        Bco := TBco.Create;
        Bco.WS_Notas_Atualiza(sNota, sRoma, sCli, st, mot, dat, he);
        // VER TRIGGER if (StrToInt(mot)=1) then Bco.Notas_Unica_AltStatus(StrToInt(sNota ), StrToInt(sCli), 1);
        Bco.Destroy;

        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.Insere_Baixa(StrToInt(sNota), StrToInt(sCli), StrToInt(mot), 90001  );
        Rast.Destroy;

        if (mot = '99') then conta_mot := conta_mot + 1;

      end;  // i
      //Label1.Caption := XMLDocument1.ChildNodes[0].ChildNodes[0].ChildNodes[0].NodeName + ' // '+
      //  XMLDocument1.ChildNodes[0].ChildNodes[1].ChildNodes[0].NodeValue;
      Label1.Caption := 'Notas atualizadas: '+IntToStr(noDoc);
      btAtual.Enabled := True;
      if (conta_mot > 0) then ShowMessage('Existem '+IntToStr(conta_mot)+' notas 99 - Outros');
      XMLDocument1.Active := False;

    end; // < 16???

  end; // with
end;

procedure TWebRec.btAtualClick(Sender: TObject);
begin
  Atualiza;
//  DecimalSeparator := ',';
//  ThousandSeparator:= '.';
end;

procedure Receber_Baixas();
  var usa : TMarco;
      rest : TREST;
      rast : TRastreio;
      Bco : TBco;
      s1, BaseURLrec, sResp, datae : string;
      c, nN, nOc, nOr, nID, nC : Integer;
begin
  usa := TMarco.Create;
  //usa.Grava_INI(99);
  //usa.Grava_INI(80);
  usa.Le_INI;
  s1 := usa.get_RestServ;
  usa.Destroy;


  BaseURLrec := s1+ '/api/BaixaLer/12057';

  with WebRec do
  begin
    // Envia Rest
    RESTClient1.BaseURL := BaseURLrec;
    RESTRequest1.Execute;
    sResp :=  RESTResponse1.JSONValue.ToString.Trim;
    // Pega Retorno
    Memo1.Clear;
    rest := TREST.Create;
    rest.JsonToDataset(Baixas, sResp);
    //Memo1.Lines.Append(sResp);
    rest.Destroy;

    if Baixas.RecordCount>0 then
    begin
      Label1.Caption := 'Recebendo: ' + Baixas.RecordCount.ToString + ' notas';
      c := 0;
      pb.Max := Baixas.RecordCount + 1;
      pb.Min := 0;
      Bco := TBco.Create;
      Bco.Ocorre_Mostra;
      Rast := TRastreio.Create;
      Baixas.First;
      while not Baixas.Eof do
      begin
        c := c + 1;
        pb.Position := c;
        Memo1.Lines.Append(c.ToString+' nota ' + Baixas.Fields[1].Value + ' Data Ent '+Baixas.Fields[5].Value+ ' ocorr '+Baixas.Fields[4].Value);
        nID := StrToInt(Baixas.Fields[3].Value);
        nN := StrToInt(Baixas.Fields[1].Value);
        nC := StrToInt(Baixas.Fields[2].Value);
        nOc:= StrToInt(Baixas.Fields[4].Value);
        nOr:= StrToInt(Baixas.Fields[7].Value);
        Bco.Notas_Altera_Baixa(nID, nOc, NOr, Baixas.Fields[0].Value, Baixas.Fields[5].Value, Baixas.Fields[6].Value);
        // EVENTO NF - Rastreio
        Rast.Insere_Baixa(nN, nC, nOC, 90001  );


        Baixas.Next;
      end;
      Bco.Destroy;
      Rast.Destroy;

      // marca como feito
      BaseURLrec := s1+ '/api/BaixaLer?ret=feito77';
      RESTClient1.BaseURL := BaseURLrec;
      RESTRequest1.Execute;
      sResp :=  RESTResponse1.JSONValue.ToString.Trim;

      Memo1.Lines.Append('Notas ' + Baixas.RecordCount.ToString);
      Memo1.Lines.Append('*** FIM ***');
    end
    else  Label1.Caption := 'Nenhuma nota para Receber';

  end;


end;

procedure TWebRec.btReceberClick(Sender: TObject);
begin
  Receber_Baixas;
end;

procedure TWebRec.FormActivate(Sender: TObject);
begin
      Label1.Caption := '';
      btAtual.Enabled := True;
      dtRm.DateTime := Now;

end;

end.
