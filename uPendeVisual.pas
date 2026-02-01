unit uPendeVisual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvDataSource, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TPendVisual = class(TForm)
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btOBS: TBitBtn;
    btRetira: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    lbNF: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    rbReent: TRadioButton;
    rbDevol: TRadioButton;
    btCancel: TBitBtn;
    btOk: TBitBtn;
    procedure btOBSClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure btRetiraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  PendVisual: TPendVisual;

implementation

{$R *.dfm}

uses uBanco, uDM5 , uNotas, uRastreio, Global;

procedure Atualiza();

var Bco :  TBco;
     sQuant : String;
begin
 Bco := tBco.Create;
 Bco.Notas_VisualizaPendencias(2);
 bco.Destroy;

 sQuant := 'Não Existem Pendências';
 if (DM5.cdsPende.RecordCount > 0) then sQuant := 'Pendências: ' + DM5.cdsPende.RecordCount.ToString;

 PendVisual.StatusBar1.Panels[0].Text := sQuant;
end;

{ TPendVisual }

procedure TPendVisual.btCancelClick(Sender: TObject);
begin
  Panel2.Visible := false;
end;

procedure TPendVisual.btOBSClick(Sender: TObject);
 var s : String;
     Bco : TBco;

begin
    StatusBar1.Panels[1].Text := '';
    s := InputBox('Pendência', 'Digite o motivo ', DM5.cdsPendeOBS.Value);
    s := copy(s, 1, 54);
    if length(s) > 3 then
    begin
      Bco := TBco.Create;
      Bco.Notas_AlteraObs(DM5.cdsPendeID.Value, s);
      Bco.Destroy;
      StatusBar1.Panels[1].Text := 'Observação alterada com sucesso!!';
      Atualiza;
    end;

end;

procedure TPendVisual.btOkClick(Sender: TObject);

  var Bco : tBco;
      Rast : TRastreio;
      idNota : Integer;
      sDT, sHrs : String;

begin
  idNota := DM5.cdsPendeID.Value;
  if (rbReent.Checked) then
  begin
    Bco := TBco.Create;
    Bco.Notas_AlteraObs(idNota, '');
    Bco.Notas_MarcaPendencia(idNota, 1);
    Bco.Destroy;

    // EVENTO NF - Rastreio
    Rast := TRastreio.Create;
    Rast.set_ocor(DM5.cdsPendeNUMNF.Value, DM5.cdsPendeLigCli.Value,0, evrPendeOK, idUser);
    Rast.Destroy;
  end
  else
  begin
    Bco := TBco.Create;
    // Ref pendencia
    Bco.Notas_MarcaPendencia(idNota, 3);
    // Ref Baixa
      sDT := FormatDateTime('yyyy-MM-dd', Now);
      sHrs := FormatDateTime('HH:mm', Now);
      Bco.Notas_Entregas_Alterar(idNota,sDT, sHrs, 'Devolução após pendência', copy(DM5.cdsPendeOBS.Value,1,40), 'Nao', 52);
      Bco.Notas_MarcarBaixa(idNota, idUser, 1 );
      Bco.NotasVolta_Marca(idNota, 1);
    Bco.Destroy;

    // EVENTO NF - Rastreio
    Rast := TRastreio.Create;
    Rast.set_ocor(DM5.cdsPendeNUMNF.Value, DM5.cdsPendeLigCli.Value,0, evrPendeNaoOK, idUser);
    Rast.Destroy;

  end;
  Entrar;
 end;

procedure TPendVisual.btRetiraClick(Sender: TObject);
begin
  lbNF.Caption := Dm5.cdsPendeNUMNF.AsString;
  Panel2.Visible := true;
end;

procedure TPendVisual.Entrar;
begin
  Panel2.Visible := false;
  Atualiza;
end;

procedure TPendVisual.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.Mostrar_Nota_id(DM5.cdsPendeID.Value);
  NotasP.Show;
end;

end.
