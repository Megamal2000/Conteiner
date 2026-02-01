unit veImportaNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Vcl.Buttons,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.ExtCtrls, ACBrBase, ACBrDFe, ACBrNFe,
  JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TeImportaNF = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbCli: TComboBox;
    e_dir: TJvDirectoryEdit;
    Panel2: TPanel;
    Label3: TLabel;
    cbTipo: TComboBox;
    btVerif: TBitBtn;
    lbResp: TLabel;
    Arquivos: TFileListBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbArq: TLabel;
    lbNota: TLabel;
    nPed: TJvValidateEdit;
    ACBrNFe1: TACBrNFe;
    procedure e_dirChange(Sender: TObject);
    procedure btVerifClick(Sender: TObject);
    procedure ArquivosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  eImportaNF: TeImportaNF;
  sDir:String;

implementation

{$R *.dfm}

uses veBanco, uLib;

{ TeImportaNF }

procedure Nota_Carregar(sArq:String);
begin
  with eImportaNf do
  begin
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(sArq);
    lbNota.Caption := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF.ToString;
  end;
end;

procedure TeImportaNF.ArquivosClick(Sender: TObject);
begin
  lbArq.Caption := Arquivos.FileName;
  lbNota.Caption := '0';
  Nota_Carregar(Arquivos.FileName);

end;

procedure TeImportaNF.btVerifClick(Sender: TObject);
begin
  Panel3.Visible := false;
  if Arquivos.Count>0 then
  begin
    Panel3.Visible := true;
    lbResp.Caption := 'Foram encontrados '+Arquivos.Count.ToString+' arquivos XML';
  end;
end;

procedure TeImportaNF.Entrar;
  var dirI : String;
      Bce : TBce;
      usa : TMarco;
begin
  Bce := TBce.Create;
  Bce.Cli_PreencheCB(cbCli);
  Bce.Cli_PadraoCB(cbCli);
  Bce.Destroy;

  Panel3.Visible := false;

  usa := TMarco.Create;
  usa.Le_INI;
  sDir := usa.get_progs;
  dirI := usa.get_stokImp;
  usa.Destroy;

  e_dir.Directory := dirI;

end;

procedure TeImportaNF.e_dirChange(Sender: TObject);
  var usa : TMarco;

begin
  Arquivos.Directory := e_dir.Directory;
  usa := TMarco.Create;
  usa.set_stokImp(e_dir.Directory);
  if (DirectoryExists(sDir)) then ChDir(sDir);
  usa.Grava_INI(7);
  usa.Destroy;

end;

end.
