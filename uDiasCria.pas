unit uDiasCria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, JvExControls, JvAnimatedImage, JvGIFCtrl,
  Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, Menus, JvMemoryDataset;

type
  TDiasCria = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    cbCli: TComboBox;
    btPesq: TBitBtn;
    btExcel: TBitBtn;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Label1: TLabel;
    JvDBGrid1: TJvDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbDT: TLabel;
    GIFaguarde: TJvGIFAnimator;
    JvDBGrid2: TJvDBGrid;
    JvDBGrid3: TJvDBGrid;
    Label5: TLabel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Label6: TLabel;
    PopupMenu1: TPopupMenu;
    Cancelada1: TMenuItem;
    Cancelada2: TMenuItem;
    btAnalise: TBitBtn;
    Pendente1: TMenuItem;
    N1: TMenuItem;
    Entregue1: TMenuItem;
    Tab: TJvMemoryData;
    Tabid: TIntegerField;
    Tabnota: TIntegerField;
    Tabligcli: TIntegerField;
    Tabdt1: TDateField;
    Tabdt2: TDateTimeField;
    Tablocal: TStringField;
    Tabcep: TStringField;
    Tabsituacao: TStringField;
    Tabnocor: TIntegerField;
    Tabnroma: TIntegerField;
    Tabult: TStringField;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure JvDBGrid3DblClick(Sender: TObject);
    procedure Cancelada1Click(Sender: TObject);
    procedure Cancelada2Click(Sender: TObject);
    procedure btAnaliseClick(Sender: TObject);
    procedure Pendente1Click(Sender: TObject);
    procedure Entregue1Click(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  DiasCria: TDiasCria;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDM2, uDM5, uNotas, uLib;



{ TDiasCria }

procedure Marca(st:smallint);

var Bco : TBco;

begin
{
0=Criada
1=Entregue
2=Devolvida
3=Cancelada
4=Pendente
}
  Bco := TBco.Create;
  Bco.Notas_Unica_AltStatus(DM5.cdsCr2NUMNOTA.Value, DM5.cdsCr2LIGCLI.Value, st);
  Bco.Destroy;
end;

procedure Mostra_Qt(idCli:Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.NaoEntregues_Quant(idcli);
  Bco.Destroy;
end;

procedure Mostra_Dia(dia:Tdatetime; idCli:Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.NaoEntregues_Dia(dia, idCli);
  Bco.Destroy;
end;

procedure Mostra_Nota(idCli, numnota:Integer; diacria:TDateTime);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.NaoEntregues_Notas(idcli, numnota, diacria);
  Bco.Destroy;
end;


procedure Faz_relatorio();
var Bco : TBco;
    idCliente, ultNF,i : Integer;
    Oc : Array[0..99] of String;
begin
  with DiasCria do
  begin
    idCliente := 0;
    if (cbCli.ItemIndex > 0) then
      idCliente := DM2.DBCp_leid(cbCli.Items[cbCli.itemindex], 'TB_CLIENTE', 'NOME');

    Bco := TBco.Create;
    Bco.Notas_Unica_Rel(idcliente);
    BCo.Ocorre_Mostra;
    Bco.Destroy;
    //=================================
    for i  := 0 to 99 do Oc[i] := '';
    DM1.cdsOc.First;
    while not DM1.cdsOc.eof do
    begin
      Oc[DM1.cdsOcNUM.Value] := DM1.cdsOcDESCR.Value;
      DM1.cdsOc.Next;
    end;

    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;

    ultNF := 0;
    DM5.cdsRCria.First;
    while not DM5.cdsRCria.eof do
    begin

      Tab.Insert;
      Tabid.Value := DM5.cdsRcriaID.Value;
      Tabnota.Value := DM5.cdsRcriaNUMNF.Value;
      Tabligcli.Value := DM5.cdsRcriaLIGCLI.Value;
      Tabdt1.Value := DM5.cdsRcriaDTCRIADA.Value;
      Tabdt2.Value := DM5.cdsRcriaDTCRIA.AsDateTime;
      Tablocal.Value := DM5.cdsRcriaLOCALI.Value;
      Tabcep.Value := DM5.cdsRcriaCEP.Value;
      Tabnocor.Value := DM5.cdsRcriaNOCORR.Value;
      Tabnroma.Value := DM5.cdsRcriaNROMA.Value;

      if ultNF<>DM5.cdsRcriaNUMNF.Value then
      begin
        ultNF:=DM5.cdsRcriaNUMNF.Value;
        Tabult.Value := 'sim';
      end
      else
        Tabult.Value := '-';

      if (DM5.cdsRcriaNROMA.Value>0) and (DM5.cdsRcriaNOCORR.Value=0) then
        Tabsituacao.Value := 'EM ROTA';
      if (DM5.cdsRcriaNROMA.Value=0) and (DM5.cdsRcriaNOCORR.Value=0) then
        Tabsituacao.Value := 'Na Transportadora';

      if (DM5.cdsRcriaNROMA.Value>0) and (DM5.cdsRcriaNOCORR.Value>0) then
        Tabsituacao.Value := Oc[DM5.cdsRcriaNOCORR.Value];


      Tab.Post;
      DM5.cdsRCria.Next;
    end;
  end;

end;

procedure ExportaExcel();
  var usa : TMarco;
begin
  usa := TMarco.Create;
  usa.Exporta_ExcelTAB(',4,5,', DiasCria.Tab);
  usa.Destroy;
end;

procedure TDiasCria.Entrar;
begin
  Mostra_Qt(0);
  cbCli.Clear;
  cbCli.Items.Append('<Todos>');
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', '');
  cbCli.ItemIndex := 0;
  lbDT.Caption := '';
  JvDBGrid3.Visible := false;
end;

procedure TDiasCria.Entregue1Click(Sender: TObject);
begin
  Marca(1)
end;

procedure TDiasCria.btExcelClick(Sender: TObject);

begin
  Faz_relatorio;
  ExportaExcel;

end;

procedure TDiasCria.btAnaliseClick(Sender: TObject);
  var conta : Integer;
begin
  // Mostra Todos
  Mostra_Dia(DM5.cdsCr1DTCRIADA.AsDateTime, -1);
  // ===== Retira apagados
  DM5.cdsCr2.First;
  while not DM5.cdsCr2.Eof  do
  begin
    conta := DM2.Conta('TB_NOTAF', ' NUMNF = '+ DM5.cdsCr2NUMNOTA.AsString + ' and ligcli = '+DM5.cdsCr2LIGCLI.AsString);
    if (conta=0) then Marca(3)
    else
    begin
      conta := DM2.Conta('TB_NOTAF', ' NUMNF = '+ DM5.cdsCr2NUMNOTA.AsString + ' and ligcli = '+DM5.cdsCr2LIGCLI.AsString+ ' and nocorr=1');
      if (conta > 0) then Marca(1);
    end;



    DM5.cdsCr2.Next;
  end;
    Mostra_Qt(0);
end;

procedure TDiasCria.btPesqClick(Sender: TObject);

var idCliente : Integer;
begin
  idCliente := 0;
  if (cbCli.ItemIndex > 0) then
    idCliente := DM2.DBCp_leid(cbCli.Items[cbCli.itemindex], 'TB_CLIENTE', 'NOME');
  Mostra_Qt(idCliente);
end;

procedure TDiasCria.JvDBGrid1CellClick(Column: TColumn);
var idCliente : Integer;
begin
  idCliente := 0;
  JvDBGrid3.Visible := false;
  if (cbCli.ItemIndex > 0) then
    idCliente := DM2.DBCp_leid(cbCli.Items[cbCli.itemindex], 'TB_CLIENTE', 'NOME');
  if (DM5.cdsCr1.RecordCount > 0) then
  begin
    Mostra_Dia(DM5.cdsCr1DTCRIADA.AsDateTime, idCliente);
    LbDT.Caption := FormatDateTime('dd/MM/yyyy ddd', DM5.cdsCr1DTCRIADA.AsDateTime);
  end;
end;

procedure TDiasCria.JvDBGrid2CellClick(Column: TColumn);
begin
  if (DM5.cdsCr2.RecordCount > 0) then
  begin
    Mostra_Nota(DM5.cdsCr2LIGCLI.Value, DM5.cdsCr2NUMNOTA.value, DM5.cdsCr2DTCRIADA.AsDateTime);
    JvDBGrid3.Visible := true;
  end;

end;

procedure TDiasCria.JvDBGrid3DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM5.cdsCr3ID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;




procedure TDiasCria.Pendente1Click(Sender: TObject);
begin
  Marca(4);
end;

procedure TDiasCria.Cancelada1Click(Sender: TObject);
begin
  Marca(2);
end;

procedure TDiasCria.Cancelada2Click(Sender: TObject);
begin
  Marca(3)
end;

end.
