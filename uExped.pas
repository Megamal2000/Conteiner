unit uExped;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, JvSpeedbar, ExtCtrls, JvExExtCtrls, JvExtComponent;

type
  TExped = class(TForm)
    JvSpeedBar1: TJvSpeedBar;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNFfora: TJvSpeedItem;
    btDmoto: TJvSpeedItem;
    btDcli: TJvSpeedItem;
    btCmoto: TJvSpeedItem;
    btCcli: TJvSpeedItem;
    btVeic: TJvSpeedItem;
    btBaixa: TJvSpeedItem;
    procedure btNFforaClick(Sender: TObject);
    procedure btVeicClick(Sender: TObject);
    procedure btDmotoClick(Sender: TObject);
    procedure btDcliClick(Sender: TObject);
    procedure btCmotoClick(Sender: TObject);
    procedure btCcliClick(Sender: TObject);
    procedure btBaixaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Exped: TExped;

implementation

uses uNFfora, upsqCar, uTikDev, uTikDev2, uTikCol, uTikCol2,Global,
  uBaixaRb;

{$R *.dfm}



procedure TExped.btNFforaClick(Sender: TObject);
begin
  NFfora.set_idU(idUser);
  NFfora.show;
end;

procedure TExped.btVeicClick(Sender: TObject);
begin
  psqCar.Show;
end;

procedure TExped.btDmotoClick(Sender: TObject);
begin
  TikDev.Entra;
  TikDev.Show;
end;

procedure TExped.btDcliClick(Sender: TObject);
begin
  TikDev2.Show;
end;

procedure TExped.btCmotoClick(Sender: TObject);
begin
  TikCol.Entra;
  TikCol.Show;
end;

procedure TExped.btCcliClick(Sender: TObject);
begin
  TikCol2.Show;
end;

procedure TExped.btBaixaClick(Sender: TObject);
begin
  BaixaRb.Show;
end;

end.
