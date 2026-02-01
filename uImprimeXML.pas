unit uImprimeXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvExMask, JvToolEdit, ExtCtrls, DB, Buttons,
  JvMemoryDataset, Grids, DBGrids, JvExDBGrids, JvDBGrid, JvDataSource,
  FileCtrl, ACBrNFe, Menus, ACBrBase, ACBrDFe;

type
  TImprimeXML = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    pasta: TJvDirectoryEdit;
    Label2: TLabel;
    lbNum: TLabel;
    Panel2: TPanel;
    JvDataSource1: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    Tab: TJvMemoryData;
    btImpNF: TBitBtn;
    btImpEtiq: TBitBtn;
    TabNota: TIntegerField;
    TabArquivo: TStringField;
    btProc: TBitBtn;
    arq: TFileListBox;
    BitBtn1: TBitBtn;
    TabVolume: TIntegerField;
    PopupMenu1: TPopupMenu;
    AlterarVolume1: TMenuItem;
    ACBrNFe1: TACBrNFe;
    procedure pastaChange(Sender: TObject);
    procedure btProcClick(Sender: TObject);
    procedure AlterarVolume1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btImpNFClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  ImprimeXML: TImprimeXML;
  pastaProg, pastaRels : String;

implementation

{$R *.dfm}

uses uLib;

procedure TImprimeXML.pastaChange(Sender: TObject);
begin
  arq.Directory := pasta.Directory;
  lbNum.Caption := IntToStr(arq.Count);
  Tab.Active    := false;
  Tab.EmptyTable;
  Tab.Active    := true;
end;

procedure TImprimeXML.btProcClick(Sender: TObject);

var i : integer;
    ArqO : String;

begin

  // Apaga a tabela
  Tab.Active := false;
  Tab.EmptyTable;
  Tab.Active := true;

  for i:= 1 to arq.Count do
  begin

    Tab.Insert;

    TabArquivo.Value := arq.Items[i-1];
    ArqO := pasta.Directory + '\'+arq.Items[i-1];
    ACBrNFe1.NotasFiscais.Clear;
    ACBrNFe1.NotasFiscais.LoadFromFile(ArqO);
    TabNota.Value   := ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF;
    if (ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Count > 0) then
      TabVolume.Value  := ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Items[0].qVol;

    Tab.Post;
  end;

end;

procedure TImprimeXML.AlterarVolume1Click(Sender: TObject);

var vol : integer;

begin
  vol := StrToint(InputBox('Alterar Voluem', 'Digite o novo Volume ou Zero para cancelar', '0'));

  if vol > 0 then
  begin
    Tab.Edit;
    TabVolume.Value := vol;
    Tab.Post;
  end;
      
end;

procedure TImprimeXML.BitBtn1Click(Sender: TObject);
begin
  if (Tab.RecordCount > 0) then
    JvDBGrid1.SelectAll;

end;

procedure ImprimirXML(arqx:String);

var
    usa : TMarco;


begin


  with ImprimeXML do
  begin

    ACBrNFe1.NotasFiscais.Clear;

    ACBrNFe1.NotasFiscais.LoadFromFile(arqx);

    if (ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Count = 0) then
      ACBrNFe1.NotasFiscais.Items[0].NFe.Transp.Vol.Add;
    // **************************************************
    //Imp.Logo := pastaProg+'\Imgs\logo.bmp';
    //Imp.RavFile := pastaRels + '\NFeMATRIZ.RAV';
    //Imp.NumCopias := 1;
    ACBrNFe1.NotasFiscais.Imprimir;

    // if (status=2) then
    // Enviar_Mail(DM1.cdsNotaARQUIVO.Value,DM1.cdsNotaNUMNF.Value);

    ChDir(pastaProg);
  end;
end;



procedure TImprimeXML.btImpNFClick(Sender: TObject);

var i : Integer;
    arqXML : String;
    


begin
 if JvDBGrid1.SelectedRows.Count>0 then
    for i:=JvDBGrid1.SelectedRows.Count-1 downto 0  do
    begin
      JvDBGrid1.DataSource.DataSet.GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
      arqXML := pasta.Directory + '\' + TabArquivo.Value;
      ImprimirXML(arqXML);
    end;

end;

procedure TImprimeXML.Entrar;

var
    usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;
  pastaRels := usa.get_rels;
  pastaProg := usa.get_progs;
  usa.Destroy;

end;

end.
