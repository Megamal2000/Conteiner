unit uNFenvio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ComCtrls, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid,
  Vcl.ExtCtrls;

type
  TNFenvio = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    dia: TDateTimePicker;
    btPesq: TBitBtn;
    Label3: TLabel;
    nQt1: TLabel;
    Label5: TLabel;
    nQt2: TLabel;
    Label7: TLabel;
    nQT3: TLabel;
    Label9: TLabel;
    nQT4: TLabel;
    Label11: TLabel;
    nQT5: TLabel;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure JvDBGrid2TitleClick(Column: TColumn);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  NFenvio: TNFenvio;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5, uNotas;

procedure Limpar();
begin
  NFEnvio.nQt1.Caption := '';
  NFEnvio.nQt2.Caption := '';
  NFEnvio.nQt3.Caption := '';
  NFEnvio.nQt4.Caption := '';
  NFEnvio.nQt5.Caption := '';
end;

procedure Pesq1(idC:Integer; dat:TDatetime);
  var Bco : TBco;
begin
  bco := TBco.Create;
  Bco.Notas_OCOREN(dat, idC);
  Bco.Destroy;
end;

procedure Pesq2(idC:Integer; dat:TDatetime);
  var Bco : TBco;
begin
  bco := TBco.Create;
  Bco.Notas_TodasDia(dat, idC);
  Bco.Destroy;
end;

procedure AbrirNF(iNF:Integer);
begin
  NotasP.Entrar;
  NotasP.Show;
  NotasP.set_idNota(iNF);
  NotasP.AbreNf;
end;


{ TNFenvio }

procedure TNFenvio.btPesqClick(Sender: TObject);
  var nCli:Integer;
      v1, v2, v3, v4,v5 : Integer;
begin
  nCli := DM2.DBCp_leid(cbCli.Items[cbCli.itemIndex], 'TB_Cliente', 'NOME');
  Pesq1(nCli, dia.DateTime);
  Pesq2(nCli, dia.DateTime-1);

  NFEnvio.nQt1.Caption := '0';
  NFEnvio.nQt2.Caption := '0';
  NFEnvio.nQt3.Caption := '0';
  NFEnvio.nQt4.Caption := '0';
  NFEnvio.nQt5.Caption := '0';
  v1:=0; v2:=0; v3:=0; v4:=0; v5:=0;
  v1 := DM5.cdsNfenvia.RecordCount;
  v4 := DM5.cdsNFdia.RecordCount;
  // Totalizando
  if v1 > 0 then
  begin
    DM5.cdsNfenvia.First;
    while not DM5.cdsNfenvia.Eof do
    begin
      if (length(DM5.cdsNfenviaDTOCOREN.AsString) > 3) then v2 := v2 + 1
        else v3 := v3 + 1;
      DM5.cdsNfenvia.Next;
    end;
    DM5.cdsNfenvia.First;
  end;

  if v4 > 0 then
  begin
    DM5.cdsNfdia.First;
    while not DM5.cdsNfdia.Eof do
    begin
      if (DM5.cdsNFdiaROMANEIO.Value =0) then v5 := v5 + 1;
      DM5.cdsNfdia.Next;
    end;
    DM5.cdsNfdia.First;
  end;

  NFEnvio.nQt1.Caption := '('+FormatDateTime('dd/MM', dia.DateTime)+ ') '+ v1.ToString;
  NFEnvio.nQt2.Caption := v2.ToString;
  NFEnvio.nQt3.Caption := v3.ToString;
  NFEnvio.nQt4.Caption := '('+FormatDateTime('dd/MM', dia.DateTime-1)+ ') '+ v4.ToString;
  NFEnvio.nQt5.Caption := v5.ToString;

end;

procedure TNFenvio.Entrar;
begin
  // Configura Clientes
  cbCli.Clear;
  cbCli.Items.Append('<TODOS>');
  DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
  cbCli.ItemIndex := 0;
  // data
  dia.DateTime := Now;
  limpar;
end;

procedure TNFenvio.JvDBGrid1DblClick(Sender: TObject);
begin
  AbrirNF(DM5.cdsNfenviaIDNF.Value);
end;

procedure TNFenvio.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if length(DM5.cdsNfenviaDTOCOREN.AsString)<3 then
  if not (gdSelected in State) then
  begin
    JvDBGrid1.Canvas.Brush.Color := clYellow;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TNFenvio.JvDBGrid1TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM5.cdsNFenvia.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TNFenvio.JvDBGrid2DblClick(Sender: TObject);
begin
  AbrirNF(DM5.cdsNfdiaIDNF.Value);
end;

procedure TNFenvio.JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DM5.cdsNFdiaROMANEIO.Value = 0) then
  if not (gdSelected in State) then
  begin
    JvDBGrid2.Canvas.Brush.Color := clYellow;
    //JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid2.Canvas.FillRect(rect);
    JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;
end;

procedure TNFenvio.JvDBGrid2TitleClick(Column: TColumn);
begin
  // Marca a Coluna e Ordena
  DM5.cdsNFdia.IndexFieldNames := Column.FieldName;
  JvDBGrid2.SortedField := Column.FieldName;
end;

end.
