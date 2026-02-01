unit uCTeVer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
   Vcl.ExtCtrls;

type
  TCTeVer = class(TForm)
    Panel1: TPanel;
    imCanc: TImage;
    imOK: TImage;
    Label1: TLabel;
    lbNumCTe: TLabel;
    lbStatus: TLabel;
    Label2: TLabel;
    WebBrowser1: TWebBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CTeVer: TCTeVer;

implementation

{$R *.dfm}

end.
