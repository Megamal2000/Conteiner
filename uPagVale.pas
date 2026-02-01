unit uPagVale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, JvExDBGrids, JvDBGrid, ComCtrls,
  StdCtrls, Buttons, JvExStdCtrls, JvEdit, JvValidateEdit, DB, Mask,
  JvExMask, JvSpin, DateUtils;

type
  TPagVale = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    lbMot: TLabel;
    dat1: TDateTimePicker;
    dat2: TDateTimePicker;
    btMot: TBitBtn;
    btAtualiza: TBitBtn;
    Rodape: TStatusBar;
    JvDBGrid1: TJvDBGrid;
    Bevel1: TBevel;
    Label1: TLabel;
    dtVale: TDateTimePicker;
    Label3: TLabel;
    vValor: TJvValidateEdit;
    Label4: TLabel;
    rd1: TRadioButton;
    rd2: TRadioButton;
    rd3: TRadioButton;
    edOut: TEdit;
    btSubNovo: TSpeedButton;
    btSubSalvar: TSpeedButton;
    btSubApagar: TSpeedButton;
    DataSource1: TDataSource;
    GroupBox1: TGroupBox;
    rd4: TRadioButton;
    cbVezes: TComboBox;
    Label5: TLabel;
    spVezes: TJvSpinEdit;
    procedure btAtualizaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSubApagarClick(Sender: TObject);
    procedure btSubSalvarClick(Sender: TObject);
    procedure btSubNovoClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btMotClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idM(i : integer);
    procedure set_sair(i : Smallint);
    procedure Entrar;
  end;

var
  PagVale: TPagVale;
  idMot, idV  : Integer;
  vTot   : Double;
  saida  : Smallint;

implementation

{$R *.dfm}

uses uDM3, uBanco, uPagDiv, upsqFuncs;


procedure Limpar();
begin

  if (DM3.cdsVale.RecordCount > 0) then
    PagVale.dtVale.DateTime := DM3.cdsValeDATA.Value
  else
    PagVale.dtVale.DateTime := pagVale.dat1.DateTime;

  PagVale.rd1.Checked  := True;
  PagVale.edOut.Text   := '';
  PagVale.vValor.Value := 0;

end;

procedure Atualiza();

var Bco : TBco;

begin
  if (idMot > 0) then
  begin
    Bco := TBco.Create;
    Bco.Vale_MostraDatas(idMot, PagVale.dat1.DateTime, PagVale.dat2.DateTime);
    Bco.Destroy;


    PagVale.Rodape.Panels[0].Text := 'Vales: '+IntToStr(DM3.cdsVale.RecordCount);
    if (DM3.cdsVale.RecordCount>0) then
    begin
      vTot := 0;
      DM3.cdsVale.First;
      while not DM3.cdsVale.Eof do
      begin
        vTot := vTot + DM3.cdsValeVALOR.AsFloat;
        DM3.cdsVale.Next;
      end;
      DM3.cdsVale.First;
      PagVale.Rodape.Panels[2].Text := 'Total: '+FormatFloat('#,##0.00', vTot);

    end;


  end
  else ShowMessage('Escolha um Motorista');

end;

procedure TPagVale.btAtualizaClick(Sender: TObject);
begin
  Atualiza;
end;

procedure TPagVale.set_idM(i: integer);
begin
  idMot := i;
end;

procedure TPagVale.set_sair(i: Smallint);
begin
  saida := i;
end;

procedure TPagVale.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (saida = 1) then
  begin
    PagDiv.set_Vale(vTot);
    PagDiv.Show;

  end;
end;

procedure TPagVale.btSubApagarClick(Sender: TObject);

var Bco : TBco;

begin
  if (idV > 0) then
  begin
    if MessageDlg('Tem certeza que deseja apagar o '+DM3.cdsValeDESCR.Value +' ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Bco := TBco.Create;
      Bco.Vale_Apaga(idV);
      Bco.Destroy;
      Atualiza;
    end;
  end
  else ShowMessage('Selecione um Vale');
end;


  { TODO : Fazer a repeticao do VALE }
procedure Repete_Vale(nMot, tipoV:Integer; dtV:TDateTime; descV:String; ValorV:Double; tipoRep:Smallint;vezesRep:Integer );

var Bco : TBco;
    i : Integer;
    dt1,dt2 : TDateTime;
    dia1, dia2, dia, ano : integer;

begin

    Bco := TBco.Create;
    if (vezesRep>0) then
    begin
      case tipoRep of
      0 : begin
            // semanal
            dt1 := dtV;
            for i := 2 to vezesRep do
            begin
              dt1 := dt1 + 7;
              Bco.Vale_Insere(nMot, tipoV, dt1,  descV, ValorV);
            end;
          end;

      1 : begin
            // quinzenal
            dt1 := dtV;
            dia1 := DayOf(dt1);
            dt2 := dt1 + 15;      dia2 := DayOf(dt2);
            Bco.Vale_Insere(nMot, tipoV, dt2,  descV, ValorV);
            dia := dia2;

            for i := 3 to vezesRep+1 do
            begin
              dt1 := dt2 + 15;
              if (dia = dia2) then dia := dia1 else dia := dia2;
              dt2 := EncodeDate(YearOf(dt1), MonthOf(dt1), dia);
              Bco.Vale_Insere(nMot, tipoV, dt2, descV, ValorV);
            end;
          end;

      2 : begin
            // mensal
            dt1 := dtV; dia1 := DayOf(dt1);
            dt2 := dt1;

            for i := 2 to vezesRep+1 do
            begin
              dt1 := dt2 + 30;
              dt2 := EncodeDate(YearOf(dt1), MonthOf(dt1), dia1);
              Bco.Vale_Insere(nMot, tipoV, dt2, descV, ValorV);
            end;
          end;

      3 : begin
            // semestral
            dt1 := dtV;
            dia1 := DayOf(dt1);
            dia2 := MonthOf(dt1);
            dt2 := dt1;

            for i := 2 to vezesRep+1 do
            begin
              ano := YearOf(dt2);
              dia2 := dia2 + 6;
              if (dia2>12) then
              begin
                dia2 := dia2 - 12;
                ano  := ano  +  1;
              end;
              dt2 := EncodeDate(ano, dia2, dia1);
              Bco.Vale_Insere(nMot, tipoV, dt2, descV, ValorV);
            end;
          end;

      4 : begin
            // anual
            dt1 := dtV;
            dia1 := DayOf(dt1);
            dia2 := MonthOf(dt1);
            dt2 := dt1;

            for i := 2 to vezesRep+1 do
            begin
              dt1 := dt2 + 365;
              dt2 := EncodeDate(YearOf(dt1), dia2, dia1);
              Bco.Vale_Insere(nMot, tipoV, dt2, descV, ValorV);
            end;
          end;

       end;
    end;
    Bco.Destroy;

end;


procedure TPagVale.btSubSalvarClick(Sender: TObject);

var Bco : TBco;
    tip : Integer;
    descricao : String;

begin
  if (rd1.Checked) then
  begin
    tip := 1;
    descricao := rd1.Caption;
  end;
  if (rd2.Checked) then
  begin
    tip := 2;
    descricao := rd2.Caption;
  end;
  if (rd3.Checked) then
  begin
    tip := 3;
    descricao := edOut.Text;
  end;
  if (rd4.Checked) then
  begin
    tip := 4;
    descricao := rd4.Caption;
  end;

  Bco := TBco.Create;
  if (idV = 0) then
     Bco.Vale_Insere(idMot, tip, dtVale.DateTime,  descricao,vValor.Value)
   else
     Bco.Vale_Altera(idV, tip, dtVale.DateTime,  descricao,vValor.Value);

  if (cbVezes.ItemIndex >0) and (spVezes.Value>0) then
    Repete_Vale(idMot, tip, dtVale.DateTime, descricao, vValor.Value, cbVezes.ItemIndex, spVezes.AsInteger);

  Bco.Destroy;
  Atualiza;
end;

procedure TPagVale.btSubNovoClick(Sender: TObject);
begin
  Limpar;
  idV := 0;
end;

procedure TPagVale.JvDBGrid1DblClick(Sender: TObject);
begin
  if (DM3.cdsVale.RecordCount > 0) then
  begin
    idV := DM3.cdsValeID.Value;
    dtVale.DateTime := DM3.cdsValeDATA.Value;
    vValor.Value := DM3.cdsValeVALOR.AsFloat;
    if (DM3.cdsValeTIPO.Value = 1) then
    begin
      rd1.Checked := true;
      edOut.Text := '';
    end;

    if (DM3.cdsValeTIPO.Value = 2) then
    begin
      rd2.Checked := true;
      edOut.Text := '';
    end;

    if (DM3.cdsValeTIPO.Value = 3) then
    begin
      rd3.Checked := true;
      edOut.Text := DM3.cdsValeDESCR.Value;
    end;

  end;
end;

procedure TPagVale.Entrar;
begin
  Limpar;

  idV               := 0;
  dat1.DateTime     := Now - 30;
  dat2.DateTime     := Now;
  dtVale.DateTime   := Now;
  cbVezes.ItemIndex := 0;

end;

procedure TPagVale.btMotClick(Sender: TObject);
begin
  {
    tipo = 0 // Funcionários
    tipo = 1 // Motoristas
    tipo = 2 // Ajudantes
    tipo = 5 // TODOS
  }
  psqFuncs.set_tipo(5);
  psqFuncs.set_saida(8); 
  psqFuncs.Show;
end;

end.
