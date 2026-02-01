unit uBaixaRb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TBaixaRb = class(TForm)
    Label1: TLabel;
    edNum: TEdit;
    lbResp: TLabel;
    lbResp2: TLabel;
    lbResp3: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure edNumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaixaRb: TBaixaRb;

implementation

{$R *.dfm}

uses uDM2, uBanco, uRoma;

procedure Troca(mens:String; cor : Smallint);
begin
  with BaixaRb do
  begin
    lbresp3.Caption := lbResp2.Caption;
    lbResp2.Caption := lbResp.Caption;

    lbResp.Caption  := mens;
    if (cor = 1) then lbResp.Font.Color := clRed;
    if (cor = 2) then lbResp.Font.Color := clBlue;
  end;
end;


procedure TBaixaRb.FormActivate(Sender: TObject);
begin
  lbResp.Caption  := '-';
  lbResp2.Caption := '-';
  lbResp3.Caption := '-';
  edNum.SetFocus;
end;

procedure TBaixaRb.edNumKeyPress(Sender: TObject; var Key: Char);

var Erro : Integer;
    Bco : TBco;
    nR : Integer;
    Rm : Troma;

begin

  if (Key = #13) then
  begin
    Rm := Troma.Create;
    nR := Rm.Pesquisa_Romaneio(edNum.text);
    Rm.Destroy;
    
    Erro := 0;
    if (DM2.Conta('TB_ROMA', 'NUM = '+IntToStr(nR)) = 0) then Erro := 1
    else
      if (DM2.Conta('TB_ROMA', 'STATUS_DEV  = 1 and NUM = '+IntToStr(nR)) > 0) then Erro := 2;

      // Marca
      if (Erro = 0) then
      begin
        Bco := Tbco.Create;
        Bco.Controle_Altera_StatusENT(nr,1);
        Bco.Destroy;
        Troca('Romaneio '+edNum.Text+' recebido com sucesso',2);
      end;

      if Erro = 1 then Troca('Romaneio '+edNum.Text+' NÃO encontrado',1);
      if Erro = 2 then Troca('Romaneio '+edNum.Text+' já foi baixado',1);
    edNum.Text := '';
  end;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;

end.
