unit uBIPnota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, JvDataSource, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid;

type
  TBIPnota = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    StatusBar1: TStatusBar;
    Bevel1: TBevel;
    btInic: TBitBtn;
    btFim: TBitBtn;
    btCorrige: TBitBtn;
    Bevel2: TBevel;
    Panel3: TPanel;
    Label2: TLabel;
    lbBdia: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbBtotal: TLabel;
    lbBconf: TLabel;
    lbBmail: TLabel;
    btRel: TBitBtn;
    ckSimples: TCheckBox;
    Label3: TLabel;
    edCod: TEdit;
    MemoRel: TMemo;
    lbResposta: TLabel;
    procedure btInicClick(Sender: TObject);
    procedure edCodKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  BIPnota: TBIPnota;
  tot, totConfere, totMais:Integer;

implementation

{$R *.dfm}

uses uBanco, uDM2, uDM5;


procedure Mostra_Dias;

  var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Unica_MostraQT(0);
  Bco.Destroy;
end;

procedure Mostra_Notas;

  var Bco : TBco;

begin

    Bco := TBco.Create;
    Bco.Notas_Unica_BIPnotas(DM5.cdsBIPtDTCRIADA.AsDateTime);
    Bco.Destroy;
end;


procedure Mostra_Totais;

  var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Unica_BIPtotais(DM5.cdsBIPtDTCRIADA.AsDateTime);
  Bco.Destroy;
  tot := 0;
  totConfere := 0;
  totMais := 0;

  DM2.cdsTMP.First;
  while not DM2.cdsTMP.eof do
  begin
    if (DM2.cdsTMP.Fields[0].Value = 2) then totConfere := DM2.cdsTMP.Fields[1].Value;
    if (DM2.cdsTMP.Fields[0].Value = 3) then totMais := DM2.cdsTMP.Fields[1].Value;
    tot := tot + DM2.cdsTMP.Fields[1].Value;

    DM2.cdsTMP.Next;
  end;

end;

procedure Iniciar();
begin
  with BIPnota do
  begin
    ckSimples.Checked := true;

    lbBdia.Caption := '';
    lbBtotal.Caption := '';
    lbBconf.Caption := '';
    lbBmail.Caption := '';
    Panel3.Visible := false;

    edCod.Text := '';
    edCod.SetFocus;

    Mostra_Dias;
  end;
end;

procedure Exec1_escolheDia();
begin
  with BIPnota do
  begin
    Mostra_Totais;

    lbBdia.Caption := FormatDateTime('dd/MM/yyyy ddd', DM5.cdsBIPtDTCRIADA.AsDateTime) + ' / Notas: '+DM5.cdsBIPtNTS.AsString;
    lbBtotal.Caption := tot.ToString;
    lbBconf.Caption := totConfere.ToString;
    lbBmail.Caption := totMais.ToString;
    Panel3.Visible := true;

    edCod.Text := '';
    edCod.SetFocus;

    lbresposta.Caption := 'Nota encontrada OK';

    Mostra_Notas;
  end;
end;

function ProcuraNota(sNum:String): boolean;

  var nNF, volNovo, BIPstatus:Integer;
      resp : boolean;
      Bco : TBco;
      s : String;

begin
  resp   := false;
  nNF := 0;
  s := sNum;
  if Pos('-', sNum) >0   then s:= copy(sNum, 1,  Pos('-', sNum) - 1);
  if Pos('WEB', sNum) >0   then s:= copy(sNum, 11, Length(Trim(sNum)) - 11);
  if (s <> sNum) then BIPnota.MemoRel.Lines.Append('<Convertido> '+sNum+' para '+s);
   // WEB-43807805922651  - 92265  - 0592265

  // converte para número
  try
    nNF:= StrToInt(s);
  finally
    volNovo := 0;
  end;

  if nNF > 0 then
  begin
    //Procura
    DM5.cdsBIPn.IndexFieldNames := 'NUMNOTA';
    DM5.cdsBIPn.First;
    if DM5.cdsBIPn.Findkey([nNF]) then
    begin
      // Marca o volume
      volNovo := DM5.cdsBIPnBIPVOL.Value + 1;
      if volNovo<DM5.cdsBIPnVOLUME.Value then BIPstatus := 1;
      if volNovo=DM5.cdsBIPnVOLUME.Value then BIPstatus := 2;
      if volNovo>DM5.cdsBIPnVOLUME.Value then BIPstatus := 3;


      Bco := TBco.Create;
      Bco.Notas_Unica_MarcaVol(DM5.cdsBIPnID.Value, volNovo, BIPstatus);
      Bco.Destroy;
      resp := true;
    end;
  end;

  result := resp;
end;



{ TBIPnota }

procedure TBIPnota.btInicClick(Sender: TObject);
begin
  Exec1_escolheDia
end;

procedure TBIPnota.edCodKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    if ProcuraNota(edCod.Text) then
    begin
      MemoRel.Lines.Append('...Nota '+edCod.Text+ ' registrada com SUCESSO');
      Exec1_escolheDia;

    end
    else
    begin
      MemoRel.Lines.Append('...Nota '+edCod.Text+ ' NÃO ENCONTRADA');
      edCod.Text := '';
      lbresposta.Caption := 'nota não Encontrada';
    end;
  end;
end;

procedure TBIPnota.Entrar;
begin
  edCod.SetFocus;
  Iniciar;
end;

procedure TBIPnota.JvDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);

  var cor1, cor2 : Integer;
begin
  // Cores
  cor1 := clBlack; // frente
  cor2 := clWhite; // fundo

  if DM5.cdsBIPnBIPE.Value = 1 then cor2 := clGray;
  if DM5.cdsBIPnBIPE.Value = 2 then cor1 := clGray;
  if DM5.cdsBIPnBIPE.Value = 3 then cor2 := clRed;

   JvDBGrid2.Canvas.Font.Color := cor1;
   JvDBGrid2.Canvas.Brush.Color := cor2;

   JvDBGrid2.Canvas.FillRect(rect);
   JvDBGrid2.DefaultDrawdatacell(Rect,Column.Field ,State);



end;

end.
