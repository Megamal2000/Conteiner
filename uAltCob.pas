unit uAltCob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TAltCob = class(TForm)
    Label1: TLabel;
    lbNF: TLabel;
    Label2: TLabel;
    lbLocal: TLabel;
    Label4: TLabel;
    cbCob: TComboBox;
    Bevel1: TBevel;
    btCancel: TBitBtn;
    btSalvar: TBitBtn;
    procedure btCancelClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_IdNF(i : Integer);
  end;

var
  AltCob: TAltCob;
  idNF : Integer;

implementation

{$R *.dfm}

uses uBanco;

procedure TAltCob.btCancelClick(Sender: TObject);
begin
  AltCob.Hide;
end;

procedure TAltCob.set_IdNF(i: Integer);
begin
  idNF := i;
end;

procedure TAltCob.btSalvarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Notas_Altera_TipoCob(idNF, cbCob.ItemIndex+1);
  Bco.Destroy;
  AltCob.Hide;
end;

end.
