unit uREST;

interface

uses
  System.JSON, DB, SysUtils,  REST.Response.Adapter, Datasnap.DBClient,
  uBanco, uRastreio, uSMSclasse, Global, uLib;

  Const MAX_NOTAS = 12;

Type
  TRestNotas = record
    idN : Integer;
    numN : Integer;
    numC : Integer;
    vNF : double;
    doc : string;
    ped : string;
  end;

  TRestNotas2 = record
    romanum:Integer;
    romamot:Integer;
    romadt:string;
  end;

  TRestBaixa = record
    idN:Integer;
    numOc:Integer;
    entDT:string;
    entHR:string;
    origem:Integer;
    recebedor:String;
  end;

  TRestDados = record
    numnota : Integer;
    ligcli : Integer;
    vlrnota : double;
    peso : double;
    volume : Integer;
    dtimporta : string;
    ddoc : string;
    numped : string;
  end;

  TCJ_Notas = array[1..MAX_NOTAS] of TRestNotas;
  TCJ_Notas2 = array[1..MAX_NOTAS] of TRestNotas2;
  TCJ_Baixas = array[1..MAX_NOTAS] of TRestBaixa;
  TCJ_DadosNotas = array[1..MAX_NOTAS] of TRestDados;

  TRest = class(TObject)


  private
    // variáveis
    sq : String;

  protected

  public
    perm:string;
    CJ1_Notas : TCJ_Notas;
    CJ1_NotasConta:Integer;
    CJ2_Notas : TCJ_Notas2;
    CJ3_Baixas : TCJ_Baixas;
    CJ4_Dados : TCJ_DadosNotas;
    CJ4_DadosConta: Integer;

    BaseURL1,BaseURL2,BaseURL3,BaseURL4,BaseURL5, BaseURL11, BaseURL12, BaseURL13 : string;
    { REST - rotinas }
   // Base
   procedure JsonToDataset(aDataset : TDataSet; aJSON : string);
   function DataSetToJsonTxt(pDataSet: TDataSet): string;
   procedure Inicia();
   // Especificos
   function CriaJSON1_EnviaNota(rN, rM:Integer; rDt:String):String;
   function CriaJSON2_EnviaNota():String;
   function CriaJSON3_Baixa():String;
   function CriaJSON4_Dados():String;

   procedure Limpar;
   procedure Grava_Saida(js:String);
   procedure Grava_SaidaB(js:String);
   procedure Grava_SaidaC(js: String);
   procedure Grava_SaidaD(js: String);
   procedure Rastreio_SMS(js: String; usaSMS:boolean);

    { Analisa }
  published

end;

implementation

// Rotinas Gerais

{ TCTe }

function TRest.CriaJSON1_EnviaNota(rN, rM:Integer; rDt:String): String;
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

begin

  ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(perm);
    ObjJSon.AddPair('mzperm',strJSon);

    // Dados do Romaneio
    IntJSon:=TJSONNumber.Create(rN);
    ObjJSon.AddPair('romanum',IntJSon);
    strJSon:=TJSONString.Create(rDt);
    ObjJSon.AddPair('romadt',strJSon);
    IntJSon:=TJSONNumber.Create(rM);
    ObjJSon.AddPair('romamot',IntJSon);

    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    for I := 1 to CJ1_NotasConta do
    begin

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].numC);
      ObjJSon1.AddPair('numC',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].numN);
      ObjJSon1.AddPair('numN',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].idN);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].vNF);
      ObjJSon1.AddPair('vNF',IntJSon);
      strJSon:=TJSONString.Create(CJ1_Notas[i].doc);
      ObjJSon1.AddPair('doc',strJSon);
      strJSon:=TJSONString.Create(CJ1_Notas[i].ped);
      ObjJSon1.AddPair('ped',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

end;

function TRest.CriaJSON2_EnviaNota(): String;
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

begin

    ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(perm);
    ObjJSon.AddPair('mzperm',strJSon);

    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    for I := 1 to CJ1_NotasConta do
    begin

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].numC);
      ObjJSon1.AddPair('numC',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].numN);
      ObjJSon1.AddPair('numN',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].idN);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ1_Notas[i].vNF);
      ObjJSon1.AddPair('vNF',IntJSon);
      strJSon:=TJSONString.Create(CJ1_Notas[i].doc);
      ObjJSon1.AddPair('doc',strJSon);
      strJSon:=TJSONString.Create(CJ1_Notas[i].ped);
      ObjJSon1.AddPair('ped',strJSon);

      // Dados do Romaneio
      IntJSon:=TJSONNumber.Create(CJ2_Notas[i].romanum);
      ObjJSon1.AddPair('romanum',IntJSon);
      strJSon:=TJSONString.Create(CJ2_Notas[i].romadt);
      ObjJSon1.AddPair('romadt',strJSon);
      IntJSon:=TJSONNumber.Create(CJ2_Notas[i].romamot);
      ObjJSon1.AddPair('romamot',IntJSon);


      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

end;


function TRest.CriaJSON3_Baixa: String;
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

begin

  ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(perm);
    ObjJSon.AddPair('mzperm',strJSon);


    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    for I := 1 to CJ1_NotasConta do
    begin

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(CJ3_Baixas[i].idN);
      ObjJSon1.AddPair('idN',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ3_Baixas[i].numOc);
      ObjJSon1.AddPair('numOc',IntJSon);
      strJSon:=TJSONString.Create(CJ3_Baixas[i].entDT);
      ObjJSon1.AddPair('entDT',strJSon);
      strJSon:=TJSONString.Create(CJ3_Baixas[i].entHR);
      ObjJSon1.AddPair('entHR',strJSon);
      IntJSon:=TJSONNumber.Create(CJ3_Baixas[i].origem);
      ObjJSon1.AddPair('origem',IntJSon);
      strJSon:=TJSONString.Create(CJ3_Baixas[i].recebedor);
      ObjJSon1.AddPair('Recebedor',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

end;

function TRest.CriaJSON4_Dados(): String;
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

begin

    ObjJSon:=TJSONObject.Create;
     // Dados para ENTRAR
    IntJSon:=TJSONNumber.Create(1);
    ObjJSon.AddPair('mzcli',IntJSon);
    strJSon:=TJSONString.Create(perm);
    ObjJSon.AddPair('mzperm',strJSon);

    // Dados das NOTAS
    ArrayJSon:=TJSONArray.Create;
    ObjJSon.AddPair('dados',ArrayJSon);
    for I := 1 to CJ4_DadosConta do
    begin

      ObjJSon1:=TJSONObject.Create();

      IntJSon:=TJSONNumber.Create(CJ4_Dados[i].numnota);
      ObjJSon1.AddPair('numnota',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ4_Dados[i].ligcli);
      ObjJSon1.AddPair('ligcli',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ4_Dados[i].vlrnota);
      ObjJSon1.AddPair('vlrnota',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ4_Dados[i].peso);
      ObjJSon1.AddPair('peso',IntJSon);
      IntJSon:=TJSONNumber.Create(CJ4_Dados[i].volume);
      ObjJSon1.AddPair('volume',IntJSon);
      strJSon:=TJSONString.Create(CJ4_Dados[i].dtimporta);
      ObjJSon1.AddPair('dtimporta',strJSon);
      strJSon:=TJSONString.Create(CJ4_Dados[i].ddoc);
      ObjJSon1.AddPair('ddoc',strJSon);
      strJSon:=TJSONString.Create(CJ4_Dados[i].numped);
      ObjJSon1.AddPair('numped',strJSon);

      ArrayJSon.AddElement(ObjJSon1);
    end;

  result := ObjJSon.ToString;
  ObjJSon.Destroy;

end;


function TRest.DataSetToJsonTxt(pDataSet: TDataSet): string;
  var
    ArrayJSon:TJSONArray;
    ObjJSon:TJSONObject;
    strJSon:TJSONString;
    intJSon:TJSONNumber;
    TrueJSon:TJSONTrue;
    FalseJSon:TJSONFalse;
    I: Integer;
    pField:TField;
begin
  ArrayJSon:=TJSONArray.Create;
    try
      pDataSet.First;
        while not pDataSet.Eof do
          begin
            ObjJSon:=TJSONObject.Create;
            for pField in pDataSet.Fields do
            case pField.DataType of
              TFieldType.ftString:
                begin
                  strJSon:=TJSONString.Create(pField.AsString);
                  ObjJSon.AddPair(pField.FieldName,strJSon);
                end;
             TFieldType.ftInteger:
                 begin
                  IntJSon:=TJSONNumber.Create(pField.AsInteger);
                  ObjJSon.AddPair(pField.FieldName,IntJSon);
                end;
             TFieldType.ftBoolean:
             {
               case rdgEstadoDataset.ItemIndex of
                 0:begin
                     TrueJSon:=TJSONTrue.Create;
                     ObjJSon.AddPair(pField.FieldName,TrueJSon);
                   end;
                 1:begin
                      FalseJSon:=TJSONFalse.Create;
                      ObjJSon.AddPair(pField.FieldName,FalseJSon);
                   end;
               end;
               }
      else //casos gerais são tratados como string
        begin
          strJSon:=TJSONString.Create(pField.AsString);
          ObjJSon.AddPair(pField.FieldName,strJSon);
       end;
  end;
    ArrayJSon.AddElement(ObjJSon);
    pDataSet.next;
end;
result:=ArrayJSon.ToString;
finally
   ArrayJSon.Free;
end;
end;

procedure TRest.Inicia;
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

  perm := '2026.12.687452068';
  BaseURL1 := s1+ '/api/Romaneio';
  BaseURL2 := s1+ '/api/Notas';
  BaseURL3 := s1+ '/api/Baixa';
  BaseURL4 := s2+ '/api/Sac';
  BaseURL5 := s2+ '/api/DadosNota';

  BaseURL11:= s2+ '/api/Romaneio';
  BaseURL12:= s2+ '/api/Notas';
  BaseURL13:= s2+ '/api/Baixa';

end;

procedure TRest.JsonToDataset(aDataset: TDataSet; aJSON: string);
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

procedure TRest.Limpar;
  var i : Integer;
begin
  for I := 1 to MAX_NOTAS do
  begin
    CJ1_Notas[i].idN  := 0;
    CJ1_Notas[i].numN := 0;
    CJ1_Notas[i].numC := 0;
    CJ1_Notas[i].vNF  := 0;
    CJ1_Notas[i].doc  := '';
    CJ1_Notas[i].ped  := '';

    CJ2_Notas[i].romanum  := 0;
    CJ2_Notas[i].romamot  := 0;
    CJ2_Notas[i].romadt   := '';

    CJ3_Baixas[i].idN := 0;
    CJ3_Baixas[i].numOc := 0;
    CJ3_Baixas[i].entDT := '';
    CJ3_Baixas[i].entHR := '';
    CJ3_Baixas[i].origem:= 0;
    CJ3_Baixas[i].recebedor := '';

    CJ4_Dados[i].numnota := 0;
    CJ4_Dados[i].ligcli := 0;
    CJ4_Dados[i].vlrnota := 0;
    CJ4_Dados[i].peso := 0;
    CJ4_Dados[i].volume := 0;
    CJ4_Dados[i].dtimporta := '';
    CJ4_Dados[i].ddoc := '';
    CJ4_Dados[i].numped := '';
  end;

end;

procedure TRest.Rastreio_SMS(js: String; usaSMS:boolean);

  var Cdtset : TClientDataSet;
      i, erro, ct : Integer;
      conj : array[1..9] of string;
      Rast : TRastreio;
      sms : TSMS;
      hoje : TDatetime;

begin
    Cdtset := TClientDataSet.Create(nil);
    for i := 1 to 9 do conj[i] := '';
    if (js.Length>5) then
    begin
      JsonToDataset(CdtSet, js);
      // ----------------------------------------------------
      // ==================== GRAVA STATUS DA SAIDA
      // ----------------------------------------------------
      if CdtSet.RecordCount > 0 then
      if (CdtSet.RecordCount = 1) and (CdtSet.Fields[0].Value = 0) then
      begin
          erro := 5;
      end
      else
      begin
        CdtSet.First;
        while not CdtSet.Eof do
        begin
          // 6=Enviado
          if CdtSet.Fields[1].Value = 6  then
          begin
            // EVENTO NF - Rastreio
            Rast := TRastreio.Create;
            Rast.set_ocorID(CdtSet.Fields[0].Value, idUser ,evrNaWEB);
            Rast.Destroy;

            if usaSMS then
            begin
              // Enviar SMS
              sms := TSMS.Create;
              ct := sms.EnviarID(CdtSet.Fields[0].Value);
              sms.Destroy;
            end;

          end;

          CdtSet.Next;
        end;

      end;
    end;
    Cdtset.Destroy;
end;

procedure TRest.Grava_Saida(js: String);

  var Cdtset : TClientDataSet;
      i, erro : Integer;
      Bco : TBco;
      conj : array[1..9] of string;

begin
    Cdtset := TClientDataSet.Create(nil);
    for i := 1 to 9 do conj[i] := '';
    if (js.Length>5) then
    begin
      JsonToDataset(CdtSet, js);
      // ----------------------------------------------------
      // ==================== GRAVA STATUS DA SAIDA
      // ----------------------------------------------------
      if CdtSet.RecordCount > 0 then
      if (CdtSet.RecordCount = 1) and (CdtSet.Fields[0].Value = 0) then
      begin
          erro := 5;
      end
      else
      begin
        CdtSet.First;
        while not CdtSet.Eof do
        begin
          // 6=Enviado
          if CdtSet.Fields[1].Value = 6  then
          begin
            if conj[6].Length>0 then conj[6] := conj[6] + ', '+CdtSet.Fields[0].AsString
              else conj[6] := conj[6] + CdtSet.Fields[0].AsString;
          end;
          if CdtSet.Fields[1].Value < 6  then
          begin
            if conj[CdtSet.Fields[1].AsInteger].Length>0 then conj[CdtSet.Fields[1].AsInteger] := conj[CdtSet.Fields[1].AsInteger] + ', '+CdtSet.Fields[0].AsString
              else conj[CdtSet.Fields[1].AsInteger] := conj[CdtSet.Fields[1].AsInteger] + CdtSet.Fields[0].AsString;
          end;

          CdtSet.Next;
        end;
        Bco := TBco.Create;
        for i := 1 to 9 do if (conj[i].Length> 0) then Bco.WS_MarcaRespVarias(i, conj[i]);
        Bco.Destroy;
      end;
    end;
    Cdtset.Destroy;
end;

procedure TRest.Grava_SaidaB(js: String);
  var Cdtset : TClientDataSet;
      i, erro : Integer;
      Bco : TBco;
      conj : array[1..9] of string;

begin

    Cdtset := TClientDataSet.Create(nil);
    //Cdtset.EmptyDataSet;
    for i := 1 to 9 do conj[i] := '';
    if (js.Length>5) then
    begin
      JsonToDataset(CdtSet, js);
      // ----------------------------------------------------
      // ==================== GRAVA STATUS DA SAIDA
      // ----------------------------------------------------
      if CdtSet.RecordCount > 0 then
      if (CdtSet.RecordCount = 1) and (CdtSet.Fields[0].Value = 0) then
      begin
          erro := 5;
      end
      else
      begin
        CdtSet.First;
        while not CdtSet.Eof do
        begin
          // 6=Enviado
          //if (CdtSet.Fields[1].Value = 4) or (CdtSet.Fields[1].Value = 9)  then
          if (Length(CdtSet.Fields[0].AsString)>1) then
          begin
            if not (conj[4].IsEmpty) then conj[4] := conj[4] + ', '+CdtSet.Fields[0].AsString
              else conj[4] := conj[4] + CdtSet.Fields[0].AsString;
          end;

          CdtSet.Next;
        end;
        Bco := TBco.Create;
        Bco.REST_BaixaMarcaVarios(conj[4]);
        Bco.Destroy;
      end;
    end;
    Cdtset.Destroy;

end;

procedure TRest.Grava_SaidaC(js: String);
  var Cdtset : TClientDataSet;
      i, erro, nNF, nCL, nCH : Integer;
      Bco : TBco;
      conj : array[1..9] of string;

begin
    Cdtset := TClientDataSet.Create(nil);
    for i := 1 to 9 do conj[i] := '';
    if (js.Length>5) then
    begin
      JsonToDataset(CdtSet, js);
      // ----------------------------------------------------
      // ==================== GRAVA STATUS DA SAIDA
      // ----------------------------------------------------
      if CdtSet.RecordCount > 0 then
      if (CdtSet.RecordCount = 1) and (CdtSet.Fields[0].Value = 0) then
      begin
          erro := 5;
      end
      else
      begin
        Bco := TBco.Create;
        CdtSet.First;
        while not CdtSet.Eof do
        begin
          nNF :=  CdtSet.Fields[2].AsInteger;
          nCL :=  CdtSet.Fields[1].AsInteger;
          nCH :=  CdtSet.Fields[0].AsInteger;
          // 6=Enviado
          if nNF > 0  then  Bco.Notas_Altera_numCham(nNF, nCL, nCH);

          CdtSet.Next;
        end;
        Bco.Config_SAC_Ult_Altera(nCH);
        Bco.Destroy;

      end;
    end;
    Cdtset.Destroy;

end;

procedure TRest.Grava_SaidaD(js: String);
  var Cdtset : TClientDataSet;
      i, erro, nNF, nCL, nCH : Integer;
      Bco : TBco;
      conj : array[1..9] of string;

begin
    Cdtset := TClientDataSet.Create(nil);
    if (js.Length>5) then
    begin
      JsonToDataset(CdtSet, js);
      // ----------------------------------------------------
      // ==================== GRAVA STATUS DA SAIDA
      // ----------------------------------------------------
      if CdtSet.RecordCount > 0 then
      if (CdtSet.RecordCount = 1) and (CdtSet.Fields[0].Value = 0) then
      begin
          erro := 5;
      end
      else
      begin
        Bco := TBco.Create;
        CdtSet.First;
        while not CdtSet.Eof do
        begin
          nNF :=  CdtSet.Fields[0].AsInteger;
          nCL :=  CdtSet.Fields[1].AsInteger;
          nCH :=  CdtSet.Fields[2].AsInteger;
          // 6=Enviado
          if (nCH = 10) or (nCH=5)  then  Bco.REST_dadosWEB_Marca(nNF, nCL, 7); // Sucesso
            //else Bco.REST_dadosWEB_Marca(nNF, nCL, 9); // Erro deixar tentar novamente

          CdtSet.Next;
        end;

        Bco.Destroy;

      end;
    end;
    Cdtset.Destroy;

end;

end.
