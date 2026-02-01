unit uControlT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Menus, ImgList, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, StdCtrls, Buttons, ExtCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, System.ImageList;

type
  TControlT = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lbQt: TLabel;
    btAtual: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Entregue1: TMenuItem;
    NoEntregue1: TMenuItem;
    DataSource1: TDataSource;
    Label3: TLabel;
    edNota: TEdit;
    edRm: TEdit;
    Lista: TListBox;
    Label4: TLabel;
    edPT: TEdit;
    btPT: TSpeedButton;
    Label5: TLabel;
    edKm: TEdit;
    Label6: TLabel;
    btScan: TSpeedButton;
    ListBox1: TListBox;
    procedure btAtualClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edNotaKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edRmKeyPress(Sender: TObject; var Key: Char);
    procedure edRmEnter(Sender: TObject);
    procedure btPTClick(Sender: TObject);
    procedure edPTKeyPress(Sender: TObject; var Key: Char);
    procedure edKmKeyPress(Sender: TObject; var Key: Char);
    procedure btScanClick(Sender: TObject);
    procedure JvDBGrid1AfterPaint(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entra(NumR : Integer);
    
  end;

var
  ControlT: TControlT;
  nRoma : integer;
  ContaRD : integer;

implementation

{$R *.dfm}

uses uDM3,uDM2,  uDM1, uBanco, uRoma, uScanner, uAguarde, uNotas, uRastreio, Global;


procedure Conta_ReentDevol();

var Bco : TBco;
    conta : Integer;

begin
  conta   := 0;
  ContaRD := 0;
  if (DM3.vcC2.RecordCount > 0) then
  begin
    Bco := TBco.Create;
    DM3.vcC2.First;
    while not DM3.vcC2.Eof do
    begin
      if (DM3.vcC2tipo.Value = 2) or (DM3.vcC2tipo.Value = 3) then conta := conta + 1;
      DM3.vcC2.Next;
    end;
    Bco.Destroy;
    DM3.vcC2.First;
  end;

  ContaRD := conta;
end;

procedure Atualiza();

var Bco : TBco;
    Posicao : TBookMark;
    numR : Integer;
    Rm : TRoma;
    qt : Integer;
    PesqDT : TDateTime;
    PesqNum, ano : Integer;

begin
  Posicao := DM3.vcC2.GetBookmark;
  with ControlT do
  begin
    Rm := Troma.Create;
    numR := Rm.Pesquisa_Romaneio(edRm.Text);
    Rm.Destroy;

    Bco := TBco.Create;
    Bco.Romaneio_MostraNum(numR);
    Bco.Destroy;

    nRoma := 0;
    if (Dm1.cdsRoma.Active) then
    if (DM1.cdsRoma.RecordCount > 0) then
    begin
      edKm.Text := DM1.cdsRomaKM.AsString;
      JvDBGrid1.Visible := true;

      Bco := TBco.Create;
      Bco.Controle_Mostra_Ticket(numR);
      Bco.Destroy;
      nRoma := numR;

      Conta_ReentDevol;

      qt := DM2.Conta('Tb_NOTAF', 'nRoma = '+intToStr(nRoma)+ ' and Status_Tkt = 0');
      qt := qt - ContaRD;
      lbQt.Caption := IntToStr(qt);
      
      if (Qt < 1) then
      begin
        Bco := TBco.Create;
        Bco.Controle_Altera_StatusENT(nRoma, 1);
        Bco.Destroy;
        lbQt.Caption := '0';
      end;
    end
    else
    begin
      JvDBGrid1.Visible := false;
      edKm.Text := '';
    end;
  end;
  DM3.vcC2.GotoBookmark(Posicao);
  if (DM3.vcC2.RecordCount >0) then ControlT.edNota.SetFocus;
end;




procedure TControlT.btAtualClick(Sender: TObject);
begin
  Atualiza;
end;

procedure TControlT.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Romaneio_MostraUlt;
  Bco.Controle_Mostra_Ticket(DM1.cdsRomaNUM.value);
  Bco.Destroy;

  edRm.SetFocus;
  edRm.text := '';
  edNota.Text := '';
end;

function SoNumeros(no : String): Integer;

var i, p : Integer;
    s : String;
begin
  s := '';
  p := pos('-', no)-1;
  if (p > 0) then s := copy(no, 1, p) else s := no;
  i := StrToInt(s);
  SoNumeros := i;

end;

procedure TControlT.edNotaKeyPress(Sender: TObject; var Key: Char);

var n, idNota : Integer;
    Bco : TBco;
    achei, normal : boolean;
    Rast : TRastreio;

begin

  if(key = #13) then
  if (Length(edNota.Text)>0) then
  begin

    // Existe Romaneio selecionado???
    if (DM3.vcC2.RecordCount > 0) then
    begin
      // Retira o hifen se existir
      n := SoNumeros(edNota.Text);
      DM3.vcC2.First;
      achei := false;

      while not achei and not DM3.vcC2.Eof do
      begin
        if (DM3.vcC2numnf.Value = n) then
        begin
          achei  := true;
          idNota := DM3.vcC2IDNF.Value;
          normal := (DM3.vcC2tipo.Value = 1);

          // EVENTO NF - Rastreio
          Rast := TRastreio.Create;
          Rast.set_ocorID(DM3.vcC2IDNF.Value, idUser, evrTicado );
          Rast.Destroy;

        end;
        DM3.vcC2.Next;
      end;

      if (achei) then
      begin

        // Alterada dia: 13/08/2012

        if not (normal) then
        if MessageDlg('Nota MARCADA como NÂO ENTREGUE.'+#13+ 'Deseja corrigí-la?',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Bco := TBco.Create;
          Bco.Notas_Entregas_Ocorr(idNota, 'Entrega Realizada Normalmente **', 'Sim', 1);
          Bco.Destroy;
          normal := true;
        end;

        if (normal) then
        begin
          Bco := TBco.Create;
          Bco.Controle_Altera_StatusTkt(n, nRoma,1);
          Bco.Destroy;

          Atualiza;
        end;
      end
      else
      begin
        Lista.Items.Append(IntToStr(n));
        if (DM2.Conta('TB_NOTAF', 'numnf = '+IntToStr(n)+' and nRoma = '+IntToStr(nRoma))= 0) then
          ShowMessage('Nota '+IntToStr(n)+ ' não pertence a este Romaneio')
        else
          ShowMessage('Nota '+IntToStr(n)+ ' não foi baixada');

        beep; beep;
      end;

      // Atualiza a Lista
      edNota.Text := '';
      Atualiza;
    end
    else ShowMessage('Selecione um Romaneio');

  end;
  if not(Key in ['0'..'9',Chr(8), '-']) then Key := #0;
  edNota.SetFocus;
end;

procedure TControlT.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.Field=DM3.vcC2STATUS_TKT then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);

    // Desenha o Quadrado
    ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,2);

    if (DM3.vcC2tipo.Value <> 2) and (DM3.vcC2tipo.Value <> 3) then
    begin
      // Desenha o check sobre o quadrado quando ativo = ‘S’
      if DM3.vcC2STATUS_TKT.Value = 1 then // ok já visto
        ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);

      if DM3.vcC2STATUS_TKT.Value = 0 then // Nao visto
        ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);
    end;
  end
  else
  begin
    if not (gdSelected in State) then
    if (DM3.vcC2tipo.Value = 2) or (DM3.vcC2tipo.Value = 3)  then
    begin
      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
      JvDBGrid1.Canvas.Font.Color := clGray;
    end
    else
    begin

      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := [];
      if (DM3.vcC2STATUS_TKT.Value = 1) then JvDBGrid1.Canvas.Font.Color := clGray
        else JvDBGrid1.Canvas.Font.Color := clBlue;
    end;


    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);

  end;


end;

procedure TControlT.edRmKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then Atualiza;
  if not(Key in ['0'..'9',Chr(8),'/']) then Key := #0;
end;

procedure TControlT.edRmEnter(Sender: TObject);
begin
  edRm.Text := '';
end;

procedure Ponto();

var Bco : TBco;

begin
  if (ControlT.edPT.Text <> '') then
  begin
    Bco := TBco.Create;
    Bco.Relatorio_GravaPonto(DM3.vcC2IDNF.Value , StrToInt(ControlT.edPT.Text));
    Bco.Destroy;
    ControlT.edPT.Text := '';
    Atualiza;
  end;
end;

procedure Km();

var Bco : TBco;
    numR : Integer;
    Rm : TRoma;

begin
  if (ControlT.edKm.Text <> '') then
  begin
    Rm := Troma.Create;
    numR := Rm.Pesquisa_Romaneio(ControlT.edRm.Text);
    Rm.Destroy;

    Bco := TBco.Create;
    Bco.Pagamento_AlterarKm(numR , 2,StrToInt(ControlT.edKm.Text));
    Bco.Destroy;

    ControlT.edKm.Font.Color := clBlack;
  end;
end;

procedure TControlT.btPTClick(Sender: TObject);

begin
  Ponto;
end;

procedure TControlT.edPTKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Ponto;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TControlT.edKmKeyPress(Sender: TObject; var Key: Char);
begin
  edKm.Font.Color := clRed;
  if (Key = #13) then Km;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TControlT.Entra(NumR: Integer);
begin
  edRm.Text := IntToStr(NumR);
  Atualiza;
end;

procedure TControlT.btScanClick(Sender: TObject);

var ScanArq : TScan;
    Bco : Tbco;
begin
  ScanArq := TScan.Create;
  ScanArq.Iniciar;
  ScanArq.Le_Dir(ListBox1);

  if (DM3.vcC2.RecordCount > 0) then
  begin
    Bco := TBco.Create;
    DM3.vcC2.First;
    while not DM3.vcC2.Eof do
    begin
      Bco.Notas_MostraId(DM3.vcC2IDNF.Value);
      ScanArq.baixa(DM3.vcC2numnf.Value, DM3.vcC2IDNF.Value, DM3.vcC2nroma.Value,  DM1.cdsNotasLIGCLI.Value , DM1.cdsNotasORIGEM.Value , ListBox1);
      DM3.vcC2.Next;
    end;
    Bco.Destroy;
    DM3.vcC2.First;
  end
  else ShowMessage('Selecione um Romaneio');
  ScanArq.Destroy;

  Atualiza;

end;

procedure TControlT.JvDBGrid1AfterPaint(Sender: TObject);
begin
  Aguarde.Hide;  
end;

procedure TControlT.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM3.vcC2IDNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

end.
