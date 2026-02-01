unit uOcorre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, JvExStdCtrls, JvEdit,
  JvValidateEdit, ImgList, DB, JvDataSource, Grids, DBGrids, JvExDBGrids,
  JvDBGrid, ppCtrls, ppVar, ppPrnabl, ppClass, ppDB, ppBands, ppCache,
  ppDBPipe, ppComm, ppRelatv, ppProd, ppReport, ppDesignLayer, ppParameter,
  System.ImageList;

type
  TOcorre = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    vNum: TJvValidateEdit;
    btSalvar: TBitBtn;
    btApagar: TBitBtn;
    btNovo: TBitBtn;
    cbTipo: TComboBox;
    edDesc: TEdit;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btImp: TBitBtn;
    RelOc: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel2: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine2: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine4: TppLine;
    ppLabel1: TppLabel;
    ckGera: TCheckBox;
    ckSMS: TCheckBox;
    ckSAC: TCheckBox;
    ckCTE: TCheckBox;
    procedure btNovoClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ocorre: TOcorre;
  idOC : integer;


implementation

{$R *.dfm}

uses uDM1, uBanco;

procedure Limpar();
begin
  Ocorre.vNum.Value       := 0;
  Ocorre.edDesc.Text      := '';
  Ocorre.cbTipo.ItemIndex := 0;
end;

procedure Preencher();
begin
  Ocorre.vNum.Value       := DM1.cdsOcNUM.Value;
  Ocorre.edDesc.Text      := DM1.cdsOcDESCR.Value;
  Ocorre.cbTipo.ItemIndex := DM1.cdsOcUSO.Value+1;
  Ocorre.ckGera.Checked   := (DM1.cdsOcAUTOPENDE.Value = 1);
  Ocorre.ckSMS.Checked   := (DM1.cdsOcAUTOSMS.Value = 1);
  Ocorre.ckSAC.Checked   := (DM1.cdsOcAUTOSAC.Value = 1);
  Ocorre.ckCTe.Checked   := (DM1.cdsOcGERACTE.Value = 1);
end;

procedure Atualiza();
var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Ocorre_Mostra;
  Bco.Destroy;
end;



procedure TOcorre.btNovoClick(Sender: TObject);

var Bco : TBco;

begin
  Limpar;
  Atualiza;
  idOC := 0;
end;

procedure TOcorre.btSalvarClick(Sender: TObject);
var Bco : TBco;
    apend, asms, asac, cte : integer;
begin
  apend := 0;
  if (ckGera.Checked) then apend := 1;
  asms := 0;
  if (ckSMS.Checked) then aSMS:= 1;
  asac := 0;
  if (ckSAC.Checked) then aSAC:= 1;
  cte := 0;
  if (ckCTE.Checked) then cte:= 1;

  Bco := TBco.Create;
  if (idOC = 0) then
    Bco.Ocorre_Insere(vnum.Value, edDesc.Text, cbTipo.ItemIndex-1, apend, asms, asac, cte)
  else
    Bco.Ocorre_Altera(idOc, vnum.Value, edDesc.Text, cbTipo.ItemIndex-1, apend, asms, asac, cte);
  Bco.Destroy;

  Atualiza;
end;

procedure TOcorre.btApagarClick(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;

  if (idOC > 0) then
  begin
  if MessageDlg('Deseja apagar a ocorrência '+DM1.cdsOcNUM.AsString+' ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Bco.Ocorre_Apaga(idOC);
  end
  else ShowMessage('Selecione uma ocorrência para apagar!');

  Bco.Destroy;


end;

procedure TOcorre.JvDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

  var tipoENT : integer;

begin
  if Column.Field=DM1.cdsOCUSO then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);

    // Desenha o Quadrado
    ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,0);

    // Desenha o check sobre o quadrado quando ativo = ‘S’
    if DM1.cdsOCUSO.Value  > 0 then //' then // Cadastro está ativo
    begin
      //Bco := TBco.Create;
      //Bco.Ocorre_PesqNum(DM1.cdsOCNUM.Value);
      //Bco.Destroy;
      {
        0 = Branco
        1 = sem Baixa
        2 = baixa (entregue)
        3 = reentrega
        4 = Devolução
      }
      tipoENT := DM1.cdsOcUSO.Value + 1;
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,tipoENT);
    end
    else
      ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+10,Rect.Top+1,1);
  end;

end;

procedure TOcorre.FormActivate(Sender: TObject);
begin
  Atualiza;
end;

procedure TOcorre.JvDBGrid1DblClick(Sender: TObject);

var Bco : TBco;

begin
  Limpar;
  idOC := DM1.cdsOcID.Value;
  Preencher;
end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with Ocorre do
   begin
     doc := 'Ocorrências de Entregas de NF ';
     { carrega o arquivo }
     RelOc.Template.FileName := dirR+'\Rels\RelOc.rtm';
     RelOc.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelOc.DeviceType := 'Screen';
     RelOc.ShowAutoSearchDialog  := False;
     RelOc.ShowCancelDialog := False;
     RelOc.ShowPrintDialog := False;
     RelOc.PrinterSetup.DocumentName := doc;

     //ppLabel8.Caption := cbCli.Items[cbCli.ItemIndex];
 
     { imprime a ordem de serviço }
     RelOc.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TOcorre.btImpClick(Sender: TObject);
begin
  // Imprime Coleta
  Imprime;
end;

end.
