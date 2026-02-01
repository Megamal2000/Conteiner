unit uCob2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls,
  Buttons, ExtCtrls, Mask, JvExMask, JvSpin, Menus, ppBands, ppCtrls,
  ppVar, jpeg, ppPrnabl, ppClass, ppDB, ppCache, ppDBPipe, ppComm,
  ppRelatv, ppProd, ppReport, ppDesignLayer, ppParameter;

type
  TCob2 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btCalc: TBitBtn;
    pb: TProgressBar;
    lbR: TStaticText;
    JvDBGrid1: TJvDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    edRoma: TEdit;
    DataSource1: TDataSource;
    cbCli: TComboBox;
    Label3: TLabel;
    vAno: TJvSpinEdit;
    JvDBGrid2: TJvDBGrid;
    DataSource2: TDataSource;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    btImprime: TBitBtn;
    RelCob: TppReport;
    ppDBPipeline1: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel8: TppLabel;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppSummaryBand1: TppSummaryBand;
    ppLabel12: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    btZeros: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBGrid2CellClick(Column: TColumn);
    procedure btCalcClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure edRomaEnter(Sender: TObject);
    procedure edRomaKeyPress(Sender: TObject; var Key: Char);
    procedure btImprimeClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btZerosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cob2: TCob2;

implementation

uses Math, DateUtils, uDM3, uDM2, uBanco, uRel3, uCobZero, uAguarde;

{$R *.dfm}


procedure TCob2.FormActivate(Sender: TObject);
begin
  if (vAno.Value = 0) then vAno.Value := YearOf(Now);
  if (cbCli.Items.Count= 0) then
    DM2.DBCb_Preenche(cbCli, 'TB_CLIENTE', 'NOME', ' ativo = 1 ');
end;

procedure TCob2.BitBtn1Click(Sender: TObject);

var Bco : TBco;
    idC : Integer;


begin
  if (cbCli.ItemIndex >= 0) then
  begin
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_CLIENTE','NOME');
    Bco := TBco.Create;
    Bco.Credito_MostraAno(idC, vAno.AsInteger);
    BCo.Cliente_MostraId(idC);
    Bco.Destroy;
    btZeros.Visible := false;
  end
  else ShowMessage('Selecione um Cliente');

end;

procedure TCob2.JvDBGrid2CellClick(Column: TColumn);

var Bco : TBco;
    idC : Integer;

begin
  if (DM3.cdsCred.RecordCount>0) then
  begin
    idC := DM3.cdsCredID.Value;
    Bco := TBco.Create;
    Bco.Credito_MostraItens(idC);
    Bco.Destroy;
    btZeros.Visible := true;
  end;

end;

procedure TCob2.btCalcClick(Sender: TObject);
var Bco : TBco;
    i,j, pos : Integer;
    marca : TBookMark;
    Vetor : Array of Integer;
    NumRel : Integer;

begin
  if JvDBGrid1.SelectedRows.Count>0 then
  begin
    pb.Min := 0;
    pb.Max := JvDBGrid1.SelectedRows.Count;
    lbR.Caption := '';

    Bco := TBco.Create;
    Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
    Bco.Destroy;

    SetLength(Vetor,JvDBGrid1.SelectedRows.Count); // Determinando o tamanho do array.
    with JvDBGrid1.DataSource.DataSet do
    begin
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Vetor[i] := DM3.cdsRelVID.Value;
      end;
      for i := 0 to High(Vetor) do
      begin
        // Atualiza a barra
        pos := pos + 1;
        pb.Position := i+1;

        // ==========================================
        NumRel := Vetor[i];
        Bco := TBco.Create;
        Bco.Relatorio_Notas(NumRel);
        Bco.Destroy;
        lbR.Caption := IntToStr(NumRel);

        if (DM3.cdsRelN.RecordCount > 0) then
        begin

            /// Nao vejo utilidade
          //  Coloquei para cima (no começo)
          Bco := TBco.Create;
          Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
          Bco.Destroy;

          { TODO : Filtrar gravação do tipo 7 (combinado) - melhorar velocidade do REL }
          //if (DM3.cdsRelNTIPO_COB.Value < 7) then
          begin
            pos := 0;
            DM3.cdsRelN.First;
            while not DM3.cdsRelN.Eof do
            begin
              Rel3.Calcula_Frete(DM3.cdsRelNNROMA.Value);
              DM3.cdsRelN.Next;
            end;
          end;
          {
          else
          begin
            Rel3.Calcula_Frete(DM3.cdsRelNNROMA.Value);
          end;
          }
        end;
        // ==========================================
        // para e atualiza a tela
        if (i mod 5 =0) then
        begin
          marca := DM3.cdsRelV.GetBookmark;
          Bco := TBco.Create;
          Bco.Credito_MostraItens(DM3.cdsCredID.Value);
          Bco.Destroy;
          DM3.cdsRelV.GotoBookmark(marca);
        end;
      end; // for  
    end; // with

      marca := DM3.cdsRelV.GetBookmark;

      Bco := TBco.Create;
      Bco.Credito_SPtotal(DM3.cdsCredID.Value);

      Bco.Credito_MostraItens(DM3.cdsCredID.Value);
      Bco.Destroy;

      DM3.cdsRelV.GotoBookmark(marca);

  end; // selected > 0
end;




procedure TCob2.JvDBGrid1DblClick(Sender: TObject);
begin
  Rel3.set_idRel(DM3.cdsRelVID.Value);
  Rel3.lbRel.Caption := Dm3.cdsRelVID.AsString;
  Rel3.show;
end;

procedure TCob2.edRomaEnter(Sender: TObject);
begin
  edRoma.Text := '';
end;

procedure TCob2.edRomaKeyPress(Sender: TObject; var Key: Char);

var achei : boolean;

begin
  if (key = #13) then
  begin
    achei := false;
    DM3.cdsRelV.First;
    while not DM3.cdsRelV.Eof and not achei do
    begin
      if (DM3.cdsRelVROMANEIO.AsInteger = StrToInt(edRoma.Text)) then achei := true;
      DM3.cdsRelV.Next;
    end;
    if (achei) then DM3.cdsRelV.Prior;
    edRoma.Text := '';
  end;

end;

Procedure Imprime();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with Cob2 do
   begin
     doc := 'Detalhes Cobrança ';
     { carrega o arquivo }
     relCob.Template.FileName := dirR+'\Rels\RelCob.rtm';
     relCob.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     relCob.DeviceType := 'Screen';
     relCob.ShowAutoSearchDialog  := False;
     relCob.ShowCancelDialog := False;
     relCob.ShowPrintDialog := False;
     relCob.PrinterSetup.DocumentName := doc;

     ppLabel8.Caption := cbCli.Items[cbCli.ItemIndex];
     ppLabel1.Caption := DM3.cdsCredDESCR.Value;

     { imprime a ordem de serviço }
     relCob.PrintReport;

     {Fecha os arquivos}
   end;
end;


procedure TCob2.btImprimeClick(Sender: TObject);
begin
  Imprime;
end;

procedure TCob2.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
{
   if not (gdSelected in State) then
    if (DM3.cdsRelV.Value = 0) then
    begin
      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsStrikeOut];
      JvDBGrid1.Canvas.Font.Color := clGray;
    end
    else
    begin

      //DBGrid1.Canvas.Brush.Color := clYellow;
      JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsBold];
      JvDBGrid1.Canvas.Font.Color := clBlue;
    end;
 }
end;

procedure TCob2.btZerosClick(Sender: TObject);
begin
  CobZero.set_idCob(DM3.cdsCredID.Value);
  CobZero.lb1.Caption := cbCli.Items[cbCli.itemindex];
  CobZero.lb2.Caption := DM3.cdsCredDESCR.Value;
  CoBZero.Atualiza;
  Aguarde.ShowModal;
  if (Aguarde.ModalResult = mrOk) then CobZero.Show;
  
end;

end.
