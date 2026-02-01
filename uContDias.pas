unit uContDias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, JvGridFilter, DB, ComCtrls, JvDBGridFooter, Grids,
  DBGrids, JvExDBGrids, JvDBGrid, JvDataSource, JvMemoryDataset, Buttons,
  StdCtrls, Mask, Menus;

type
  TContDias = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btCli: TSpeedButton;
    btMot: TSpeedButton;
    lbCli: TLabel;
    lbMot: TLabel;
    tab1: TJvMemoryData;
    JvDataSource1: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    JvDBGridFooter1: TJvDBGridFooter;
    tab1tmpData: TDateField;
    tab1tmpHr1: TTimeField;
    tab1tmpHr2: TTimeField;
    tab1tmpKm1: TIntegerField;
    tab1tmpkm2: TIntegerField;
    tab1tmpDesc: TCurrencyField;
    tab1tmpMot: TStringField;
    JvGridFilter1: TJvGridFilter;
    dt: TDateTimePicker;
    hr1: TMaskEdit;
    hr2: TMaskEdit;
    km1: TEdit;
    km2: TEdit;
    edDesc: TEdit;
    edObs: TEdit;
    btSalvar: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Bevel1: TBevel;
    Label10: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btMostrar: TSpeedButton;
    PopupMenu1: TPopupMenu;
    ApagarLinha1: TMenuItem;
    btRomas: TBitBtn;
    tab1tmpRoma: TIntegerField;
    tab1tmpNUM: TLargeintField;
    procedure btMotClick(Sender: TObject);
    procedure btCliClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dtKeyPress(Sender: TObject; var Key: Char);
    procedure hr1KeyPress(Sender: TObject; var Key: Char);
    procedure hr2KeyPress(Sender: TObject; var Key: Char);
    procedure km1KeyPress(Sender: TObject; var Key: Char);
    procedure km2KeyPress(Sender: TObject; var Key: Char);
    procedure edDescKeyPress(Sender: TObject; var Key: Char);
    procedure edObsKeyPress(Sender: TObject; var Key: Char);
    procedure btMostrarClick(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure ApagarLinha1Click(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btRomasClick(Sender: TObject);
    procedure dt1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure set_idC(i : Integer);
    procedure set_idM(i : Integer);
    procedure Entrar;
  end;

var
  ContDias: TContDias;
  idCli, idMot : Integer;
  marca : TBookMark;
implementation

uses upsqFuncs, upsqCli, uBanco, uDM3, uDM2, uFTcont2, DateUtils;

{$R *.dfm}

procedure TContDias.set_idC(i: Integer);
begin
  idCli := i;
end;

procedure TContDias.set_idM(i: Integer);
begin
  idMot := i;
end;

procedure TContDias.btMotClick(Sender: TObject);
begin
  psqFuncs.set_tipo(1); // Motoristas
  psqFuncs.set_saida(4);
  psqFuncs.Show;
end;

procedure TContDias.btCliClick(Sender: TObject);
begin
  psqCli.set_Saida(2);
  psqCli.Show;

end;

procedure Limpar();
begin
  with ContDias do
  begin
    hr1.Text := '__:__';
    hr2.Text := '__:__';
    km1.Text := '';
    km2.Text := '';
    edDesc.Text := '';
    edObs.Text  := '';
  end;
end;



procedure Preencher();

begin
  with ContDias do
  begin
    dt.DateTime := tab1tmpData.Value;
    hr1.Text := FormatDateTime('HH:mm', tab1tmpHr1.Value);
    hr2.Text := FormatDateTime('HH:mm', tab1tmpHr2.Value);
    km1.Text := tab1tmpKm1.AsString;
    km2.Text := tab1tmpkm2.AsString;
    edDesc.Text := tab1tmpDesc.AsString;
    edObs.Text  := tab1tmpMot.Value;

  end;

end;

Function ExisteTMP():boolean;

var ok : boolean;
    i : Integer;

begin
  ok := false;
  with ContDias do
  begin
    if (tab1.RecordCount > 0) then
    begin
      tab1.First;
      while not tab1.Eof do
      begin
        if (tab1tmpData.AsString= DateToStr(dt.DateTime)) then
        begin
          ok := true;
          marca := tab1.GetBookmark;
        end;
        tab1.Next;
      end;
    end;
  end;
  ExisteTMP := ok;
end;

procedure InserirTMP;

var vd : double;

begin
  with ContDias do
  begin
    if not (ExisteTMP) then
      tab1.Insert
    else
    begin
      tab1.GotoBookmark(marca);
      tab1.Edit;
    end;
    tab1tmpData.Value:= dt.DateTime;
    tab1tmpHr1.Value := StrToTime(hr1.Text);
    tab1tmpHr2.Value := StrToTime(hr2.Text);
    tab1tmpKm1.Value := StrToInt(km1.Text);
    tab1tmpKm2.Value := StrToInt(km2.Text);
    vd := 0;
    if (edDesc.Text<> '') then vd := StrToFloat(edDesc.Text);
    tab1tmpDesc.Value:= vd;
    tab1tmpMot.Value := edObs.Text;

    tab1.Post;

    tab1.SortOnFields('tmpData', false, false);
  end;
end;


procedure TContDias.FormActivate(Sender: TObject);
begin
  dt.SetFocus;
  tab1.Open;
end;

function  ajusta_hora(h:String):String;

var s : String;
    i : Integer;
begin
  s := '';
  if (h[1] in ['0'..'9']) then s := s + h[1] else s := s + '0';
  if (h[2] in ['0'..'9']) then s := s + h[2] else s := s + '0';
  s := s + ':';
  if (h[4] in ['0'..'9']) then s := s + h[4] else s := s + '0';
  if (h[5] in ['0'..'9']) then s := s + h[5] else s := s + '0';


  ajusta_hora := s;
end;

procedure TContDias.dtKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then hr1.SetFocus;
end;

procedure TContDias.hr1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    hr1.Text := ajusta_hora(hr1.Text);
    hr2.SetFocus;
  end;
end;

procedure TContDias.hr2KeyPress(Sender: TObject; var Key: Char);
begin
    if (Key = #13) then
  begin
    hr2.Text := ajusta_hora(hr2.Text);
    km1.SetFocus;
  end;
end;

procedure TContDias.km1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then km2.SetFocus;
end;

procedure TContDias.km2KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then edDesc.SetFocus;
end;

procedure TContDias.edDescKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then edObs.SetFocus;
end;

procedure TContDias.edObsKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (km1.Text <> '') and (km2.Text <> '') and (hr1.Text <> ':') and (hr2.Text <> ':') then
    begin
      InserirTMP;
      dt.DateTime := dt.DateTime + 1;
      dt.SetFocus;
      Limpar;
    end
    else hr1.SetFocus;
  end;
end;

procedure Dias_Vazios;

var i, f : Integer;
    n : Double;
    dtTab : TDateTime;

begin
  with ContDias do
  begin
    n := dt2.DateTime - dt1.DateTime;
    f := Trunc(n);
    for i := 0 to f do
    begin
      dtTab := dt1.DateTime + i;
      tab1.Insert;
      tab1tmpData.Value := dtTab;
      tab1.Post;
      tab1.SortOnFields('tmpData',false,false);

    end;
  end;
end;
procedure TContDias.btMostrarClick(Sender: TObject);

var Bco : TBco;
    idL : Integer;

begin
      tab1.EmptyTable;
  Dias_Vazios;

    Bco := TBco.Create;
    tab1.First;
    while not tab1.Eof do
    begin
      idL := Bco.FreteContratoDia_Existe(idCli, idMot, tab1tmpData.Value);
      if (idL > 0) then
      begin
        Bco.FreteContratoDia_Mostra(idL);
        tab1.Edit;
        tab1tmpHr1.Value := DM3.cdsFT5aHRINICIO.Value;
        tab1tmpHr2.Value := DM3.cdsFT5aHRFIM.Value;
        tab1tmpKm1.Value := DM3.cdsFT5aKMINICIO.Value;
        tab1tmpKm2.Value := DM3.cdsFT5aKMFIM.Value;
        tab1tmpDesc.Value:= DM3.cdsFT5aDESCONTO.AsFloat;
        tab1tmpMot.Value := DM3.cdsFT5aMOTIVO.Value;
        tab1tmpNUM.Value := DM3.cdsFT5aNROMA.Value;
        tab1tmpRoma.Value:= DM3.cdsFT5aNROMA.Value - Yearof(DM3.cdsFT5aDIA.Value)*1000000;
        tab1.Post;
      end;
      tab1.Next;
    end;
    Bco.Destroy;
  tab1.First;
end;

procedure TContDias.Entrar;
begin
  Limpar;
  dt1.DateTime := Now - 2;
  dt2.DateTime := Now - 1;
end;

procedure TContDias.JvDBGrid1DblClick(Sender: TObject);
begin
  Preencher;
end;

procedure TContDias.ApagarLinha1Click(Sender: TObject);
begin
  tab1.delete;
end;

Function DifHora2(Inicio,Fim : String):Double;
{Retorna a diferença entre duas horas}
var
  FIni,FFim : TDateTime;
  resp : Double;
  hr : String;
  h, m : Double;

begin
  Fini := StrTotime(Inicio);
  FFim := StrToTime(Fim);
  If (Inicio > Fim) then
    begin

      hr := TimeToStr((StrTotime('23:59:59')-Fini)+FFim);
    end
  else
    begin
      hr := TimeToStr(FFim-Fini);
    end;
    h := StrToFloat(copy(hr, 1, 2));
    m := StrToFloat(copy(hr, 4, 2));
    m := m / 60;
    if (m <= 0.25) then m := 0;
    if (m>0.25) and (m<=0.75) then m := 0.5;
    if (m>0.75) then m := 1;
    resp := h + m;
  Result := resp;
end;

procedure TContDias.btSalvarClick(Sender: TObject);

var Bco : TBco;
    idL, difKm, kmCli, Roma : Integer;
    difHr, hrCli, vHrC, vKmC, totHr, totKm : Double;
    vHrPag, vKmPag, totPagHr, totPagKm : Double;

begin
  if (idCli = 0) then ShowMessage('Escolha um Cliente')
  else if (idMot = 0) then ShowMessage('Escolha um Motorista')
  else if (tab1.RecordCount = 0) then ShowMessage('Sem valores na TABELA')
  else
  begin
    Bco := TBco.Create;
    // Valores para cobrança
    Bco.FreteContrato_Mostra(idCli);
    kmCli := DM3.cdsFT5KM.Value;
    hrCli := DM3.cdsFT5HORAS.Value;
    vHrC  := DM3.cdsFT5VAVULSO_HORA.AsFloat;
    vKmC  := DM3.cdsFT5VAVULSO_KM.AsFloat;

    // Valores para pagamento
    Bco.PagContrato_Mostra;
    vKmPag   := DM3.cdsPGContVAVULSO_KM.AsFloat;
    vHrPag   := DM3.cdsPGContVAVULSO_HORA.AsFloat;

    tab1.First;
    while not tab1.Eof do
    begin

      idL := Bco.FreteContratoDia_Existe(idCli, idMot, tab1tmpData.Value);
      if (tab1tmpHr1.AsString <> '00:00:00') and (tab1tmpHr1.AsString <> '00:00:00') and
         (tab1tmpkm1.Value <> 0) and (tab1tmpkm2.Value <> 0) then
      begin
        difKm := tab1tmpkm2.Value-tab1tmpkm1.Value;
        difHr := DifHora2(tab1tmpHr1.AsString, tab1tmpHr2.AsString);
        difKm := difKm - kmCli;
        if (difKm < 0) then difKm := 0;
        difhr := difhr - hrCli;
        if (difhr < 0) then difhr := 0;

        // Totais Cobrança
        totHr := vHrC * difHr;
        totKm := vKmC * difKm;

        // Totais Pagamento
        totPagHr := vHrPag * difHr;
        totPagKm := vKmPag * difKm;
        Roma := 0;
        if (tab1tmpNUM.Value <> null) then Roma := tab1tmpNUM.Value;

        if (idL = 0) then
          Bco.FreteContratoDia_Insere(idCli, idMot, tab1tmpData.Value, tab1tmpHr1.Value,tab1tmpHr2.Value ,
            tab1tmpKm1.Value,tab1tmpkm2.Value, tab1tmpDesc.Value, tab1tmpMot.Value, difHr, difKm,totHr,totKm,totPagHr,totPagKm,Roma )
        else
          Bco.FreteContratoDia_Altera(idL,idCli, idMot, tab1tmpData.Value, tab1tmpHr1.Value,tab1tmpHr2.Value ,
            tab1tmpKm1.Value,tab1tmpkm2.Value, tab1tmpDesc.Value, tab1tmpMot.Value, difHr, difKm,totHr,totKm,totPagHr,totPagKm,Roma );
      end;
      tab1.Next;
    end;
    Bco.Destroy;
    tab1.First;

  end;

end;

procedure TContDias.btRomasClick(Sender: TObject);

var Bco : TBco;
    idL : Integer;

begin
    Bco := TBco.Create;
    Bco.FreteContratoDia_Romaneio(idCli, idMot, dt1.DateTime, dt2.DateTime);
    Bco.Destroy;

    tab1.First;
    while not tab1.Eof do
    begin
      DM3.cdsRomaC.First;
      while not DM3.cdsRomaC.Eof do
      begin
        if (tab1tmpData.Value = DM3.cdsRomaCDTROMA.Value) then
        begin
          tab1.Edit;
          tab1tmpRoma.Value := DM3.cdsRomaCROMANEIO.AsInteger;
          tab1tmpNUM.Value  := DM3.cdsRomaCNUM.Value;
          tab1.Post;
        end;
        DM3.cdsRomaC.Next;
      end;
      tab1.Next;
    end;
    tab1.First;

end;

procedure TContDias.dt1Change(Sender: TObject);
begin
  dt2.DateTime := Dt1.DateTime + 30;
end;

end.
