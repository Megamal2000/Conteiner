unit uPrazo2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, JvExControls, JvgDigits,
  JvComponentBase, JvThreadTimer, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, ComObj;
type
 TUteis = record
   dia : TDateTime;
   num : Integer;
 end;

type
  TPrazo2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btProcNao: TBitBtn;
    btProcTodos: TBitBtn;
    lbEntrega: TStaticText;
    lbDias: TStaticText;
    lbPrazo: TStaticText;
    pb: TProgressBar;
    TimerProc: TJvThreadTimer;
    Dig: TJvgDigits;
    lbPb: TStaticText;
    Panel3: TPanel;
    lbResult: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btMostra: TBitBtn;
    Panel4: TPanel;
    btGera: TBitBtn;
    lbGeral: TLabel;
    lbPorDia: TLabel;
    lbOk: TLabel;
    btExcel: TBitBtn;
    Memo1: TMemo;
    btadmI: TBitBtn;
    SpeedButton1: TSpeedButton;
    lbFinal: TStaticText;
    Panel5: TPanel;
    ckSabado: TCheckBox;
    ckDomingo: TCheckBox;
    ckJunto: TCheckBox;
    procedure btProcNaoClick(Sender: TObject);
    procedure TimerProcTimer(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btProcTodosClick(Sender: TObject);
    procedure btMostraClick(Sender: TObject);
    procedure btGeraClick(Sender: TObject);
    procedure btadmIClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Prazo2: TPrazo2;
  nProc, tipoProc : Smallint;

  nNot, nNot1, nf24, nf48, nf72, nf96, nfout, nfPrazo, nf_Fora : Integer;
  mNf, mNf1, m24, m48, m72, mOut, mPrazo, mFora : Integer;
  porc1, porc2 : double;
  clis : String;
  planilha : variant;

implementation

{$R *.dfm}

uses uBanco, uDM5, uDM2,uDM1, uInuteis, uDiasUteis;


procedure Mostrar_NFs();

  var Bco : TBco;
      nNot, nNot1 : Integer;

begin
  with Prazo2 do
  begin
    Bco := TBco.Create;
    Bco.Prazo2Estat_Clientes(dt1.DateTime, dt2.DateTime);
    Bco.Destroy;

    nNot := DM2.Conta('TB_NFUNICA', 'dtcriada >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1.DateTime))+' and dtcriada <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2.DateTime))   );
    nNot1 := DM2.Conta('TB_NFUNICA', 'dtcriada >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1.DateTime))+' and dtcriada <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2.DateTime))+' and (status=1) '   );
    lbResult.Caption := 'Clientes: '+DM5.cdsPrE1.RecordCount.ToString+ '   /// Notas: '+nNot.ToString + '  /// Entregues: '+ nNot1.ToString;
  end;
end;

procedure botoes(mostrar: boolean);

begin
  with Prazo2 do
  begin
    btProcNao.Enabled := mostrar;
    btProcTodos.Enabled := mostrar;
    btMostra.Enabled := mostrar;
    btGera.Enabled := mostrar;
    btExcel.Enabled := mostrar;
    btadmI.Enabled := mostrar;
  end;
end;

procedure Limpar();
begin
  with Prazo2 do
  begin
    lbEntrega.Caption := '';
    lbDias.Caption := '';
    lbPrazo.Caption := '';
    lbFinal.Caption := '';

    lbPb.Caption := '';
    lbResult.Caption := '';

    lbGeral.Caption := '';
    lbPorDia.Caption := '';
    lbOk.Caption := '';

    ckSabado.Checked := false;
    ckDomingo.Checked := false;


  end;

end;
procedure Iniciar();
begin
  with Prazo2 do
  begin
    lbEntrega.Caption := 'Selecionando a Data de Entrega [Parado]';
    lbDias.Caption    := 'Calculando Dias para Entrega [Parado]';
    lbPrazo.Caption   := 'Copiando o prazo [Parado]';

    lbEntrega.Font.Color := clBlack;
    lbDias.Font.Color := clBlack;
    lbPrazo.Font.Color := clBlack;

    pb.Min := 0;
    pb.Position := 0;
    pb.Max := 10;

    Dig.Value := 5;
    lbPb.Caption := '';
    lbGeral.Caption := '';
    lbPorDia.Caption := '';
    lbOk.Caption := '';
    lbResult.Caption := '';
  end;
end;

function Nao_Util(dt:TDateTime):boolean;
  var resp : boolean;
begin
  resp := false;

  if DM5.cdsInu.RecordCount>0 then
  begin
    DM5.cdsInu.First;
    while (not DM5.cdsInu.Eof) and (not resp) do
    begin
      if (FormatDateTime('dd/MM',dt)=FormatDateTime('dd/MM',DM5.cdsInuDIA_INUTIL.AsDateTime)) then resp := true;
      DM5.cdsInu.Next;
    end;
  end;

  result := resp;
end;



function CalcDias(dt1, dt2: TDateTime; usa_sabado, usa_domingo:boolean): Integer;
  var resp : Integer;
      DataI, DataF : TDate;
      Bco : TBco;
      DU : TDutil;
begin
  // Inicia as Variáveis
  DataI := dt1;
  DataF := dt2 + 20;
  resp := 0;

  DU := TDutil.Create;
  DU.set_Datas(DataI, DataF);
  DU.Incluir_Sabado(usa_sabado);
  DU.Incluir_Domingo(usa_domingo);
  DU.Inserir_DiaInutil(Now + 1);
  DU.Montar_Sequencia;

  resp := DU.Calcular_EntreDatas(dt1, dt2);

  DU.Destroy;
  result := resp;


end;

function DescreveOC(nOc:Integer): String;
  var Bco : TBco;

begin
  Bco := tBco.Create;
  result := Bco.Ocorre_fPesq(nOc);
  Bco.Destroy;
end;

procedure Exec1_DTentrega();
  var Bco : TBco;
begin
  Bco := Tbco.Create;
  Bco.Prazo2DTentrega(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime, tipoProc);
  Bco.Destroy;
end;



procedure Exec2_CalcDias(usaSabado, usaDomingo: boolean);
  var diasUt : Array[0..52] of TUteis;
      DataI, DataF, DataTMP, diaE : TDateTime;
      Contador, i, diaBase : Integer;
      Bco : TBco;
      a,m,d : Word;
      achei : boolean;

begin
  Bco := TBco.Create;
  Bco.Prazo2Inuteis_MostraDT(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime);
  Bco.Destroy;

  DataI := Prazo2.dt1.Date;
  DataF := Prazo2.dt2.Date + 20;
  Prazo2.pb.Max := 52;
  Prazo2.pb.Position := 0;
  Contador := 0;
  i := 0;
  while (DataI <= DataF) and (i<52) do
  begin

    diasUt[i].dia :=  DataI;
    diasUt[i].num :=  Contador;

    Prazo2.Memo1.Lines.Append(i.ToString+'/ '+FormatDateTime('dd/MMM ddd',DataI)+ ' / '+Contador.ToString);

    if (  ((DayOfWeek(DataI) <> 6) or usaSabado ) and ((DayOfWeek(DataI) <> 7) or usaDomingo ) and (not Nao_Util(DataI+1)) ) then
      Inc(Contador);

    Inc(i);
    DataI := DataI + 1;
    Prazo2.pb.Position := Prazo2.pb.Position + 1;
  end;

  if i < 51 then
  begin
    diasUt[i].dia :=  DataI;
    diasUt[i].num :=  -2;
  end;

  Bco := TBco.Create;

  DataI := Prazo2.dt1.DateTime;
  diaBase := 0;
  DecodeDate(DataI, a,m,d);
  DataTMP := EncodeDate(a,m,d);
  while (DataTMP <= DataF) do
  begin
    Bco.Prazo2DiasEntrega_Mostra(DataTMP,tipoProc);
    Prazo2.pb.Max := DM5.cdsPrDia.RecordCount +1;
    Prazo2.pb.Position := 0;
    if (DM5.cdsPrDia.RecordCount > 0) then
    begin
      DM5.cdsPrDia.First;
      while not DM5.cdsPrDia.Eof do
      begin
        diaE := DM5.cdsPrDiaDTENTREGA.Value;

        // Procura
        achei := false;
        i := 0;
        while (i<52) and (not achei) and (diasUt[i].num<>-2) do
        begin
          if FormatDateTime('dd/MM/yyyy',diasUt[i].dia) = FormatDateTime('dd/MM/yyyy',diaE) then
          begin
            Bco.Prazo2DiasEntrega_Altera(DataTMP,diaE, diasUt[i].num-diaBase, tipoProc);
            achei := true;
          end;
          Inc(i);
        end;

        Prazo2.pb.Position := Prazo2.pb.Position + 1;
        DM5.cdsPrDia.Next;
      end;

    end;


    DataTMP := DataTMP + 1;
        // Procura
        achei := false;
        i := 0;
        while (i<52) and (not achei) and (diasUt[i].num<>-2) do
        begin
          if FormatDateTime('dd/MM/yyyy',diasUt[i].dia) = FormatDateTime('dd/MM/yyyy',DataTMP) then
          begin
            diaBase := diasUt[i].num;
            achei := true;
          end;
          Inc(i);
        end;

  end;
  Bco.Destroy;

end;

function CEP_num(sCEP:String):Integer;
  var s,s1 : String;
      i, resp : integer;
begin
  resp := 0;
  if sCEP.Length>0 then
  begin
    s := copy(sCEP, 1, 5);
    s1 := '';
    for I := 1 to 5 do if s[i] in ['0'..'9'] then s1 := s1 + s[i];
    if s1.Length>0 then resp := StrToInt(s1);
  end;

  result := resp;
end;


procedure Exec3_CopiaPrazo();
  var Bco : TBco;
      PadraoCli : Smallint;
      qts, s : String;
      cont, nCep, i : Integer;
      achei : boolean;
      diaTMP : TDateTime;

begin
  Bco := TBco.Create;

  // Passo 1: Prazo = -1 = não feito
  diaTMP := Prazo2.dt1.DateTime;
  while diaTMP <= Prazo2.dt2.DateTime do
  begin
    Bco.Prazo2Copia_Padrao(-9, tipoProc, diaTMP);
    diaTMP := diaTMP + 1;
  end;
  // Passo 2: Mostrar os CEPs das Notas
  Bco.Prazo2Copia_Mostra(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime);

  if DM5.cdsPrCep.RecordCount > 0 then
  begin
    // Passo 3: Lista os Clientes
    Bco.Prazo2Copia_MostraCli(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime);
    qts := DM5.cdsPrCli.RecordCount.ToString;
    cont := 0;
    DM5.cdsPrCli.First;
    while not DM5.cdsPrCli.Eof do
    begin
      cont := cont + 1;
      Prazo2.lbPb.Caption := cont.ToString+'/'+qts;
      Application.ProcessMessages;
      // Passo 4: Faixa de CEP do Cliente
      Bco.PrazosFaixa_Mostrar_Cli(DM5.cdsPrCliLIGCLI.value);
      PadraoCli := DM2.Ultimo('TB_Cliente', 'Prazo', 'id='+DM5.cdsPrCliLIGCLI.AsString );
      if PadraoCli = 0 then PadraoCli:=1;
      // ===== Filtra o Cliente
      DM5.cdsPrCep.Filtered := false;
      DM5.cdsPrCep.Filter := 'Ligcli = ' +  DM5.cdsPrCliLIGCLI.AsString;
      DM5.cdsPrCep.Filtered := true;
      // Passo 5: Lista Faixas do Cliente
      //Bco.PrazosFaixa_Mostrar_Cli(DM5.cdsPrCliLIGCLI.Value);

      Prazo2.pb.Max := DM5.cdsPrCep.RecordCount;
      Prazo2.pb.Position := 0;
      DM5.cdsPrCep.First;
      while not DM5.cdsPrCep.Eof do
      begin
        Prazo2.pb.Position := Prazo2.pb.Position + 1;
        achei := false;
        nCep := CEP_num(DM5.cdsPrCepCEP.Value);
        if (DM5.cdsPr2.RecordCount>0) then
        begin
          DM5.cdsPr2.First;
          while (not DM5.cdsPr2.Eof) and (not achei) do
          begin
            if (nCEP >= DM5.cdsPr2CEPI.Value) and (nCEP <= DM5.cdsPr2CEPF.Value) then
            begin
              achei := true;
              Bco.Prazo2Copia_Nota(DM5.cdsPrCepID.Value, DM5.cdsPr2PRAZO.Value);
            end;
            DM5.cdsPr2.Next;
          end;
        end;
        if not achei then Bco.Prazo2Copia_Nota(DM5.cdsPrCepID.Value, PadraoCli);
        DM5.cdsPrCep.Next;
      end;
      DM5.cdsPrCli.Next;
    end;
  end;

  Bco.Destroy;


end;

procedure Exec4_Tentativas();

var Bco : TBco;

begin
  Bco := TBco.Create;
  //Bco.Prazo2Estat_Notas(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime, clis);
  Bco.Prazo2Estat_Tentativas(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime, ' ');

  DM5.cdsPrTent.First;
  while not DM5.cdsPrTent.Eof do
  begin
    Bco.Prazo2Estat_Tentativas_Gravar(DM5.cdsPrTentNUMNF.Value,  DM5.cdsPrTentLIGCLI.Value, DM5.cdsPrTentNUMOC.Value, DM5.cdsPrTentDT_ROMA.AsDateTime, DM5.cdsPrTentDT_OCOR.AsDateTime);
    DM5.cdsPrTent.Next;
  end;

  Bco.Destroy;

end;

procedure Exec5_Resultado();

var Bco : TBco;
    resp, dias : Integer;
    DU : TDutil;

begin
  Bco := TBco.Create;
  Bco.Prazo2Estat_Notas(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime, clis);

  // Incia Dias uteis
  DU := TDutil.Create;

  DU.set_Datas(Prazo2.dt1.DateTime, Prazo2.dt2.DateTime);
  DU.Incluir_Sabado(Prazo2.ckSabado.Checked);
  DU.Incluir_Domingo(Prazo2.ckDomingo.Checked);

  //
  if DM5.cdsInu.RecordCount>0 then
  begin
    DM5.cdsInu.First;
    while (not DM5.cdsInu.Eof) do
      if  (DM5.cdsInuDIA_INUTIL.Value >= Prazo2.dt1.DateTime) and  (DM5.cdsInuDIA_INUTIL.Value <= Prazo2.dt2.DateTime + 20) then
        DU.Inserir_DiaInutil(DM5.cdsInuDIA_INUTIL.Value);
  end;

  DU.Montar_Sequencia;

  resp := 0;
  DM5.cdsPrE2.First;
  while not DM5.cdsPrE2.Eof do
  begin
    if DM5.cdsPrE2DTENTREGA.Value < Prazo2.dt1.DateTime - 60 then
    begin
      resp := 1;
      if not (DM5.cdsPrE2PRIMSAIDA.Value < Prazo2.dt1.DateTime - 60) then
      begin
        dias := DU.Calcular_EntreDatas(DM5.cdsPrE2DTCRIADA.Value, DM5.cdsPrE2PRIMSAIDA.Value);
        if (DM5.cdsPrE2PRAZO.Value >= dias) and (dias >=0)  then resp := 6;
      end;
    end
    else
    begin
      if DM5.cdsPrE2DTCRIADA.Value > DM5.cdsPrE2DTENTREGA.Value then resp := -1
      else
      begin
        if DM5.cdsPrE2STATUS.Value = 0  then  resp := 1
        else
        begin
          if DM5.cdsPrE2PRAZO.Value >= DM5.cdsPrE2DIASENTREGA.Value then resp := 9
          else
          begin
            dias := DU.Calcular_EntreDatas(DM5.cdsPrE2DTCRIADA.Value, DM5.cdsPrE2PRIMSAIDA.Value);
            if (DM5.cdsPrE2PRAZO.Value >= dias) and (dias >= 0)   then resp := 7
              else resp := 2;
          end;
      end;
      end;
    end;

    Bco.Prazo2Estat_Resultado_Gravar(DM5.cdsPrE2ID.Value, resp);

    DM5.cdsPrE2.Next;
  end;
  DU.Destroy;
  Bco.Destroy;
end;





{ TPrazo2 }

procedure TPrazo2.btadmIClick(Sender: TObject);
begin
  Inuteis.Entrar;
  Inuteis.Show;
end;

procedure Exporta_Excel_Totais();
begin
   // -------------- PLANILHA GERAL
   // Nome do relatório

   planilha.WorkBooks[1].Sheets[1].cells[ 1,2] := 'Flaydel Relatório de Performance TOTAL GERAL';
   planilha.WorkBooks[1].Sheets[1].cells[ 2,2] := 'Período '+FormatDateTime('dd/MMM', Prazo2.dt1.DateTime)+ ' - '+FormatDateTime('dd/MMM', Prazo2.dt2.DateTime);

   planilha.WorkBooks[1].Sheets[1].cells[ 3,2] := 'Notas';
   planilha.WorkBooks[1].Sheets[1].cells[ 3,3] := mNF.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[ 5,2] := 'Entregues';
   planilha.WorkBooks[1].Sheets[1].cells[ 5,3] := mNF1.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[ 6,2] := 'Não Entregues';
   planilha.WorkBooks[1].Sheets[1].cells[ 6,3] := (mNF - mNF1).ToString;

   // DIas

   planilha.WorkBooks[1].Sheets[1].cells[ 3,5] := '24h '; planilha.WorkBooks[1].Sheets[1].cells[ 3,6] := m24.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[ 4,5] := '48h '; planilha.WorkBooks[1].Sheets[1].cells[ 4,6] := m48.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[ 5,5] := '72h '; planilha.WorkBooks[1].Sheets[1].cells[ 5,6] := m72.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[ 6,5] := 'acima'; planilha.WorkBooks[1].Sheets[1].cells[ 6,6] := (mOut).ToString;

   planilha.WorkBooks[1].Sheets[1].cells[ 3,7] := FormatFloat('#,##0.00',m24*100/mNF1);
   planilha.WorkBooks[1].Sheets[1].cells[ 4,7] := FormatFloat('#,##0.00',m48*100/mNF1);
   planilha.WorkBooks[1].Sheets[1].cells[ 5,7] := FormatFloat('#,##0.00',m72*100/mNF1);
   planilha.WorkBooks[1].Sheets[1].cells[ 6,7] := FormatFloat('#,##0.00',(mOut)*100/mNF1);

   // Prazo
   planilha.WorkBooks[1].Sheets[1].cells[ 3,9] := 'No Prazo';      planilha.WorkBooks[1].Sheets[1].cells[ 3,10] := mPrazo.ToString;planilha.WorkBooks[1].Sheets[1].cells[ 3,11] :=  FormatFloat('#,##0.00',mPrazo*100/mNF);
   planilha.WorkBooks[1].Sheets[1].cells[ 4,9] := 'Fora do Prazo'; planilha.WorkBooks[1].Sheets[1].cells[ 4,10] := mFora.ToString;planilha.WorkBooks[1].Sheets[1].cells[ 4,11] :=  FormatFloat('#,##0.00',mFora*100/mNF);

end;

procedure Exporta_Excel(sCliente:String; nPlanilha:Integer);
var linha, coluna, i, local,oc, nPlan : integer;
    ntot : double;
    notaAtual : integer;


var valorcampo : string;
var dt : TDateTime;
    Bco : TBco;

begin
 with Prazo2 do
 begin
   if (nPlanilha=1) then
   begin
     planilha:= CreateoleObject('Excel.Application');
     planilha.WorkBooks.add(1);
     planilha.caption := 'Performance Flaydel';
     planilha.visible := true;
     for I := 1 to JvDBGrid1.SelectedRows.Count + 2 do planilha.WorkBooks[1].Sheets.Add;

   end;

   nPlan := nPlanilha + 1;
  {
   ==============================================
     cabecalhos
   ==============================================
   }

   // -------------- PLANILHA GERAL
   // Nome do relatório
   if (nPlanilha = 1) then planilha.WorkBooks[1].Sheets[1].Name := 'GERAL';

   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 1,2] := 'Flaydel Relatório de Performance '+ copy(sCliente, 1, 25);
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 2,2] := 'Período '+FormatDateTime('dd/MMM', dt1.DateTime)+ ' - '+FormatDateTime('dd/MMM', dt2.DateTime);

   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,2] := 'Notas';
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,3] := nNot.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 5,2] := 'Entregues';
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 5,3] := nNot1.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 6,2] := 'Não Entregues';
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 6,3] := (nNot - nNot1).ToString;

   // DIas

   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,5] := '24h '; planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,6] := nf24.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,5] := '48h '; planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,6] := nf48.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 5,5] := '72h '; planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 5,6] := nf72.ToString;
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 6,5] := 'acima'; planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 6,6] := (nf96+nfout).ToString;

   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,7] := FormatFloat('#,##0.00',nf24*100/nNot1);
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,7] := FormatFloat('#,##0.00',nf48*100/nNot1);
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 5,7] := FormatFloat('#,##0.00',nf72*100/nNot1);
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 6,7] := FormatFloat('#,##0.00',(nf96+nfOut)*100/nNot1);

   // Prazo
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,9] := 'No Prazo';      planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,10] := nfPrazo.ToString;planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 3,11] :=  FormatFloat('#,##0.00',porc1);
   planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,9] := 'Fora do Prazo'; planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,10] := nf_Fora.ToString;planilha.WorkBooks[1].Sheets[1].cells[nPlanilha*7 + 4,11] :=  FormatFloat('#,##0.00',porc2);








   // -------------- PLANILHA DE NOTAS
   // Nome do relatório
   planilha.WorkBooks[1].Sheets[nPlan].Name := copy(sCliente, 1, 25);  (*

                                            *)
   planilha.WorkBooks[1].Sheets[nPlan].cells[1,2] := 'Flaydel Relatório de Performance';
   planilha.WorkBooks[1].Sheets[nPlan].cells[2,2] := 'Período '+FormatDateTime('dd/MMM', dt1.DateTime)+ ' - '+FormatDateTime('dd/MMM', dt2.DateTime);

   planilha.WorkBooks[1].Sheets[nPlan].cells[3,2] := 'Notas';
   planilha.WorkBooks[1].Sheets[nPlan].cells[3,3] := nNot.ToString;
   planilha.WorkBooks[1].Sheets[nPlan].cells[4,2] := 'Entregues';
   planilha.WorkBooks[1].Sheets[nPlan].cells[4,3] := nNot1.ToString;
   planilha.WorkBooks[1].Sheets[nPlan].cells[5,2] := 'Não Entregues';
   planilha.WorkBooks[1].Sheets[nPlan].cells[5,3] := (nNot - nNot1).ToString;

   // DIas
   planilha.WorkBooks[1].Sheets[nPlan].cells[3,5] := '24h '; planilha.WorkBooks[1].Sheets[nPlan].cells[3,6] := nf24.ToString;
   planilha.WorkBooks[1].Sheets[nPlan].cells[4,5] := '48h '; planilha.WorkBooks[1].Sheets[nPlan].cells[4,6] := nf48.ToString;
   planilha.WorkBooks[1].Sheets[nPlan].cells[5,5] := '72h '; planilha.WorkBooks[1].Sheets[nPlan].cells[5,6] := nf72.ToString;
   planilha.WorkBooks[1].Sheets[nPlan].cells[6,5] := 'acima'; planilha.WorkBooks[1].Sheets[nPlan].cells[6,6] := (nf96+nfout).ToString;

   // Prazo
   planilha.WorkBooks[1].Sheets[nPlan].cells[3,12] := 'No Prazo';      planilha.WorkBooks[1].Sheets[nPlan].cells[3,13] := nfPrazo.ToString;planilha.WorkBooks[1].Sheets[nPlan].cells[3,14] :=  FormatFloat('#,##0.0', porc1);
   planilha.WorkBooks[1].Sheets[nPlan].cells[4,12] := 'Fora do Prazo'; planilha.WorkBooks[1].Sheets[nPlan].cells[4,13] := nf_Fora.ToString;planilha.WorkBooks[1].Sheets[nPlan].cells[4,14] :=  FormatFloat('#,##0.0', porc2);





   // Títulos
   {
   for coluna := 0 to JvDBGrid1.Columns.Count - 1 do
   begin
     valorCampo := JvDBGrid1.Columns.Items[coluna].DisplayName;
     planilha.WorkBooks[1].Sheets[nPlan].cells[1,coluna+1] := valorcampo;
   end;
   }
   coluna := 1;
   linha := 7;

   //planilha.WorkBooks[1].Sheets[nPlan].Name := sCliente;
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna] := 'Cód';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+1] := 'Cliente';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+2] := 'Nota Fiscal';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+3] := 'CEP';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+4] := 'Data Início';

   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+5] := 'Data Entrega';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+6] := 'Dias';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+7] := 'Situação';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8] := 'Forma de Entrega';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+9] := 'Prazo';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10] := 'Local';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11] := 'Ocorrência';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12] := '1a Tentativa';
   //planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+13] := '1o OCOREN';
   planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+13] := '1o OCOREN Descr';
   //planilha.WorkBooks[1].Sheets[nPlan].cells[1,coluna+21] := '';

  {
   ==============================================
     DADOS
   ==============================================
   }
   Bco := TBco.Create;
   //Bco.Prazo2Estat_Notas(dt1.DateTime, dt2.DateTime, clis);
   Bco.Prazo2Estat_Notasf(clis);
   Bco.Destroy;


   // Dados
   DM5.cdsPrE2.First;
   if DM5.cdsPrE2.RecordCount > 0 then
   begin
     notaAtual := 0;
     while not DM5.cdsPrE2.Eof do
     begin
       if (DM5.cdsPrE2NUMNOTA.Value <> notaAtual) then
       begin
          notaAtual := DM5.cdsPrE2NUMNOTA.Value;

          linha := linha + 1;
          // -- Código (id do Cliente)
          valorcampo := DM5.cdsPrE2LIGCLI.AsString;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna] :=  valorCampo;

          // -- Nome do Cliente)
          valorcampo := DM5.cdsPrE2NOME.Value;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+1] :=  valorCampo;

         // -- Valor da NF
          valorcampo := DM5.cdsPrE2NUMNOTA.AsString;
          //if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+2] :=  valorCampo;

          // -- CEP
          valorcampo := DM5.cdsPrE2CEP.Value;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+3] :=  valorCampo;

          // -- Data Inicio
          dt := DM5.cdsPrE2DTCRIADA.Value;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+4] :=  dt;

          // Classificação
            case DM5.cdsPrE2PRAZORESP.Value of
             -1: valorcampo := 'ERRO nos DADOS';
              0: valorcampo := 'sem Análise';
              1: valorcampo := 'Não Entregue';
              2: valorcampo := 'Fora do Prazo';
              3: valorcampo := 'Fora do Prazo, 1a Tentativa';
              4: valorcampo := 'Fora do Prazo, 1o OCOREN';
              6: valorcampo := '1a Tentativa no Prazo';
              7: valorcampo := 'Entregue no Prazo, 1a Tentativa';
              //6: valorcampo := 'Entregue no Prazo, 1o OCOREN';
              9: valorcampo := 'Entregue no Prazo';
            end;
            //valorcampo := valorcampo + DM5.cdsPrE2PRAZORESP.AsString;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8] :=  valorCampo;

           // Classificação *** CORES  ***
           if DM5.cdsPrE2PRAZORESP.Value=9 then
                planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8].Font.Color := clGray;
            if DM5.cdsPrE2PRAZORESP.Value=7 then
            begin
                planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8].Font.Color := clNavy;
                planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12].Font.Color := clNavy;
            end;
           if DM5.cdsPrE2PRAZORESP.Value=6 then
           begin
                planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8].Font.Color := clGreen;
                planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12].Font.Color := clGreen;
           end;
           if DM5.cdsPrE2PRAZORESP.Value=-1 then planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8].Font.Color := clRed;


          if (DM5.cdsPrE2STATUS.Value = 1) then
          begin
            // -- Data Entrega
            dt := DM5.cdsPrE2DTENTREGA.Value;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+5] :=  dt;

            // -- Dias para Entrega
            valorcampo := DM5.cdsPrE2DIASENTREGA.AsString;
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+6] :=  valorCampo;

            // -- Situação
            valorcampo := 'Entregue';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+7] :=  valorCampo;

            // -- No Prazo
            {
            if DM5.cdsPrE2PRAZO.Value >= DM5.cdsPrE2DIASENTREGA.Value then
              valorcampo := 'Ok' else valorcampo := 'FORA';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+8] :=  valorCampo;
            }

            // -- ERRO
            if DM5.cdsPrE2DIASENTREGA.Value < 0 then
              valorcampo := 'ERRO: Negativo. Dias para Entrega' else valorcampo := '-';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10] :=  valorCampo;

          end
          else
          begin
            // -- Situação
            valorcampo := 'NÃO Entregue';
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+7] :=  valorCampo;
          end;

          // -- (Prazo do Cliente)
          valorcampo := DM5.cdsPrE2PRAZO.AsString;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+9] :=  valorCampo;

          // -- TipoLocal = 0 SP, TipoLocal =1 GSP, TipoLocal > 1 Interior
          local := DM5.cdsPrE2TIPOLOCAL.Value;
          if (local = 0)  then valorcampo := 'SP';
          if (local = 1)  then valorcampo := 'GSP';
          if (local >= 2)  then valorcampo := 'Interior';
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+10] :=  valorCampo;


      // -- Ocorrência
         valorcampo := DescreveOC(  DM5.cdsPrE2NOCOR.Value);
         planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11] :=  valorcampo;
          {
          oc := DM5.cdsPrE2NOCORR.Value;
          valorcampo := ' - x - ';
          if oc = 1 then valorcampo := 'Entrega Realizada Normalmente';
          if oc > 1 then
          begin
            Bco := Tbco.Create;
            valorcampo := Bco.Ocorrencia_Traduz(1, oc);
            Bco.Destroy;
          end;
          planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+11] :=  valorCampo;
          }

          // 1a Tentativa
          dt := DM5.cdsPrE2PRIMSAIDA.Value;
          if (dt>dt1.DateTime) then
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+12] :=  dt;

          // 1a Ocorrência
          if (DM5.cdsPrE2PRAZORESP.Value<9) then
          begin
            valorcampo := DescreveOC(  DM5.cdsPrE2OC_PRIM.Value);
            planilha.WorkBooks[1].Sheets[nPlan].cells[linha,coluna+13] :=  valorcampo;
          end;
       end;

       DM5.cdsPrE2.Next;
     end;
   end;
   planilha.WorkBooks[1].Sheets[nPlan].columns.Autofit;

   planilha.WorkBooks[1].Sheets[nPlan].Columns[6].Font.Color := clred;
   planilha.WorkBooks[1].Sheets[nPlan].Columns[7].Font.Color := clGreen;
   planilha.WorkBooks[1].Sheets[nPlan].Columns[7].Interior.Color := clYellow;
   planilha.WorkBooks[1].Sheets[nPlan].Columns[10].Interior.Color := clYellow;
   planilha.WorkBooks[1].Sheets[nPlan].Columns[3].Font.Bold  := True;


   planilha.WorkBooks[1].Sheets[nPlan].Cells[5,6].Font.Color := clBlack;


   // Format o Titulo
   planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Bold  := True;
   planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Color := clNavy;
   planilha.WorkBooks[1].Sheets[nPlan].Cells[1,2].Font.Size := 12;
   planilha.WorkBooks[1].Sheets[nPlan].Cells[2,2].Font.Color := clgreen;

   // Formata os cabeçalhos
   for i:=1 to 6 do
   begin
     planilha.WorkBooks[1].Sheets[nPlan].Cells[i,7].Interior.Color := clwhite;
     planilha.WorkBooks[1].Sheets[nPlan].Cells[i,10].Interior.Color := clWhite;
   end;

   for i:=1 to 15 do
   begin
     planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Font.Bold  := True;
     planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Font.Color := clNavy;
     planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Interior.Color := clYellow;
   end;

    for i:=7 to 10 do
   begin
     planilha.WorkBooks[1].Sheets[nPlan].Cells[7,i].Interior.Color := clLime;
   end;

   // formata Geral

 end;

end;

procedure Totaliza(ligcli:Integer);
   var Bco : TBco;
       i : integer;
       nfAnt : Integer;
       repete : Integer;

begin
  with Prazo2 do
  begin
    if ligcli=0  then
    begin
      // clis = lista SQL dos clientes selecionados
      clis := ' and (';
      with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        if i > 0 then clis := clis + '  or TB_NFUNICA.ligcli = '+DM5.cdsPrE1LIGCLI.AsString+ ' '
          else  clis := clis + ' TB_NFUNICA.ligcli = '+DM5.cdsPrE1LIGCLI.AsString;
      end;
      clis := clis + ' ) ';
    end
      else  clis := ' and ( TB_NFUNICA.ligcli = '+ligcli.ToString+ ' ) ';


    Bco := TBco.Create;
      if  (not DM5.cdsPrE2.Active) or (LigCli=0) then Bco.Prazo2Estat_Notas(Prazo2.dt1.Date, Prazo2.dt2.Date, clis);
      if  DM5.cdsPrE2.RecordCount>0 then Bco.Prazo2Estat_Notasf(clis);
    Bco.Destroy;

    nf24 := 0;
    nf48 := 0;
    nf72 := 0;
    nf96 := 0;
    nfout:= 0;
    nfPrazo := 0;
    nf_fora := 0;
    repete := 0;
    nfAnt := 0;

    // Mostra no Clientes, Notas e notas Entregues
    nNot := DM2.Conta('TB_NFUNICA', 'dtcriada >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1.DateTime))+' and dtcriada <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2.DateTime))+' and (status<>11) '+Clis   );
    nNot1 := DM2.Conta('TB_NFUNICA', 'dtcriada >= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt1.DateTime))+' and dtcriada <= '+QuotedStr(FormatDateTime('yyyy-MM-dd',dt2.DateTime))+' and (status=1) '+clis   );

    if DM5.cdsPrE2.RecordCount > 0 then
    begin
      nfAnt := 0;
      DM5.cdsPrE2.First;
      while not DM5.cdsPrE2.Eof do
      begin
        if (DM5.cdsPrE2NUMNOTA.Value <> nfAnt) then
        begin
          if (DM5.cdsPrE2DIASENTREGA.Value = 0) or (DM5.cdsPrE2DIASENTREGA.Value = 1) then nf24 := nf24 + 1;
          if (DM5.cdsPrE2DIASENTREGA.Value = 2) then nf48 := nf48 + 1;
          if (DM5.cdsPrE2DIASENTREGA.Value = 3) then nf72 := nf72 + 1;
          if (DM5.cdsPrE2DIASENTREGA.Value > 3) then nfout := nfout + 1;
          if (DM5.cdsPrE2PRAZORESP.Value > 5) then nfPrazo := nfPrazo + 1
            else nf_fora := nf_fora + 1;
        end;
        nfAnt := DM5.cdsPrE2NUMNOTA.Value;
        DM5.cdsPrE2.Next;
      end;
    end;

    porc1 := nfPrazo*100/nNot;
    porc2 := nf_Fora *100/nNot;

    // Totaliza
    mNF := mNF + nNot;  mNF1 := mNF1 + nNot1;
    m24 := m24 + nf24;  m48 := m48 + nf48;    m72 := m72 + nf72;  mOut := mOut + nf96 + nfout;
    mPrazo := mPrazo + nfPrazo;    mFora := mFora + nf_Fora;

  end;
end;

procedure TPrazo2.btExcelClick(Sender: TObject);
  var i, idCli, nFim : Integer;
      bFim : boolean;

begin
  if (ckJunto.Checked) or (JvDBGrid1.SelectedRows.Count=1) then Exporta_Excel('Vários',1)
  else
  begin
    mNf:=0; mNf1:=0; m24:=0; m48:=0; m72:=0; mOut:=0; mPrazo:=0; mFora := 0;
    with JvDBGrid1.DataSource.DataSet do
    for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
    begin
      GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
      idCli := DM5.cdsPrE1LIGCLI.Value;
      Totaliza(idCli);
      Exporta_Excel(DM5.cdsPrE1NOME.Value,i+1);
    end;
    Exporta_Excel_Totais;

  end;
  //planilha.quit;
  ShowMessage('Exportação para o Excel terminada');
end;

procedure TPrazo2.btGeraClick(Sender: TObject);
var
    i : Integer;

    bco : tBco;

begin
  lbGeral.Caption := 'Aguarde ...';
  lbPordia.Caption:= '';
  lbOk.Caption    := '';
  Application.ProcessMessages;

  if DM5.cdsPrE1.RecordCount >0 then
  if (JvDbGrid1.SelectedRows.Count> 0) then
  begin
    Totaliza(0);

    lbGeral.Caption := 'Notas: '+nNot.ToString;
    lbPorDia.Caption := 'Notas no Prazo: '+nfPrazo.ToString+'  ('+FormatFloat('#,##0.0', porc1)+')';
    lbOk.Caption := 'Fora do Prazo: '+nf_Fora.ToString+'  ('+FormatFloat('#,##0.0', porc2)+')';

  end
  else ShowMessage('Selecione alguns Clientes');


end;

procedure TPrazo2.btMostraClick(Sender: TObject);

begin
  Mostrar_NFs;
end;

procedure TPrazo2.btProcNaoClick(Sender: TObject);

  var Bco : TBco;
      qt : Integer;

begin
  Limpar;
  botoes(false);
  nProc := 1;
  tipoProc := 2;
  Dig.Value := 5;

  Bco := TBco.Create;
  qt := Bco.Prazo2DTentregaQT(dt1.DateTime, dt2.DateTime, tipoProc);
  Bco.Destroy;
  if (qt>0) then
  begin
    TimerProc.Enabled := true;
    lbEntrega.Caption := 'Selecionando a Data de Entrega [Iniciando...]';
    lbEntrega.Font.Color := clGreen;

  end
    else ShowMessage('Não há Registros sem Cálculos');

end;

procedure TPrazo2.btProcTodosClick(Sender: TObject);
 var Bco : TBco;
      qt : Integer;

begin
  Limpar;
  botoes(false);
  nProc := 1;
  tipoProc := 1;
  Dig.Value := 5;

  Bco := TBco.Create;
  qt := Bco.Prazo2DTentregaQT(dt1.DateTime, dt2.DateTime, tipoProc);
  Bco.Destroy;
  if (qt>0) then
  begin
    TimerProc.Enabled := true;
    lbEntrega.Caption := 'Selecionando a Data de Entrega [Iniciando...]';
    lbEntrega.Font.Color := clGreen;

  end
    else ShowMessage('Não há Registros nas datas selecionadas');


end;

procedure TPrazo2.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime;
end;

procedure TPrazo2.Entrar;
  var Bco : TBco;
begin
  Iniciar;
  dt2.DateTime := Now;
  dt1.DateTime := Now - 14;
  TimerProc.Enabled := False;

  Bco := TBco.Create;
  Bco.Ocorre_Mostra;
  Bco.Destroy;

end;

procedure TPrazo2.SpeedButton1Click(Sender: TObject);
  var d : Integer;
      notaAtual : Integer;
      Bco : TBco;

begin
  //d := CalcDias(dt1.DateTime, dt2.DateTime, ckSabado.Checked, ckDomingo.Checked);
  //Prazo2.Memo1.Lines.Append(' dias ' + d.ToString);

   Bco := TBco.Create;
   Bco.Prazo2DiasEntregaQT(dt1.DateTime, dt2.DateTime, 1);


   // Dados
   DM2.cdsTMP.First;
   if DM2.cdsTMP.RecordCount > 0 then
   begin
     notaAtual := 0;
     while not DM2.cdsTMP.Eof do
     begin
       if ( DM2.cdsTMP.Fields[2].AsInteger = notaAtual) then
       begin
         Bco.Notas_Unica_Apagar(DM2.cdsTMP.Fields[0].AsInteger);
       end;
       notaAtual := DM2.cdsTMP.Fields[2].AsInteger;
       DM2.cdsTMP.Next;
     end;
   end;
   Bco.Destroy;

   ShowMessage('Terminou!');

end;

procedure TPrazo2.TimerProcTimer(Sender: TObject);
begin
  if (dig.value > 0) then Dig.Value := Dig.Value - 1;
  if Dig.Value = 0  then
  begin
    if nproc = 1 then
    begin
      lbEntrega.Caption := 'Selecionando a Data de Entrega [Executando...]';
      lbEntrega.Font.Color := clRed;
      Application.ProcessMessages;

      Exec1_DTentrega;

      Dig.Value := 5;
      lbEntrega.Caption := 'Selecionando a Data de Entrega [Feito]';
      lbEntrega.Font.Color := clGray;

      lbDias.Caption := 'Calculando Dias para Entrega [Iniciando...]';
      lbDias.Font.Color := clGreen;
      Application.ProcessMessages;


    end;

    if nproc = 2 then
    begin
      lbDias.Caption := 'Calculando Dias para Entrega [Executando...]';
      lbDias.Font.Color := clRed;
      Application.ProcessMessages;

      Exec2_CalcDias(ckSabado.Checked, ckDomingo.Checked);

      lbDias.Caption := 'Calculando Dias para Entrega [Feito]';
      lbDias.Font.Color := clGray;

      lbPrazo.Caption := 'Copiando o prazo [Iniciando...]';
      lbPrazo.Font.Color := clGreen;
      Application.ProcessMessages;

      Dig.Value := 5;
    end;

    if nproc = 3 then
    begin
      lbPrazo.Caption := 'Copiando o prazo [Executando...]';
      lbPrazo.Font.Color := clRed;
      Application.ProcessMessages;

      Exec3_CopiaPrazo;

      lbPrazo.Caption := 'Copiando o prazo [Feito]';
      lbPrazo.Font.Color := clGray;
      Application.ProcessMessages;

      Dig.Value := 5;
    end;

   if nproc = 4 then
    begin
      lbFinal.Caption := 'verificando 1a Tentativa [Executando...]';
      lbFinal.Font.Color := clRed;
      Application.ProcessMessages;

      Exec4_Tentativas;


      lbFinal.Caption := 'Produzindo o Resultado [Executando...]';
      Application.ProcessMessages;
      Exec5_Resultado;

      lbFinal.Caption := 'Produzindo o Resultado [Feito]';
      lbFinal.Font.Color := clGray;
      Application.ProcessMessages;

      Dig.Value := 5;
      TimerProc.Enabled := false;
      botoes(true);
      ShowMessage('Processos Finalizados');
      Mostrar_NFs;
    end;

    nProc := nProc + 1;

  end;
end;

end.
