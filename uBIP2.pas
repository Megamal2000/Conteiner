unit uBIP2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, JvMemoryDataset,
  JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, uBIPclass;

type
  TBIP2 = class(TForm)
    PanelInic: TPanel;
    Panel2: TPanel;
    PanelFim: TPanel;
    JvDataSource1: TJvDataSource;
    Tab: TJvMemoryData;
    Memo1: TMemo;
    JvDBGrid2: TJvDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    dtEntra: TDateTimePicker;
    btIniciar: TBitBtn;
    lbEntra: TLabel;
    edNum: TEdit;
    Label4: TLabel;
    btConfere: TBitBtn;
    btImprime: TBitBtn;
    btFinal: TBitBtn;
    lbNotas: TLabel;
    lbVol: TLabel;
    TabtNota: TIntegerField;
    TabtVol: TIntegerField;
    TabAlterado: TSmallintField;
    DataSource2: TDataSource;
    JvDBGrid1: TJvDBGrid;
    procedure btIniciarClick(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btFinalClick(Sender: TObject);
  private
    { Private declarations }
    bip : TBIP;
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  BIP2: TBIP2;

implementation

{$R *.dfm}

uses uDM5;


procedure tabInsereNota(numnf:Integer);

var achei : boolean;

begin
   achei := false;

   with BIP2 do
   begin
    // procura Nota
    Tab.First;
    while not tab.Eof and not achei do
    begin
      if (TabtNota.Value = numnf) then
      begin
        achei := true;
        Tab.Edit;
        TabtVol.Value := TabtVol.Value + 1;
        TabAlterado.Value := 2;
        Tab.Post;
      end
      else  tab.Next;
    end;
    if not achei then
    begin
      Tab.Insert;
      TabtNota.Value := numnf;
      TabtVol.Value := 1;
      TabAlterado.Value := 1;
      Tab.Post;
    end;

    // insere
  end;
end;

procedure ConverteNF(sNF:String);
   var sn : String;
       nNF : Integer;

begin
  // ---- Converte a NF
  BIP2.bip := TBip.Create;
  nNF := BIP2.bip.ConverteNumeroNota(sNF);
  BIP2.bip.Destroy;

  // --- Verifica a conversão
  if (nNF > 0) then
  begin
    BIP2.Memo1.Lines.Append('Nota: ' + nNF.ToString + FormatDateTime(' HH:mm', Now));
    tabInsereNota(nNF);
    BIP2.Tab.First;
  end
  else
    BIP2.Memo1.Lines.Append('ERRO: (' + nNF.ToString + ') '+sNF);

end;



procedure tabInsereVolume();
begin

end;

procedure tabAtualiza();
begin

end;

procedure tab();
begin

end;

procedure Mostra_Entradas();
begin
 with BIP2 do
 begin
  bip := TBIP.Create;
  bip.Iniciar(dtEntra.DateTime);
  bip.Destroy;
 end;

end;

procedure Limpar();
begin
  with BIP2 do
  begin
    lbEntra.Caption := '';
    lbNotas.Caption := '';
    lbVol.Caption   := '';
    PanelFim.Visible := false;
    PanelInic.Visible:= true;
    edNum.Text := '';
    Memo1.Clear;

  end;
end;

procedure TBIP2.btFinalClick(Sender: TObject);


begin
  Tab.SortOnFields('tNota',false,false);
  Tab.Refresh;
  bip := TBIP.Create;
  //===== continuar  ===== bip.set_idBIP(DM5.cdsBIP);
  Tab.First;
  while not Tab.eof do
  begin

    if TabAlterado.Value < 10  then
    begin
      // 0 inserir novo
      if TabAlterado.Value = 0  then
      begin

      end;
      // 1 alterar
      if TabAlterado.Value = 1  then
      begin

      end;
      // 9 apagar
      if TabAlterado.Value = 0  then
      begin

      end;
      Tab.Edit;
      TabAlterado.Value := TabAlterado.Value + 10;
      Tab.Post;


      {
      bip := TBIP.Create;
      bip.Iniciar(dtEntra.DateTime);
      bip.Destroy;
      }
    end;


    Tab.Next;
  end;
end;

procedure TBIP2.btIniciarClick(Sender: TObject);
begin
  bip := TBIP.Create;
  bip.Iniciar(dtEntra.DateTime);
  bip.Destroy;
  lbEntra.Caption := FormatDateTime('dd/MM/yyyy ddd', dtEntra.DateTime);
  PanelFim.Visible := true;
  PanelInic.Visible:= false;
  btConfere.Visible:= false;
  btImprime.Visible:= false;

  edNum.Text := '';
  edNum.SetFocus;
  Memo1.Clear;
  Memo1.Lines.Append('[Início] '+ FormatDateTime('dd/MMM/yyyy ddd HH:mm', Now) );

  tab.Active := false;
  tab.EmptyTable;
  tab.Active := true;

  if DM5.cdsBIP2nf.RecordCount > 0 then
  begin
    Memo1.Lines.Append('[carregado do Arquivo] '+ FormatDateTime('dd/MMM/yyyy ddd HH:mm', Now) );

    DM5.cdsBIP2nf.First;
    while not DM5.cdsBIP2nf.Eof do
    begin
      Tab.Insert;
      TabtNota.Value := DM5.cdsBIP2nfENUMNF.Value;
      TabtVol.Value := DM5.cdsBIP2nfEVOL.Value;
      TabAlterado.Value := 0;
      Tab.Post;

      DM5.cdsBIP2nf.Next;
    end;
  end;



end;

procedure TBIP2.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    if length(edNum.Text)>0 then
      ConverteNF(edNum.Text);
    edNum.Text := '';
  end;
end;

procedure TBIP2.Entrar;
begin
  Limpar;
  dtEntra.DateTime := Now;
  Mostra_Entradas;
end;

procedure TBIP2.JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdSelected in State) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    //DBGrid1.Canvas.Font.Style := DBGrid1.Canvas.Font.Style + [fsitalic];

    if (TabAlterado.Value = 0) then JvDBGrid2.Canvas.Font.Color := clGray;
    if (TabAlterado.Value = 1) then JvDBGrid2.Canvas.Font.Color := clRed;
    if (TabAlterado.Value = 2) then JvDBGrid2.Canvas.Font.Color := clMaroon;
    JvDBGrid2.Canvas.FillRect(rect);
    JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);

  end;
end;

end.
