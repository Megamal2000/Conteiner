unit uPagDiv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Menus, JvExStdCtrls, JvEdit, JvValidateEdit,
  ppCtrls, ppVar, ppPrnabl, ppClass, ppDB, ppBands, ppCache, ppDBPipe,
  ppComm, ppRelatv, ppProd, ppReport, JvMemoryDataset, ppParameter,
  ppDesignLayer;

type
  TPagDiv = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btMot: TBitBtn;
    lbMot: TLabel;
    btAtualiza: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    Rodape: TStatusBar;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Classificarpagm1: TMenuItem;
    AlterarKm1: TMenuItem;
    AlterarValor1: TMenuItem;
    N1: TMenuItem;
    Calcular1: TMenuItem;
    lbkm: TLabel;
    Bevel1: TBevel;
    valorKM: TJvValidateEdit;
    btSalveKM: TSpeedButton;
    AlterarTipo1: TMenuItem;
    Entregas1: TMenuItem;
    KM1: TMenuItem;
    Sada1: TMenuItem;
    Contrato1: TMenuItem;
    ratado1: TMenuItem;
    InserirTratado1: TMenuItem;
    btImp: TSpeedButton;
    RelPG1: TppReport;
    Panel2: TPanel;
    lbSubt: TLabel;
    lbVales: TLabel;
    lbTot: TLabel;
    btVales: TBitBtn;
    Bevel2: TBevel;
    Label3: TLabel;
    btSalvPag: TBitBtn;
    Tab: TJvMemoryData;
    TabdtRoma: TDateField;
    TabNum: TIntegerField;
    TabRomaneio: TIntegerField;
    TabQtNFtot: TIntegerField;
    TabQtNFprinc: TIntegerField;
    TabQtNFout: TIntegerField;
    TabPagM: TStringField;
    Tabkm: TIntegerField;
    TabPonto: TSmallintField;
    TabTipo_Carro: TSmallintField;
    TabTipo_Pag: TSmallintField;
    TabVPAG: TFloatField;
    TabLigAjud: TIntegerField;
    lbCred: TLabel;
    btcred: TBitBtn;
    ppDBPipeline1: TppDBPipeline;
    TabPeso: TFloatField;
    TabQNFsite: TIntegerField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel12: TppLabel;
    ppLabel18: TppLabel;
    TabRegiao: TStringField;
    ppDBText8: TppDBText;
    ppLabel20: TppLabel;
    procedure btMotClick(Sender: TObject);
    procedure btAtualizaClick(Sender: TObject);
    procedure Classificarpagm1Click(Sender: TObject);
    procedure AlterarKm1Click(Sender: TObject);
    procedure AlterarValor1Click(Sender: TObject);
    procedure Entregas1Click(Sender: TObject);
    procedure KM1Click(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure Contrato1Click(Sender: TObject);
    procedure ratado1Click(Sender: TObject);
    procedure Calcular1Click(Sender: TObject);
    procedure dat1Change(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btSalveKMClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
    procedure btValesClick(Sender: TObject);
    procedure btcredClick(Sender: TObject);
    procedure dat2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idM(i : Integer);
    procedure set_Vale(f : Double);
    procedure set_Cred(f : Double);
    procedure Entrar;
  end;

var
  PagDiv: TPagDiv;
  idMot : Integer;
  vSubt, vVales,vCred, vTot : Double;


implementation

uses upsqFuncs, uDM1, uDM3, uDM4, uBanco, uPagms, uRoman, uPagVale, uDM2,
  uPagCred, Global;

{$R *.dfm}

procedure TPagDiv.btMotClick(Sender: TObject);
begin
  psqFuncs.set_tipo(1);
  psqFuncs.set_saida(5);
  psqFuncs.Show;
end;

procedure TPagDiv.set_idM(i: Integer);
begin
  idMot := i;
end;

function Retorna_Regiao(idRe:Integer):String;
  var resp : String;
begin
  resp := '';
  DM1.cdsReg.First;
  while not DM1.cdsReg.Eof do
  begin
    if DM1.cdsRegID.Value = idRe then resp := DM1.cdsRegDESCR.Value;

    DM1.cdsReg.Next;
  end;

  Result := resp;
end;

procedure Copia_Tabelas;
   var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Regiao_Mostra;
  Bco.Destroy;

  with PagDiv do
  begin
    Tab.Close;
    Tab.EmptyTable;

    Tab.Open;

    DM3.cdsPG.First;
    while NOT DM3.cdsPG.Eof do
    begin
      Tab.Insert;

      TabdtRoma.Value        := DM3.cdsPGDTROMA.Value;
      TabNum.Value           := DM3.cdsPGNUM.Value;
      TabRomaneio.Value      := DM3.cdsPGROMANEIO.AsInteger;
      TabQtNFtot.Value       := DM3.cdsPGNOTAS.Value;
      TabPagM.Value          := DM3.cdsPGPAGM.Value;
      Tabkm.Value            := DM3.cdsPGKM.Value;
      TabPonto.Value         := DM3.cdsPGPT.AsInteger;
      TabTipo_Carro.Value    := DM3.cdsPGTIPO_CARRO.Value;
      TabTipo_Pag.Value      := DM3.cdsPGTIPO_PAG.Value;
      TabVPAG.Value          := DM3.cdsPGVPAG.AsFloat;
      TabLigAjud.Value       := DM3.cdsPGLIGAJUD.Value;
      TabPeso.Value          := DM3.cdsPGPESO.AsFloat;
      TabQtNFprinc.Value     := 0;
      TabQtNFout.Value       := 0;
      TabQNFsite.Value       := 0;
      TabRegiao.Value        := Retorna_Regiao(DM3.cdsPGLIGREG.Value);

      Tab.Post;

      DM3.cdsPG.Next;
    end; //while


  end; // with
end;

procedure Conta_Cli;

var Bco : TBco;
    fim  : boolean;
begin
  Bco := TBco.Create;
  Bco.Pagamento_ContarCli(1,idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
  Bco.Destroy;

  with PagDiv do
  begin
    DM3.cdsPGconta.First;
    while NOT DM3.cdsPGconta.Eof do
    begin
      fim := false;
      Tab.First;
      while NOT Tab.Eof and not fim do
      begin
        if (TabNUM.Value = DM3.cdsPGcontaNUM.Value) then
        begin
          fim := true;
          // Tela
          Tab.Edit;
          TabQtNFprinc.Value := DM3.cdsPGcontaNOTAS.Value;
          Tab.Post;
        end;
        Tab.Next;
      end;
      DM3.cdsPGconta.Next;
    end;
  end; // with
end;

procedure Conta_Outros;

var Bco : TBco;
    fim  : boolean;
begin
  Bco := TBco.Create;
  Bco.Pagamento_ContarCli(3,idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
  Bco.Destroy;

  with PagDiv do
  begin
    DM3.cdsPGconta.First;
    while NOT DM3.cdsPGconta.Eof do
    begin
      fim := false;
      Tab.First;
      while NOT Tab.Eof and not fim do
      begin
        if (TabNUM.Value = DM3.cdsPGcontaNUM.Value) then
        begin
          fim := true;
          // Tela
          Tab.Edit;
          TabQtNFout.Value := DM3.cdsPGcontaNOTAS.Value;
          Tab.Post;
        end;
        Tab.Next;
      end;
      DM3.cdsPGconta.Next;
    end;
  end; // with
end;

procedure Conta_Site;

var Bco  : TBco;
    fim  : boolean;

begin
  Bco := TBco.Create;
  Bco.Pagamento_ContarCli(22,idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
  Bco.Destroy;

  with PagDiv do
  begin
    DM3.cdsPGconta.First;
    while NOT DM3.cdsPGconta.Eof do
    begin
      fim := false;
      Tab.First;
      while NOT Tab.Eof and not fim do
      begin
        if (TabNUM.Value = DM3.cdsPGcontaNUM.Value) then
        begin
          fim := true;
          // Tela
          Tab.Edit;
          TabQNFsite.Value := DM3.cdsPGcontaNOTAS.Value;
          Tab.Post;
        end;
        Tab.Next;
      end;
      DM3.cdsPGconta.Next;
    end;
  end; // with
end;

function Conta_Repetidos(nR:Integer): Integer;


begin
  DM3.cdsPGrepet.First;
  while NOT DM3.cdsPGrepet.Eof do
  begin

    DM3.cdsPGrepet.Next;
  end;
end;

procedure CEP_repetidos();
var Bco  : TBco;
    fim  : boolean;
    qt: Integer;

begin


  with PagDiv do
  begin
    Tab.First;
    while NOT Tab.Eof do
    begin
      Bco := TBco.Create;
      Bco.Pagamento_ContaCEP_repetidos(TabNum.Value);
      Bco.Destroy;
      qt  := 0;

      DM3.cdsPGrepet.First;
      while not DM3.cdsPGrepet.EOf do
      begin
        qt := qt + DM3.cdsPGrepetCOUNT.Value - 1;
        DM3.cdsPGrepet.Next;
      end;

      // Tela
      Tab.Edit;
      TabQtNFprinc.Value := qt;
      TabQNFsite.Value := TabQtNFtot.Value - qt;
      Tab.Post;

      Tab.Next;
    end;


  end; // with

end;


procedure Atualiza();

var Bco : TBco;
    cVales, cCred : Integer;

begin
  if (idMot > 0) then
  begin
    Bco := TBco.Create;
    Bco.Pagamento_Mostrar(idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
    Bco.Vale_Total(idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
    vVales := 0;
    cVales := 0;
    vTot   := 0;
    if (DM2.cdsTMP.RecordCount > 0) then
    begin
      vVales := DM2.cdsTMP.Fields[1].AsFloat;  // Soma
      cVales := DM2.cdsTMP.Fields[0].value;  // conta
    end;

    Bco.CredMot_Total(idMot, PagDiv.dat1.DateTime, PagDiv.dat2.DateTime);
    vCred := 0;
    cCred := 0;
    if (DM2.cdsTMP.RecordCount > 0) then
    begin
      vCred := DM2.cdsTMP.Fields[1].AsFloat;  // Soma
      cCred := DM2.cdsTMP.Fields[0].value;  // conta
    end;

    Bco.Destroy;
    Copia_Tabelas;
    //Conta_Cli;
    CEP_repetidos;
    Conta_Outros;
    Conta_Site;


    PagDiv.Rodape.Panels[0].Text := 'Romaneios: '+IntToStr(DM3.cdsPG.RecordCount);
    PagDiv.Rodape.Panels[1].Text := 'Vales: '+IntToStr(cVales);
    PagDiv.Rodape.Panels[2].Text := 'Créditos: '+IntToStr(cCred);

    if (DM3.cdsPG.RecordCount>0) then
    begin
      vSubt := 0;
      DM3.cdsPG.First;
      while not DM3.cdsPG.Eof do
      begin
        vSubt := vSubt + DM3.cdsPGVPAG.AsFloat;
        DM3.cdsPG.Next;
      end;
      DM3.cdsPG.First;
      vTot := vSubt - vVales + vCred;
      PagDiv.lbSubt.Caption  := FormatFloat('#,##0.00', vSubt);
      PagDiv.lbVales.Caption := FormatFloat('#,##0.00', vVales);
      PagDiv.lbCred.Caption  := FormatFloat('#,##0.00', vCred);
      PagDiv.lbTot.Caption   := FormatFloat('#,##0.00', vTot);
    end;
  end
  else ShowMessage('Escolha um Motorista');

end;


procedure TPagDiv.btAtualizaClick(Sender: TObject);

begin
  Atualiza;
end;

procedure TPagDiv.Classificarpagm1Click(Sender: TObject);

var Bco : TBco;

begin
  {
    0 = nao classificado
    1 = padrao : Entrega ou Peso
    2 = KM
    3 = Saida ou Saida Personalizada
    4 = Saida P
    5 - Tratado

  }
  if (DM3.cdsPGTIPO_PAG.Value <> 5) then
  begin
    if (DM3.cdsPG.RecordCount > 0) then
    begin
      DM3.cdsPG.First;
      while not DM3.cdsPG.Eof do
      begin
        // Serviço padrão
        if (DM3.cdsPGKM.Value = 0) and (DM3.cdsPGTIPO_CARRO.Value = 0) and (DM3.cdsPGTipo_Pag.Value < 4) then
          begin
            Bco := TBco.Create;
            Bco.Pagamento_AlterarTipo(DM3.cdsPGNUM.Value , 1);
            Bco.Destroy;
          end;

        if (DM3.cdsPGKM.Value > 0) then
          begin
            Bco := TBco.Create;
            Bco.Pagamento_AlterarTipo(DM3.cdsPGNUM.Value , 2);
            Bco.Destroy;
          end;

        if (DM3.cdsPGTIPO_CARRO.Value > 0) then
          begin
            Bco := TBco.Create;
            Bco.Pagamento_AlterarTipo(DM3.cdsPGNUM.Value , 3);
            Bco.Destroy;
          end;
        {
        if (DM3.cdsPGTIPO_CARRO.Value = 7) then
          begin
            Bco := TBco.Create;
            Bco.Pagamento_AlterarTipo(DM3.cdsPGNUM.Value , 7);
            Bco.Destroy;
          end;
         }
        DM3.cdsPG.Next;
      end;
      Atualiza;
    end;
  end; // <9
end;

procedure TPagDiv.AlterarKm1Click(Sender: TObject);

var n : String;
    Bco : TBco;

begin
  if (DM3.cdsPG.RecordCount > 0) then
    begin
      n := InputBox('Km do Romaneio','Qual foi a quilometragem do Romaneio' ,'' );

      Bco := TBco.Create;
      Bco.Pagamento_Alterarkm(TabNUM.Value , 2, StrToInt(n));
      Bco.Destroy;
    end;
end;

procedure TPagDiv.AlterarValor1Click(Sender: TObject);

var t : Integer;
    Bco : TBco;
    S : String;
    n : Double;

begin
  if (DM3.cdsPG.RecordCount > 0) then
    begin
      // NAO FUNCIONA 

      S := InputBox('Alterar o Valor ','Digite o novo Valor' ,'' );
      if  (S <> '') then
      begin
        if (pos('.',S)>0) then S[pos('.',S)] := ',';
        n := StrToFloat(S);

        t:= DM3.cdsPGTIPO_PAG.Value;
        if (t >= 1) and (t<=5) then t := t + 10;
        if (t = 0) then t := 6;

        Bco := TBco.Create;
        Bco.Pagamento_AlterarValor(TabNum.Value ,t, n);
        Bco.Destroy;
      end;

    end;

end;

procedure TPagDiv.Entregas1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Pagamento_AlterarTipo(TabNUM.Value , 1);
  Bco.Destroy;
end;

procedure TPagDiv.KM1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Pagamento_AlterarTipo(TabNUM.Value , 2);
  Bco.Destroy;

end;

procedure TPagDiv.Sada1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Pagamento_AlterarTipo(TabNUM.Value , 3);
  Bco.Destroy;
end;

procedure TPagDiv.Contrato1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Pagamento_AlterarTipo(TabNUM.Value , 4);
  Bco.Destroy;
end;

procedure TPagDiv.ratado1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Pagamento_AlterarTipo(TabNUM.Value , 5);
  Bco.Destroy;
end;

procedure TPagDiv.Calcular1Click(Sender: TObject);

var Pag : TPag;
    Bco : TBco;
    loc, tPeso : Integer;
    pagM : Double;
    NotasT, NotasP, NotasO, NumAjud : Integer;

begin
  if (Tab.RecordCount > 0) then
  begin

    Tab.First;
    while not Tab.Eof do
    begin

      NotasT := TabQtNFtot.Value;
      NotasP := TabQtNFprinc.Value + TabQNFsite.Value;
      NotasO := TabQtNFout.Value;

      NumAjud:= 1;
      if (TabLigAjud.Value = 62) then NumAjud := 1;
      if (TabLigAjud.Value = 63) then NumAjud := 2;
      if (TabLigAjud.Value = 60) then NumAjud := 2;
      if (TabLigAjud.Value = 64) then NumAjud := 3;

      Bco := TBco.Create;
      Bco.Romaneio_MostraNum(TabNUM.Value);
      Bco.Regiao_MostraId(DM1.cdsRomaLIGREG.Value);
      loc := DM1.cdsRegCLASS.Value-1;
      Bco.PagFaixa_Mostrar(idMot, loc);
      Bco.Destroy;

      pagM := -1;
      // 1 ENTREGAS - Serviço padrão
      if (TabTipo_Pag.Value = 1) then
        begin
          Bco := TBco.Create;
          Bco.PagFaixa_Mostrar(idMot, loc);
          Bco.Destroy;

          Pag := TPag.Create;
          Pag.CalculaEntregas(loc,NotasT, NumAjud);
          if (DM3.cdsPag1.Active) then
            if (DM3.cdsPag1.RecordCount > 0) then
              Pag.CalculaPersonalizado(loc,NotasT,idMot, NumAjud, TabNUM.Value);
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

      // 2 KM
      if (TabTipo_Pag.Value = 2) then
        begin
          Pag := TPag.Create;
          Pag.CalculaKm(TabKM.Value, valorKM.Value );
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

      // 3 Saída
      if (TabTipo_Pag.Value = 3) then
        begin
          Pag := TPag.Create;
          if (DM1.cdsRomaTIPO_CARRO.Value<7) then
            Pag.CalculaSaida(DM1.cdsRomaNUM.Value, DM1.cdsRomaTIPO_CARRO.Value, loc, NumAjud )
          else
            begin
              { DONE 2 -oMarco -cMedio : TOTAL do Peso no Romaneio }
              // Falta o valor do Peso do romaneio
              Bco := TBco.Create;
              tPeso := Trunc(Bco.Romaneio_PesoTotal(DM1.cdsRomaNUM.value));
              Bco.Destroy;
              Pag.CalculaSaidaP(DM1.cdsRomaLIGMOT.Value, tPeso, loc, NumAjud);
            end;
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

      // 5 Tratado
      if (TabTipo_Pag.Value = 5) then
        begin
          Pag := TPag.Create;
          Pag.CalculaTratado(TabNum.Value);
          PagM := Pag.get_Total;
          Pag.Destroy;
        end;
       // Outras Notas (EXTRA)
       {
       OUTRAS - FECHADO em 18.02.2016 - refazer problema
       =======
       if (NotasO>0) and (TabTipo_Pag.Value <> 5) then
       begin
         Bco := TBco.Create;
         PagM := PagM + Bco.Pagamento_CalcOutrasNF(DM1.cdsRomaNUM.Value);
         Bco.Destroy;
       end;
       }
       // Calcula Pontos
       if (TabPonto.Value > 0) and (TabTipo_Pag.Value <> 5) then
       begin
         Bco := TBco.Create;
         PagM := PagM + Bco.Pagamento_CalcPontos(idMot, TabPonto.Value);
       Bco.Destroy;
       end;

       if (PagM >= 0) then
        begin
          Bco := TBco.Create;
          Bco.Pagamento_AlterarValor(TabNUM.Value , TabTIPO_PAG.Value, pagM);
          Bco.Destroy;
        end;

      Tab.Next;
    end;
    Atualiza;
  end;


{
  if (DM3.cdsPG.RecordCount > 0) then
  begin

    DM3.cdsPG.First;
    while not DM3.cdsPG.Eof do
    begin
      Bco := TBco.Create;
      Bco.Romaneio_MostraNum(DM3.cdsPGNUM.Value);
      Bco.Regiao_MostraId(DM1.cdsRomaLIGREG.Value);
      loc := DM1.cdsRegCLASS.Value-1;
      Bco.PagFaixa_Mostrar(idMot, loc);
      Bco.Destroy;


      pagM := -1;
      // 1 ENTREGAS - Serviço padrão
      if (DM3.cdsPGTipo_Pag.Value = 1) then
        begin
          Bco := TBco.Create;
          Bco.PagFaixa_Mostrar(idMot, loc);
          Bco.Destroy;


          Pag := TPag.Create;
          Pag.CalculaEntregas(loc,DM3.cdsPGNOTAS.Value);
          if (DM4.cdsPG1.Active) then
            if (DM4.cdsPG1.RecordCount > 0) then
              Pag.CalculaPersonalizado(loc,DM3.cdsPGNOTAS.Value,idMot);
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

      // 2 KM
      if (DM3.cdsPGTipo_Pag.Value = 2) then
        begin
          Pag := TPag.Create;
          Pag.CalculaKm(DM3.cdsPGKM.Value, valorKM.Value );
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

      // 3 Saída
      if (DM3.cdsPGTipo_Pag.Value = 3) then
        begin
          Pag := TPag.Create;
          Pag.CalculaSaida(DM1.cdsRomaNUM.Value, DM1.cdsRomaTIPO_CARRO.Value, loc );
          pagM := Pag.get_Total;
          Pag.Destroy;
        end;

        if (PagM >= 0) then
        begin
          Bco := TBco.Create;
          Bco.Pagamento_AlterarValor(DM3.cdsPGNUM.Value , DM3.cdsPGTIPO_PAG.Value, pagM);
          Bco.Destroy;
        end;

      DM3.cdsPG.Next;
    end;
    Atualiza;
  end;
  }


end;

procedure TPagDiv.dat1Change(Sender: TObject);
begin
  dat2.DateTime := dat1.DateTime + 30;
  dtPag1 := dat1.DateTime;
  dtPag2 := dat2.DateTime;

end;

procedure TPagDiv.JvDBGrid1DblClick(Sender: TObject);
begin
  //Roman.vNum.Value := DM3.cdsPGROMANEIO.AsInteger;
  Roman.set_idRoma(TabNUM.Value);
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure TPagDiv.btSalveKMClick(Sender: TObject);
begin
  Bco := TBco.Create;
  Bco.Funcs_GravaKM(idMot , valorKM.Value);
  Bco.Destroy;
end;

procedure TPagDiv.Entrar;
begin


    Bco := TBco.Create;
    valorKM.Value := Bco.Funcs_LeKM(idMot);
    Bco.Destroy;

end;

procedure Imprimir_rec();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with PagDiv do
   begin
     doc := 'Recibo de Pagamentos';
     { carrega o arquivo }
     RelPG1.Template.FileName := dirR+'\Rels\RelPagR.rtm';
     RelPG1.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelPG1.DeviceType := 'Screen';
     RelPG1.ShowAutoSearchDialog  := False;
     RelPG1.ShowCancelDialog := False;
     RelPG1.ShowPrintDialog := False;
     RelPG1.PrinterSetup.DocumentName := doc;

     ppLabel2.Caption:= lbMot.Caption;
     ppLabel4.Caption:= FormatDateTime('dd/MM/yyyy', dat1.DateTime);
     ppLabel5.Caption:= FormatDateTime('dd/MM/yyyy', dat2.DateTime);
     ppLabel16.Caption:= FormatFloat('#,##0.00', vVales);
     ppLabel17.Caption:= FormatFloat('#,##0.00', vTot);
     ppLabel18.Caption:= FormatFloat('#,##0.00', vCred);

     { imprime a ordem de serviço }
     RelPG1.PrintReport;

     {Fecha os arquivos}
   end;

end;

procedure TPagDiv.btImpClick(Sender: TObject);
begin
  Imprimir_rec;
end;

procedure TPagDiv.btValesClick(Sender: TObject);
begin
 PagVale.set_idM(idMot);
 PagVale.lbMot.Caption := lbMot.Caption;
 PagVale.dat1.DateTime := dtPag1;
 PagVale.dat2.DateTime := dtPag2;
 PagVale.set_sair(1);
 PagVale.btAtualizaClick(Sender);

 PagVale.Entrar;
 PagVale.Show;
end;

procedure TPagDiv.set_Vale(f: Double);
begin
  vVales := f;
end;

procedure TPagDiv.set_Cred(f: Double);
begin
  vCred := f;
end;

procedure TPagDiv.btcredClick(Sender: TObject);
begin
 PagCred.set_idM(idMot);
 PagCred.lbMot.Caption := lbMot.Caption;
 PagCred.dat1.DateTime := dtPag1;
 PagCred.dat2.DateTime := dtPag2;
 PagCred.set_sair(1);
 PagCred.btAtualizaClick(Sender);

 PagCred.Show;
end;

procedure TPagDiv.dat2Change(Sender: TObject);
begin
  dtPag2 := dat2.DateTime;
end;

end.
