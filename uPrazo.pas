unit uPrazo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, DB, JvMemoryDataset, JvDataSource, ExtCtrls, JvExControls,
  JvSpecialProgress, ComObj;

type
  TPrazo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    JvDBGrid1: TJvDBGrid;
    Label1: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btMostrar: TBitBtn;
    Pb1: TJvSpecialProgress;
    Pb2: TJvSpecialProgress;
    TabidCli: TIntegerField;
    TabCliente: TStringField;
    TabPrazo: TSmallintField;
    Tabd1: TFloatField;
    Tabd2: TFloatField;
    Tabd3: TFloatField;
    TabdOut: TFloatField;
    TabNaoEnt: TFloatField;
    TabTotal: TIntegerField;
    TabPrazoOK: TFloatField;
    TabPrazoFora: TFloatField;
    ckPorc: TCheckBox;
    TabErro: TFloatField;
    btExcel: TBitBtn;
    BitBtn1: TBitBtn;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    Tab2: TJvMemoryData;
    Tab2idCli: TIntegerField;
    Tab2Cliente: TStringField;
    Tab2Prazo: TSmallintField;
    Tab2d1: TFloatField;
    Tab2d2: TFloatField;
    Tab2d3: TFloatField;
    Tab2dOut: TFloatField;
    Tab2NaoEnt: TFloatField;
    Tab2Erro: TFloatField;
    Tab2Total: TIntegerField;
    Tab2PrazoOK: TFloatField;
    Tab2PrazoFora: TFloatField;
    lbProg: TStaticText;
    procedure btMostrarClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ckPorcClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  Prazo: TPrazo;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDm2, uPrazoDet, uLib, uDM5;

procedure TPrazo.btMostrarClick(Sender: TObject);

var Bco : TBco;
    i, iTot : integer;
    id1, id2, id3, ido, iNE, iPS, iPN, iErro : Double;
    pd1, pd2, pd3, pdo, pNE, pPS, pPN, pErro : Double;
    DIAS_Entrega:Smallint;
    usa : TMarco;

begin
  Bco := TBco.Create;
  Bco.EstatC_PrazoCLI;
  if (DM1.cdsCli.RecordCount > 0) then
  begin
    Pb1.Minimum := 1;
    Pb1.Maximum := DM1.cdsCli.RecordCount+1;
    Pb1.Position := 1;
    DM1.cdsCli.First;
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;
    Tab2.Active := false;
    Tab2.EmptyTable;
    Tab2.Active := true;

    while not DM1.cdsCli.Eof do
    begin
      lbProg.Caption :=  IntToStr(Pb1.Position) + '/' + IntToStr(Pb1.Maximum-1);
      id1:=0; id2:=0; id3:=0; ido:=0; iNE:=0; iTot:=0; iPS:=0; iPN:=0;
      iErro := 0;
      Pb1.Position := Pb1.Position + 1;

      Bco.EstatC_Prazo(dt1.DateTime, dt2.DateTime, DM1.cdsCliID.Value);


      if (DM5.cdsPrazo2.RecordCount > 0) then
      begin
        Pb2.Minimum := 1;
        Pb2.Maximum := 120;
        if (DM5.cdsPrazo2.RecordCount >=120) then Pb2.Maximum := DM5.cdsPrazo2.RecordCount+1;
        Pb2.Position := 1;
        DM5.cdsPrazo2.First;
        while not DM5.cdsPrazo2.Eof do
        begin
          Pb2.Position := Pb2.Position + 1;

          if (Length(DM5.cdsPrazo2DIAS.AsString)>0) then DIAS_Entrega := DM5.cdsPrazo2DIAS.Value
          else
          begin
            usa := TMarco.Create;
            DIAS_Entrega := usa.IntervaloDias(DM5.cdsPrazo2DTimporta.AsDateTime, DM5.cdsPrazo2DTentrega.AsDateTime);
            usa.Destroy;

            Bco.Notas_AlteraDiasE(DM5.cdsPrazo2IDNF.Value, DIAS_Entrega);
          end;

          iTot := iTot + 1;

          if (DM5.cdsPrazo2OCOR.Value <> 1) then
            iNE := iNE + 1
          else
          begin

            if (DIAS_Entrega > DM1.cdsCliPRAZO.Value) then
                iPN := iPN + 1 else iPS := iPS + 1;

            if (DIAS_Entrega > 3) then
              ido := ido + 1
            else if (DIAS_Entrega > 2) then
              id3 := id3 + 1
            else if (DIAS_Entrega > 1) then
              id2 := id2 + 1
            else if (DIAS_Entrega > -1) then
              id1 := id1 + 1
            else
            begin
              iErro := iErro + 1;
              iPS   := iPS - 1;
            end;

          end;

          DM5.cdsPrazo2.Next;
        end;

        pd1 := id1*100/iTot;
        pd2 := id2*100/iTot;
        pd3 := id3*100/iTot;
        pdo := ido*100/iTot;
        pNE := iNE*100/iTot;
        pPS := iPS*100/iTot;
        pPN := iPN*100/iTot;
        pErro := iErro*100/iTot;


        Tab.Insert;
        TabidCli.Value := DM1.cdsCliID.Value;
        TabCliente.Value := DM1.cdsCliNOME.Value;
        TabPrazo.Value := DM1.cdsCliPRAZO.Value;
        Tabd1.Value := id1;
        Tabd2.Value := id2;
        Tabd3.Value := id3;
        TabdOut.Value := ido;
        TabNaoEnt.Value := iNE;
        TabTotal.Value := iTot;
        TabPrazoOK.Value := iPS;
        TabPrazoFora.Value := iPN;
        TabErro.Value := iErro;
        Tab.Post;

        Tab2.Insert;
        Tab2idCli.Value := DM1.cdsCliID.Value;
        Tab2Cliente.Value := DM1.cdsCliNOME.Value;
        Tab2Prazo.Value := DM1.cdsCliPRAZO.Value;
        Tab2d1.Value := pd1;
        Tab2d2.Value := pd2;
        Tab2d3.Value := pd3;
        Tab2dOut.Value := pdo;
        Tab2NaoEnt.Value := pNE;
        Tab2Total.Value := iTot;
        Tab2PrazoOK.Value := pPS;
        Tab2PrazoFora.Value := pPN;
        Tab2Erro.Value := pErro;
        Tab2.Post;
      end;
      DM1.cdsCli.Next;
    end;

    JvDBGrid2.Visible := ckPorc.Checked;
    ShowMessage('Cálculos Terminados');
  end
  else ShowMessage('Nenhum Cliente com prazo marcado');

  Bco.Destroy;
end;

procedure TPrazo.Entrar;
begin
  dt1.DateTime := Now - 8;
  dt2.DateTime := Now - 1;
end;

procedure TPrazo.dt1Change(Sender: TObject);
begin
  dt2.DateTime := dt1.DateTime + 14;
  if (Dt2.DateTime > Now) then dt2.DateTime := Now;
end;

procedure TPrazo.JvDBGrid1DblClick(Sender: TObject);
begin
  PrazoDet.lbCli.Caption := TabCliente.Value + ' (Prazo: '+TabPrazo.AsString+')';
  PrazoDet.lbDatas.Caption := FormatDateTime('dd/MM/yyyy',dt1.DateTime) + ' - ' + FormatDateTime('dd/MM/yyyy',dt2.DateTime);
  PrazoDet.get_DTi(dt1.DateTime);
  PrazoDet.get_DTf(dt2.DateTime);
  if (ckPorc.Checked) then PrazoDet.get_idCli(Tab2idCli.Value) else PrazoDet.get_idCli(TabidCli.Value); 
  PrazoDet.Entrar;
  PrazoDet.Show;
end;

procedure TPrazo.btExcelClick(Sender: TObject);


var linha, coluna, linha2 : integer;
    planilha : variant;
    valorcampo : string;
    dt : TDateTime;

begin
 if (Tab.RecordCount > 0) then
 begin
   planilha:= CreateoleObject('Excel.Application');
   planilha.WorkBooks.add(1);
   planilha.caption := 'Exportando dados do dbGrid para o Excel';
   planilha.visible := true;

   // Dados
   Tab2.First;
   for linha := 0 to Tab2.RecordCount - 1 do
   begin
     for coluna := 1 to Tab2.FieldCount do
     begin
         valorcampo := Tab2.Fields[coluna - 1].AsString;
         if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
         planilha.cells[linha + 3,coluna] :=  valorCampo;
     end;
     Tab2.Next;
   end;

   linha2 := linha + 1;
   Tab.First;
   for linha := 0 to Tab.RecordCount - 1 do
   begin
     for coluna := 1 to Tab.FieldCount do
     begin
         valorcampo := Tab.Fields[coluna - 1].AsString;
         if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
         planilha.cells[linha + 3+linha2,coluna] :=  valorCampo;
     end;
     Tab.Next;
   end;

   // Títulos

   for coluna := 1 to Tab.FieldCount do
   begin
     valorcampo := Tab.Fields[coluna - 1].DisplayLabel;
     planilha.cells[2,coluna] := valorcampo;
   end;
   planilha.columns.Autofit;
     // 1a Linha
     valorcampo := 'FLAYDEL LOG - Relatório entre '+FormatDateTime('dd/MM/yyyy ddd',dt1.DateTime)+ ' - ' +FormatDateTime('dd/MM/yyyy ddd',dt1.DateTime);
     planilha.cells[1,1] := valorcampo;

 end
 else ShowMessage('Sem dados');
end;


procedure TPrazo.BitBtn1Click(Sender: TObject);

var usa : TMarco;
    i : Integer;
begin
  usa := TMarco.Create;
  i := usa.IntervaloDias(dt1.Date, dt2.Date);
  usa.Destroy;

  ShowMessage('Intervalo: '+ IntToStr(i));
end;

procedure TPrazo.ckPorcClick(Sender: TObject);
begin
    JvDBGrid2.Visible := ckPorc.Checked;

end;

end.
