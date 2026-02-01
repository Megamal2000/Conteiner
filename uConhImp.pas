unit uConhImp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, DB, JvDataSource, Grids, DBGrids,
  JvExDBGrids, JvDBGrid, Buttons, ppCtrls, ppPrnabl, ppClass, ppDB,
  ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ComObj,
  ppDesignLayer, ppParameter, System.ImageList, Vcl.ImgList, Vcl.Menus,
  JvExControls, JvArrowButton, JvProgressBar, JvMenus;

type
  TConhImp = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    Bevel10: TBevel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    dat1: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    JvDataSource1: TJvDataSource;
    btData: TSpeedButton;
    btImp: TSpeedButton;
    btExcel: TSpeedButton;
    Label23: TLabel;
    lbUlt: TLabel;
    Notas: TLabel;
    lbQt: TLabel;
    StatusBar1: TStatusBar;
    Label25: TLabel;
    Bevel12: TBevel;
    Label28: TLabel;
    Bevel15: TBevel;
    Label29: TLabel;
    Bevel16: TBevel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    ppDBPipeline1: TppDBPipeline;
    RelCon: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppImage1: TppImage;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine1: TppLine;
    ppSummaryBand1: TppSummaryBand;
    dat2: TDateTimePicker;
    Label22: TLabel;
    cbCli: TComboBox;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppDBCalc3: TppDBCalc;
    btMail: TSpeedButton;
    ImageList1: TImageList;
    JvArrowButton1: TJvArrowButton;
    Panel3: TPanel;
    Label24: TLabel;
    agLB: TStaticText;
    agPB: TJvGradientProgressBar;
    JvPopupMenu1: TJvPopupMenu;
    ReenviarCONEMB2: TMenuItem;
    CopiarXML2: TMenuItem;
    Panel4: TPanel;
    Label26: TLabel;
    edNumC: TEdit;
    Label27: TLabel;
    edDOCCOB: TEdit;
    btTodos: TSpeedButton;
    FretenaNotaFiscal1: TMenuItem;
    btExcelCli: TSpeedButton;
    procedure btDataClick(Sender: TObject);
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure btImpClick(Sender: TObject);
    procedure btExcelClick(Sender: TObject);
    procedure btMailClick(Sender: TObject);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CopiarXML2Click(Sender: TObject);
    procedure ReenviarCONEMB2Click(Sender: TObject);
    procedure edNumCKeyPress(Sender: TObject; var Key: Char);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure edDOCCOBKeyPress(Sender: TObject; var Key: Char);
    procedure btTodosClick(Sender: TObject);
    procedure FretenaNotaFiscal1Click(Sender: TObject);
    procedure btExcelCliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  ConhImp : TConhImp;
  NumC    : Integer;
  liga    : boolean;


implementation

{$R *.dfm}

uses uBanco, uDM1, uDM2, uDM4, uImp, uLib, uMailmz, uCtePQ, uNegocio;

procedure Limpa();
begin
  with ConhImp do
  begin
    Label1.Caption := '';
    Label2.Caption := '';
    Label3.Caption := '';
    Label4.Caption := '';
    Label5.Caption := '';
    Label6.Caption := '';
    Label7.Caption := '';
    Label8.Caption := '';
    Label9.Caption := '';
    Label10.Caption := '';
    Label30.Caption := '';
    Label31.Caption := '';
    Label32.Caption := '';
    edNumC.Text     := '';
    edDOCCOB.Text   := '';


  end;
end;

procedure Preenche();
begin
  with ConhImp do
  begin
    Label1.Caption := FormatFloat('#,##0.00', DM4.cdsConhFRETEPESO.AsFloat);
    Label2.Caption := FormatFloat('#,##0.00', DM4.cdsConhADICPESO.AsFloat);
    Label3.Caption := FormatFloat('#,##0.00', DM4.cdsConhFRETEVALOR.AsFloat);
    Label4.Caption := FormatFloat('#,##0.00', DM4.cdsConhGRIS.AsFloat);
    Label5.Caption := FormatFloat('#,##0.00', DM4.cdsConhPEDAGIO.AsFloat);
    Label6.Caption := FormatFloat('#,##0.00', DM4.cdsConhTXCTE.AsFloat);
    Label30.Caption := FormatFloat('#,##0.00', DM4.cdsConhTDE.AsFloat);
    Label31.Caption := FormatFloat('#,##0.00', DM4.cdsConhPONTO.AsFloat);
    Label7.Caption := FormatFloat('#,##0.00', DM4.cdsConhOUTROS.AsFloat);
    Label8.Caption := FormatFloat('#,##0.00', DM4.cdsConhTOTAL.AsFloat);
    Label9.Caption := FormatFloat('#,##0.00', DM4.cdsConhBASE.AsFloat);
    Label10.Caption := FormatFloat('#,##0.00', DM4.cdsConhALIQ.AsFloat);
    Label32.Caption := FormatFloat('#,##0.00', DM4.cdsConhICMS.AsFloat);


  end;
end;



procedure TConhImp.btDataClick(Sender: TObject);

var bco : TBco;
    idC : Integer;

begin
  idC := 0;
  if (cbCli.ItemIndex > 0) then
  begin
    idC :=  DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente','Nome');
    bco := TBco.Create;
    bco.Conhec_PesqData(dat1.DateTime, dat2.DateTime,idC);
    bco.Conhec_UltimoNum(dat2.datetime);
    bco.Destroy;

    if (DM4.cdsConh.RecordCount > 0) then
    begin
      DM4.cdsConh.Last;
      lbQt.Caption  := IntToStr(DM4.cdsConh.RecordCount);
      lbUlt.Caption := DM4.cdsConh.Fields[2].AsString;
      DM4.cdsConh.First;
    end
    else
    begin
      lbQt.Caption  := '-';
      lbUlt.Caption := '-';
    end;
  end
  else ShowMessage('Escolha um CLIENTE!');

end;

procedure TConhImp.JvDBGrid1CellClick(Column: TColumn);
begin
  Preenche;
end;

procedure TConhImp.JvDBGrid1DblClick(Sender: TObject);
begin
  // Mostra
  CtePQ.Entrar;
  CtePQ.PesqCTe(DM4.cdsConhNUMC.AsString);
  CtePQ.Show;
end;

procedure TConhImp.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DM4.cdsConhSTATUSENVIO.Value < 4) then
  if not (gdSelected in State) then
  begin
    //DBGrid1.Canvas.Brush.Color := clYellow;
    //JvDBGrid1.Canvas.Font.Style := JvDBGrid1.Canvas.Font.Style + [fsitalic];
    JvDBGrid1.Canvas.Font.Color := clGray;
    JvDBGrid1.Canvas.FillRect(rect);
    JvDBGrid1.DefaultDrawdatacell(Rect,Column.Field ,State);
  end;

  if Column.Field=DM4.cdsConhSTATUS_EDI then
  begin
    JvDBGrid1.Canvas.FillRect(Rect);
    // Desenha o Quadrado
    if DM4.cdsConhSTATUS_EDI.Value=0 then ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+1,Rect.Top+1,0);
    if DM4.cdsConhSTATUS_EDI.Value=1 then ImageList1.Draw(JvDBGrid1.Canvas,Rect.Left+1,Rect.Top+1,1);
  end;

end;

procedure TConhImp.ReenviarCONEMB2Click(Sender: TObject);
var nSel,i, j : Integer;
    Bco : TBco;
begin
  nSel := JvDBGrid1.SelectedRows.Count;
  // reenviar Conemb
  if nSel>0 then
  begin
    if MessageDlg('Tem certeza que deseja REENVIAR os ' + nSel.ToString + ' selecionados? ',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     agLb.Caption := '';
     agPB.Min := 1;
     agPB.Max := nSel+1;
     agPB.Position := 0;
     Panel3.Visible := true;
     with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid1.SelectedRows.Items[i]);
        Bco := TBco.Create;
        Bco.Cte_MarcarEDI(DM4.cdsConhNUMC.Value,DM4.cdsConhLIGCLI.Value, 0);
        Bco.Destroy;

        agLb.Caption := i.ToString +' de '+nSel.ToString;
        agPB.Position := agPB.Position + 1;
      end;
    end;
    agLb.Caption := 'TERMINADO.';
    Panel3.Visible := false;
  end
  else ShowMessage('Selecione alguns Conhecimentos!');

end;

procedure TConhImp.btTodosClick(Sender: TObject);
begin
  JvDBGrid1.SelectAll;
end;

Function Espacos(N : Integer): String;

var x : Integer;
    S : String;

 begin
  S := '';
  For x := 1 to N do S := S + ' ';
  Espacos := S;
 end;


Function AdjustLeft(st:string; qt:byte; ch:char):string;

var aux,S : String;
    pos   : byte;
    x     : integer;

begin
  x := qt;
  aux := StringOfChar(ch, x);
  aux := st+aux;
  S := Copy(aux,1,x);

  Adjustleft  := S;
end;

function RetiraAcentos ( str: String ): String;
var
i: Integer;
begin
  for i := 1 to Length ( str ) do
  case str[i] of
  'á': str[i] := 'a';
  'é': str[i] := 'e';
  'í': str[i] := 'i';
  'ó': str[i] := 'o';
  'ú': str[i] := 'u';
  'à': str[i] := 'a';
  'è': str[i] := 'e';
  'ì': str[i] := 'i';
  'ò': str[i] := 'o';
  'ù': str[i] := 'u';
  'â': str[i] := 'a';
  'ê': str[i] := 'e';
  'î': str[i] := 'i';
  'ô': str[i] := 'o';
  'û': str[i] := 'u';
  'ä': str[i] := 'a';
  'ë': str[i] := 'e';
  'ï': str[i] := 'i';
  'ö': str[i] := 'o';
  'ü': str[i] := 'u';
  'ã': str[i] := 'a';
  'õ': str[i] := 'o';
  'ñ': str[i] := 'n';
  'ç': str[i] := 'c';
  'Á': str[i] := 'A';
  'É': str[i] := 'E';
  'Í': str[i] := 'I';
  'Ó': str[i] := 'O';
  'Ú': str[i] := 'U';
  'À': str[i] := 'A';
  'È': str[i] := 'E';
  'Ì': str[i] := 'I';
  'Ò': str[i] := 'O';
  'Ù': str[i] := 'U';
  'Â': str[i] := 'A';
  'Ê': str[i] := 'E';
  'Î': str[i] := 'I';
  'Ô': str[i] := 'O';
  'Û': str[i] := 'U';
  'Ä': str[i] := 'A';
  'Ë': str[i] := 'E';
  'Ï': str[i] := 'I';
  'Ö': str[i] := 'O';
  'Ü': str[i] := 'U';
  'Ã': str[i] := 'A';
  'Õ': str[i] := 'O';
  'Ñ': str[i] := 'N';
  'Ç': str[i] := 'C';
end;
Result := str;
end;


procedure Imprimir(idNF : Integer);
var  F : TextFile;
     Porta : String;
     Margem : String;
     x,i : integer;
     UF : String;
     Dia : String;
     Car : Char;
     Data  : TDateTime;
     compPeso, compValor, compSEC, compDespacho, compPedagio,
     compOutros, compTotal, compBC, compAliq, compICMS : double;

     motNome, motPlaca, motVeiculo, motColeta, motEntrega : String;
     iAno,iMes, iDia : Word;
     Imprimir : Boolean;
     Esquerda, Superior : Integer;
     impPeso, impValor, impSEC, impDespacho, impPedagio, impOutros : DOuble;

     cliNome, cliEnder, cliCidade, cliUF, cliCEp, cliCNPJ, cliIE : String;
     destNome, destEnder, destCidade, destUF, destCEp, destCNPJ, destIE : String;
     conhData : String;
     conhNatureza, conhEspecie : String;
     conhQuant, conhVolume, conhNF : Integer;
     conhPeso, conhValor : double;


begin
  Imprimir := False;
  //ShowMessage('Nota '+ IntToStr(Conh.get_edi.Notas[num].numero));


  // Dados a Receber
  // Cliente
  cliNome  := DM1.cdsCliNOME.Value;
  cliEnder := DM1.cdsEnderENDER.Value + ', '+DM1.cdsEnderNUMERO.AsString;
  cliCidade:= DM1.cdsEnderCIDADE.Value;
  cliUF    := DM1.cdsEnderESTADO.Value;
  cliCEP   := DM1.cdsEnderCEP.Value;
  cliCNPJ  := DM1.cdsCliCNPJ.Value;
  cliIE    := DM1.cdsCliIE.Value;

  // Destinatário
  destNome  := DM4.cdsEspelhoRAZAOS.Value;
  destEnder := DM4.cdsEspelhoENDERECO.Value + ', '+DM4.cdsEspelhoNUMERO.AsString;
  destCidade:= DM4.cdsEspelhoCIDADE.Value;
  destUF    := DM4.cdsEspelhoESTADO.Value;
  destCEP   := DM4.cdsEspelhoCEP.Value;
  destCNPJ  := DM4.cdsEspelhoDCNPJ.Value;
  destIE    := DM4.cdsEspelhoDIE.Value;

    // Conhecimento
  conhData     := FormatDateTime('dd/MM/yyyy', Now);
  conhNatureza := 'Material';
  conhQuant    := DM4.cdsEspelhoVOLUME.Value;
  conhEspecie  := 'cx';
  conhPeso     := DM4.cdsEspelhoPESO.AsFloat;
  conhVolume   := 1;
  conhNF       := DM4.cdsEspelhoNUMNF.Value;
  conhValor    := DM4.cdsEspelhoVALOR.AsFloat;

  //Composicao
   compPeso     := DM4.cdsConhFRETEPESO.AsFloat;
   compValor    := DM4.cdsConhFRETEVALOR.AsFloat;
   compSEC      := DM4.cdsConhSECCAT.AsFloat;
   compDespacho := DM4.cdsConhDESPACHO.AsFloat;
   compPedagio  := DM4.cdsConhPEDAGIO.AsFloat;
   compOutros   := DM4.cdsConhOUTROS.AsFloat;

   compTotal    := DM4.cdsConhTOTAL.AsFloat;
   compBC       := DM4.cdsConhBASE.AsFloat;
   compAliq     := DM4.cdsConhALIQ.AsFloat;
   compICMS     := DM4.cdsConhICMS.AsFloat;

   //Motorista
   motNome    := DM4.cdsConhMOTNOME.Value;
   motPlaca   := DM4.cdsConhMOTPLACA.Value;
   motVeiculo := DM4.cdsConhMOTVEICULO.Value;
   motColeta  := 'Sao Paulo';
   motEntrega := AdjustLeft(RetiraAcentos(destCidade),20,Car);


  with ConhImp do
  begin
    //Margem Esquerda
    Esquerda := 2;
    Superior := 19;
    Margem :=Espacos(Esquerda);
    Car := ' ';

    Porta := 'LPT1';
    AssignFile(F,Porta);
    ReWRITE(F);

    Write(F,TamPagina);
    Write(F,Condensado);
    //kk
    Write(F,#27+'3'+#1);
    //Tabulado para 12 e 76
    Write(F,#27+'D'+#9+#72+#0);


    //Margem Superior
    Write(F,Lin216(Superior));
    Write(F,#10);

    // Inicia a Impressao
    Write(F,#9);
    Write(F,#9);

    // Natureza da operação e Código
    Write(F,Margem+AdjustLeft('Transporte',20,Car));
    if (destUF = 'SP') then
      Write(F,Espacos(33)+AdjustLeft('5351',7,Car))
    else
      Write(F,Espacos(33)+AdjustLeft('6351',7,Car));

    Write(F,Lin216(10));
    Write(F,#10);

    Write(F,#9);
    Write(F,#9);

  //Local e data
  iDia := StrToInt( copy(ConhData, 1,2) );
  iMes := StrToInt( copy(ConhData, 4,2) );
  iAno := StrToInt( copy(ConhData, 7,4) );

  Data := EncodeDate( iAno, iMes, iDia);
  Dia  := FormatDateTime('dd',Data)+ ' de '+ FormatDateTime('mmmmm',Data)+' de ' +FormatDateTime('yyyy',Data);
  Write(F,Margem+'Sao Paulo, '+Dia);
  Write(F,Lin216(6));
  Write(F,#10);

  Write(F,#9);

  //Remetente e Destinatario
  Write(F,Margem+AdjustLeft(RetiraAcentos(cliNome),50,Car));
  Write(F,#9);
  Write(F,Espacos(12)+AdjustLeft(RetiraAcentos(destNome),50,Car));
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

   //Enderecos
  Write(F,Margem+AdjustLeft(RetiraAcentos(cliEnder),50,Car));
  Write(F,#9);
  Write(F,Espacos(12)+AdjustLeft(RetiraAcentos(destEnder),50,Car));
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

  //Municipios e UF's
  Write(F, Margem+AdjustLeft(RetiraAcentos(cliCidade),25,Car));
  UF := cliUF;
  Write(F,Espacos(23)+UF);
  Write(F,#9);
  Write(F,Espacos(12)+AdjustLeft(RetiraAcentos(destCidade),16,Car));
  UF := destUF + ' '+destCEP;
  Write(F,Espacos(23)+UF);
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

   //CNPJ e IE
  Write(F,Margem +AdjustLeft(cliCNPJ,19,Car));
  Write(F,Espacos(15)+AdjustLeft(cliIE,16,Car));
  Write(F,#9);
  Write(F,Espacos(12)+AdjustLeft(destCNPJ,19,Car));
  Write(F,Espacos(15)+AdjustLeft(destIE,16,Car));
  Write(F,Lin216(7));
  Write(F,#10);

  Write(F,#9);


  //Frete por conta de
  UF := 'Remetente';
  Write(F,Espacos(16)+UF);
  Write(F,EV16);
  for i:= 1 to 4 do Write(F,#10);
 {
  Write(F,#9);

  //Consignatário e Empresa
  Write(F, AdjustLeft(Edit8.Text,50,Car));
  Write(F,#9);
  Write(F,Espacos(10)+AdjustLeft(Edit16.Text,50,Car));
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

   //Enderecos
  Write(F,AdjustLeft(Edit9.Text,50,Car));
  Write(F,#9);
  Write(F,Espacos(10)+AdjustLeft(Edit17.Text,50,Car));
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

  //Municipios e UF's
  Write(F, AdjustLeft(Edit10.Text,25,Car));
  if (Edit10.text <> '') then UF := Combobox2.Items[Combobox2.ItemIndex] else UF := '     ';
  Write(F,Espacos(23)+UF);
  Write(F,#9);
  Write(F,Espacos(10)+AdjustLeft(Edit18.Text,25,Car));
  if (Edit18.text <> '') then UF := Combobox4.Items[Combobox4.ItemIndex] else UF := '     ';
  Write(F,Espacos(23)+UF);
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);

   //CNPJ
  Write(F,#9);
  Write(F,Espacos(10)+AdjustLeft(Edit19.Text,19,Car));
  Write(F,Lin216(4.5));
  Write(F,#10);

  Write(F,#9);


  //Calculado ate
  Write(F,Espacos(4)+AdjustLeft(Edit11.Text,15,Car));
  Write(F,Espacos(20)+AdjustLeft(Edit12.Text,12,Car));
  Write(F,#9);
  Write(F,Espacos(10)+AdjustLeft(Edit20.Text,30,Car));
  Write(F,Lin216(12));
  Write(F,#10);
}
  // Marca o X
 // Write(F,Lin216(40));
 // Write(F,#10);

  Write(F,Espacos(5)+Espacos(26)+'X');



  //Mercadoria Linha 1
  Write(F,Lin216(75));
  Write(F,#10);

  Write(F,Espacos(6)+AdjustLeft(ConhNatureza,10,Car)+Espacos(14));
  Write(F,AdjustLeft(IntToStr(ConhQuant),10,Car)+Espacos(6));
  Write(F,AdjustLeft(ConhEspecie,10,Car)+Espacos(10));
  Write(F,AdjustLeft(FloatToStr(ConhPeso),10,Car)+Espacos(10));
  Write(F,AdjustLeft(FloatToStr(ConhVolume),10,Car)+Espacos(10));
  Write(F,AdjustLeft(IntToStr(ConhNF),10,Car)+Espacos(10));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',ConhValor),10,Car));
  Write(F,Lin216(8));
  Write(F,#10);

  //Write(F,Espacos(Esquerda-2)+Format('%6s',[Edit35.Text])+Espacos(7));
  Write(F,Espacos(4)+AdjustLeft(FormatFloat('#,##0.00',compPeso),7,Car)+Espacos(10));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compValor),7,Car)+Espacos(9));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compSEC),7,Car)+Espacos(7));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compDespacho),7,Car)+Espacos(6));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compPedagio),7,Car)+Espacos(5));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compOutros),7,Car)+Espacos(5));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compTotal),12,Car)+Espacos(5));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compBC),12,Car)+Espacos(4));
  Write(F,AdjustLeft('12%',5,Car)+Espacos(4));
  Write(F,AdjustLeft(FormatFloat('#,##0.00',compICMS),6,Car));
  Write(F,Lin216(4));
  Write(F,#10);

  Write(F,Margem+AdjustLeft(RetiraAcentos(motNome),18,Car)+Espacos(13));
  Write(F,AdjustLeft(motPLaca,18,Car)+Espacos(10));
  Write(F,AdjustLeft(RetiraAcentos(motVeiculo),18,Car)+Espacos(10));
  Write(F,AdjustLeft(RetiraAcentos(motColeta),18,Car)+Espacos(11));
  Write(F,AdjustLeft(RetiraAcentos(motEntrega),18,Car));
  Write(F,Lin216(8));
  Write(F,#10);

{
  //Obs Padrao
  Write(F,Margem+Memo1.Lines.Strings[0]);
  WriteLN(F,' '+Memo1.Lines.Strings[1]);

  //Obs normal
  WriteLN(F,Margem+Memo2.Lines.Strings[0]);
  WriteLN(F,Margem+Memo2.Lines.Strings[1]);
  WriteLN(F,Margem+Memo2.Lines.Strings[2]);
 }
  //Linha normal
  Write(F,EV16);

  Write(F,AvancoPag);

  CloseFile(F);
  end;
  Imprimir := True;
end;

procedure Imprimir_Lista();

var doc : String;
    dirR : String;

begin
   GetDir(0, dirR);
   with ConhImp do
   begin
     doc := 'Lista de Extras';
     { carrega o arquivo }
     RelCon.Template.FileName := dirR+'\Rels\RelConh.rtm';
     RelCon.Template.LoadFromFile;

     { Configurações do tipo de impressão }
     RelCon.DeviceType := 'Screen';
     RelCon.ShowAutoSearchDialog  := False;
     RelCon.ShowCancelDialog := False;
     RelCon.ShowPrintDialog := False;
     RelCon.PrinterSetup.DocumentName := doc;


     ppLabel5.Caption:= FormatDateTime('dd/MM/yyyy', dat1.DateTime);
     ppLabel6.Caption:= FormatDateTime('dd/MM/yyyy', dat2.DateTime);
     ppLabel2.Caption:= '';
     if (cbCli.ItemIndex > 0) then ppLabel2.Caption:= cbCli.Items[cbCli.ItemIndex];

     { imprime a ordem de serviço }
     RelCon.PrintReport;

     {Fecha os arquivos}
   end;

end;


procedure TConhImp.btImpClick(Sender: TObject);

begin
  Imprimir_Lista;
end;

procedure TConhImp.btExcelClick(Sender: TObject);

var linha, coluna, i : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;
    Bco : TBco;

begin

 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Exportando dados do dbGrid para o Excel';
 planilha.visible := true;

{
 ==============================================
   cabecalhos
 ==============================================
 }
 // Títulos
 for coluna := 0 to JvDBGrid1.Columns.Count - 1 do
 begin
   valorCampo := JvDBGrid1.Columns.Items[coluna].DisplayName;
   planilha.cells[1,coluna+1] := valorcampo;
 end;
 coluna := coluna - 1;

 planilha.cells[1,coluna+2] := 'CEP';
 planilha.cells[1,coluna+3] := 'Valor da NF';
 planilha.cells[1,coluna+4] := 'Peso';
 planilha.cells[1,coluna+5] := 'Volume';
 planilha.cells[1,coluna+6] := 'Cubagem';

 planilha.cells[1,coluna+7] := 'Frete Peso';
 planilha.cells[1,coluna+8] := 'Adic Peso';
 planilha.cells[1,coluna+9] := 'Ad Valor';
 planilha.cells[1,coluna+10] := 'GRIS';
 planilha.cells[1,coluna+11] := 'Pedágios';
 planilha.cells[1,coluna+12] := 'Impostos';
 planilha.cells[1,coluna+13] := 'Tx CT-e';
 planilha.cells[1,coluna+14] := 'TDE';
 planilha.cells[1,coluna+15] := 'R$ Pontos';
 planilha.cells[1,coluna+16] := 'Outros';
 planilha.cells[1,coluna+17] := 'Frete Total';
 planilha.cells[1,coluna+18] := 'Qt pontos';
 planilha.cells[1,coluna+19] := 'Entregue';
 planilha.cells[1,coluna+20] := 'Ocorrência';
 planilha.cells[1,coluna+21] := 'Data Entrega';
 planilha.cells[1,coluna+22] := 'Num DocCob';
 planilha.cells[1,coluna+23] := 'Chave';
 planilha.cells[1,coluna+24] := 'Autorizado SEFAZ';


 //planilha.cells[1,coluna+21] := '';

{
 ==============================================
   DADOS
 ==============================================
 }


 // Dados
 JvDBGrid1.DataSource.DataSet.First;
 for linha := 1 to JvDBGrid1.DataSource.DataSet.RecordCount do
 begin
       // Tabela Notas
       // -----------------------
       Bco := TBco.Create;
       Bco.Notas_MostraId(DM4.cdsConhLIGNOTA.Value);
       Bco.Destroy;

   for coluna := 0 to JvDBGrid1.Columns.Count -1  do
   begin


       valorcampo := JvDBGrid1.Columns.Grid.Fields[coluna].AsString;
       if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
       planilha.cells[linha + 2,coluna+1] :=  valorCampo;
   end;
       // complementos dos cálculos do CT-e
        // ************************ Mostra Detalhes
        coluna := coluna - 1;
        // -- CEP
        valorcampo := DM1.cdsNotasCEP.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+2] :=  valorCampo;

        // -- Valor da NF
        valorcampo := DM1.cdsNotasVALOR.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+3] :=  valorCampo;

        // -- Peso
        valorcampo := DM1.cdsNotasPESO.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+4] :=  valorCampo;

        // -- Volume
        valorcampo := DM1.cdsNotasVOLUME.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+5] :=  valorCampo;

        // -- Cubagem
        valorcampo := DM1.cdsNotasCUB_VOLUME.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+6] :=  valorCampo;




        // -- Frete Peso
        valorcampo := FloatToStr(DM4.cdsConhFRETEPESO.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+7] :=  valorCampo;

        // -- Frete Peso Adic
        valorcampo := FloatToStr(DM4.cdsConhADICPESO.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+8] :=  valorCampo;
        // -- Ad Valor
        valorcampo := FloatToStr(DM4.cdsConhFRETEVALOR.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+9] :=  valorCampo;
        // -- Gris
        valorcampo := FloatToStr(DM4.cdsConhGRIS.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+10] :=  valorCampo;
        // -- Pedágio
        valorcampo := FloatToStr(DM4.cdsConhPEDAGIO.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+11] :=  valorCampo;
        // -- Impostos (ICMS)
        valorcampo := FloatToStr(DM4.cdsConhICMS.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+12] :=  valorCampo;
        // -- Emissao (Taxa CTRC)
        valorcampo := FloatToStr(DM4.cdsConhTXCTE.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+13] :=  valorCampo;
        // -- GrauD (TDE) Flutua
        valorcampo := FloatToStr(DM4.cdsConhTDE.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+14] :=  valorCampo;

        // -- R$ Pontos
        valorcampo := FloatToStr(DM4.cdsConhPONTO.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+15] :=  valorCampo;

        // -- Outros  Flutua
        valorcampo := FloatToStr(DM4.cdsConhOUTROS.AsFloat);
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+16] :=  valorCampo;

        // -- Frete Total
        valorcampo := DM4.cdsConhTOTAL.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+17] :=  valorCampo;

        // -- Ponto
        valorcampo := DM1.cdsNotasPONTO.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+18] :=  valorCampo;

        // -- Entregue
        valorcampo := DM1.cdsNotasENTREGUE.AsString;
        planilha.cells[linha + 2,coluna+19] :=  valorCampo;

        // -- ocorrência
        valorcampo := DM1.cdsNotasOBS.AsString;
        planilha.cells[linha + 2,coluna+20] :=  valorCampo;

        // -- Data da Entrega
        dt := DM1.cdsNotasDTENT.AsDateTime;
        planilha.cells[linha + 2,coluna+21] :=  dt;

        // -- Num DOCCOB
        valorcampo := DM4.cdsConhLIGDCOB.AsString;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+22] :=  valorCampo;

        // -- CHAVE
        valorcampo := DM4.cdsConhARQUIVO.Value;
        if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
        planilha.cells[linha + 2,coluna+23] :=  valorCampo;

        ///// -- STATUS
        valorcampo := 'CTE Não Enviado';
        if (DM4.cdsConhSTATUSENVIO.Value = 4) then valorcampo := 'Ok';
        if (DM4.cdsConhSTATUSENVIO.Value > 4) then valorcampo := 'Cancelado';
        planilha.cells[linha + 2,coluna+24] :=  valorCampo;



   JvDBGrid1.DataSource.DataSet.Next;
 end;
 planilha.columns.Autofit;

end;

procedure Exporta_Cli2();
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
var dt : TDateTime;
    i, loc, qtNF, ff, pesqOcor  : Integer;
    Neg : TNeg;
    Bco : TBco;
    vlrFloat : double;

begin
with ConhImp do
begin
 planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Excel Cobrança - Cliente';
 planilha.visible := true;
 linha := -1;
 agpb.Min := 0;
 agpb.Max := JvDBGrid1.SelectedRows.Count;

 // Titulos
 planilha.cells[1,1] := 'NÚMERO DA FATURA';
 planilha.cells[1,2] := 'NOME TRANSPORTADOR';
 planilha.cells[1,3] := 'CNPJ';
 planilha.cells[1,4] := 'TIPO DE FRETE';
 planilha.cells[1,5] := 'CTE';
 planilha.cells[1,6] := 'DATA EMISSÃO CTE';

 planilha.cells[1,7] := 'DESTINATÁRIO';
 planilha.cells[1,8] := 'CPF/CNPJ';
 planilha.cells[1,9] := 'CIDADE DO DESTINATÁRIO';
 planilha.cells[1,10] := 'REGIÂO';
 planilha.cells[1,11] := 'CEP DESTINO';
 planilha.cells[1,12] := 'UF DESTINO';

 planilha.cells[1,13] := 'NÚMERO DO PEDIDO';
 planilha.cells[1,14] := 'NÚMERO NF';
 planilha.cells[1,15] := 'SÉRIE NF';
 planilha.cells[1,16] := 'DATA EMISSÃO NF';
 planilha.cells[1,17] := 'VALOR DA NF';
 planilha.cells[1,18] := 'PESO REAL';
 planilha.cells[1,19] := 'PESO CUBADO';
 planilha.cells[1,20] := 'PESO CONSIDERADO';

 planilha.cells[1,21] := 'FRETE PESO';
 planilha.cells[1,22] := 'PESO EXC';
 planilha.cells[1,23] := 'GRIS';
 planilha.cells[1,24] := 'ADV';
 planilha.cells[1,25] := 'PEDAGIO';
 planilha.cells[1,26] := 'TDE';
 planilha.cells[1,27] := 'TEMIS';
 planilha.cells[1,28] := 'OUTROS';
 planilha.cells[1,29] := 'VLR AGENDADA';
 planilha.cells[1,30] := 'ICMS';
 planilha.cells[1,31] := 'Alíquota de ICMS';
 planilha.cells[1,32] := 'FRETE TOTAL S/ICMS';
 planilha.cells[1,33] := 'FRETE TOTAL C/ICMS';
 planilha.cells[1,34] := 'QTDE DE ITENS';
 planilha.cells[1,35] := 'CHAVE DE ACESSO';
 planilha.cells[1,36] := 'CLI';
 planilha.cells[1,37] := 'num OCOR';
 planilha.cells[1,38] := 'OCORRÊNCIA';
 planilha.cells[1,39] := 'DATA DE ENTREGA';
 planilha.cells[1,40] := 'Autorizado SEFAZ';


 // Dados
 pesqOcor := 0;
 if JvDBGrid1.SelectedRows.Count>0 then
  begin
    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
         linha := linha + 1;
         agpb.Position := linha;

       // Tabela Notas
       // -----------------------
       Bco := TBco.Create;
       Bco.Notas_MostraId(DM4.cdsConhLIGNOTA.Value);
       Bco.Destroy;


       // Linhas
         if DM1.cdsNotas.RecordCount>0 then
         begin
           // Marca como Cobrado no Rel = 2
           Bco := TBco.Create;
           Bco.Marca_Cobrado(DM1.cdsNotasID.Value,2);
           Bco.Destroy;
           // **************************************
           // ** NAO UTILIZADOS - out/018
           // **************************************
           {
           // -- Romaneio
            valorcampo := DM1.cdsRomaRROMANEIO.AsString;
            planilha.cells[linha + 2,1] :=  valorCampo;

            // -- Motorista
            valorcampo := DM1.cdsRomaRNOME.Value;
            planilha.cells[linha + 2,2] :=  valorCampo;

             // -- HR Entrega
            valorcampo := ' ' + copy(DM1.cdsRomaRHORA.AsString, 1, 5);
            planilha.cells[linha + 2,5] :=  valorCampo;
           }
           // **************************************
           // ** DADOS INICIAIS 1 a 12
           // **************************************
              // -- Numero da Fatura FIXO
              planilha.cells[linha + 2,1] :=  0;

              // -- Nome do Transportador FIXO
              planilha.cells[linha + 2,2] :=  'FLAYDEL LOG';

              // -- CNPJ FIXO
              planilha.cells[linha + 2,3] :=  '191839920001-68';

            // -- TIPO DE FRETE FIXO -- Serviço 2
            valorcampo := 'Peso';
            if DM1.cdsNotasTIPO_COB.Value = 2 then valorcampo := 'Taxa';
            if DM1.cdsNotasTIPO_COB.Value = 3 then valorcampo := 'Entrega';
            if DM1.cdsNotasTIPO_COB.Value = 4 then valorcampo := 'Saída';
            if DM1.cdsNotasTIPO_COB.Value = 5 then valorcampo := 'Contrato';
            planilha.cells[linha + 2,4] :=  valorcampo;

             /// *************************************

           //if DM1.cdsRomaRNCONH.Value>0 then
           begin

             // -- Cte
              valorcampo := DM4.cdsConhNUMC.AsString;
              planilha.cells[linha + 2,5] :=  valorcampo;

              // -- Data da Emissão do CTE
              dt := DM4.cdsConhDATAC.AsDateTime;
              planilha.cells[linha + 2,6] :=  dt;

              // CHAVE DE ACESSO
              valorcampo := DM4.cdsConhARQUIVO.AsString;
              planilha.cells[linha + 2,35] :=  valorcampo;
           end;
           // **************************************
           // ** DADOS DESTINATARIO
           // **************************************
            // -- Destinat
            valorcampo := DM1.cdsNotasNOMEDEST.AsString;
            planilha.cells[linha + 2,7] :=  valorCampo;

            // -- CPF
            valorcampo := DM1.cdsNotasDOCDEST.AsString;
            planilha.cells[linha + 2,8] :=  valorCampo;

            // -- Cidade
            valorcampo := DM1.cdsNotasLOCALI.AsString;
            planilha.cells[linha + 2,9] :=  valorCampo;

            // -- REGIAO
            if DM1.cdsNotasTIPOLOCAL.Value = 0  then valorcampo := 'SP';
            if DM1.cdsNotasTIPOLOCAL.Value = 1  then valorcampo := 'GSP';
            if DM1.cdsNotasTIPOLOCAL.Value = 2  then valorcampo := 'INT';
            planilha.cells[linha + 2,10] :=  valorCampo;

            // -- CEP
            valorcampo := DM1.cdsNotasCEP.Value;
            planilha.cells[linha + 2,11] :=  valorCampo;

            // -- UF 11
            valorcampo := 'SP';
            planilha.cells[linha + 2,12] :=  valorCampo;

           // **************************************
           // ** DADOS NF
           // **************************************
            // -- Pedido
            valorcampo := DM1.cdsNotasNUMPED.AsString;
            planilha.cells[linha + 2,13] :=  valorCampo;

            // -- Nota Fiscal
            valorcampo := DM1.cdsNotasNUMNF.AsString;
            planilha.cells[linha + 2,14] :=  valorCampo;

            // -- Serie
            valorcampo := DM1.cdsNotasSERIENF.AsString;
            planilha.cells[linha + 2,15] :=  valorCampo;

            // -- DT EMISSÃO
            dt := DM1.cdsNotasDTNOTA.AsDateTime;
            planilha.cells[linha + 2,16] :=  dt;

            // -- valor NF
            valorcampo := DM1.cdsNotasVALOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,17] :=  valorCampo;

            if (length(DM1.cdsNotasCUB_VOLUME.AsString)=0) or (DM1.cdsNotasCUB_VOLUME.AsString='0') then
            begin
              // -- Peso NF
              valorcampo := DM1.cdsNotasPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,18] :=  valorCampo;
              planilha.cells[linha + 2,20] :=  valorCampo;

              // -- Cubagem
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,19] :=  valorCampo;
           end
            else
            begin
              // -- Peso NF
              valorcampo := '0';
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,18] :=  valorCampo;

              // -- Cubagem
              valorcampo := DM1.cdsNotasPESO.AsString;
              if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
              planilha.cells[linha + 2,19] :=  valorCampo;
              planilha.cells[linha + 2,20] :=  valorCampo;

           end;

             // ************************ Mostra Detalhes
            // -- Frete Peso
            valorcampo := FloatToStr(DM4.cdsConhFRETEPESO.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,21] :=  valorCampo;

            // -- Frete Peso Adic
            valorcampo := FloatToStr(DM4.cdsConhADICPESO.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,22] :=  valorCampo;

            // -- Gris
            valorcampo := FloatToStr(DM4.cdsConhGRIS.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,23] :=  valorCampo;

            // -- Seguro = AdValor???
            valorcampo := FloatToStr(DM4.cdsConhFRETEVALOR.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,24] :=  valorCampo;

            // -- Pedágio
            valorcampo := FloatToStr(DM4.cdsConhPEDAGIO.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,25] :=  valorCampo;

            // -- TDE - Grau de Dific
            valorcampo := FloatToStr(DM4.cdsConhTDE.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,26] :=  valorCampo;

            // -- Emissao (Taxa CTRC)  =TEMIS - taxa de EMissao
            valorcampo := FloatToStr(DM4.cdsConhTXCTE.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,27] :=  valorCampo;

            // -- Outros  Flutua
            valorcampo := FloatToStr(DM4.cdsConhOUTROS.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;

            // VLR AGENDADA
            planilha.cells[linha + 2,29] :=  0;

            // -- Impostos (ICMS)
            valorcampo := FloatToStr(DM4.cdsConhICMS.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,30] :=  valorCampo;
            planilha.cells[linha + 2,31] :=  DM4.cdsConhALIQ.AsFloat; // %ICMS

            // -- Frete Total - ICMS
            vlrFloat :=  DM4.cdsConhTOTAL.AsFloat  ;
            valorcampo := vlrFloat.ToString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,32] :=  valorCampo;

            // -- Frete Total
            valorcampo := FloatToStr(DM4.cdsConhTOTAL.AsFloat + DM4.cdsConhICMS.AsFloat);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,33] :=  valorCampo;

            // QTDE DE ITENS - Volume
            valorcampo := DM1.cdsNotasVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,34] :=  valorCampo;



            // -- Cliente LIGCLI
            valorcampo := DM1.cdsNotasLIGCLI.AsString;
            planilha.cells[linha + 2,36] :=  valorCampo;

            // -- num oCORRENCIA
            valorcampo := DM1.cdsNotasNOCORR.AsString;
            planilha.cells[linha + 2,37] :=  valorCampo;

            // -- OCORRENCIA
            if (DM1.cdsNotasNOCORR.Value = 0) then valorcampo := 'sem Ocorrência';
            if (DM1.cdsNotasNOCORR.Value = 1) then valorcampo := 'ENTREGUE';
            if (DM1.cdsNotasNOCORR.Value > 1) then
            begin
              valorcampo := 'x';
              pesqOcor := pesqOcor + 1;
            end;
            planilha.cells[linha + 2,38] :=  valorCampo;

            // -- Data da Entrega
            dt := DM1.cdsNotasDTENT.AsDateTime;
            planilha.cells[linha + 2,39] :=  dt;

            ///// -- STATUS
            valorcampo := 'CTE Não Enviado';
            if (DM4.cdsConhSTATUSENVIO.Value = 4) then valorcampo := 'Ok';
            if (DM4.cdsConhSTATUSENVIO.Value > 4) then valorcampo := 'Cancelado';
            planilha.cells[linha + 2,coluna+40] :=  valorCampo;
             {

            // -- GrauD (TDE) Flutua
            valorcampo := FloatToStr(Neg.get_04GrauD);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,38] :=  valorCampo;

            // -- R$ Pontos
            valorcampo := FloatToStr(Neg.get_06Ponto);
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,coluna+6] :=  valorCampo;


            // -- Ponto
            valorcampo := DM1.cdsRomaRPONTO.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,79] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRLIGCLI.AsString;
            planilha.cells[linha + 2,50] :=  valorCampo;

            // -- Entregue
            valorcampo := DM1.cdsRomaRENTREGUE.value;
            planilha.cells[linha + 2,51] :=  valorCampo;

            // -- recebedor
            valorcampo := DM1.cdsRomaRRECEBEDOR.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,81] :=  valorCampo;

            // -- Minuta
            valorcampo := DM1.cdsRomaRMINUTA.AsString;
            planilha.cells[linha + 2,82] :=  valorCampo;

            // -- Tipo Cob
            valorcampo := DM1.cdsRomaRTIPO_COB.AsString;
            planilha.cells[linha + 2,83] :=  valorCampo;


            // -- Serviço
            valorcampo := DM1.cdsRomaRSERVICO.Value;
            planilha.cells[linha + 2,84] :=  valorCampo;

            // -- valor Volume
            valorcampo := DM1.cdsRomaRVOLUME.AsString;
            if (pos(',',valorcampo)>0) then valorcampo[pos(',',valorcampo)] := '.';
            planilha.cells[linha + 2,28] :=  valorCampo;


            // -- Doc
            valorcampo := DM1.cdsRomaRDOC.Value;
            planilha.cells[linha + 2,86] :=  valorCampo;

            // -- Ocor
            valorcampo := DM1.cdsRomaROCORRENCIA.Value;
            planilha.cells[linha + 2,87] :=  valorCampo;
             }


         end;
      end; // for
      /// ----- INsere Ocorrencias
      if pesqOcor > 0  then
      begin
        linha := 1;
        valorcampo := 'A';
        while valorcampo <> '' do
          begin
             linha := linha + 1;
             valorcampo := planilha.Workbooks[1].Sheets[1].cells[linha + 2,38];
             if valorcampo = 'x' then
             begin
                Bco := TBco.Create;
                ff := StrToInt(planilha.Workbooks[1].Sheets[1].cells[linha + 2,37]);
                valorcampo :=  Bco.Ocorrencia_Traduz(1, ff);
                planilha.cells[linha + 2,38] := valorcampo;
                Bco.Destroy
             end;
          end;

      end;

   end; // count > 0

             // Formata os cabeçalhos
    for ff:=1 to 38 do
    begin
      if ff<7 then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGray;
      if (ff>6) and (ff<13) then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clNavy;
      if (ff>12) and (ff<36) then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clBlack;
      if ff>35then
        Planilha.WorkBooks[1].Sheets[1].Columns[ff].Font.Color := clGreen;
    end;

 planilha.columns.Autofit;
end;

end;

procedure TConhImp.btExcelCliClick(Sender: TObject);
begin
  if JvDBGrid1.SelectedRows.Count < 4  then JvDBGrid1.SelectAll;
  Exporta_Cli2;
end;

procedure TConhImp.Entrar;
begin
  Limpa;
  dat2.DateTime := Now;
  dat1.DateTime := Now - 15;

  cbCli.Clear;
  cbCli.Items.Append('<Nenhum>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 and Cteemite=1 ');
  cbCli.ItemIndex := 1;

end;

procedure TConhImp.FretenaNotaFiscal1Click(Sender: TObject);
  var i : Integer;
     Bco : tBco;
begin
     with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid1.SelectedRows.Items[i]);
        Bco := Tbco.Create;
        bco.Notas_AlterarFrete( DM4.cdsConhLIGNOTA.Value, DM4.cdsConhTOTAL.AsFloat);
        bco.Destroy;
      end;

end;

procedure Enviar_CTeMail(dest, dirCTE : String; Qt : Integer);

var correio: TMailmz;
    usa : TMarco;

begin
  usa := TMarco.Create;
  usa.Le_INI;


  correio := TMailmz.Inicia;

  correio.contaSMTP(usa.get_mailsmtp,usa.get_mailrem, 'flaydelmail', 587);
  correio.remetente(usa.get_mailrem, 'FLAYDEL log');
  correio.mensagem('Lista de CT-e - Flaydel', 'FLAYDEL log '+#13+'e-Mail automático- Envio de Lista de CT-e'+#13+#13+'Não Responder - Contato: 3644-6351'+#13+#13+'Quantidade de CT-e '+IntToStr(Qt),dirCTE, '');

  correio.enviar(dest);

  correio.desconectar;
  correio.Finaliza;
  usa.Destroy;


end;

function Converte_Arquivo(numTransp:Integer; nomeArq:String) : String;

var  resp  : String;
     NomeA : String;
     Bco   : TBco ;


begin
  resp := 'nada';
  bco := Tbco.Create;
  bco.CTe_Padrao_Mostra(numTransp);
  bco.Destroy;

  if (nomeArq<>'-') then
  begin
    // Monta o nome do arquivo
    NomeA := nomeArq;
    NomeA := copy(NomeA,4,Length(NomeA)-3)+'-Cte.xml';

    resp := DM4.cdsCtePPASTAXML.Value+'\'+NomeA;
  end;

  Converte_Arquivo := resp;
end;


function Cria_ZIP(nomeArq:String):Integer;

var qtCTE : Integer;
    arqS  : String;


begin
  with ConhImp do
  begin
    qtCTE := 0;

    DM4.cdsConh.First;
    while not DM4.cdsConh.Eof do
    begin
      if (DM4.cdsConhSTATUSENVIO.Value = 4) then
      begin

        arqS := Converte_Arquivo(DM4.cdsConhLIGTRANSP.Value, DM4.cdsConhARQUIVO.Value);
        if (FileExists(arqS)) then
        begin
          //tsqZip1.FilesToZip.Append(arqS);
          qtCTE := qtCTE + 1;
        end;
      end;
      DM4.cdsConh.Next;
    end;

    //tsqZip1.ZipFileName := nomeArq ;
    //tsqZip1.Execute;
    //Cria_ZIP := qtCTE;
  end;
end;


procedure TConhImp.btMailClick(Sender: TObject);

var MailDest : String;
    dirF, anexof : String;
    ok : boolean;
    qtc : Integer;

begin
  MailDest := '';
  MailDest := InputBox('e-Mail do Destinatário', 'Digite o e-mail', '');

  if (Length(MailDest) > 3) then
  begin
    ok := false;
    getDir(0, dirF);
    ok :=  DirectoryExists(dirF+'\ZIPf');
    if Not ok then ok := CreateDir(dirF+'\ZIPf');
    if (ok) then
    begin
      anexof := dirF+'\ZIPf\FlaydelCTE'+FormatDateTime('yyyyMMdd', dat1.DateTime )+'a'+FormatDateTime('yyyyMMdd', dat2.DateTime)+'.ZIP';
      if FileExists(anexof) then DeleteFile(anexof);
      qtc := Cria_ZIP(anexof);
      if (qtc > 0) then
      begin
        Enviar_CTeMail(MailDest, anexof,  qtc);
        ShowMessage('e-Mail enviado!');
      end
      else ShowMessage('Nenhum e-mail para ENVIAR');
    end
    else ShowMessage('Não foi possível criar o diretório '+dirF+'/ZIPf');
  end;
end;

procedure TConhImp.CopiarXML2Click(Sender: TObject);
var nSel,i, j : Integer;
    dirO, dirD, sData, sArq, sCte: String;
    Bco : TBco;
    usa : TMarco;

begin
  // Destino
  dirD := 'C:\MZp\CteXML';
  if Not DirectoryExists(dirD) then CreateDir(dirD);
  // origem
  Bco := TBco.Create;
  Bco.CTe_Padrao_Mostra(3);
  Bco.Destroy;
  dirO := DM4.cdsCtePPASTAXML.Value;

  nSel := JvDBGrid1.SelectedRows.Count;
  // reenviar Conemb
  if nSel>0 then
  begin
    if MessageDlg('Tem certeza que deseja COPIAR os ' + nSel.ToString + ' XML selecionados?'+ #13 +'De '+DirO+' para '+DirD,
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
     agLb.Caption := '';
     agPB.Min := 1;
     agPB.Max := nSel+1;
     agPB.Position := 0;
     Panel3.Visible := true;
     j := 0;
     with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(JvDBGrid1.SelectedRows.Items[i]);
        if (DM4.cdsConhSTATUSENVIO.Value = 4) then
        begin
          sArq := DM4.cdsConhARQUIVO.Value;
          sArq := copy(sArq, 4, length(sArq))+'-CTe.xml';
          sdata := FormatDateTime('yyyyMM', DM4.cdsConhDATAC.AsDateTime);
          sCte := dirO+'\'+sdata+'\'+sArq;
          //ShowMessage(sCte);

          usa := TMarco.Create;
          if usa.FileCopy(sCte, dirD+'\'+sArq) then j := j + 1;
          usa.Destroy;
        end;


        agLb.Caption := i.ToString +' de '+nSel.ToString;
        agPB.Position := agPB.Position + 1;
      end;
      StatusBar1.Panels[1].Text := 'Arquivos Copiados: '+j.ToString;
    end;
    agLb.Caption := 'TERMINADO.';
    Panel3.Visible := false;
  end
  else ShowMessage('Selecione alguns Conhecimentos!');
end;

procedure Pesquisa_Conhecimento(num:Integer);
 var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Conhec_PesqNumC(num, 3);
  Bco.Destroy;
end;

procedure Pesquisa_DocCob(num:Integer);
 var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Conhec_PesqDocCob(num, 3);
  Bco.Destroy;
end;

procedure TConhImp.edDOCCOBKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if Length(edDOCCOB.Text)>0 then
    begin
      Pesquisa_DocCob(StrToInt(edDOCCOB.Text));
      edDOCCOB.Text := '';
    end;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;
end;

procedure TConhImp.edNumCKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    if Length(edNumC.Text)>0 then
    begin
      Pesquisa_Conhecimento(StrToInt(edNumC.Text));
      edNumC.Text := '';
    end;
  if not(Key in ['0'..'9',Chr(8)]) then Key := #0;

end;




end.
