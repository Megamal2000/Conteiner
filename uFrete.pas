unit uFrete;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ComCtrls, Vcl.StdCtrls,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid,
  Vcl.ExtCtrls, Vcl.Buttons, JvComponentBase, JvThread, JvExControls,
  JvAnimatedImage, JvGIFCtrl;

type
  TFrete = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    JvDataSource1: TJvDataSource;
    Label2: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    PageControl1: TPageControl;
    tsResumo: TTabSheet;
    tsNotasOk: TTabSheet;
    tsExporta: TTabSheet;
    btExecuta: TBitBtn;
    StaticText1: TStaticText;
    Panel4: TPanel;
    lbTit: TLabel;
    lbRes: TLabel;
    btResumo: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    JvDBGrid3: TJvDBGrid;
    JvDBGrid4: TJvDBGrid;
    JvDataSource3: TJvDataSource;
    JvDBGrid5: TJvDBGrid;
    Panel5: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edDesc: TEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    rbJuntos: TRadioButton;
    rbSeparados: TRadioButton;
    Label6: TLabel;
    lbqtSel: TLabel;
    StaticText2: TStaticText;
    rbPlanilhas: TRadioButton;
    btExcel: TBitBtn;
    StaticText3: TStaticText;
    pb: TProgressBar;
    StaticText4: TStaticText;
    procedure btExecutaClick(Sender: TObject);
    procedure btResumoClick(Sender: TObject);
    procedure JvDBGrid3CellClick(Column: TColumn);
    procedure dt1Change(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Frete: TFrete;

implementation

{$R *.dfm}

uses uDM2, uDM5, uBanco, uExcelComp;

{ TFrete }


procedure Resumo(dta, dtb:TDateTime);

var Bco: TBco;
    nDias, nClientes, nNotas  : Integer;
    vTotal, vMedio, vNFdia : Double;

begin
  with Frete do
  begin
    nDIas := 0; nClientes := 0; nNotas := 0; vTotal := 0; vMedio := 0;

    Bco := TBco.Create;
    Bco.FreteCOB_MostraDias(dta, dtb);
    Bco.FreteCOB_MostraClientes(dta, dtb);
    Bco.FreteCOB_MostraNotas(dta, dtb);
    Bco.FreteCOB_fMostraNFcli(0);
    Bco.Destroy;

    lbTit.Caption := 'Resumo de '+FormatDateTime('dd/MM/yy', dta)+' até '+FormatDateTime('dd/MM/yy', dtb);

    DM5.cdsFrtDia.First;
    while not DM5.cdsFrtDia.Eof  do
    begin
      nDias := nDias + 1;
      vTotal := vTotal + DM5.cdsFrtDiaVALORES.AsFloat;
      nNotas := nNotas + DM5.cdsFrtDiaNOTAS.Value;
      DM5.cdsFrtDia.Next;
    end;
    nClientes := DM5.cdsFrtCli.RecordCount;
    vMedio := vTotal / nDias;
    vNFdia := nNotas / nDias;

    lbRes.Caption := 'Nenhuma Nota Encontrada';
    if nDias > 0 then lbRes.Caption := 'Notas: '+nNotas.ToString+'   .. Dias: '+nDias.ToString+'   .. Clientes: '+nClientes.ToString+' .. Frete Período: '+ FormatFloat('#,##0.00',vTotal)+' .. Notas por dia: '+FormatFloat('#,##0.00',vNFdia)+' .. Valor Médio por dia: '+FormatFloat('#,##0.00',vMedio);
  end;
end;

function Sem_Especiais(texto:String):String;
   var resp , s: String;
       i : Integer;
begin
  resp := '';
  s := TRIM(texto);
  for i := 1 to Length(s) do
  begin
    if (s[i] in ['0'..'9', 'a'..'z','A'..'Z']) then resp := resp + s[i]
      else resp := resp + '_';
  end;
  Result := resp;
end;

function Estimado(): String;
  var i, qt, t : Integer;
      resp : String;

begin
  resp := '';
  qt := 0;
  with Frete do
  with JvDBGrid5.DataSource.DataSet do
    for i:=0 to JvDBGrid5.SelectedRows.Count-1 do
       begin
         GotoBookmark(JvDBGrid5.SelectedRows.Items[i]);
         qt := qt +  DM5.cdsFrtCliNOTAS.AsInteger;
       end;
   // usando 200 notas por minuto
   t := (qt div 200) + 1;
  resp := '. Tempo Estimado: '+t.ToString+ ' min para '+ qt.ToString+' notas.';
  Result := resp;
end;

procedure TFrete.btExcelClick(Sender: TObject);
  var plan : TXLS;
      qt,i, lin : Integer;
      Bco : TBco;
      Tempo : TDateTime;

begin
  Tempo := Now;
  StaticText3.Caption := '';
  StaticText4.Caption := 'Iniciando em '+FormatDateTime('HH mm ss', Tempo)+Estimado;


  Bco := TBco.Create;
  Bco.Notas_MostraDatas(dt1.DateTime, dt2.DateTime);
  Bco.FreteCOB_Cte(dt1.DateTime, dt2.DateTime);
  Bco.Destroy;

  pb.Min := 0;
  pb.Max := JvDBGrid5.SelectedRows.Count;
  pb.Position := 0;
  plan := TXLS.Create;
  qt := JvDBGrid5.SelectedRows.Count;
  if rbJuntos.Checked then plan.set_Tipo(modUmaPlanilha);
  if rbSeparados.Checked then plan.set_Tipo(modVariosArquivos);
  if rbPlanilhas.Checked then plan.set_Tipo(modVariasPlanilhas);
  plan.set_Varios(qt);
  plan.set_DescricaoArquivo(Sem_Especiais(edDesc.Text));


  // ======================================== UMA UNICA PLANILHA
  if rbJuntos.Checked then
  begin
    StaticText3.Caption := DM5.cdsFrtCliNome.AsString;

    plan.Inicio;
    plan.set_Planilha(1);
    plan.Cabecalho();
    lin := 2;
    with JvDBGrid5.DataSource.DataSet do
      for i:=0 to JvDBGrid5.SelectedRows.Count-1 do
         begin
           GotoBookmark(JvDBGrid5.SelectedRows.Items[i]);
           pb.Position := i + 1;
           StaticText3.Caption :=  DM5.cdsFrtCliNome.Value;
           Application.ProcessMessages;

           plan.DadosCliente(DM5.cdsFrtCliLIGCLI.Value,lin );
           lin := plan.get_linha;
         end;
     plan.set_NomeCliente('Varios_Clientes1');
     plan.Finais();
     plan.Fechar;
  end;

  // ======================================== V A R I A S PLANILHAS
  if rbPlanilhas.Checked then
  begin
    StaticText3.Caption := DM5.cdsFrtCliNome.AsString;

    plan.Inicio;
    lin := 2;
    with JvDBGrid5.DataSource.DataSet do
      for i:=0 to JvDBGrid5.SelectedRows.Count-1 do
         begin
           GotoBookmark(JvDBGrid5.SelectedRows.Items[i]);
           pb.Position := i + 1;
           StaticText3.Caption :=  DM5.cdsFrtCliNome.Value;
           Application.ProcessMessages;
           plan.set_Planilha(i+1);
           plan.set_NomeCliente(Sem_Especiais(DM5.cdsFrtCliNome.AsString));
           plan.Cabecalho;
           plan.DadosCliente(DM5.cdsFrtCliLIGCLI.Value,lin );
           plan.Finais;
         end;
     plan.set_NomeCliente('Varios Clientes2');
     plan.Fechar;

     StaticText3.Caption :=  '*** FINALIZADO ***';
  end;


  // ======================================== V A R I A S PLANILHAS
  if rbSeparados.Checked then
  begin
    StaticText3.Caption := DM5.cdsFrtCliNome.AsString;

    lin := 2;
    with JvDBGrid5.DataSource.DataSet do
      for i:=0 to JvDBGrid5.SelectedRows.Count-1 do
         begin
           GotoBookmark(JvDBGrid5.SelectedRows.Items[i]);
           pb.Position := i + 1;
           StaticText3.Caption :=  DM5.cdsFrtCliNome.Value;
           Application.ProcessMessages;

           plan.Inicio;
           plan.set_Planilha(1);
           plan.set_NomeCliente(Sem_Especiais(DM5.cdsFrtCliNome.AsString));
           plan.Cabecalho;
           plan.DadosCliente(DM5.cdsFrtCliLIGCLI.Value,lin );
           plan.Finais;
           plan.Fechar;

         end;
  end;


   Tempo := Tempo - Now;
   StaticText3.Caption :=  '*** FINALIZADO *** Tempo: '+ FormatDateTime('H mm ss', Tempo);


  plan.Destroy;
end;

procedure TFrete.btExecutaClick(Sender: TObject);

  var Bco : TBco;
      Tempo : TDateTime;
  //var proc1 : Tth1;
  //    proc2 : Tth1;

begin
  {
  JvGIFAnimator1.Visible := true;

  proc1 := Tth1.Create(true);
  proc1.Chamar(1);
  proc1.FreeOnTerminate := true;
  proc1.Start;
  }

  Tempo := Now;
  StaticText2.Caption := FormatDateTime('HH:mm', tempo);
  PageControl1.TabIndex := 0;

  Bco := TBco.Create;
  StaticText1.Caption := '1/3 '+FormatDateTime('HH:mm', tempo)+' Iniciando ...';
  sleep(3000);
  Application.ProcessMessages;

  Bco.FreteCOB_Inicia(dt1.DateTime, dt2.DateTime);
  StaticText1.Caption :=  '2/3 '+FormatDateTime('H mm:ss', Now - tempo).Replace('0 ', '') +' Serviço ... '  ;
  sleep(3000);
  Application.ProcessMessages;

  Bco.FreteCOB_Servico;
  StaticText1.Caption := '3/3 '+FormatDateTime('H mm:ss', Now - tempo).Replace('0 ', '')+' Totalizando... ';
  sleep(3000);
  Application.ProcessMessages;

  Bco.FreteCOB_Total;
  StaticText1.Caption := 'Finalizado em ' + FormatDateTime('H mm:ss', Now - tempo).Replace('0 ', '');
  Bco.Destroy;

  Resumo(dt1.DateTime, dt2.DateTime);



  {
  proc2 := Tth1.Create(true);
  proc2.Chamar(2);
  proc2.FreeOnTerminate := true;
  proc2.Start;
  }
  //proc1.Terminate;
  //proc2.Terminate;


end;

procedure TFrete.btResumoClick(Sender: TObject);
begin
  Resumo(dt1.DateTime, dt2.DateTime);
end;

procedure TFrete.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 15;
end;

procedure TFrete.Entrar;
begin

  dt1.DateTime := Now - 15;
  dt2.DateTime := Now;

  StaticText1.Caption := '';
  StaticText2.Caption := '';
  StaticText3.Caption := '';
  StaticText4.Caption := '';

  PageControl1.ActivePage := tsResumo;
end;

procedure TFrete.JvDBGrid3CellClick(Column: TColumn);
var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.FreteCOB_fMostraNFcli(DM5.cdsFrtCliLIGCLI.Value);
  Bco.Destroy;

  lbqtSel.Caption := JvDBGrid5.SelectedRows.Count.ToString;
end;

end.
