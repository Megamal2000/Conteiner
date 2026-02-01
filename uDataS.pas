unit uDataS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TDataS = class(TForm)
    Label1: TLabel;
    dtSis: TDateTimePicker;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_dtSis(d : TDatetime);
  end;

var
  DataS: TDataS;
  dtS : TdateTime;

implementation

{$R *.dfm}

uses Global;

procedure TDataS.FormActivate(Sender: TObject);
begin
  dtSis.DateTime := dtS;
end;

procedure TDataS.set_dtSis(d: TDatetime);
begin
  dts := d;
end;

end.
