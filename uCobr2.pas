unit uCobr2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, JvMemoryDataset,
  JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvThreadTimer,
  JvMTComponents, JvComponentBase, JvExControls, JvAnimatedImage, JvGIFCtrl,
  JvThread, JvThreadDialog;

type
  TCobr2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btExec: TBitBtn;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    lbdias: TLabel;
    lbNotas: TLabel;
    pb: TProgressBar;
    lbProc1: TLabel;
    lbProc2: TLabel;
    Panel3: TPanel;
    JvDBGrid1: TJvDBGrid;
    dsTab: TJvDataSource;
    Tab: TJvMemoryData;
    TabSel: TBooleanField;
    TabCliente: TStringField;
    TabNotas: TIntegerField;
    TabCalculadas: TIntegerField;
    TabidCli: TIntegerField;
    TabStatus: TStringField;
    GIFag: TJvGIFAnimator;
    Tempo: TJvThreadTimer;
    btTodas: TBitBtn;
    BitBtn1: TBitBtn;
    procedure btExecClick(Sender: TObject);
    procedure TempoTimer(Sender: TObject);
    procedure btTodasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cobr2: TCobr2;
  crono, nTarefa, contaCli, totalCli  : Smallint;

implementation

{$R *.dfm}

uses uCobranca, uDM2, uBanco, uDM1;

procedure Preenche();

var Bco : Tbco;
begin

  with Cobr2 do
  if (DM2.cdsTMP.RecordCount > 0) then
  begin
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;
    DM2.cdsTMP.Last;
    while not DM2.cdsTMP.Bof do
    begin
      Tab.Insert;
      TabidCli.Value      := DM2.cdsTMP.Fields[0].AsInteger;
      TabNotas.Value      := DM2.cdsTMP.Fields[1].AsInteger;
      TabCliente.Value    := DM2.cdsTMP.Fields[0].AsString;
      TabCalculadas.Value := 0;
      TabSel.Value        := true;
      TabStatus.Value     := '-';
      Tab.Post;
      DM2.cdsTMP.Prior;
    end;

    Bco := TBco.Create;
    Bco.Cliente_Mostra;
    Bco.Destroy;

    DM1.cdsCli.IndexFieldNames := 'id';
    Tab.First;
    while not Tab.Eof do
    begin
      if (DM1.cdsCli.FindKey([TabidCli.Value])) then
      begin
        Tab.Edit;
        TabCliente.Value    := DM1.cdsCliNOME.Value;
        Tab.Post;
      end;
      Tab.Next;
    end;
    DM1.cdsCli.IndexFieldNames := '';
    Tab.First;

  end;
end;

procedure Executa_tarefa(n:Smallint);
var s : String;

begin
  if (Cobr2.TabSel.Value) and (Cobr2.TabidCli.Value > 0) then
  begin
    if (n = 1) then
    begin
      s := 'Iniciando... ';
    end;
    if (n = 2) then
    begin
      s := 'Calculando COMBINADOS... ';
    end;
    if (n = 3) then
    begin
      s := 'Calculando SAIDAS... ';
    end;
    if (n = 4) then
    begin
      s := 'Calcuilando PADRAO ... ';
    end;
    if (n = 5) then
    begin
      s := 'Contando Notas Calculadas... ';
    end;
  end
  else s := 'NÃO realizada';

    with Cobr2 do
    begin
      Tab.Edit;
      TabStatus.Value := s;
      Tab.Post;
    end;
end;

procedure Cronometro(tipo:Smallint);
begin
  with Cobr2 do
  begin

    pb.Max := tab.RecordCount + 1;
    pb.Min := 0;
    pb.Position := 0;
    tab.First;
    contaCli      := 0;
    totalCli      := tab.RecordCount;
    nTarefa       := 0;
    crono         := 3;
    tempo.Enabled := true;


  end;
end;


procedure TCobr2.btExecClick(Sender: TObject);

var Cobr : TCobra;
begin
  btExec.Enabled := false;
  Cobr := TCobra.Create;
  lbDias.Caption := '0';
  lbProc2.Caption := '0';

  Cobr.Entrada(dat1.DateTime, dat2.DateTime);
  lbNotas.Caption := IntToStr(Cobr.get_qtNotas);

  Cobr.Lista_Clientes(1);
  Cobr.Destroy;
  Preenche;
  btExec.Enabled := TRUe;
  lbdias.Caption := InttoSTr(Tab.RecordCount);

end;

procedure TCobr2.TempoTimer(Sender: TObject);
begin
  crono := crono - 1;
  if (crono < 1) then
  begin
    nTarefa := nTarefa + 1;
    if (nTarefa<6) then Executa_tarefa(ntarefa)
    else
    begin
      contaCli := contacli + 1;
      lbProc2.Caption := IntToStr(contacli) + ' / '+IntToStr(totalCli);
      pb.Position := pb.Position + 1;
      ntarefa := 0;
      if ( TabStatus.Value <> 'NÃO realizada') then
      begin
        tab.Edit;
        TabStatus.Value := 'Ok';
        Tab.Post;
      end;
      if contaCli < totalCli  then
      begin
        Tab.Next;
      end
      else tempo.Enabled := false;
    end;
  end;

end;

procedure TCobr2.btTodasClick(Sender: TObject);
begin
  Cronometro(1);
end;

procedure TCobr2.BitBtn1Click(Sender: TObject);
begin
  Tempo.Enabled := false;
end;

procedure TCobr2.JvDBGrid1CellClick(Column: TColumn);
begin
  if (Column.FieldName = 'Sel') then
  begin
    Tab.Edit;
    TabSel.Value := not TabSel.Value;
    Tab.Post;
  end;
end;

end.
