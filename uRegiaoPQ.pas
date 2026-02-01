unit uRegiaoPQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Buttons, StdCtrls, Grids, DBGrids, ExtCtrls;

type
  TRegiaoPQ = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edReg: TEdit;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    procedure edRegKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RegiaoPQ: TRegiaoPQ;

implementation

{$R *.dfm}

uses uDM1, uBanco, uRoman;

procedure TRegiaoPQ.edRegKeyPress(Sender: TObject; var Key: Char);

var Bco : TBco;

begin
  if (key = #13) and (length(edReg.Text)>=2) then
  begin
    Bco := TBco.Create;
    Bco.Regiao_Pesquisa(edReg.Text);
    Bco.Destroy;

    if (DM1.cdsReg.RecordCount > 0) then
    begin
      DM1.cdsReg.First;
      DBGrid1.SetFocus;
      
    end;
  end;
end;

procedure TRegiaoPQ.FormActivate(Sender: TObject);
begin
  edReg.Text := '';
  edREg.SetFocus;
end;

procedure TRegiaoPQ.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if(key = chr(VK_DOWN)) then DM1.cdsReg.Next;
  if(key = chr(VK_UP))   then DM1.cdsReg.Prior;
  if(key = #13) then
  begin
    Roman.set_idR(DM1.cdsRegID.Value);
    Roman.set_nreg(DM1.cdsRegCLASS.Value);
    Roman.lbReg.Caption := DM1.cdsRegDESCR.Value;
    Roman.Show;
    RegiaoPQ.Hide;
  end;

end;

end.
