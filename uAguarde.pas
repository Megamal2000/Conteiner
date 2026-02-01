unit uAguarde;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvExControls, JvAnimatedImage, JvGIFCtrl, StdCtrls,
  JvExStdCtrls, JvBehaviorLabel, JvWaitingGradient;

type
  TAguarde = class(TForm)
    StaticText1: TStaticText;
    Image1: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Aguarde: TAguarde;

implementation

{$R *.dfm}

procedure TAguarde.FormActivate(Sender: TObject);
begin
  StaticText1.Caption := 'Aguarde ...';
  StaticText1.Repaint;
end;

procedure TAguarde.FormPaint(Sender: TObject);
begin
  ModalResult := mrOk;
end;

end.
