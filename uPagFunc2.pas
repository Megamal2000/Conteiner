unit uPagFunc2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, JvDataSource, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit, ExtCtrls, Menus;

type
  TPagFunc2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbMot: TLabel;
    cbLocal: TComboBox;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    vInicio: TJvValidateEdit;
    vFim: TJvValidateEdit;
    vPag: TJvValidateEdit;
    vCob: TJvValidateEdit;
    btSalvar1: TBitBtn;
    btNovo: TBitBtn;
    Panel3: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    vMinimo: TJvValidateEdit;
    vACmot: TJvValidateEdit;
    btSalvar2: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    PopupMenu1: TPopupMenu;
    Apagar1: TMenuItem;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvar1Click(Sender: TObject);
    procedure btSalvar2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbLocalCloseUp(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure Apagar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idMot(i : integer);
  end;

var
  PagFunc2: TPagFunc2;
  idMot, idP3, idP4: Integer;

implementation

{$R *.dfm}

uses uDM4,ubanco;

{ TPagFunc2 }

procedure TPagFunc2.set_idMot(i: integer);
begin
  idMot := i;
end;

procedure Limpar1();
begin
  with PagFunc2 do
  begin
    vInicio.Value := 0;
    vFim.Value    := 0;
    vPag.Value  := 0;
    vCob.Value := 0;
    vMinimo.Value := 0;
    vACmot.Value := 0;
    vInicio.SetFocus;
  end;
end;

procedure Limpar2();
begin
  with PagFunc2 do
  begin
    //vMinimo.Value  := 0;
    //vMinimo.SetFocus;
  end;
end;

procedure TPagFunc2.btNovoClick(Sender: TObject);
begin
  Limpar1;
  idP3 := 0;
end;

procedure Preencher1();
begin
  with PagFunc2 do
  begin
    vInicio.Value := DM4.cdsPG3INICIO.Value;
    vFim.Value    := DM4.cdsPG3FIM.Value;
    vPag.Value    := DM4.cdsPG3VPAG.AsFloat;
    vCob.Value    := DM4.cdsPG3VCOB.AsFloat;
    idP3 := DM4.cdsPG3ID.Value;
    vInicio.SetFocus;
  end;
end;

procedure Preencher2();
begin
  with PagFunc2 do
  begin
    vMinimo.Value  := DM4.cdsPG4MINIMO.AsFloat;
    vACmot.Value   := DM4.cdsPG4VLR_ACIMA.Value;
    vMinimo.SetFocus;
  end;
end;

Procedure Carregar;

var Bco : TBco;

begin

  Bco := TBco.Create;
  bco.Pag2Faixa_Mostrar(idMot, PagFunc2.cbLocal.ItemIndex);
  bco.Pag2FaixaMais_Mostrar(idMot, PagFunc2.cbLocal.ItemIndex);
  Bco.Destroy;

  Limpar2;
  Limpar1;
  idP4 := 0;
  idP3 := 0;
  if (DM4.cdsPG4.RecordCount > 0) then
  begin
    Preencher2;
    idP4 := DM4.cdsPG4ID.Value;
  end;

end;


procedure TPagFunc2.btSalvar1Click(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;

  if (idP3 > 0) then
    bco.Pag2Faixa_Alterar(idP3, cbLocal.ItemIndex, vInicio.Value, vFim.Value, vPag.Value, vCob.Value)
  else
    bco.Pag2faixa_Inserir(idMot,cbLocal.ItemIndex, vInicio.Value, vFim.Value, vPag.Value, vCob.Value);

  bco.Pag2Faixa_Mostrar(idMot, cbLocal.ItemIndex);
  Limpar1;
  Bco.Destroy;
  idP3 := 0;

end;

procedure TPagFunc2.btSalvar2Click(Sender: TObject);
var Bco : TBco;

begin
  Bco := TBco.Create;

  if (idP4 > 0) then
    bco.Pag2FaixaMais_Alterar(idP4, cbLocal.ItemIndex, vMinimo.Value, vACmot.Value)
  else
    bco.Pag2FaixaMais_Inserir(idMot,cbLocal.ItemIndex, vMinimo.Value, vACmot.Value);

  bco.Pag2FaixaMais_Mostrar(idMot, cbLocal.ItemIndex);
  idP4 := DM4.cdsPG4ID.Value;
  Bco.Destroy;
  vInicio.SetFocus;
end;

procedure TPagFunc2.FormActivate(Sender: TObject);
begin
  Carregar;
end;

procedure TPagFunc2.cbLocalCloseUp(Sender: TObject);
begin
  Carregar;
end;

procedure TPagFunc2.JvDBGrid1DblClick(Sender: TObject);
begin
  Preencher1;
end;

procedure TPagFunc2.Apagar1Click(Sender: TObject);

var Bco : tBco;

begin
  if MessageDlg('Tem certeza que deseja apagar essa faixa?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Bco := TBco.Create;
    Bco.Pag2Faixa_Apagar(DM4.cdsPG3ID.Value);
    Bco.Destroy;

    Carregar;

  end;

end;

end.
