unit uRomaSem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls, JvExDBGrids,
  JvDBGrid, JvExStdCtrls, JvEdit, JvValidateEdit, Menus;

type
  TRomaSem = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    lbSEM: TLabel;
    btEsq: TSpeedButton;
    btDir: TSpeedButton;
    lbPag: TLabel;
    DataSource1: TDataSource;
    JvDBGrid1: TJvDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    vPag: TJvValidateEdit;
    PopupMenu1: TPopupMenu;
    ApagarNota1: TMenuItem;
    iNumNF: TJvValidateEdit;
    lbResp: TLabel;
    Label2: TLabel;
    DescartarNotas1: TMenuItem;
    procedure btEsqClick(Sender: TObject);
    procedure btDirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure vPagKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure ApagarNota1Click(Sender: TObject);
    procedure iNumNFKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure DescartarNotas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  RomaSem: TRomaSem;
  PagAtual, Max, nNotas, nMostra : Integer;
  posicao:TBookMark;

implementation

{$R *.dfm}
uses uDM1, uDM2, uBanco, uNotas, uPrinc, uRastreio;



procedure TRomaSem.Entrar;

var Bco : TBco;

begin
  PagAtual := 1;
  nNotas   := DM2.Conta('TB_NOTAF', 'nRoma = 0 and (select TB_NOTAF_OBS.id from TB_NOTAF_OBS where TB_NOTAF_OBS.LIGNF =TB_NOTAF.id) is null');
  nMostra  := 18;
  Max      := nNotas div nMostra;
  if (nNotas mod nMostra)>0 then Max := Max + 1;

  lbSEM.Caption := IntToStr(nNotas);
  lbPag.Caption := '1';

  Bco := TBco.Create;
  Bco.Romaneio_NotasSEM(PagAtual);
  Bco.Destroy;
end;

procedure Pagina(num : Integer);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Romaneio_NotasSEM(num);
  Bco.Destroy;

  RomaSEM.lbPag.Caption := IntToStr(num);
end;


procedure TRomaSem.btEsqClick(Sender: TObject);
begin
  PagAtual := PagAtual - 1;
  if (PagAtual < 1) then PagAtual := 1;
  Pagina(PagAtual);
end;

procedure TRomaSem.DescartarNotas1Click(Sender: TObject);

var Bco : TBco;
    idUsuario : Integer;
    i : integer;
    mens : String;
    Rast : TRastreio;

begin
  if JvDBGrid1.SelectedRows.Count=1 then mens := 'DESCARTAR a Nota '+DM1.cdsSEMNUMNF.AsString;
  if JvDBGrid1.SelectedRows.Count>1 then mens := 'DESCARTAR '+JvDBGrid1.SelectedRows.Count.ToString + ' notas';


  if MessageDlg(mens+#13+'Tem certeza que deseja descartar?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idUsuario := StrToInt( Princ.LbUserID.Caption );
      Posicao := DM1.cdsSEM.GetBookmark;
      Bco := TBco.Create;

      // Apaga selecionados
    if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));

        Bco.Rotas_adm_passaRota(DM1.cdsSEMID.Value, -1);

        // EVENTO NF - Rastreio
        Rast := TRastreio.Create;
        Rast.set_ocor(DM1.cdsSEMNUMNF.Value, DM1.cdsSEMLigCli.Value,0, evrDescarteSEM, idUsuario);
        Rast.Destroy;

      end;


      if (pagAtual > 0) then
        Bco.Romaneio_NotasSEM(PagAtual);
      Bco.Destroy;
      DM1.cdsSEM.GotoBookmark(Posicao);
    end;
end;

procedure TRomaSem.btDirClick(Sender: TObject);
begin
  PagAtual := PagAtual + 1;
  if (PagAtual > Max) then PagAtual := Max;
  Pagina(PagAtual);
end;

procedure TRomaSem.SpeedButton1Click(Sender: TObject);
begin
  PagAtual := 1;
  Pagina(PagAtual);
end;

procedure TRomaSem.SpeedButton2Click(Sender: TObject);
begin
  PagAtual := Max;
  Pagina(PagAtual);
end;

procedure TRomaSem.vPagKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
    PagAtual := vPag.value;
    if (PagAtual < 1) then PagAtual := 1;
    if (PagAtual > Max) then PagAtual := Max;
    Pagina(PagAtual);
  end;
end;

procedure TRomaSem.JvDBGrid1DblClick(Sender: TObject);

begin
  NotasP.Entrar;
  NotasP.set_idNota(DM1.cdsSEMID.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TRomaSem.ApagarNota1Click(Sender: TObject);

var Bco : TBco;
    idUsuario : Integer;
    i : integer;
    mens : String;
    Rast : TRastreio;

begin
  if JvDBGrid1.SelectedRows.Count=1 then mens := 'Apagar a Nota '+DM1.cdsSEMNUMNF.AsString;
  if JvDBGrid1.SelectedRows.Count>1 then mens := 'Apagar '+JvDBGrid1.SelectedRows.Count.ToString + ' notas';


  if MessageDlg(mens+#13+'Tem certeza que deseja apagar?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      idUsuario := StrToInt( Princ.LbUserID.Caption );
      Posicao := DM1.cdsSEM.GetBookmark;
      Bco := TBco.Create;

      // Apaga selecionados
    if JvDBGrid1.SelectedRows.Count>0 then
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Bco.Notas_Anotar(DM1.cdsSEMNUMNF.Value, idUsuario);
        Bco.Notas_Apagar(DM1.cdsSEMID.Value);
        if DM2.Conta('TB_NOTAF', 'Ligcli = '+DM1.cdsSEMLIGCLI.AsString+ ' and NumNF = '+DM1.cdsSEMNUMNF.AsString) = 0 then
          Bco.Notas_Unica_AltStatus(DM1.cdsSEMNUMNF.Value, DM1.cdsSEMLIGCLI.Value, 11);
        Rast := TRastreio.Create;
        Rast.set_ocor(DM1.cdsSEMNUMNF.Value, DM1.cdsSEMLigCli.Value,0, evrApagarSemRoma, idUsuario);
        Rast.Destroy;

      end;

      if (pagAtual > 0) then
        Bco.Romaneio_NotasSEM(PagAtual);
      Bco.Destroy;
      DM1.cdsSEM.GotoBookmark(Posicao);
    end;
end;

Procedure ProcuraNF(n:Integer);
begin
  DM1.cdsSEM.IndexFieldNames := 'NUMNF';
  if (DM1.cdsSEM.FindKey([n]) ) then
  begin
    RomaSem.lbResp.Font.Color := clBlue;
    RomaSem.lbResp.Caption := 'OK';
  end
  else
  begin
    RomaSem.lbResp.Font.Color := clRed;
    RomaSem.lbResp.Caption := 'NÃO encontrado';
  end;

end;


procedure TRomaSem.iNumNFKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key =#13) then ProcuraNF(iNumNF.AsInteger);
end;

procedure TRomaSem.JvDBGrid1TitleClick(Column: TColumn);
begin
  DM1.cdsSEM.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

end.
