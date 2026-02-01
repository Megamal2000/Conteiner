unit uGraficos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,  StdCtrls, ComCtrls,
  Buttons, Mask, JvExMask, JvSpin, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.DBXFirebird, Data.FMTBcd, Data.SqlExpr, Datasnap.Provider,
  Datasnap.DBClient, midasLib;
  // Delphi 7 para DXE 10 - retirei TeeProcs, TeEngine, Chart,

type
  TGraficos = class(TForm)
    PageControl1: TPageControl;
    Graf1: TTabSheet;
    Graf2: TTabSheet;
    Graf3: TTabSheet;
    Graf4: TTabSheet;
    Label1: TLabel;
    btGraf1: TButton;
    telaChart1: TChart;
    Label2: TLabel;
    Label3: TLabel;
    spAno: TJvSpinEdit;
    btGraf2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    spAno2: TJvSpinEdit;
    btGraf3: TBitBtn;
    Label6: TLabel;
    cbCli: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    DataSource1: TDataSource;
    SQLConnection1: TSQLConnection;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    SQLDataSet1: TSQLDataSet;
    procedure btGraf1Click(Sender: TObject);
    procedure btGraf2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btGraf3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Graficos: TGraficos;
  Yd : array[1..12] of Double;
  Y1, Y2, Y3 : array[1..12] of Integer;
  Xs, Tit : array[1..12] of String;
  gc , sc, g2c: Integer;

implementation

uses uDM4,  uBanco, uDM2, uDM1;
// Delphi 7 para DXE10 - retirei Series
{$R *.dfm}

procedure Prepara_dados(tipo:smallint);

var
    i, idC: Integer;
    Bco : TBco;


begin
  // Limpa os dados
  for i := 1 to 12 do
  begin
    Yd[i] := 0;
    y1[i] := 0;
    y2[i] := 0;
    y3[i] := 0;
    Xs[i] := '';
  end;
  g2c := 0;

  if (tipo = 1 ) then
  begin

    // pesquisa dados
    Bco := TBco.Create;
    Bco.Graficos_ultimos;
    Bco.Destroy;

    sc := 1;
    i  := 0;

    DM4.cdsG1.First;
    while not DM4.cdsG1.Eof do
    begin
      i := i + 1;
      if (i<13) then
      begin
        Xs[i] := DM4.cdsG1MES.AsString + '/' + DM4.cdsG1ANO.AsString;
        y1[i] := DM4.cdsG1ROMANEIOS.Value;
      end;  
      DM4.cdsG1.Next;
    end;
    gc := i;
  end;

  if (tipo = 2) then
  begin

    // pesquisa dados
    Bco := TBco.Create;
    Bco.Graficos_ano(Graficos.spAno.AsInteger);
    Bco.Destroy;

    sc := 1;
    i  := 0;

    DM4.cdsG2.First;
    while not DM4.cdsG2.Eof do
    begin
      i := i + 1;
      Xs[i] := DM4.cdsG2MES.AsString ;
      y1[i] := DM4.cdsG2ROMANEIOS.Value;
      DM4.cdsG2.Next;
    end;
    gc := i;
  end;

  if (tipo = 3) then
  begin
    idC := 0;
    if (Graficos.cbCli.Itemindex > 0) then
      idC := DM2.DBCp_leid(Graficos.cbCli.Items[Graficos.cbCli.ItemIndex], 'TB_Cliente', 'Nome');

    // pesquisa dados
    Bco := TBco.Create;
    Bco.Graficos_Frete(idC, Graficos.spAno2.AsInteger);
    Bco.Destroy;

    sc := 1;
    i  := 0;

    DM4.cdsG3.First;
    while not DM4.cdsG3.Eof do
    begin
      i := i + 1;
      Xs[i] := DM4.cdsG3MES.AsString ;
      y1[i] := trunc(DM4.cdsG3RECEBIDO.AsFloat/1000);
      DM4.cdsG3.Next;
    end;
    gc  := i;
  end;

  if (tipo = 4) then
  begin

    // pesquisa dados
    Bco := TBco.Create;
    Bco.Graficos_ano(Graficos.spAno.AsInteger);
    Bco.Destroy;

    sc := 1;
    i  := 0;

    DM4.cdsG2.First;
    while not DM4.cdsG2.Eof do
    begin
      i := i + 1;
      Xs[i] := DM4.cdsG2MES.AsString ;
      y1[i] := DM4.cdsG2ROMANEIOS.Value;
      DM4.cdsG2.Next;
    end;
    gc := i;
  end;

end;

procedure Mostra_Tela;

var m : TChartSeries;
    yi, xi: Integer;

begin

  with Graficos do
  begin
  // Limpa o Grafico
  // Inicia as series
  telaChart1.SeriesList.Clear;
  telaChart1.Title.Text.Clear;
  telaChart1.Title.Text.Append('Romaneios '+FormatDateTime('dd/MM/yyyy ddd',Now)  );
  for xi := 1 to sc do
  begin
  // Cria a Serie
    {
    m := TBarSeries.Create(nil);;
    m.Title := Xs[xi];
    m.Marks.Visible := False;
    telaChart1.AddSeries(m);
    telaChart1.Series[xi-1].Clear;
    telaChart1.Series[xi-1].GalleryChanged3D(false);
    telaChart1.Legend.Visible := false;
     }
    for yi := 1 to gc do
    begin
      telaChart1.Series[xi-1].AddXY(yi,y1[yi],Xs[yi])
    end;
  end;
  telaChart1.Repaint;

  end;
end;

procedure IniciaMM();
begin
  with Graficos do
  begin
    cbCli.Clear;
    cbCli.Items.Append('<Todos>');
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
    cbCli.ItemIndex := 0;
  end;

end;

procedure DBCb_Preenche( Tab, Campo: String);

var i  : integer;
    sq : String;

begin
  sq := 'SELECT id, ' + Campo + ' FROM ' + Tab + ' order by ' + Campo;
  DM2.Roda_SQL(DM2.sdsDBCp  , DM2.cdsDBCp  , sq);
end;

procedure IniciaMM2();
begin
  with Graficos do
  begin
    DBCb_Preenche( 'TB_Cliente', 'Nome');
  end;

end;


procedure TGraficos.BitBtn1Click(Sender: TObject);
begin
{
  try
    DM1.Conexao.Connected := true;
    DM1.cdsCli.Active := false;
    DM1.cdsCli.Active := true;

  except
    on Exc : Exception do
       ShowMessage('ERRO: '+Exc.Message);
  end;
  ShowMessage('Finalizado');
  }
  DBCb_Preenche('TB_CLIENTE', 'Nome');
end;

procedure TGraficos.BitBtn2Click(Sender: TObject);
begin
{
  SQLConnection1.Connected := false;
  SQLConnection1.params.Values['database']  := Edit1.Text;
  SQLConnection1.Connected := true;

  ClientDataSet1.Active := true;
  }
  IniciaMM;

end;

procedure TGraficos.btGraf1Click(Sender: TObject);
begin
  Prepara_dados(1);
  Mostra_Tela;
end;

procedure TGraficos.btGraf2Click(Sender: TObject);
begin
  Prepara_dados(2);
  Mostra_Tela;
end;


procedure TGraficos.FormActivate(Sender: TObject);
begin
  // Inicia ComboBox

end;

procedure TGraficos.btGraf3Click(Sender: TObject);
begin
  Prepara_dados(3);
  Mostra_Tela;
end;

end.
