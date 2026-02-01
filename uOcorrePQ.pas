unit uOcorrePQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, ExtCtrls, StdCtrls, JvExStdCtrls, JvEdit,
  JvValidateEdit, Vcl.Buttons;

type
  TOcorrePQ = class(TForm)
    edNum: TJvValidateEdit;
    edDesc: TEdit;
    Label1: TLabel;
    Bevel1: TBevel;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DataSource1: TDataSource;
    btOK: TBitBtn;
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edDescKeyPress(Sender: TObject; var Key: Char);
    procedure btOKClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OcorrePQ: TOcorrePQ;

implementation

{$R *.dfm}

uses uDM1, uBanco;

procedure TOcorrePQ.edNumKeyPress(Sender: TObject;
  var Key: Char);

var Bco : TBco;
    ok  : Boolean;
begin
  if (key = #13) then
  begin
    if (edNum.Value > 0) then
    begin
      ok := False;
      DM1.cdsOc.First;
      while not DM1.cdsOc.Eof  and not ok do
      begin
        if (edNum.Value = Dm1.cdsOcNUM.Value) then ok := True;
        DM1.cdsOc.Next;
      end;
      DM1.cdsOc.Prior;
      btOk.SetFocus;

    end
    else edDesc.SetFocus;
  end;
end;

procedure TOcorrePQ.FormActivate(Sender: TObject);

var Bco : TBco;

begin
  edNum.Value := 0;
  edDesc.Text := '';
  edNum.SetFocus;
  Bco := TBco.Create;
  Bco.Ocorre_Mostra;
  Bco.Destroy;
end;

procedure TOcorrePQ.btOKClick(Sender: TObject);
begin
  modalResult := mrOk;
end;

procedure TOcorrePQ.DBGrid1DblClick(Sender: TObject);
begin
  modalResult := mrOk;
end;

procedure TOcorrePQ.edDescKeyPress(Sender: TObject; var Key: Char);

var Bco : TBco;

begin
  if (key = #13) then
  begin
    Bco := TBco.Create;
    Bco.Ocorre_PesqMeio(edDesc.Text);
    Bco.Destroy;
  end;
end;

end.
