unit utmpTela;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage;

type
  TtmpTela = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  tmpTela: TtmpTela;

implementation

{$R *.dfm}

uses Global, DateUtils;


procedure TtmpTela.Timer1Timer(Sender: TObject);

var d,m,a, md : Word;

begin
  Timer1.Enabled := False;
  tmpTela.Hide;
  tmpTela.Free;
  // ---  datas
  d := DayOfTheMonth(Now);
  m := MonthOf(Now);
  a := YearOf(Now);
  if (m < 12) then md := m + 1 else md := 1;

  dtPag1 := EncodeDate(a,m,1);
  dtPag2 := EncodeDate(a,md,1) - 1;



end;

end.
