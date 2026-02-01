unit vejAltQUant;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  JvExStdCtrls, JvEdit, JvValidateEdit, Vcl.Buttons;

type
  TejAltQuant = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lbCli: TLabel;
    Label2: TLabel;
    lbProd: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbObs: TComboBox;
    lbQt: TLabel;
    Panel2: TPanel;
    btCancel: TBitBtn;
    btAltera: TBitBtn;
    edQt: TJvValidateEdit;
    procedure btCancelClick(Sender: TObject);
    procedure btAlteraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar(idProd, idSub, ligCli:Integer) ;
  end;

var
  ejAltQuant: TejAltQuant;
  idP, idS, idC : Integer;

implementation

{$R *.dfm}

uses veEstoque, veDM, veCadatro;


procedure TejAltQuant.btAlteraClick(Sender: TObject);
  var Stok : TStok;
      sModo : String;
      qt, obs : integer;
begin
  qt := edQt.Value - StrToInt(lbQt.Caption);
  sModo := '+';
  if (qt < 0) then
  begin
    sModo := '-';
    qt := qt * (-1);
  end;
  obs := cbObs.ItemIndex + 5;

  if qt>0 then
  begin
    Stok := TStok.Create;
    Stok.Altera_Estoque_Prod(idC, idP, idS, qt, obs, sModo, 0);
    Stok.Destroy;
  end;

  eCadastro.pedLbTot.Caption := eDM.cdsProdQUANTIDADE.AsString;
  eCadastro.pedQtEstoque.Caption := eDM.cdsProdSQUANTSUB.AsString;

  ejAltQuant.Hide;
end;

procedure TejAltQuant.btCancelClick(Sender: TObject);

begin


  ejAltQuant.Hide;
end;

procedure TejAltQuant.Entrar(idProd, idSub, ligCli:Integer);
begin
  lbCli.Caption := '';
  lbProd.Caption := '';
  lbQt.Caption := '';
  cbObs.ItemIndex := 0;
  edQt.Value := 0;

  idP := idProd;
  idS := idSub;
  idC := ligCli;



end;

end.
