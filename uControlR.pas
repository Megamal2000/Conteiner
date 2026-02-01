unit uControlR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls, StdCtrls,
  Buttons, ExtCtrls, ImgList, Menus;

type
  TControlR = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbOK: TLabel;
    Label2: TLabel;
    lbNAO: TLabel;
    btExcel: TBitBtn;
    btAtual: TBitBtn;
    dtRoma: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Entregue1: TMenuItem;
    NoEntregue1: TMenuItem;
    ImageList1: TImageList;
    btVerifica: TBitBtn;
    procedure btAtualClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Entregue1Click(Sender: TObject);
    procedure NoEntregue1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btVerificaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ControlR: TControlR;


implementation

{$R *.dfm}

uses uDM3, uDM2,  uBanco, uControlT, uAguarde;

procedure Conta;

var conta_ok, conta_nao : integer;

begin
  conta_ok := 0;
  conta_nao:= 0;

  DM3.vcC1.First;
  while not DM3.vcC1.Eof do
  begin
    if (DM3.vcC1STATUS_DEV.Value = 0) then conta_nao := conta_nao + 1;
    if (DM3.vcC1STATUS_DEV.Value = 1) then conta_ok  := conta_ok  + 1;

    DM3.vcC1.Next;
  end;

  ControlR.lbOK.Caption  := IntToStr(conta_ok);
  ControlR.lbNAO.Caption := IntToStr(conta_nao);

end;


procedure Atualiza();

var Bco : TBco;
    Posicao : TBookMark;

begin
  with ControlR do
  begin
    Bco := TBco.Create;
    Bco.Controle_Mostra_Romaneios(dtRoma.DateTime);
    Bco.Destroy;
    Conta;
  end;
end;

procedure Marca(n : smallint);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Controle_Altera_StatusENT(DM3.vcC1num.Value, n);
  Bco.Destroy;
end;


procedure TControlR.btAtualClick(Sender: TObject);
begin
    Aguarde.ShowModal;
    if (Aguarde.ModalResult = mrOk) then Atualiza;
end;

procedure TControlR.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if Column.Field=DM3.vcC1STATUS_DEV then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);

    // Desenha o Quadrado
    ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,2);

    // Desenha o check sobre o quadrado quando ativo = ‘S’
    if DM3.vcC1STATUS_DEV.Value = 1 then //' then // Cadastro está ativo
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1)
    else
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);
  end;

end;

procedure TControlR.Entregue1Click(Sender: TObject);
begin
  Marca(1);
  Atualiza;
end;

procedure TControlR.NoEntregue1Click(Sender: TObject);
begin
  Marca(0);
  Atualiza;
end;

procedure TControlR.JvDBGrid1DblClick(Sender: TObject);
begin
  ControlT.Show;
  ControlT.Entra(DM3.vcC1Romaneio.AsInteger);

end;

procedure TControlR.btVerificaClick(Sender: TObject);

var Qt : Integer;
    Bco : TBco;
begin
  if (DM3.vcC1.RecordCount > 0) then
  begin
    DM3.vcC1.First;
    while not DM3.vcC1.Eof do
    begin
        qt := DM2.Conta('Tb_NOTAF', 'nRoma = '+DM3.vcC1NUM.AsString+ ' and nOcorr <> 2 and nOcorr <> 3 and Status_Tkt = 0');
        if (Qt = 0) then
        begin
          Bco := TBco.Create;
          Bco.Controle_Altera_StatusENT(DM3.vcC1NUM.Value, 1);
          Bco.Destroy;
        end;
    end;
  end;
end;

end.
