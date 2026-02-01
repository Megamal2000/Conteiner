unit uPagPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls;

type
  TPagPago = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edValorP: TJvValidateEdit;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    lbMot: TLabel;
    btSalvar: TBitBtn;
    Label3: TLabel;
    cbBanco: TComboBox;
    Label4: TLabel;
    cbModo: TComboBox;
    lbConta: TLabel;
    ListBox1: TListBox;
    procedure cbBancoChange(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure edValorPKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idPagD(i : Integer);
    procedure set_idMot(i : Integer);
  end;

var
  PagPago: TPagPago;
  idPagD, idMot : Integer;

implementation

{$R *.dfm}

uses uBanco, uDM1, uDM4, uDM2;

{ TPagPago }

procedure Posiciona_Combo(var lista:TComboBox; valor:String);

var i, x_ind : Integer;

begin
  x_ind := 0;
  lista.ItemIndex := 0;
  if (lista.Items.Count > 1) then
  begin
    for i:= 1 to lista.Items.Count do
      if (valor = lista.Items[i-1]) then x_ind := i-1;
  end;
  lista.ItemIndex := x_ind;
end;

procedure TPagPago.set_idMot(i: Integer);

var Bco : TBco;

begin
  idMot := i;
  Bco := TBco.Create;
  Bco.Banco_MostraTodos(idMot);
  Bco.PagGrupo_ItensMotorista(idMot);
  Bco.Destroy;
  ListBox1.Clear;
  ListBox1.Items.Append('-');
  cbBanco.Clear;
  cbBanco.Items.Append('direto');
  DM1.cdsFBco.First;
  while(not DM1.cdsFBco.Eof) do
  begin
    cbBanco.Items.Append(DM1.cdsFBcoBCONOME.Value);
    ListBox1.Items.Append(DM1.cdsFBcoCONTA.Value);
    DM1.cdsFBco.Next;
  end;
  Posiciona_Combo(cbBanco, DM4.cdsPagIBANCO.Value);
  edValorP.Value := DM4.cdsPagIVPAGO.AsFloat;

end;

procedure TPagPago.set_idPagD(i: Integer);
begin
  idPagD := i;
end;

procedure TPagPago.cbBancoChange(Sender: TObject);
begin
  ListBox1.ItemIndex := cbBanco.ItemIndex;
  lbConta.Caption    := ListBox1.Items[ListBox1.ItemIndex];
end;


procedure Salvar;

var Bco : TBco;

begin
  with PagPago do
  begin
    Bco := TBco.Create;
    Bco.PagGrupo_ItensGravaVP(idPagD, edValorP.Value, cbModo.Items[cbModo.ItemIndex], cbBanco.Items[cbBanco.ItemIndex],lbConta.Caption );
    Bco.Destroy;
    PagPago.Hide;
    DM4.cdsPagI.Refresh;
  end;
end;

procedure TPagPago.btSalvarClick(Sender: TObject);

begin
  Salvar;
end;

procedure TPagPago.edValorPKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then Salvar;
end;

end.
