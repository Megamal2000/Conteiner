unit uOcorreCli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ComCtrls, JvMemoryDataset,
  JvDataSource, Vcl.StdCtrls, Vcl.Buttons;

type
  TOcorreCli = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    btSalvar: TBitBtn;
    StatusBar1: TStatusBar;
    JvDataSource1: TJvDataSource;
    Tab1: TJvMemoryData;
    Tab1pDescricao: TStringField;
    Tab1pNum: TIntegerField;
    Tab1novoNum: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    Tab2: TJvMemoryData;
    Tab2pInterno: TStringField;
    Tab2pCod: TIntegerField;
    Tab2numCli: TIntegerField;
    ProgressBar1: TProgressBar;
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Entrar(sCli:String; LigG:Integer) ;
  end;

var
  OcorreCli: TOcorreCli;
  idGrupo : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDM5;

function TipoOC(tipo:Smallint):Integer;
  var resp : integer;
begin
  DM5.cdsOCcli.Filtered := false;
  DM5.cdsOCcli.Filter := 'tipo = '+tipo.ToString;
  DM5.cdsOCcli.Filtered := true;

  resp := 0;
  resp := DM5.cdsOCcli.RecordCount;

  result :=resp;
end;



Procedure Iniciar_OC();
  var Bco : TBco;
begin
  with OcorreCli do
  begin
    Tab1.Active := false;
    Tab1.EmptyTable;
    Tab1.Active := true;

    Bco := TBco.Create;
    Bco.Ocorre_Mostra;
    Bco.Destroy;

    DM1.cdsOc.First;
    while not DM1.cdsOc.Eof do
    begin
      Tab1.Append;
      Tab1pDescricao.Value := DM1.cdsOcDESCR.Value;
      Tab1pNum.Value       := DM1.cdsOcNUM.Value;
      Tab1novoNum.Value    := 0;
      Tab1.Post;

      DM1.cdsOc.Next;
    end;
    Tab1.First;
  end;
end;

Procedure Carregar_OC();
  var Bco : TBco;
begin
  with OcorreCli do
  begin
    if tipoOc(1)> 0 then
    begin
      Tab1.First;
      DM5.cdsOCcli.First;
      while not DM5.cdsOCcli.Eof do
      begin
        Tab1.Locate('pNum',DM5.cdsOCcliCODPAD.value, [loCaseInsensitive]  );
        Tab1.Edit;
        Tab1novoNum.Value    := DM5.cdsOCcliCODNOVO.Value;
        Tab1.Post;

        DM5.cdsOCcli.Next;
      end;
    end;
    Tab1.First;
  end;
end;

Procedure Iniciar_INT();

  var Bco : TBco;
begin
  with OcorreCli do
  begin
    Tab2.Active := false;
    Tab2.EmptyTable;
    Tab2.Active := true;

    Bco := TBco.Create;
    Bco.Rastreio_Mostra;
    Bco.Destroy;

    DM5.cdsCODi.First;
    while not DM5.cdsCODi.Eof do
    begin
      Tab2.Append;
      Tab2pInterno.Value := DM5.cdsCODiDESCR.Value;
      Tab2pCod.Value     := DM5.cdsCODiCODINT.Value;
      Tab2numCli.Value   := 0;
      Tab2.Post;

      DM5.cdsCODi.Next;
    end;
    Tab2.First;
  end;
end;

Procedure Carregar_INT();
  var Bco : TBco;
begin
  with OcorreCli do
  begin
    if tipoOc(2)> 0 then
    begin
      Tab2.First;
      DM5.cdsOCcli.First;
      while not DM5.cdsOCcli.Eof do
      begin
        Tab2.Locate('pCod',DM5.cdsOCcliCODPAD.value, [loCaseInsensitive] );
        Tab2.Edit;
        Tab2numCli.Value    := DM5.cdsOCcliCODNOVO.Value;
        Tab2.Post;

        DM5.cdsOCcli.Next;
      end;
    end;
    Tab2.First;
  end;
end;

procedure Salvar(id, t, pad, novo:Integer; temTipo:boolean);
    var Bco : TBco;
begin
  Bco := TBco.Create;
  if temTipo then
  begin
    if DM5.cdsOCcli.Locate('codpad', pad, [loCaseInsensitive]) then
      Bco.Ocorre_Cliente_Altera(id,t, pad, novo)
    else
      Bco.Ocorre_Cliente_Insere(id,t, pad, novo);
  end
  else Bco.Ocorre_Cliente_Insere(id,t, pad, novo);

  Bco.Destroy;
end;

procedure Apagar(id, t, pad:Integer; temTipo:boolean);
    var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Ocorre_Cliente_Apaga(id,t, pad);
  Bco.Destroy;
end;


procedure SalvarTudo();
  var existe : boolean;
begin
  with OcorreCli do
  begin
    existe := false;
    existe := (TipoOC(1)>0);
    Tab1.First;
    while not Tab1.Eof do
    begin
      if Tab1novoNum.Value > 0 then
        Salvar(idGrupo, 1, Tab1pNum.Value, Tab1novoNum.Value, existe)
      else Apagar(idGrupo, 1, Tab1pNum.Value, existe);
      Tab1.Next;
    end;
    Tab1.First;

    existe := (TipoOC(2)>0);
    Tab2.First;
    while not Tab2.Eof do
    begin
      if Tab2numCli.Value > 0 then
        Salvar(idGrupo, 2, Tab2pCod.Value, Tab2numCli.Value, existe)
      else Apagar(idGrupo, 2, Tab2pCod.Value, existe);

      Tab2.Next;
    end;
    Tab2.First;

  end;
end;

procedure TOcorreCli.btSalvarClick(Sender: TObject);
begin
  SalvarTudo;
end;

procedure TOcorreCli.Entrar(sCli:String; LigG:Integer);
  var Bco : TBco;
begin
  idGrupo :=  LigG;
  lbCli.Caption := sCli;
  Iniciar_INT();
  Iniciar_OC();
  Bco := TBco.Create;
  Bco.Ocorre_Cliente_Mostra(idGrupo);
  Bco.Destroy;
  if DM5.cdsOCcli.RecordCount >0 then
  begin
    Carregar_INT;
    Carregar_OC;
  end;

end;

procedure TOcorreCli.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Tab1novoNum.Value > 0) then
  if not (gdSelected in State) then
  begin
    JvDBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TOcorreCli.JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Tab2numCli.Value > 0) then
  if not (gdSelected in State) then
  begin
    JvDBGrid2.Canvas.Brush.Color := clMoneyGreen;
    JvDBGrid2.Canvas.FillRect(rect);
    JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

end.
