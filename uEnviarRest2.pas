unit uEnviarRest2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.JSON, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Response.Adapter, DB, DBClient, REST.Types;

type
  TEnviarRest2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pb: TProgressBar;
    btCancelar: TBitBtn;
    RESTResponse1: TRESTResponse;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    Timer1: TTimer;
    StaticText1: TStaticText;
    procedure Timer1Timer(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations        }

  public
    { Public declarations }
     procedure Entrar;
     procedure set_NumRoma(i : Integer);
     procedure set_Reenvia(b : boolean);
     procedure set_TipoEnvio(s : String);
     procedure set_TipoSaida(i : Integer);
     procedure set_DiaEnvia(d : TDateTime);


  end;

var
  EnviarRest2: TEnviarRest2;
  nR, tipoSaida : Integer;
  bCancela, bReenvia : Boolean;
  BaseURL1,BaseURL2,BaseURL3,BaseURL4,BaseURL5, BaseURL11, BaseURL12, BaseURL13 : string;
  tipoE : string;
  diaE : TDateTime;
 Const WEB_PERMISSAO = '2026.12.687452068';
 Const FRETE_PERMISSAO = '2776129652245.23';


implementation

{$R *.dfm}

uses uBanco, uDM5, uLib;

{
   ===================================
   Envia Romaneio
   uma nota por vez
   ===================================
}

  function RomaneioCriaJSON():String;
  var
    ArrayJSon:TJSONArray;
    ObjJSon:TJSONObject;
    ObjJSon1:TJSONObject;
    strJSon:TJSONString;
    intJSon:TJSONNumber;
    TrueJSon:TJSONTrue;
    FalseJSon:TJSONFalse;
    I, nR: Integer;
    pField:TField;

begin

  ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(WEB_PERMISSAO);
    ObjJSon.AddPair('mzperm',strJSon);

    nR := StrToInt( copy(DM5.cdsRestRNUM.AsString, 5, 6) );
    // Dados do Romaneio
    IntJSon:=TJSONNumber.Create(nR);
    ObjJSon.AddPair('romanum',IntJSon);
    strJSon:=TJSONString.Create(DM5.cdsRestRDTROMA.AsString);
    ObjJSon.AddPair('romadt',strJSon);
    IntJSon:=TJSONNumber.Create(DM5.cdsRestRLIGMOT.Value);
    ObjJSon.AddPair('romamot',IntJSon);

    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    //for I := 1 to CJ1_NotasConta do
    begin

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(DM5.cdsRestNLIGCLI.Value);
      ObjJSon1.AddPair('numC',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNNUMNF.Value);
      ObjJSon1.AddPair('numN',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNID.Value);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNVALOR.AsInteger);
      ObjJSon1.AddPair('vNF',IntJSon);
      strJSon:=TJSONString.Create(DM5.cdsRestNDOCDEST.Value);
      ObjJSon1.AddPair('doc',strJSon);
      strJSon:=TJSONString.Create(DM5.cdsRestNNUMPED.Value);
      ObjJSon1.AddPair('ped',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

  end;

   function DiaCriaJSON():String;
  var
    ArrayJSon:TJSONArray;
    ObjJSon:TJSONObject;
    ObjJSon1:TJSONObject;
    strJSon:TJSONString;
    intJSon:TJSONNumber;
    TrueJSon:TJSONTrue;
    FalseJSon:TJSONFalse;
    I, nR: Integer;
    pField:TField;

    BCo : TBco;

begin

  ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(WEB_PERMISSAO);
    ObjJSon.AddPair('mzperm',strJSon);

    Bco := TBco.Create;
    Bco.REST_RomaDiaFiltra(DM5.cdsRestNNROMA.Value);
    Bco.Destroy;

    nR := StrToInt( copy(DM5.cdsRestRNUM.AsString, 5, 6) );
    // Dados do Romaneio
    IntJSon:=TJSONNumber.Create(nR);
    ObjJSon.AddPair('romanum',IntJSon);
    strJSon:=TJSONString.Create(DM5.cdsRestRDTROMA.AsString);
    ObjJSon.AddPair('romadt',strJSon);
    IntJSon:=TJSONNumber.Create(DM5.cdsRestRLIGMOT.Value);
    ObjJSon.AddPair('romamot',IntJSon);

    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    //for I := 1 to CJ1_NotasConta do
    begin


      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(DM5.cdsRestNLIGCLI.Value);
      ObjJSon1.AddPair('numC',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNNUMNF.Value);
      ObjJSon1.AddPair('numN',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNID.Value);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestNVALOR.AsInteger);
      ObjJSon1.AddPair('vNF',IntJSon);
      strJSon:=TJSONString.Create(DM5.cdsRestNDOCDEST.Value);
      ObjJSon1.AddPair('doc',strJSon);
      strJSon:=TJSONString.Create(DM5.cdsRestNNUMPED.Value);
      ObjJSon1.AddPair('ped',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

  end;

  function BaixaCriaJSON: String;
var
    ArrayJSon:TJSONArray;
    ObjJSon:TJSONObject;
    ObjJSon1:TJSONObject;
    strJSon:TJSONString;
    intJSon:TJSONNumber;
    TrueJSon:TJSONTrue;
    FalseJSon:TJSONFalse;
    I: Integer;
    pField:TField;

    sDt , stHr : String;

begin

  ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(WEB_PERMISSAO);
    ObjJSon.AddPair('mzperm',strJSon);


    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    //for I := 1 to CJ1_NotasConta do
    begin
      sDt  := FormatDateTime('yyyy-MM-dd',DM5.cdsRestBDTENT.Value);
      stHr := FormatDateTime('HH:mm',DM5.cdsRestBHRENT.Value);

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(DM5.cdsRestBID.Value);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestBNOCORR.Value);
      ObjJSon1.AddPair('numOc',IntJSon);
      strJSon:=TJSONString.Create(sDT);
      ObjJSon1.AddPair('entDT',strJSon);
      strJSon:=TJSONString.Create(stHr);
      ObjJSon1.AddPair('entHR',strJSon);
      IntJSon:=TJSONNumber.Create(DM5.cdsRestBBAIXA_FUNC.Value);
      ObjJSon1.AddPair('origem',IntJSon);
      strJSon:=TJSONString.Create(DM5.cdsRestBRECEBEDOR.Value);
      ObjJSon1.AddPair('Recebedor',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

end;

procedure JsonToDataset(aDataset: TDataSet; aJSON: string);
var
  JObj: TJSONArray;
  vConv : TCustomJSONDataSetAdapter;
begin
  if (aJSON = EmptyStr) then
  begin
    Exit;
  end;

  JObj := TJSONObject.ParseJSONValue(aJSON) as TJSONArray;
  vConv := TCustomJSONDataSetAdapter.Create(Nil);

  try
    vConv.Dataset := aDataset;
    vConv.UpdateDataSet(JObj);
  finally
    vConv.Free;
    JObj.Free;
  end;
end;


  procedure RomaneioGravaResposta(sResp:String);
  var JSON_obj : TJSONObject;
      BCO : TBco;
      id,v : Integer;
      Cdtset : TClientDataSet;
  begin
    Cdtset := TClientDataSet.Create(nil);
    JsonToDataset(CdtSet, sResp);
    if CdtSet.RecordCount > 0 then
    begin
      id :=  StrToInt(Cdtset.FieldByName('id').AsString);
      v  :=  StrToInt(Cdtset.FieldByName('status').AsString);
      if (v <> 6) then
      begin
        Bco := TBco.Create;
        Bco.WS_MarcaResp(id, v);
        Bco.Destroy;
      end;
    end;
    CdtSet.Destroy;

  end;

  function JSONescolhe(tipo:smallint):String;
    var resp : String;
  begin
    case tipo of
      1: resp := RomaneioCriaJSON;
      2: resp := BaixaCriaJSON;
      3 :resp := DiaCriaJSON;
    end;

    Result := resp;
  end;

  procedure Envia(nJSON:Integer; Base:String; CDS:TClientDataSet);
     var
        sJSON, sResp : String;
        qt : integer;
  begin
    qt :=CDS.RecordCount;
    with EnviarRest2 do
    begin
      pb.Min := 0;
      pb.Max := qt+1;
      pb.Position := 0;
      Label1.Caption := 'Enviando '+qt.ToString+' notas' ;
      Label2.Caption := '';

      if qt>0 then
      begin
       bCancela := false;
       CDS.First;
        while not CDS.Eof and not bCancela do
        begin
          pb.Position := pb.Position + 1;
          Label2.Caption := 'Processando: '+pb.Position.ToString;
          sJSON := JSONescolhe(nJSON);
          Application.ProcessMessages;

          // Envia REST
          RESTClient1.BaseURL := Base;
          RESTRequest1.Params.Items[0].Value  :=  QuotedStr(sJSON);
          RESTRequest1.Execute;
          sResp :=  RESTResponse1.JSONValue.ToString.Trim;

          if (length(sResp) > 5) then RomaneioGravaResposta( sResp );
         CDS.Next;
        end;
      end;
    end;
  end;

  procedure RomaneioEnvia(numRoma:Integer; reenvia:boolean);
    var Bco : TBco;

  begin
    EnviarRest2.StaticText1.Caption := BaseURL1;
    Bco := TBco.Create;
    Bco.REST_Notas(numRoma, reenvia);
    Bco.REST_Romaneio(numRoma);
    Bco.WS_MarcaRespRomaneio(numRoma, 6);
    Bco.Destroy;

    Envia(1, BaseURL1, DM5.cdsRestN);

    EnviarRest2.ModalResult := mrOk;
  end;

  procedure BaixaEnvia(numRoma:Integer);
    var Bco : TBco;

  begin
    EnviarRest2.StaticText1.Caption := BaseURL1;
    Bco := TBco.Create;
    Bco.REST_BaixaRoma(numRoma);
    //Bco.WS_MarcaRespRomaneio(numRoma, 6);
    Bco.Destroy;

    Envia(2, BaseURL3, DM5.cdsRestB);

    EnviarRest2.ModalResult := mrOk;
  end;

  procedure DiaEnvia(dia : TDateTime; reenvia:boolean);
    var Bco : TBco;

  begin
    EnviarRest2.StaticText1.Caption := BaseURL1;
    Bco := TBco.Create;
    Bco.REST_NotasDia(dia, reenvia);
    Bco.REST_RomaDia(dia);
    Bco.WS_MarcaRespDia(dia, 6);
    Bco.Destroy;

    Envia(3, BaseURL1, DM5.cdsRestN);

    EnviarRest2.ModalResult := mrOk;
  end;

  procedure BaixaDiaEnvia(dia:TDatetime);
    var Bco : TBco;

  begin
    EnviarRest2.StaticText1.Caption := BaseURL3;
    Bco := TBco.Create;
    Bco.REST_BaixaDia(dia);
    //Bco.WS_MarcaRespRomaneio(numRoma, 6);
    Bco.Destroy;

    Envia(2, BaseURL3, DM5.cdsRestB);

    EnviarRest2.ModalResult := mrOk;
  end;






{ TEnviarRest2 }

procedure TEnviarRest2.btCancelarClick(Sender: TObject);
begin
  bCancela := true;
  EnviarRest2.ModalResult := mrOk;
end;

procedure TEnviarRest2.Entrar;
  var usa : TMarco;
     s1, s2 : string;
begin
  usa := TMarco.Create;
  //usa.Grava_INI(99);
  //usa.Grava_INI(80);
  usa.Le_INI;
  s1 := usa.get_RestServ;
  s2 := usa.get_RestServ2;
  usa.Destroy;

  BaseURL1 := s1+ '/api/Romaneio';
  BaseURL2 := s1+ '/api/Notas';
  BaseURL3 := s1+ '/api/Baixa';
  BaseURL4 := s2+ '/api/Sac';
  BaseURL5 := s2+ '/api/DadosNota';

  BaseURL11:= s2+ '/api/Romaneio';
  BaseURL12:= s2+ '/api/Notas';
  BaseURL13:= s2+ '/api/Baixa';


  Label2.Caption := '';
  bCancela := false;
  Timer1.Interval := 3000;
  Label1.Caption := 'Aguarde...';
  Timer1.Enabled := true;
  // Inicia variáveis de Configuração
  nR := 0;
  bReenvia := false;

end;

{
   ===================================
   Envia Romaneio
   uma nota por vez
   ===================================
}
procedure TEnviarRest2.set_DiaEnvia(d: TDateTime);
begin
  diaE := d;
end;

procedure TEnviarRest2.set_NumRoma(i: Integer);
begin
  nR := i;
end;

procedure TEnviarRest2.set_Reenvia(b: boolean);
begin
  bReenvia := b;
end;

procedure TEnviarRest2.set_TipoEnvio(s: String);
begin
  tipoE := s;
end;

procedure TEnviarRest2.set_TipoSaida(i: Integer);
begin
  tipoSaida := i;
end;

procedure TEnviarRest2.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := false;
  if (tipoE = 'Romaneio') then RomaneioEnvia(nR, bReenvia);
  if (TipoE = 'BaixaRomaneio') then  BaixaEnvia(nR);
  if (tipoE = 'Dia') then DiaEnvia(diaE, bReenvia);
  if (tipoE = 'BaixaDia') then BaixaDiaEnvia(diaE);




end;
 {
   ===================================
   Envia WEB COMPLETA Romaneio
   uma nota por vez
   ===================================
}


end.
