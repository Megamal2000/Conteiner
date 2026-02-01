unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, ComCtrls, Buttons,
  ExtCtrls;

type
  TRespXL = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btPesq: TBitBtn;
    btCancela: TBitBtn;
    pb: TProgressBar;
    Arquivo: TJvFilenameEdit;
    cbCol1: TComboBox;
    cbCol2: TComboBox;
    lbProc: TStaticText;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RespXL: TRespXL;

implementation

{$R *.dfm}

uses uDM2, uDM1, uDM3, uBanco;

procedure TRespXL.FormActivate(Sender: TObject);
begin
  if cbCli.Items.Count = 0 then
  begin
    cbCli.Items.Clear;
    DM2.DBCb_Preenche(cbCli, 'CLIENTE', 'NOME', '');
  end;  

end;

end.
