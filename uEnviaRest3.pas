unit uEnviaRest3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.JSON, IPPeerClient, REST.Client, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Response.Adapter, DB, DBClient, REST.Types;

type
  TTabelas = (taFretes, taClientes);
  TEnviaRest3 = class(TForm)
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
    Memo1: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
  private
    { Private declarations        }

  public
    { Public declarations }
     procedure Entrar;
     procedure set_Tabelas(tabelaTipo: TTabelas);
     procedure set_idCli(i: Integer);
     procedure set_idGrupo(i: Integer);

     procedure set_nomeCli(nome:String);
  end;

var
  EnviaRest3: TEnviaRest3;
  idC, idG : Integer;
  bCancela, bReenvia : Boolean;
  BaseURL1,BaseURL2,BaseURL3,BaseURL4,BaseURL5, BaseURL11, BaseURL12, BaseURL13 : string;
  tipoE, nomeCli : string;
  diaE : TDateTime;
  tipo : TTabelas;
 Const WEB_PERMISSAO = '2026.12.687452068';
 Const FRETE_PERMISSAO = '2776129652245.23';
 Const MASCARAID = 2046880000;


implementation

{$R *.dfm}

uses uBanco, uDM1, uDM3, uDM5, uLib;



{
   ===================================
   Cria JSON a partir de uma tabela
   um envio por vez
   ===================================
}

  function TabelaCriaJSON(cdsTabela: TClientDataSet):String;
  var
    ArrayJSon:TJSONArray;
    ObjJSon:TJSONObject;
    ObjJSon1:TJSONObject;
    strJSon:TJSONString;
    numJSon:TJSONNumber;
    boolJSon:TJSONBool;
    TrueJSon:TJSONTrue;
    FalseJSon:TJSONFalse;
    I, nR: Integer;
    pField:TField;
    nomeCampo : String;
    sLigcli : String;
    achei : boolean;

begin

  ObjJSon:=TJSONObject.Create;
   achei := false;
     // Dados para ENTRAR
    strJSon:=TJSONString.Create(FRETE_PERMISSAO);
    ObjJSon.AddPair('mzperm',strJSon);

    for i := 0 to cdsTabela.FieldCount - 1  do
    begin
      nomeCampo :=  LowerCase( cdsTabela.Fields[i].FieldName );

      case cdsTabela.Fields[i].DataType of
         ftString :
         begin
           strJSon:=TJSONString.Create(cdsTabela.Fields[i].AsString);
           ObjJSon.AddPair(nomeCampo,strJSon);
         end;
         ftSmallint, ftInteger:
         begin
           if (nomeCampo = 'ligcli') then
           begin
             sLigCli := idG.toString;
             achei := true;
           end
             else sLigCli := cdsTabela.Fields[i].AsString;

           numJSon:=TJSONNumber.Create(sLigCli);
           ObjJSon.AddPair(nomeCampo,numJSon);
         end;
         ftfloat, ftBCD, ftFMTBcd:
         begin
           numJSon:=TJSONNumber.Create(  FormatFloat('#,##0.00', cdsTabela.Fields[i].AsFloat).Replace(',','.') );
           ObjJSon.AddPair(nomeCampo,numJSon);
         end;
         ftBoolean:
         begin
           boolJSon:=TJSONBool.Create(cdsTabela.Fields[i].Value);
           ObjJSon.AddPair(nomeCampo,boolJSon);
         end;
         ftDate, ftDateTime:
         begin
           strJSon:=TJSONString.Create(FormatDateTime('yyyy-MM-dd', cdsTabela.Fields[i].AsDateTime) );
           ObjJSon.AddPair(nomeCampo,strJSon);
         end;
      end;

    end;
    if (not achei)  then
    begin
      sLigCli := idG.toString;
      numJSon:=TJSONNumber.Create(sLigCli);
      ObjJSon.AddPair('ligcli',numJSon);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

  end;

  procedure Envia(Base:String; CDS:TClientDataSet);
     var
        sJSON, sResp : String;
        qt : integer;
  begin
    qt :=CDS.RecordCount;
    with EnviaRest3 do
    begin
      pb.Min := 0;
      pb.Max := qt+1;
      pb.Position := 0;
      Label2.Caption := 'Enviando '+qt.ToString+' itens' ;


      if qt>0 then
      begin
       bCancela := false;
       CDS.First;
        while not CDS.Eof and not bCancela do
        begin
          pb.Position := pb.Position + 1;
          Label2.Caption := 'Processando: '+pb.Position.ToString;
          sJSON := TabelaCriaJSON(CDS);
          Memo1.lines.Append(sJSON);
          Application.ProcessMessages;

          // Envia REST

          RESTClient1.BaseURL := Base;
          //RESTRequest1.Params[0].Value  :=  QuotedStr(sJSON); // usado para enviar STRING
          RESTRequest1.Method :=  TRESTRequestMethod.rmPOST;
          RESTRequest1.Params[0].Value  :=  sJSON; // envia JSON objeto
          RESTRequest1.Execute;
          sResp :=  RESTResponse1.JSONValue.ToString.Trim;
          if (sResp = '97') then Memo1.Lines.Append('ERRO: sem Permissão');
          if (sResp = '99') then Memo1.Lines.Append('ERRO: banco de dados - SQL');
          if (sResp = '90') then Memo1.Lines.Append('ERRO: retornou NULO');
          if (sResp = '4') then Memo1.Lines.Append('SUCESSO');


          //if (length(sResp) > 5) then RomaneioGravaResposta( sResp );
         CDS.Next;
        end;
      end;
    end;
  end;

  procedure Apaga(Base:String; idCli:Integer);
    var sResp : String;
        idSomado : Integer;
  begin
    with EnviaRest3 do
    begin
      idSomado := idCli + mascaraID;
      RESTClient1.BaseURL := Base+'/'+idSomado.ToString;
      RESTRequest1.Method :=  TRESTRequestMethod.rmDELETE;
      RESTRequest1.Execute;
      //sResp :=  RESTResponse1.JSONValue.ToString.Trim;

      Memo1.Lines.Append('SUCESSO: apagou '+nomeCli + '(' + idC.ToString + ')');
      if (sResp = '99') then Memo1.Lines.Append('ERRO: não foi possível apagar');
    end;

  end;

{
   ===================================
   Envia Romaneio
   uma nota por vez
   ===================================
}


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


{ TEnviaRest3 }

procedure TEnviaRest3.btCancelarClick(Sender: TObject);
begin
  bCancela := true;
  EnviaRest3.ModalResult := mrOk;
end;

procedure TEnviaRest3.Entrar;
  var usa : TMarco;
     s1, s2 : string;
begin
  usa := TMarco.Create;
  //usa.Grava_INI(99);
  //usa.Grava_INI(80);
  usa.Le_INI;
  // teste
  //s1 := 'http://localhost:47553';
  s1 := usa.get_RestServ;
  s2 := usa.get_RestServ2;
  usa.Destroy;

  BaseURL1 := s1+ '/api/Frete0';
  BaseURL2 := s1+ '/api/Frete1';
  BaseURL3 := s1+ '/api/Frete1a';
  BaseURL4 := s1+ '/api/PrazoCep';

  Label1.Caption := 'Enviando Fretes de ' + nomeCli + ' // id: ' + idC.ToString;
  Label2.Caption := 'Aguarde ... ' ;
  StaticText1.Caption := '-';

  bCancela := false;

  Timer1.Interval := 3000;
  Timer1.Enabled  := true;
  // Inicia variáveis de Configuração
  bReenvia := false;

end;

  {
     ===================================
     Entradas
     uma por vez
     ===================================
  }
  procedure TEnviaRest3.set_Tabelas(tabelaTipo: TTabelas);
  begin
    tipo := tabelaTipo;
  end;


  procedure TEnviaRest3.set_idCli(i: Integer);
  begin
    idC := i;
  end;

  procedure TEnviaRest3.set_idGrupo(i: Integer);
begin
   idG := i;
end;

procedure TEnviaRest3.set_nomeCli(nome: String);
  begin
    nomeCli := nome;
  end;

  procedure Tab1Frete0Enviar;
   var Bco : Tbco;
       idSomado : Integer;
  begin
    Bco := Tbco.Create;
    Bco.Frete_CadAdic_Mostra(idC);
    Bco.Destroy;

    idSomado := mascaraId + idG;
    EnviaRest3.StaticText1.Caption := BaseURL1;

    Apaga(BaseURL1, idG);
    Envia(BaseURL1, DM1.cdsFAd);
  end;

  procedure Tab2Frete1Enviar;
   var Bco : Tbco;
       idSomado : Integer;
  begin
    Bco := Tbco.Create;
    Bco.FretePeso_Mostra(idC);
    Bco.Destroy;

    idSomado := mascaraId + idG;
    EnviaRest3.StaticText1.Caption := BaseURL2;

    Apaga(BaseURL2, idG);
    Envia(BaseURL2, DM3.cdsFT1);
  end;

  procedure Tab3Frete1aEnviar;
   var Bco : Tbco;
       idSomado : Integer;
  begin
    Bco := Tbco.Create;
    Bco.FretePesoExc_Mostra(idC);
    Bco.Destroy;

    idSomado := mascaraId + idG;
    EnviaRest3.StaticText1.Caption := BaseURL3;

    Apaga(BaseURL3, idG);
    Envia(BaseURL3, DM3.cdsFT1a);
  end;

  procedure Tab4PrazoCEPEnviar;
   var Bco : Tbco;
       idSomado : Integer;
  begin
    Bco := Tbco.Create;
    Bco.PrazosFaixa_Mostrar_Cli(idC);
    Bco.Destroy;

    idSomado := mascaraId + idG;
    EnviaRest3.StaticText1.Caption := BaseURL4;

    Apaga(BaseURL4, idG);
    Envia(BaseURL4, DM5.cdsPr2);
  end;

  Procedure FretesEnviar;
  begin
    Tab1Frete0Enviar;
    Tab2Frete1Enviar;
    Tab3Frete1aEnviar;
    Tab4PrazoCEPEnviar;
  end;


  procedure TEnviaRest3.Timer1Timer(Sender: TObject);
  begin
    Timer1.Enabled := false;
    Label2.Caption := '>> Iniciando ...';
    ;
    if (tipo = TTabelas.taFretes) then FretesEnviar();
    Label2.Caption := '[ Finalizado ]';
  end;



end.
