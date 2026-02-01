unit uGanhoM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, ExtCtrls, ComCtrls,
  StdCtrls, Buttons, DB, JvDataSource, ComObj, JvExControls,
  JvSpecialProgress;

type
  TGanhoM = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    btMot: TBitBtn;
    lbMot: TLabel;
    Label2: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    Bevel1: TBevel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btPesq: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btExcel: TSpeedButton;
    Barra: TJvSpecialProgress;
    procedure btPesqClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure btMotClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idMot(i:Integer);
  end;

var
  GanhoM: TGanhoM;
  idMot : integer;

implementation

{$R *.dfm}

uses uBanco, uDM4, uDM1, upsqFuncs, uRoman;

{ TGanhoM }

procedure TGanhoM.set_idMot(i: Integer);
begin
  idMot := i;
end;

procedure TGanhoM.btPesqClick(Sender: TObject);

var Bco : TBco;
    tot, desp, rec : Double;
    qtNF, neg : Integer;

begin
  Bco := TBco.Create;
  bco.Gerencial_GanhoMot(idMot, dt1.DateTime, dt2.DateTime);
  bco.Destroy;

  StatusBar1.Panels[0].Text := 'Romaneios: '+IntToStr(Dm4.cdsGerGM.RecordCount);

  // Totaliza;
  // inicia variaveis
  tot := 0;
  rec := 0;
  desp := 0;
  qtNf := 0;
  neg := 0;

  // laço para totalizar
  DM4.cdsGerGM.First;
  while not DM4.cdsGerGM.Eof do
  begin
    // soma
    rec  := rec + DM4.cdsGerGMRECEITA.AsFloat;
    desp := desp + DM4.cdsGerGMDESPESA.AsFloat;
    qtNF := qtNF + DM4.cdsGerGMNOTAS.Value;
    if (DM4.cdsGerGMLUCRO.AsFloat <= 0) then neg := neg + 1;
    if NOT(VarIsNull(DM4.cdsGerGMLUCRO.AsFloat) ) then tot := tot + DM4.cdsGerGMLucro.AsFloat;
    DM4.cdsGerGM.Next;
  end;
  DM4.cdsGerGM.First;
  // --- Mostra os Totais -------------------------------
  Label1.Caption := IntToStr(qtNF);
  Label3.Caption := FormatFloat('#,##0.00', rec);
  Label4.Caption := FormatFloat('#,##0.00', desp);
  Label5.Caption := FormatFloat('#,##0.00', tot);
  StatusBar1.Panels[1].Text := 'Problemas: '+IntToStr(neg)+' de '+IntToStr(DM4.cdsGerGM.RecordCount);

end;


procedure TGanhoM.FormActivate(Sender: TObject);
begin
  dt1.DateTime := Now - 30;
  dt2.DateTime := Now;

end;

procedure TGanhoM.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 15;
end;

procedure TGanhoM.btMotClick(Sender: TObject);
begin
  psqFuncs.set_tipo(1); // Motoristas
  psqFuncs.set_saida(6);
  psqFuncs.Show;
end;

procedure TGanhoM.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if not (gdSelected in State) then
  if (DM4.cdsGerGMLUCRO.AsFloat <= 0) then
  begin
    JvDBGrid1.Canvas.Font.Color := clRed;
    JvDBGrid1.DefaultDrawColumnCell(Rect,DatacOl, Column, State);
  end;

end;

procedure TGanhoM.JvDBGrid1DblClick(Sender: TObject);
begin
  Roman.set_idRoma(DM4.cdsGerGMNUM.Value);
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure TGanhoM.btExcelClick(Sender: TObject);

var Ad,d  : String;
    Linha : Integer;
    Excel : variant;
    x,i,st: Integer;
    dtM1, dtM2 : tDateTime;

begin
  getDir(0,d);
  Ad := d + '\Averb\Motoristas ' + FormatDateTime('yyyyMMdd HHmm',Now) + '.xls';
  //FileListBox1.Directory := d + '\Averb';

  //Label10.Caption := 'Arquivo foi salvo em ' +Ad;
  //Apaga da pasta Exporta se existir
  if FileExists(Ad) then DeleteFile(Ad);

  DM4.cdsGerGM.First;

  btExcel.Enabled := false;

  //Abre o arquivo Excel para exportar
  Excel := CreateOleObject('Excel.Application');
  Excel.Visible := True;
  Excel.WorkBooks.Add;

  //Titulos
  //Principal
  Excel.WorkBooks[1].Sheets[1].Cells[1,2]:= 'Transportes Flaydel';
  Excel.WorkBooks[1].Sheets[1].Cells[2,2]:= Now;


  Barra.Minimum := 0;
  Barra.Maximum := DM4.cdsGerGM.RecordCount;
  Barra.Position := 0;
  Barra.Visible := True;
  Linha := 5;


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='Data Romaneio';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:='Romaneio';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,4]:='Quant Notas';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,5]:='Receitas';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,6]:='Despesas';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,7]:='Lucro';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,8]:='Porcento';

  Linha := Linha + 1;
  DM4.cdsGerGM.First;
  While not DM4.cdsGerGM.Eof do
    Begin

      begin
        // Número do item
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha - 6;

        Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := DM4.cdsGerGMDTROMA.AsDateTime;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := DM4.cdsGerGMROMANEIO.AsInteger;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := DM4.cdsGerGMNOTAS.AsInteger;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := DM4.cdsGerGMRECEITA.AsFloat ;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,6] := DM4.cdsGerGMDESPESA.AsFloat ;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,7] := DM4.cdsGerGMLUCRO.AsFloat ;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,8] := DM4.cdsGerGMPORCENTO.AsFloat ;
        Linha:=Linha+1;
      end;

      DM4.cdsGerGM.Next;
      Barra.Position := Barra.Position + 1;

    end;


  // **************************************************
  // Ajusta as colunas

  for x:=1 to 10 do
    begin
      Excel.WorkBooks[1].Sheets[1].Columns[x].Select;
      Excel.WorkBooks[1].Sheets[1].Columns[x].AutoFit;
      Excel.WorkBooks[1].Sheets[1].Columns[x].Font.Bold := False;
    end;

  for x:=5 to 8 do
      Excel.WorkBooks[1].Sheets[1].Columns[x].NumberFormat := '#.##0,00';

  // Linas 1 e 2
  Excel.WorkBooks[1].Sheets[1].Cells[1,2].Font.Size := 16;
  Excel.WorkBooks[1].Sheets[1].Cells[2,2].Font.Color:= clBlue;


  // Coluna 1 e 3
  Excel.WorkBooks[1].Sheets[1].Columns[1].Font.Color := clLtGray;
  Excel.WorkBooks[1].Sheets[1].Columns[3].Font.Bold  := True;

  Excel.WorkBooks[1].Sheets[1].Cells[3,2]:= lbMot.Caption;
  Excel.WorkBooks[1].Sheets[1].Cells[3,2].Font.Bold := true;
    // Formata os cabeçalhos
    for x:=1 to 10 do
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
  Excel.WorkBooks[1].Sheets[1].Columns[10].Select;
  Excel.WorkBooks[1].Sheets[1].Columns[10].AutoFit;

  //Salva como
  Excel.WorkBooks[1].SaveAs(Ad);

  //termina
  Excel.quit;

  btExcel.Enabled := True;

  //Atualiza o diretorio
  // FileListBox1.Update;
  // FileListBox1.Selected[FileListBox1.Items.Count-1];
  Barra.Visible := False;



end;

end.
