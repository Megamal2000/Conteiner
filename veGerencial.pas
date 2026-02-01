unit veGerencial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.CategoryButtons,
  Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TeGerencial = class(TForm)
    ActionList1: TActionList;
    actCli: TAction;
    actProd: TAction;
    actPower: TAction;
    Action1: TAction;
    imlIcons: TImageList;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    Label4: TLabel;
    lbPadrao: TLabel;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btStok: TBitBtn;
    procedure imgMenuClick(Sender: TObject);
    procedure actCliExecute(Sender: TObject);
    procedure actProdExecute(Sender: TObject);
    procedure btStokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  eGerencial: TeGerencial;

implementation

{$R *.dfm}

uses veStok;

procedure TeGerencial.actCliExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TeGerencial.actProdExecute(Sender: TObject);
begin
  PageControl1.TabIndex := 0;
end;

procedure TeGerencial.btStokClick(Sender: TObject);
begin
  eStok.Entrar;
  eStok.Show;
end;

procedure TeGerencial.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

end.
