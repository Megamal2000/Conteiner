unit uDiarioCli;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Buttons, JvMemoryDataset, ComObj, JvMTComponents,
  JvComponentBase, JvExControls, JvAnimatedImage, JvGIFCtrl;

type
  TDiarioCli = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    cbCli: TComboBox;
    btPesq: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    dsTab1: TJvDataSource;
    dsTab2: TJvDataSource;
    Label3: TLabel;
    Label4: TLabel;
    Tab1: TJvMemoryData;
    Tab2: TJvMemoryData;
    Tab1Dia: TDateField;
    Tab1TOT: TIntegerField;
    Tab1SRo: TIntegerField;
    Tab1NEnt: TIntegerField;
    Tab2Nota: TIntegerField;
    Tab2Valor: TFloatField;
    Tab2Status: TStringField;
    Tab2DataE: TStringField;
    Tab2HoraE: TStringField;
    Tab2idNF: TIntegerField;
    lbDT: TLabel;
    Tab2tpOcor: TIntegerField;
    Tab2numRoma: TIntegerField;
    BitBtn1: TBitBtn;
    GIFaguarde: TJvGIFAnimator;
    JvMTManager1: TJvMTManager;
    thProcesso: TJvMTThread;
    Tab2CEP: TStringField;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure thProcessoExecute(Sender: TJvMTThread;
      MTThread: TJvMTSingleThread);
    procedure thProcessoFinished(Sender: TJvMTThread;
      MTThread: TJvMTSingleThread);
    procedure JvDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  DiarioCli: TDiarioCli;
  idC : Integer;
implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5, uNotas;

procedure TDiarioCli.btPesqClick(Sender: TObject);

var Bco : TBco;
    Achei : Boolean;

begin
  Tab1.Active := false;
  Tab1.EmptyTable;
  Tab1.Active := true;

  idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');

  // Conta TODOS
  Bco := TBco.Create;
  Bco.Diario_MostraDias(idC, 0);
  Bco.Destroy;

  DM5.cdsDiaC.First;
  while not DM5.cdsDiaC.Eof do
  begin
    Tab1.Insert;
    Tab1Dia.Value    := DM5.cdsDiaCDTNOTA.Value;
    Tab1TOT.Value    := DM5.cdsDiaCNFQUANT.Value;
    Tab1SRo.Value    := 0;
    Tab1NEnt.Value   := 0;
    Tab1.Post;
    DM5.cdsDiaC.Next;
  end;
  {
  // ========================================
  // Conta SEM ROMANEIO
  Bco := TBco.Create;
  Bco.Diario_MostraDias(idC, 1);
  Bco.Destroy;

  Achei := false;
  DM5.cdsDiaC.First;
  while not DM5.cdsDiaC.Eof do
  begin
    Tab1.First;
    while not Tab1.Eof and not Achei  do
    begin
      if (Tab1Dia.Value = DM5.cdsDiaCDTNOTA.Value) then
      begin
        Achei := true;

        Tab1.Edit;
        Tab1SRo.Value    := DM5.cdsDiaCNFQUANT.Value;
        Tab1.Post;
      end;
      Tab1.Next;
    end;
    DM5.cdsDiaC.Next;
  end;

  // ========================================
  // Conta NAO ENTREGUES
  Bco := TBco.Create;
  Bco.Diario_MostraDias(idC, 2);
  Bco.Destroy;

  Achei := false;
  DM5.cdsDiaC.First;
  while not DM5.cdsDiaC.Eof do
  begin
    Tab1.First;
    while not Tab1.Eof and not Achei  do
    begin
      if (Tab1Dia.Value = DM5.cdsDiaCDTNOTA.Value) then
      begin
        Achei := true;

        Tab1.Edit;
        Tab1NEnt.Value    := DM5.cdsDiaCNFQUANT.Value;
        Tab1.Post;
      end;
      Tab1.Next;
    end;
    DM5.cdsDiaC.Next;
  end;
  }
  StatusBar1.Panels[0].Text := 'Lista com '+IntToStr(Tab1.RecordCount) + ' dias';
end;

procedure TDiarioCli.Entrar;
begin
  lbDT.Caption := '';
  cbCli.Clear;
  cbCli.Items.Append('<teste>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
  cbCli.ItemIndex := 0;
end;

procedure TDiarioCli.JvDBGrid1CellClick(Column: TColumn);

begin
  GIFaguarde.Animate := true;
  if not (JvMTManager1.ActiveThreads) then thProcesso.RunCopy;


end;

procedure TDiarioCli.BitBtn1Click(Sender: TObject);

var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;

begin

  planilha:= CreateoleObject('Excel.Application');
  planilha.WorkBooks.add(1);
  planilha.caption := 'Exportando dados do dbGrid para o Excel';
  planilha.visible := true;

  // Dados
  planilha.cells[1,3] :=  'Data de ref.: '+ lbDT.Caption;
  planilha.cells[2,3] :=  StatusBar1.Panels[1].Text;

  Tab2.First;
  for linha := 0 to Tab2.RecordCount - 1 do
  begin
    planilha.cells[linha + 5,1] :=  Tab2Nota.AsString;
    valorcampo := Tab2Valor.AsString;
    if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
    planilha.cells[linha + 5,2] :=  valorcampo;
    planilha.cells[linha + 5,3] :=  Tab2Status.Value;
    planilha.cells[linha + 5,4] :=  Tab2DataE.Value;
    planilha.cells[linha + 5,5] :=  Tab2HoraE.Value;
    planilha.cells[linha + 5,6] :=  copy(Tab2CEP.Value,1,5) + '-'+copy(Tab2CEP.Value, 6,3);

    Tab2.Next;
 end;
 // Títulos
 planilha.cells[ 4,1] :=  'Nota Fiscal';
 planilha.cells[ 4,2] :=  'Valor';
 planilha.cells[ 4,3] :=  'Status';
 planilha.cells[ 4,4] :=  'Data Entrega';
 planilha.cells[ 4,5] :=  'Hora ENtrega';
 planilha.cells[ 4,6] :=  'CEP';
 planilha.columns.Autofit;

end;

procedure TDiarioCli.thProcessoExecute(Sender: TJvMTThread;
  MTThread: TJvMTSingleThread);

var Bco : TBco;
    contaNAO : Smallint;
    dtN : TDateTime;
    sOcor : String;

begin
  if (Tab1.RecordCount > 0) then
  begin
    JvDBGrid2.Visible := false;
    StatusBar1.Panels[1].Text := '';
    dtN := Tab1Dia.Value;
    lbDT.Caption := FormatDateTime('dd/MM/yyyy ddd', dtN);

    Bco := TBco.Create;
    Bco.Diario_MostraNotas(idC,Tab1Dia.Value);
    Bco.Destroy;

    Tab2.Active := false;
    Tab2.EmptyTable;
    Tab2.Active := true;


    if (DM2.cdsTMP.RecordCount > 0) then
    begin
      contaNAO := 0;
      DM2.cdsTMP.First;
      while not DM2.cdsTMP.Eof do
      begin
        Tab2.Insert;
        Tab2idNF.Value      := DM2.cdsTMP.Fields[0].Value;
        Tab2Nota.Value      := DM2.cdsTMP.Fields[1].Value;
        Tab2Valor.Value     := DM2.cdsTMP.Fields[2].Value;
        Tab2tpOcor.Value    := DM2.cdsTMP.Fields[3].Value;
        Tab2numRoma.Value   := DM2.cdsTMP.Fields[4].Value;
        Tab2CEP.Value       := DM2.cdsTMP.Fields[7].Value;
        Tab2DataE.Value     := '-';
        Tab2HoraE.Value     := '-';

        Tab2Status.Value    := 'Na Transportadora';
        if (DM2.cdsTMP.Fields[4].Value > 0) then
        begin
          Tab2Status.Value := 'Em ROTA. Romaneio: '+copy(DM2.cdsTMP.Fields[4].AsString, 5, 6);
          if (DM2.cdsTMP.Fields[3].Value = 1) then Tab2Status.Value    := 'Ok';
          if (DM2.cdsTMP.Fields[3].Value = 2) then Tab2Status.Value    := '[Reentrega] ' + DM2.cdsTMP.Fields[3].AsString;
          if (DM2.cdsTMP.Fields[3].Value = 3) then Tab2Status.Value    := 'Devolução';

          if (DM2.cdsTMP.Fields[3].Value <> 1) then contaNAO := contaNAO + 1;

          if (DM2.cdsTMP.Fields[5].Value <> null) then Tab2DataE.Value     := FormatDateTime('dd/MM/yyyy ddd', DM2.cdsTMP.Fields[5].Value);
          if (DM2.cdsTMP.Fields[6].Value <> null) then Tab2HoraE.Value     := DM2.cdsTMP.Fields[6].Value;
        end
        else
        contaNAO := contaNAO + 1;


        Tab2.Post;

        DM2.cdsTMP.Next;
      end;

      /// ===============================================
      /// Repassa procurando outras Informações
      Tab2.First;
      while not Tab2.Eof do
      begin
        if (Tab2tpOcor.Value=2) then
        begin
          Bco := TBco.Create;
          Bco.Diario_Reentrega(idC, Tab2Nota.Value ,dtN);
          Bco.Destroy;

          DM2.cdsTMP.Last;

          sOcor    := 'Na Transportadora';
          if (DM2.cdsTMP.Fields[2].Value > 0) then sOcor    := 'Em ROTA. Romaneio: '+copy(DM2.cdsTMP.Fields[2].AsString, 5, 6);
          if (DM2.cdsTMP.Fields[1].Value = 1) then
          begin
            sOcor    := 'Ok';
            contaNAO := contaNAO - 1;
          end;
          if (DM2.cdsTMP.Fields[1].Value = 3) then sOcor    := 'Devolução';

          if (DM2.cdsTMP.Fields[1].Value = 2) then sOcor    := DM2.cdsTMP.Fields[6].AsString;

          Tab2.Edit;
          Tab2Status.Value := sOcor;
          if (DM2.cdsTMP.Fields[3].Value <> null) then Tab2DataE.Value     := FormatDateTime('dd/MM/yyyy ddd', DM2.cdsTMP.Fields[3].Value);
          if (DM2.cdsTMP.Fields[4].Value <> null) then Tab2HoraE.Value     := DM2.cdsTMP.Fields[4].Value;
          Tab2.Post;

        end;
        Tab2.Next;
      end;

      StatusBar1.Panels[1].Text := 'Notas: '+IntToStr(Tab2.RecordCount) + ' // Não Entregues: '+ IntToStr(contaNAO);
      JvDBGrid2.Visible := true;
      Tab2.First;
    end;

  end;

end;

procedure TDiarioCli.thProcessoFinished(Sender: TJvMTThread;
  MTThread: TJvMTSingleThread);
begin
  GIFaguarde.Animate := false;
end;

procedure TDiarioCli.JvDBGrid2DblClick(Sender: TObject);
begin
  if (Tab2.RecordCount > 0) then
  begin
    NotasP.Entrar;
    NotasP.Mostrar_Nota_id(Tab2idNF.Value);
    NotasP.Show;
  end;  
end;

end.
