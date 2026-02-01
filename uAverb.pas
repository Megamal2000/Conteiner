unit uAverb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl, DBCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, Mask, JvExMask, JvSpin, uAverbacao, DB, JvDataSource,
  JvExDBGrids, JvDBGrid, JvExStdCtrls, JvEdit, JvValidateEdit,
  JvMemoryDataset, JvToolEdit;

type
  TAverb = class(TForm)
    PageControl1: TPageControl;
    tb1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    Label15: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Cbmes: TComboBox;
    EdDesc: TEdit;
    BtCriar: TButton;
    btEscolhe: TBitBtn;
    ListaN: TComboBox;
    tb2: TTabSheet;
    BtMostrar: TButton;
    tb3: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btAnalise: TButton;
    tb4: TTabSheet;
    Label9: TLabel;
    Bevel2: TBevel;
    Label10: TLabel;
    Label14: TLabel;
    btExcel: TBitBtn;
    FileListBox1: TFileListBox;
    Barra: TProgressBar;
    tb5: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit2: TEdit;
    Memo1: TMemo;
    btEnvia: TButton;
    nAno: TJvSpinEdit;
    btMes: TSpeedButton;
    Shape1: TShape;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    pb: TProgressBar;
    lbDesc: TLabel;
    lbTot: TLabel;
    vVirtual: TJvValidateEdit;
    Shape2: TShape;
    pb2: TProgressBar;
    lbDesc2: TLabel;
    lbFinal: TStaticText;
    Tab: TJvMemoryData;
    TabidM: TIntegerField;
    TabVlrOut: TFloatField;
    TabMin2: TJvMemoryData;
    TabMin2num: TIntegerField;
    TabMin2numR: TIntegerField;
    TabMin2nome: TStringField;
    TabMin2CPF: TStringField;
    TabMin2Placa: TStringField;
    TabMin2Minuta: TIntegerField;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    tb6: TTabSheet;
    rbCSV: TRadioButton;
    rbESP: TRadioButton;
    btCriar2: TBitBtn;
    Label16: TLabel;
    Pasta: TJvDirectoryEdit;
    lbresp: TLabel;
    pbCSV: TProgressBar;
    TabMin2CodLib: TStringField;
    procedure btMesClick(Sender: TObject);
    procedure BtCriarClick(Sender: TObject);
    procedure BtMostrarClick(Sender: TObject);
    procedure btEscolheClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btAnaliseClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure btCriar2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Averb: TAverb;
  Avb : TAvb;
  idAv : integer;

implementation

uses DateUtils, uDM4, uDM2, Math, ComObj, uLib;

 {$R *.dfm}


Procedure DiasDoMes(szMes,szAno : word);
// Retorna o Ultimo dia do mes de uma determinada
// data
var  d,m,a : Word;
     dt    : TDateTime;
begin
  //Passa valores
  m := szMes;
  a := szAno;

  //Primeiro Dia
  dt := EncodeDate(a,m,1);
  Averb.dt1.DateTime := dt;

  //Ultimo Dia
  Inc(m);
  if m = 13 then
  begin
    m := 1;
    a := a + 1;
  end;
  dt := EncodeDate(a,m,1);
  dt := dt - 1;
  Averb.Dt2.DateTime := dt;
end;

Function Cria_Descr : String;

var S : String;

begin
  S := FormatDateTime('yyyy mm mmmm', Averb.dt1.DateTime);
  Cria_Descr := S;
end;

procedure TAverb.btMesClick(Sender: TObject);
begin
  DiasDoMes(Cbmes.ItemIndex+1, nAno.AsInteger);
  EdDesc.Text := Cria_Descr;
end;

procedure Mostrar();
begin
  Avb := TAvb.Create;
  Avb.Averb_MostraTodos;
  Avb.Destroy;

  if (DM4.cdsAv1.RecordCount > 0) then
  begin
    idAv := DM4.cdsAv1ID.Value;
    Averb.lbDesc.Caption := DM4.cdsAv1DESCR.Value;
    Averb.lbTot.Caption  := FormatFloat('#,##0.00',DM4.cdsAv1TOTAL.AsFloat);
    Averb.lbDesc2.Caption := DM4.cdsAv1DESCR.Value;
  end;
end;


procedure TAverb.BtCriarClick(Sender: TObject);

var mTot : Double;
    mQt  : Integer;

begin
 if (EdDesc.Text <> '') then
 begin
   Avb := TAvb.Create;
   idAv := Avb.Averb_Insere(EdDesc.Text, 0, 0);
   Avb.Minutas_Lista(dt1.DateTime,dt2.DateTime);
   Avb.Minutas_Complemento(dt1.DateTime,dt2.DateTime);
   Avb.Destroy;

   mTot := 0;
   mqt  := 0;
   pb.Min := 0;
   pb.Max := DM4.cdsMin.RecordCount;
   pb.Visible := true;

   DM4.cdsMin.First;
   while not DM4.cdsMin.Eof do
   begin
     // insere as Minutas
     Avb := TAvb.Create;
     Avb.Item_Insere(DM4.cdsMinDTROMA.Value, DM4.cdsMinMINUTA.Value, DM4.cdsMinTOTAL.AsFloat,DM4.cdsMinTOTAL.AsFloat,0,idAv);
     Avb.Destroy;

     mTot := mTot + DM4.cdsMinTOTAL.AsFloat;
     mQt  := mQt  + 1;
     pb.Position := mQt;
     DM4.cdsMin.Next;
   end;

   Avb := TAvb.Create;
   Avb.Averb_Altera(idAv, EdDesc.Text, mTot, mQt);
   Avb.Destroy;

   pb.Visible := false;

   Mostrar;
   PageControl1.TabIndex := 1;
 end
 else ShowMessage('Preencha a descrição!');

end;

procedure TAverb.BtMostrarClick(Sender: TObject);
begin
  Mostrar;
end;

procedure TAverb.btEscolheClick(Sender: TObject);
begin
  PageControl1.TabIndex := 1;
end;

procedure TAverb.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM4.cdsAv1.RecordCount > 0) then
  begin
    idAv := DM4.cdsAv1ID.Value;
    Averb.lbDesc.Caption := DM4.cdsAv1DESCR.Value;
    Averb.lbTot.Caption  := FormatFloat('#,##0.00',DM4.cdsAv1TOTAL.AsFloat);
    Averb.lbDesc2.Caption := DM4.cdsAv1DESCR.Value;
    PageControl1.TabIndex := 2;
  end;
end;

// <--- Faz arredondamento de forma matemática igual da calculadora
function Arred(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;

begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;


procedure TAverb.Entrar;
begin
  dt1.DateTime    := Now;
  dt2.DateTime    := Now + 15;
  cbmes.ItemIndex := MonthOf(Now)-1;
  nAno.Value      := YearOf(Now);

  idAv := 0;
  Averb.lbDesc.Caption := '-';
  Averb.lbTot.Caption  := '0';
  Averb.lbDesc2.Caption := '-';

end;

procedure TAverb.btAnaliseClick(Sender: TObject);

var  base, base1, base2, tt, nf, valorReal, valorVirtual : double;
     ct      : integer;
     minimo  : double;

begin
  minimo := 300;
  valorReal    := DM4.cdsAv1TOTAL.AsFloat;
  valorVirtual := vVirtual.Value;

  if (DM4.cdsAv1.RecordCount > 0) then
  if (DM4.cdsAv1TOTAL.AsFloat > 0) then
  begin
    // calcula FATOR inicial
    base1 := valorVirtual/int(valorReal);
    // calcula base1 e base2 FATORES usados
    base2 := 1 - base1 / 3;
    base1 := 1 - base1 / 4;
    // inicia usando o FATOR base1
    base := base1;

    //Mostra os valores
    Label6.Caption := 'Valor Real    = '+ FormatFloat('#,##0.00',valorReal);
    Label7.Caption := 'valor Virtual = '+ FormatFloat('#,##0.00',valorVirtual) + ' e Fator = '+ floattostr(base);

    tt := valorReal;

    Avb := TAvb.Create;
    Avb.Item_MostraAv(idAv);
    Avb.Destroy;

    pb2.Min := 0;
    pb2.Max := DM4.cdsAv2.RecordCount;
    pb2.Visible := true;

    // Inicia Tabela Virtual
    Tab.Close;
    Tab.EmptyTable;
    Tab.Open;
    //Preenche
    DM4.cdsAv2.First;
    while not DM4.cdsAv2.Eof do
    begin
      Tab.Insert;
      TabIDM.Value     := DM4.cdsAv2ID.Value;
      TabVlrOut.Value  := DM4.cdsAv2VALOR.AsFloat;
      Tab.Post;

      DM4.cdsAv2.Next;
    end;


    Tab.First;
    while (tt > valorVirtual) do
    begin
      if TabVlrOut.Value > minimo then
      begin
        pb2.Position := pb2.Position + 1;
        // Calcula Novo valor
        nf := int(TabVlrOut.Value) * base + 20;

        nf := Arred(nf, 1);
        tt := tt + nf - TabVlrOut.Value;

        // Grava Novo Valor
        Tab.Edit;
        TabVlrOut.Value := nf;
        Tab.Post;

        // Altera o FATOR a ser Usado
        if base = base1 then base := base2 else base := base1;
      end;
      lbFinal.Caption := FormatFloat('#,##0.00',tt);
      lbFinal.Refresh;
      Tab.Next;
      if (Tab.Eof) then
      begin
        Tab.First;
        pb2.Position := 0;
      end;
    end;
    Label8.Caption := 'Valor Final = '+ FormatFloat('#,##0.00',tt);
    //Grava Valores Finais
    pb2.Position := 0;

    lbFinal.Caption := 'Gravando...';
    lbFinal.Refresh;


    Tab.First;
    while not Tab.Eof do
    begin
      pb2.Position := pb2.Position + 1;

      Avb := TAvb.Create;
      Avb.Item_Virtual(TabIDM.Value, TabVlrOut.Value);
      Avb.Destroy;

      Tab.Next;
    end;
    pb2.Visible := false;

  end
  else ShowMessage('Banco de Dados Não Preparado');

end;

procedure Preenche_Complementos(dat1, dat2 : tdateTime);

begin
   with Averb do
   begin
   Avb := TAvb.Create;
   Avb.Minutas_Complemento(dat1, dat2);
   Avb.Destroy;

// Carrega Complementos
    // Inicia Tabela Virtual
    TabMin2.Close;
    TabMin2.EmptyTable;
    TabMin2.Open;
    Label10.Caption := 'Atualizando a Tabela Complemento';

    // Último
      TabMin2.Insert;
      TabMin2num.Value     := 0;
      TabMin2numR.Value    := 0;
      TabMin2Nome.Value    := 'Não encontrado';
      TabMin2CPF.Value     := '- x -';
      TabMin2Placa.Value   := '- x -';
      TabMin2Minuta.Value  := 0;
      TabMin2CodLib.Value  := '';
      TabMin2.Post;

    //Preenche
    DM4.cdsMin2.First;
    while not DM4.cdsMin2.Eof do
    begin
      TabMin2.Insert;
      TabMin2num.Value     := DM4.cdsMin2NUM.Value;
      TabMin2numR.Value    := DM4.cdsMin2ROMANEIO.AsInteger;
      TabMin2Nome.Value    := DM4.cdsMin2NOME.Value;
      TabMin2CPF.Value     := DM4.cdsMin2CPF.Value;
      // Placa do Motorista ou Flaydel
      if (Length(DM4.cdsMin2PLACAF.Value) = 0) then
      begin
        TabMin2Placa.Value   := DM4.cdsMin2PLACA.Value;
        TabMin2CodLib.Value   := DM4.cdsMin2CODLIBERA.Value
      end
      else
      begin
        TabMin2Placa.Value   := DM4.cdsMin2PLACAF.Value;
        TabMin2CodLib.Value   := DM4.cdsMin2CODLIBERAF.Value;
      end;

      TabMin2Minuta.Value  := DM4.cdsMin2MINUTA.Value;
      TabMin2.Post;

      DM4.cdsMin2.Next;
    end;

    Label10.Caption := 'Continuando';
   end;
end;

procedure Procura_Minuta(min : Integer);

var b : boolean;

begin
  with Averb do
  begin
    b := false;
    TabMin2.First;
    while not TabMin2.Eof and not b  do
    begin

      if (TabMin2Minuta.Value = min) then
        b := true
      else
        TabMin2.Next;
    end;
  end;
end;

procedure TAverb.btExcelClick(Sender: TObject);

var Ad,d  : String;
    Linha : Integer;
    Excel : variant;
    x     : Integer;
    dtM1, dtM2 : tDateTime;

begin
  getDir(0,d);
  Ad := d + '\Averb\' + DM4.cdsAv1Descr.Value + '.xls';
  FileListBox1.Directory := d + '\Averb';

  Label10.Caption := 'Arquivo foi salvo em ' +Ad;
  //Apaga da pasta Exporta se existir
  if FileExists(Ad) then DeleteFile(Ad);

  Avb := TAvb.Create;
  Avb.Item_MostraAv(idAv);
  Avb.Destroy;

  DM4.cdsAv2.First;
  dtM1 := DM4.cdsAv2MINDATA.AsDateTime;
  DM4.cdsAv2.Last;
  dtM2 := DM4.cdsAv2MINDATA.AsDateTime;
  Preenche_Complementos(dtM1, dtM2);

  DM4.cdsAv2.First;

  btExcel.Enabled := false;

  //Abre o arquivo Excel para exportar
  Excel := CreateOleObject('Excel.Application');
  Excel.Visible := True;
  Excel.WorkBooks.Add;

  //Titulos
  //Principal
  Excel.WorkBooks[1].Sheets[1].Cells[1,2]:= 'Transportes Flaydel';
  Excel.WorkBooks[1].Sheets[1].Cells[2,2]:= Now;
  //Colunas
  Excel.WorkBooks[1].Sheets[1].Cells[4,2]:='Data';
  Excel.WorkBooks[1].Sheets[1].Cells[4,3]:='Minuta';
  Excel.WorkBooks[1].Sheets[1].Cells[4,4]:='Romaneio';
  Excel.WorkBooks[1].Sheets[1].Cells[4,5]:='Origem';
  Excel.WorkBooks[1].Sheets[1].Cells[4,6]:='Destino';
  Excel.WorkBooks[1].Sheets[1].Cells[4,7]:='Motorista';
  Excel.WorkBooks[1].Sheets[1].Cells[4,8]:='CPF';
  Excel.WorkBooks[1].Sheets[1].Cells[4,9]:='Placa';
  Excel.WorkBooks[1].Sheets[1].Cells[4,10]:='Valor';
  Excel.WorkBooks[1].Sheets[1].Cells[4,11]:='Código Liberação';

  Barra.Min := 0;
  Barra.Max := DM4.cdsAv2.RecordCount;
  Barra.Position := 0;
  Barra.Visible := True;
  Linha := 5;
  While not DM4.cdsAv2.Eof do
    Begin
      Procura_Minuta(DM4.cdsAv2MinNum.Value);

      // Número do item
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha - 4;

      Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := DM4.cdsAv2MinData.AsDateTime;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := DM4.cdsAv2MinNum.Value;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := TabMin2numR.Value;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := 'SP';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := 'SP';
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := TabMin2nome.Value;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := 'cpf.'+TabMin2CPF.AsString;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,9] := TabMin2Placa.Value;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,10]:= DM4.cdsAv2VLROUTRO.AsFloat;
      Excel.WorkBooks[1].Sheets[1].Cells[Linha,11]:= 'cod.'+TabMin2CodLib.AsString;

      DM4.cdsAv2.Next;
      Linha:=Linha+1;

      Barra.Position := Barra.Position + 1;
    end;

  // Ajusta as colunas
  for x:=1 to 10 do
    begin
      Excel.WorkBooks[1].Sheets[1].Columns[x].Select;
      Excel.WorkBooks[1].Sheets[1].Columns[x].AutoFit;
      Excel.WorkBooks[1].Sheets[1].Columns[x].Font.Bold := False;
    end;
  // Linas 1 e 2
  Excel.WorkBooks[1].Sheets[1].Cells[1,2].Font.Size := 16;
  Excel.WorkBooks[1].Sheets[1].Cells[2,2].Font.Color:= clBlue;


  // Coluna 1 e 3
  Excel.WorkBooks[1].Sheets[1].Columns[1].Font.Color := clLtGray;
  Excel.WorkBooks[1].Sheets[1].Columns[3].Font.Bold  := True;

    // Formata os cabeçalhos
    for x:=1 to 11 do
    begin
      Excel.WorkBooks[1].Sheets[1].Cells[4,x].Font.Bold  := True;
      Excel.WorkBooks[1].Sheets[1].Cells[4,x].Font.Color := clNavy;
    end;

  Excel.WorkBooks[1].Sheets[1].Columns[10].Select;
  Excel.WorkBooks[1].Sheets[1].Columns[10].Style := 'Comma';

  Excel.WorkBooks[1].Sheets[1].Cells[Linha+3,10].FormulaR1C1 := '=SUM(R['+intToStr(-Linha)+']C:R[-4]C)';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha+3,10].Font.Bold := True;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha+3,10].Font.Color := clred;

  // Totaliza
  Excel.WorkBooks[1].Sheets[1].Calculate;
  Excel.WorkBooks[1].Sheets[1].Columns[11].Select;
  Excel.WorkBooks[1].Sheets[1].Columns[11].AutoFit;

  //Salva como
  Excel.WorkBooks[1].SaveAs(Ad);

  //termina
  Excel.quit;

  btExcel.Enabled := True;

  //Atualiza o diretorio
  FileListBox1.Update;
  FileListBox1.Selected[FileListBox1.Items.Count-1];
  Barra.Visible := False;

end;

function LinhaESP(sData, sMin, sRoma, sOrig, sDest, sCPF, sPlaca, sValor, sMotor:String):String;

var s : String;
    usa : TMarco;


begin
  usa := TMarco.Create;
  s := ' ';
  s := s + usa.AdjustLeft(sData ,14, ' ');
  s := s + usa.AdjustLeft(sMin  ,10, ' ');
  s := s + usa.AdjustLeft(sRoma ,08, ' ');
  s := s + usa.AdjustLeft(sOrig ,06, ' ');
  s := s + usa.AdjustLeft(sDest ,06, ' ');
  s := s + usa.AdjustLeft(sCPF  ,14, ' ');
  s := s + usa.AdjustLeft(sPlaca,11, ' ');
  s := s + usa.AdjustLeft(sValor,12, ' ');
  s := s + usa.AdjustLeft(sMotor,60, ' ');
  usa.Destroy;


  LinhaESP := s;
end;


function LinhaCSV(sData, sMin, sRoma, sOrig, sDest, sCPF, sPlaca, sValor, sMotor:String):String;

var s : String;
begin
  s := sData +';'+ sMin  +';'+  sRoma +';'+  sOrig +';'+  sDest +';'+  sCPF +';'+  sPlaca +';'+  sValor +';'+  sMotor +';';
  LinhaCSV := s;
end;


procedure Arq_Outros();

var arq: TextFile;
    linha, sArq: String;
    s1, s2, s3, s4, s5, s6, s7, s8, s9 : String;
    posi : integer;
    dtM1, dtM2 : TDateTime;

begin
  with Averb do
  begin
    Avb := TAvb.Create;
    Avb.Item_MostraAv(idAv);
    Avb.Destroy;

    DM4.cdsAv2.First;
    dtM1 := DM4.cdsAv2MINDATA.AsDateTime;
    DM4.cdsAv2.Last;
    dtM2 := DM4.cdsAv2MINDATA.AsDateTime;
    Preenche_Complementos(dtM1, dtM2);

    DM4.cdsAv2.First;

    // prepara o noem do arquivo
    sArq := Averb.Pasta.Directory+'\Flaydel Averb '+lbDesc.caption;
    if (Averb.rbCSV.Checked) then sArq := sArq + '.csv';
    if (Averb.rbESP.Checked) then sArq := sArq + '.txt';
    lbresp.Caption := 'Aguarde...';
    // Inicia ARQ texto
    AssignFile ( arq, sArq);
    Rewrite ( arq );

    if (Averb.rbESP.Checked) then
    begin
      linha := LinhaESP('Data', 'Minuta', 'Romaneio', 'Origem', 'Destino', 'CPF', 'Placa', 'Valor', 'Motorista');
      writeln(arq, linha);
    end;

    DM4.cdsAv2.First;
    pbCSV.Min := 0;
    pbCSV.Max := DM4.cdsAv2.RecordCount;
    posi := 0;
    while not DM4.cdsAv2.Eof do
      begin
         Procura_Minuta(DM4.cdsAv2MinNum.Value);

         // progress BAR
         posi := posi + 1;
         pbCSV.Position := posi;
         //write(arq, 'linha '+IntToStr(posi)+' - ');

         // Ajusta os valores
         s1 := Trim(DM4.cdsAv2MINDATA.AsString);
         s2 := Trim(DM4.cdsAv2MINNUM.AsString);
         s3 := Trim(Averb.TabMin2NumR.AsString);
         s4 := 'SP';
         s5 := 'SP';
         s6 := Trim(TabMin2CPF.AsString);
         s7 := Trim(TabMin2PLaca.Value);
         s8 := Trim(DM4.cdsAv2VLROUTRO.AsString);
         s9 := Trim(TabMin2Nome.value);

         //Cria as linhas
         if (Averb.rbCSV.Checked) then     linha := LinhaCSV(s1, s2, s3, s4, s5, s6, s7, s8, s9);
         if (Averb.rbESP.Checked) then     linha := LinhaESP(s1, s2, s3, s4, s5, s6, s7, s8, s9);
         WriteLn( arq, linha );

         DM4.cdsAv2.Next;
      end;
    CloseFile ( arq );
    lbresp.Caption := sArq;

  end;
end;


procedure TAverb.btCriar2Click(Sender: TObject);
begin
  Arq_Outros;
end;

end.
