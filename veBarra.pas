unit veBarra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  JvExExtCtrls, JvExtComponent, JvSpeedbar, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls;

type
  TeBarra = class(TForm)
    BarraBotoes: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    bbtCad: TJvSpeedItem;
    JvSpeedBarSection3: TJvSpeedBarSection;
    bbtConfig: TJvSpeedItem;
    bbtESnf: TJvSpeedItem;
    bbtGerencial: TJvSpeedItem;
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure bbtCadClick(Sender: TObject);
    procedure bbtConfigClick(Sender: TObject);
    procedure bbtESnfClick(Sender: TObject);
    procedure bbtGerencialClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  eBarra: TeBarra;

implementation

{$R *.dfm}

uses veDM, veCadatro, veEstoque, veConfig, veNFs, veGerencial, veBanco;




// Conectar


procedure TeBarra.bbtCadClick(Sender: TObject);
begin
  eCadastro.Entrar;
  eCadastro.Show;
end;

procedure TeBarra.bbtConfigClick(Sender: TObject);
begin
  eConfig.Entrar;

  eConfig.Show;
end;

procedure TeBarra.bbtESnfClick(Sender: TObject);
begin
  eNFs.Entrar;
  eNFs.Show;
end;

procedure TeBarra.bbtGerencialClick(Sender: TObject);
begin
  eGerencial.Show;
end;

procedure TeBarra.Entrar;

var Stoke : TStok;
    ok : boolean;

begin
  Stoke := TStok.Create;
  ok := Stoke.ConectarEstoque;
  Stoke.Destroy;

   if (ok) then
   begin
     eBarra.StatusBar1.Panels[0].Text := 'CONECTADO';
     eBarra.BarraBotoes.Enabled := true;
     // Inicia Bancos
     Stoke := TStok.Create;
     Stoke.Inicia_Bancos;
     Stoke.Destroy;
   end;
end;

procedure TeBarra.FormClose(Sender: TObject; var Action: TCloseAction);

  var Stoke : TStok;

begin
  Stoke := TStok.Create;
  Stoke.Inicia_Bancos;
  Stoke.Destroy;
end;

procedure TeBarra.FormCreate(Sender: TObject);
begin
  Top    := 0;
  Left   := 0;
  Height := 207;
  Width  := GetSystemMetrics(SM_CXScreen);
end;

end.
