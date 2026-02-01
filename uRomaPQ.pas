unit uRomaPQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvMemoryDataset, JvDataSource, Menus;

type
  TRomaPQ = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dtR: TDateTimePicker;
    btPesq: TBitBtn;
    Rodape: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    lbAtual: TLabel;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    TabNUM: TIntegerField;
    TabKM: TSmallintField;
    TabROMANEIO: TIntegerField;
    TabNOME: TStringField;
    TabSEMBAIXA: TIntegerField;
    TabFrete: TFloatField;
    TabPesoR: TFloatField;
    JvDBGrid3: TJvDBGrid;
    JvDataSource2: TJvDataSource;
    Tab2: TJvMemoryData;
    Tab2idC: TIntegerField;
    Tab2NomeC: TStringField;
    Tab2NFtot: TIntegerField;
    Tab2NFfalta: TIntegerField;
    Label2: TLabel;
    rbRoma: TRadioButton;
    rbCli: TRadioButton;
    Tab2LINHA: TSmallintField;
    PopupMenu1: TPopupMenu;
    BaixaporRomaneio1: TMenuItem;
    procedure btPesqClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BaixaporRomaneio1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  RomaPQ: TRomaPQ;

implementation

{$R *.dfm}

uses uBanco, uDM3, uRoman, uAguarde, uDM2, uPrinc, uBaixaRap;

procedure Faz_TabelaFretes;

var Bco   : TBco;

begin
  with RomaPQ do
  begin
    JvDBGrid2.Visible := True;

    Bco := TBco.Create;
    Bco.Romaneio_PesqDT(RomaPq.dtR.DateTime);
    Tab.Active := false;
    Tab.EmptyTable;
    Tab.Active := true;

    DM3.cdsRomaPQ.First;
    while not DM3.cdsRomaPQ.Eof do
    begin
      Tab.Insert;
      TabNUM.Value      := DM3.cdsRomaPQNUM.Value;
      TabKM.Value       := DM3.cdsRomaPQKM.Value;
      TabROMANEIO.Value := DM3.cdsRomaPQROMANEIO.AsInteger;
      TabNOME.Value     := DM3.cdsRomaPQNOME.Value;
      TabSEMBAIXA.Value := DM3.cdsRomaPQSEMBAIXA.Value;
      Tab.Post;

      DM3.cdsRomaPQ.Next;
    end;

    Bco.Romaneio_PesqDT2(RomaPq.dtR.DateTime);

    DM3.cdsRomaPQ.First;
    while not DM3.cdsRomaPQ.Eof do
    begin
      if (Tab.Locate('NUM',DM3.cdsRomaPQNUM.Value, [loCaseInsensitive])) then
      begin
        Tab.Edit;
        TabFrete.Value      := DM3.cdsRomaPQfrete.AsFloat;
        TabPesoR.Value      := DM3.cdsRomaPQPESOR.AsFloat;
        Tab.Post;
      end;

      DM3.cdsRomaPQ.Next;
    end;

    Bco.Destroy;
    //Ordenando a tabela por NOME
     Tab.SortOnFields('Nome',false,false);
     Tab.First;

  end;
end;

procedure PesqCLI;

var Bco : TBco;
    i : Integer;
    falta, notas : Integer;

begin
  with RomaPq do
  begin
  Bco := TBco.Create;
  Bco.Romaneio_PesqDT3(RomaPq.dtR.DateTime);  // Mostra por Cliente
  JvDBGrid3.Visible := true;
  //***************

  Tab2.Active := false;
  Tab2.EmptyTable;
  Tab2.Active := true;

  i := DM3.cdsRomaPq2.RecordCount + 1;
  DM3.cdsRomaPq2.Last;
  while (not DM3.cdsRomaPq2.Bof) do
  begin
    i := i - 1;
    RomaPq.Tab2.Insert;
    RomaPq.Tab2idC.Value   := DM3.cdsRomaPq2IDCLI.Value;
    RomaPq.Tab2NomeC.Value := DM3.cdsRomaPq2NOME.Value;
    RomaPq.Tab2NFtot.Value := DM3.cdsRomaPq2COUNT.Value;
    RomaPq.Tab2NFfalta.Value := 0;
    RomaPq.Tab2LINHA.Value := i;

    RomaPq.Tab2.Post;
    DM3.cdsRomaPq2.Prior;
  end;

  Bco.Romaneio_PesqDT4(RomaPq.dtR.DateTime);  // Mostra por Cliente

  RomaPq.Tab2.First;
  for i := 1 to Tab2.RecordCount do
  begin
    DM3.cdsRomaPq2.First;
    while (not DM3.cdsRomaPq2.Eof) do
    begin
      //REFAZER
      if (RomaPq.Tab2idC.Value = DM3.cdsRomaPq2IDCLI.Value) then
      begin
         RomaPq.Tab2.Edit;
         RomaPq.Tab2NFfalta.Value := DM3.cdsRomaPq2COUNT.Value;
         RomaPq.Tab2.Post;
       end;
      DM3.cdsRomaPq2.Next;
    end;
  Tab2.Next;
  end;
  Bco.Destroy;
  //***************
  falta := 0;
  Notas := 0;
  Tab2.First;
  while not tab2.Eof do
  begin
      falta := falta +Tab2NFfalta.Value;
      Notas := Notas + Tab2NFtot.Value;
    tab2.Next;
  end;

  RomaPq.Rodape.Panels[1].Text := 'Não terminados '+IntToStr(falta)+' de '+IntToStr(Notas)+' notas';


  end;
end;

procedure Pesquisar();

var Bco   : TBco;
    falta : Integer;
    Notas : integer;
    Notas_Tot : Integer;

begin

  //RomaPq.JvDBGrid1.Columns[4].Visible := True;
  //if (DM2.get_usnivel > 3) then RomaPq.JvDBGrid1.Columns[4].Visible := true;
  RomaPq.JvDBGrid3.Visible := false;
  RomaPq.JvDBGrid2.Visible := false;
  Bco := TBco.Create;
  bco.Usuarios_MostraId(StrToInt(Princ.LbUserID.Caption));

 // if (DM2.cdsUserNIVEL.Value >3) then
 //   Faz_TabelaFretes
 // else
  Bco.Romaneio_PesqDT(RomaPq.dtR.DateTime);   // Mostra por Romaneio

  Notas_Tot := Bco.Romaneio_PesqDT_Total(RomaPq.dtR.DateTime);
  Bco.Destroy;

  RomaPq.Rodape.Panels[0].Text := 'Encontrados '+IntToStr(DM3.cdsRomaPQ.RecordCount)+' Romaneios com '+IntToStr(Notas_Tot)+' notas';
  RomaPq.lbAtual.Caption := 'Atualizada em'+#13+FormatDateTime('HH:mm',Now);

  falta := 0;
  Notas := 0;
  DM3.cdsRomaPQ.First;
  while not DM3.cdsRomaPQ.Eof do
  begin
    if (DM3.cdsRomaPQSEMBAIXA.Value > 0) then
    begin
      falta := falta +1;
      Notas := Notas + DM3.cdsRomaPQSEMBAIXA.Value;
    end;
    DM3.cdsRomaPQ.Next;
  end;

  RomaPq.Rodape.Panels[1].Text := 'Não terminados '+IntToStr(falta)+' Romaneios / '+IntToStr(Notas)+' notas';

end;




procedure TRomaPQ.btPesqClick(Sender: TObject);

begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then
      if (rbRoma.Checked) then Pesquisar
        else PesqCLI;
end;

procedure TRomaPQ.Entrar;
begin
  dtR.DateTime := Now;
  Pesquisar;
end;

procedure TRomaPQ.JvDBGrid1DblClick(Sender: TObject);
begin

  if (JvDBGrid2.Visible) then
    Roman.set_idRoma(TabNUM.Value)
  else
    Roman.set_idRoma(DM3.cdsRomaPQNUM.Value);
  Roman.set_MostraNum(true);
  Roman.Entrar;
  Roman.Show;
end;

procedure TRomaPQ.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not (gdSelected in State) then
    begin

      if (DM3.cdsRomaPQSEMBAIXA.AsInteger = 0) then
      begin
        JvDBGrid1.Canvas.Font.Color := clGray;
        JvDBGrid1.Canvas.Font.Style := [fsItalic];
      end
      else
      begin
        JvDBGrid1.Canvas.Font.Color := clRed;
        JvDBGrid1.Canvas.Font.Style := [];
      end;

      JvDBGrid1.Canvas.FillRect(rect);
      JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
    end;

end;

procedure TRomaPQ.JvDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
    if not (gdSelected in State) then
    begin

      if (tabSEMBAIXA.AsInteger = 0) then
      begin
        JvDBGrid2.Canvas.Font.Color := clGray;
        JvDBGrid2.Canvas.Font.Style := [fsItalic];
      end
      else
      begin
        JvDBGrid2.Canvas.Font.Color := clRed;
        JvDBGrid2.Canvas.Font.Style := [];
      end;

      JvDBGrid2.Canvas.FillRect(rect);
      JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);
    end;
end;

procedure TRomaPQ.BaixaporRomaneio1Click(Sender: TObject);
begin

  BaixaRap.Entrar;
  BaixaRap.set_Roma(DM3.cdsRomaPQROMANEIO.AsString);
  BaixaRap.dtBaixa.DateTime :=  dtR.DateTime;
  BaixaRap.Show;
end;

end.
