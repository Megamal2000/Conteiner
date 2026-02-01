unit uTktxls;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, ComCtrls, ExtCtrls, JvExControls,
  JvSpecialProgress, ComObj;

type
  TTktxls = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StatusBar1: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btAtual: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    dta: TDateTimePicker;
    dtb: TDateTimePicker;
    cbCli: TComboBox;
    Label3: TLabel;
    lbC1: TLabel;
    Label5: TLabel;
    lbC3: TLabel;
    lbC2: TLabel;
    lbC4: TLabel;
    btExcel: TSpeedButton;
    Barra: TJvSpecialProgress;
    procedure dtaChange(Sender: TObject);
    procedure btAtualClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Tktxls: TTktxls;
  idCli : Integer;

implementation

{$R *.dfm}

uses Ubanco, uDM2, uDM4;

{ TTktxls }

procedure TTktxls.Entrar;


begin
  lbC1.Caption := '';
  lbC2.Caption := '';
  lbC3.Caption := '';
  lbC4.Caption := '';
  
  cbCli.Clear;
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  idCli := DM2.get_cliNum;

  DM2.DBCp_Pos(cbCli, 'TB_Cliente',IntToStr(idCli),'Nome');
  dta.DateTime := Now;
end;

procedure TTktxls.dtaChange(Sender: TObject);
begin
  dtb.DateTime := dta.DateTime;
end;

procedure TTktxls.btAtualClick(Sender: TObject);

var Bco : TBco;

begin
  lbC1.Caption := '';
  lbC2.Caption := '';
  lbC3.Caption := '';
  lbC4.Caption := '';

  idCli := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE', 'NOME');

  if (idCli > 0) then
  begin
    Bco := TBco.Create;
    Bco.Ticket_DiaConta(idCli, dta.DateTime, dtb.DateTime);
    Bco.Ticket_DiaMostra(idCli, dta.DateTime, dtb.DateTime);
    Bco.Destroy;

    DM4.cdsTKc.First;
    while not DM4.cdsTKc.eof do
    begin
      if (DM4.cdsTKcSTATUS_TKT.Value = 1) then lbC1.Caption := DM4.cdsTKcCONTA.AsString;
      if (DM4.cdsTKcSTATUS_TKT.Value = 0) then lbC2.Caption := DM4.cdsTKcCONTA.AsString;
      if (DM4.cdsTKcSTATUS_TKT.Value = 2) then lbC3.Caption := DM4.cdsTKcCONTA.AsString;
      if (DM4.cdsTKcSTATUS_TKT.Value = 3) then lbC4.Caption := DM4.cdsTKcCONTA.AsString;

      DM4.cdsTKc.Next;
    end;
  end
  else ShowMessage('Selecione um Cliente');
end;

procedure TTktxls.btExcelClick(Sender: TObject);

var Ad,d  : String;
    Linha : Integer;
    Excel : variant;
    x,i,st: Integer;
    dtM1, dtM2 : tDateTime;

begin
  getDir(0,d);
  Ad := d + '\Averb\Tickets ' + FormatDateTime('yyyyMMdd HHmm',dta.DateTime) + '.xls';
  //FileListBox1.Directory := d + '\Averb';

  //Label10.Caption := 'Arquivo foi salvo em ' +Ad;
  //Apaga da pasta Exporta se existir
  if FileExists(Ad) then DeleteFile(Ad);

  DM4.cdsTKm.First;

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
  Excel.WorkBooks[1].Sheets[1].Cells[4,2]:='Não recebidas';
  Excel.WorkBooks[1].Sheets[1].Cells[4,4]:='Recebidas';
  Excel.WorkBooks[1].Sheets[1].Cells[5,2]:='Devoluções';
  Excel.WorkBooks[1].Sheets[1].Cells[5,4]:='Coletas';

  Barra.Minimum := 0;
  Barra.Maximum := DM4.cdsTKm.RecordCount;
  Barra.Position := 0;
  Barra.Visible := True;
  Linha := 5;

  for i := 1 to 4 do
  begin
  Linha := linha + 2;
  // **************************************************
  // Não recebidos
  if (i = 1) then
  begin
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='NÃO recebidos';
    st := 0;
  end;
  if (i = 2) then
  begin
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='Recebidos';
    st := 1;
  end;

  if (i = 3) then
  begin
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='Devoluções';
    st := 3;
  end;

  if (i = 4) then
  begin
    Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='Coletas';
    st := 9;
  end;


  Linha := Linha + 1;
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,2]:='Data Romaneio';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,3]:='Romaneio';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,4]:='Nota Fiscal';
  Excel.WorkBooks[1].Sheets[1].Cells[Linha,5]:='Obs';

  Linha := Linha + 1;
  DM4.cdsTKm.First;
  While not DM4.cdsTKm.Eof do
    Begin
      if (DM4.cdsTKmSTATUS_TKT.Value = st) then
      begin
        // Número do item
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,1] := Linha - 4;

        Excel.WorkBooks[1].Sheets[1].Cells[Linha,2] := DM4.cdsTKmDTROMA.AsDateTime;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,3] := DM4.cdsTKmROMANEIO.AsInteger;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,4] := DM4.cdsTKmNUMNF.AsInteger;
        Excel.WorkBooks[1].Sheets[1].Cells[Linha,5] := DM4.cdsTKmOBS.AsString ;
        Linha:=Linha+1;
      end;

      DM4.cdsTKm.Next;
      Barra.Position := Barra.Position + 1;

    end;

    end; // for

  // **************************************************
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
