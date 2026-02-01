unit uCob1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, JvExDBGrids, JvDBGrid, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, uBanco, DB;

type
  TCob1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edNum: TEdit;
    edTexto: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDesc: TEdit;
    Label6: TLabel;
    dtPrev: TDateTimePicker;
    btSalva: TBitBtn;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure edTextoKeyPress(Sender: TObject; var Key: Char);
    procedure btSalvaClick(Sender: TObject);
    procedure edDescKeyPress(Sender: TObject; var Key: Char);
    procedure dtPrevChange(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idCli(i : integer);
  end;

var
  Cob1: TCob1;
  idCli, idCred : integer;
  Bco : TBco;

implementation

{$R *.dfm}

uses uDM3, uRel1;

procedure Limpar();
begin
  with Cob1 do
  begin
    edNum.Text   := '';
    edTexto.Text := '';
    edDesc.Text  := '';
    dtprev.DateTime := Now;
  end;
end;


{ TCob1 }

procedure TCob1.set_idCli(i: integer);
begin
  idCli := i;
end;

procedure TCob1.edNumKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
   if (Length(edNum.Text)>0) then
  begin
    Bco := TBco.Create;
    Bco.Credito_MostraId(StrToInt(edNum.Text));
    Bco.Destroy;
  end;
  if not (Key in ['0'..'9', chr(VK_BACK), chr(VK_DELETE)]) then key := #0;
end;

procedure TCob1.edTextoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
   if (Length(edTexto.Text)>2) then
  begin
    Bco := TBco.Create;
    Bco.Credito_MostraDesc(idCli, edTexto.Text);
    Bco.Destroy;
  end;
end;



procedure TCob1.btSalvaClick(Sender: TObject);
begin
  if (Length(edDesc.Text)>2) then
  begin
    Bco := TBco.Create;

    if (idCred = 0) then
      Bco.Credito_Insere(idCli, edDesc.Text, dtprev.DateTime)
    else
      Bco.Credito_Altera(idCred, edDesc.Text, dtprev.DateTime);

    Bco.Credito_MostraDesc(idCli, edDesc.Text);
    Bco.Destroy;
  end;  
end;

procedure TCob1.edDescKeyPress(Sender: TObject; var Key: Char);
begin
  if (key =#13) then dtPrev.SetFocus;
end;

procedure TCob1.dtPrevChange(Sender: TObject);
begin
  btSalva.SetFocus;
end;

procedure TCob1.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM3.cdsCred.RecordCount > 0) then
  begin
    RelGer.lbPag.Caption := DM3.cdsCredDESCR.Value;
    RelGer.set_idCob(DM3.cdsCredID.Value);
    RelGer.Show;
  end;
end;

procedure TCob1.FormActivate(Sender: TObject);
begin
 Limpar;
end;

end.
