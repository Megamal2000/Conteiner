unit uTemp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvMemoryDataset, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, JvDBUltimGrid, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Mask, JvExMask, JvToolEdit, Vcl.FileCtrl, ACBrDFeReport,
  ACBrCTeDACTEClass,  ACBrBase, ACBrDFe, ACBrCTe,
  JvDataSource;

type
  TTemp = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    ts1BTler: TBitBtn;
    ts1DBGrid1: TJvDBUltimGrid;
    Tab1: TJvMemoryData;
    Tab1NumNota: TIntegerField;
    Tab1ChaveArq: TStringField;
    Tab1CSTAT: TIntegerField;
    Tab1ChaveBD: TStringField;
    Tab1DIF: TSmallintField;
    ts1ARQS: TFileListBox;
    ts1DIR: TJvDirectoryEdit;
    ACBrCTe1: TACBrCTe;
    JvDataSource1: TJvDataSource;
    Label2: TLabel;
    Label3: TLabel;
    ts1BTLe2: TBitBtn;
    pb: TProgressBar;
    ts1BTxl: TBitBtn;
    ts1Grava: TBitBtn;
    procedure ts1DIRChange(Sender: TObject);
    procedure ts1BTlerClick(Sender: TObject);
    procedure ts1BTLe2Click(Sender: TObject);
    procedure ts1BTxlClick(Sender: TObject);
    procedure ts1GravaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Temp: TTemp;

implementation

{$R *.dfm}

uses uDM1, uDM2, uLib;

procedure ts1_CTe_Mostra(menor, maior:Integer);
  var sq : String;

begin
  sq := 'Select numc, Arquivo from TB_CONHEC where numc >= '+menor.ToString+'  and numc <= '+maior.ToString + ' order by numc ';
  DM2.Roda_SQL(DM2.sdsTMP, DM2.cdsTMP, sq);
end;

procedure ts1_CTe_Grava(nCTe:Integer; sArq:String);
  var sq : String;

begin
  sq := 'UPDATE TB_CONHEC set StatusEnvio=4, Arquivo = '+QuotedStr(sArq)+' where numc = '+nCTe.ToString+' ';
  DM2.Executa_SQL(DM1.Conexao, DM2.sdsUser, sq, 'Altera');
end;


procedure TTemp.ts1BTLe2Click(Sender: TObject);
 var me, ma, i, nu, dif, conta1, conta2 : Integer;
begin
  ma := 0;
  me := 90000;
  nu := 0;

  pb.Position := 0;

  Tab1.First;
  me := Tab1NumNota.Value;
  Tab1.Last;
  ma := Tab1NumNota.Value;

  ts1_CTe_Mostra(me, ma);

  pb.Min := 0;
  pb.Max := Tab1.RecordCount;
  pb.Position := 0;

  conta1 := 0; conta2 := 0;

  Tab1.First;
  for I := 1 to Tab1.RecordCount do
  begin
    pb.Position := i;
    nu := Tab1NumNota.Value;
    DM2.cdsTMP.Filtered := false;
    DM2.cdsTMP.Filter := 'numc = '+nu.ToString;
    DM2.cdsTMP.Filtered := true;

    if DM2.cdsTMP.RecordCount > 0 then
    begin

      dif := 1;
      if DM2.cdsTMP.Fields[1].AsString <> Tab1ChaveArq.Value then dif := 2;
      Tab1.Edit;
      Tab1ChaveBD.Value := DM2.cdsTMP.Fields[1].AsString;
      Tab1DIF.Value := dif;
      Tab1.Post;

      if dif = 1 then conta1 := conta1 + 1;
      if dif = 2 then conta2 := conta2 + 1;


    end;
    Tab1.Next;
  end;
  Label2.Caption := 'TOTAL: '+Tab1.RecordCount.ToString + '// Iguais: '+conta1.ToString+ '  // Diferentes: '+conta2.ToString;

end;

procedure TTemp.ts1BTlerClick(Sender: TObject);
  var i : Integer;
     s1, s2 : String;
begin
  // Apagar a Tabela
  Tab1.Active := false;
  Tab1.EmptyTable;
  Tab1.Active := true;

  if ts1ARQS.Count > 0 then
  begin
    pb.Min := 0;
    pb.Max := ts1ARQS.Count + 1;
    //for I := 1 to ts1ARQS.Count do
    for I := 1 to ts1ARQS.Count  do
    begin
      pb.Position := i;
      s1 := ts1ARQS.items.Strings[i-1];

      ACBrCTe1.Conhecimentos.Clear;
      ACBrCTe1.Conhecimentos.LoadFromFile(s1);
      if ACBrCTe1.Conhecimentos.Items[0].CTe.procCTe.cStat = 100 then
      begin
        Tab1.Append;
        Tab1NumNota.Value := ACBrCTe1.Conhecimentos.Items[0].CTe.Ide.nCT;
        Tab1ChaveArq.Value :=  'CTe'+ACBrCTe1.Conhecimentos.Items[0].CTe.procCTe.chCTe;
        Tab1CSTAT.Value := ACBrCTe1.Conhecimentos.Items[0].CTe.procCTe.cStat;
        Tab1ChaveBD.Value := 'CTe';
        Tab1DIF.Value := 0;
        Tab1.Post;
      end;
    end;
    Label2.Caption := 'TOTAL: '+Tab1.RecordCount.ToString;



  end;

end;

procedure TTemp.ts1BTxlClick(Sender: TObject);
var usa : TMarco;
begin
  usa := TMarco.Create;
  usa.Exporta_ExcelTAB('',Tab1);
  usa.Destroy;

end;

procedure TTemp.ts1DIRChange(Sender: TObject);
begin
  ts1ARQS.Directory := ts1DIR.Directory;
end;

procedure TTemp.ts1GravaClick(Sender: TObject);
  var i, nu: Integer;
begin
  pb.Min := 0;
  pb.Max := Tab1.RecordCount;
  pb.Position := 0;


  Tab1.First;
  for I := 1 to Tab1.RecordCount do
  begin
    pb.Position := i;
    nu := Tab1NumNota.Value;

    if Tab1DIF.Value = 2 then ts1_CTe_Grava(nu, Tab1ChaveArq.Value);
    Tab1.Next;
  end;

end;

end.
