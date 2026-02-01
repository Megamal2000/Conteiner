unit uCubagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, JvExStdCtrls,
  JvEdit, JvValidateEdit, Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, Vcl.Menus;

type
  TCubagem = class(TForm)
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    cbCli: TComboBox;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    btPesq: TBitBtn;
    btImp: TBitBtn;
    ck300: TCheckBox;
    edValor: TJvValidateEdit;
    btAltera: TBitBtn;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    AlterarSelecionados1: TMenuItem;
    lbQuant: TLabel;
    VoltarOriginalnosSelecionados1: TMenuItem;
    procedure btPesqClick(Sender: TObject);
    procedure btAlteraClick(Sender: TObject);
    procedure JvDBGrid1TitleClick(Column: TColumn);
    procedure AlterarSelecionados1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure VoltarOriginalnosSelecionados1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Entrar;
  end;

var
  Cubagem: TCubagem;
  onde : string;

implementation

{$R *.dfm}

uses uDM1, uDM2, uBanco, uNotas;


function Formata_Num(num: double): String;

var i : integer;
    s, n : String;
begin
  s := '';
  n := FloatToStr(num);
  for i:= 1 to length(n) do
  begin
    if (n[i] in ['0'..'9']) then s := s + n[i];
    if (n[i] = ',') then s := s + '.';
  end;
  Formata_num := s;
end;
{ TCubagem }

procedure TCubagem.AlterarSelecionados1Click(Sender: TObject);
  var i : integer;
      x, a, peso, vol, mult : double;
      sq : string;
begin
  mult := 1;
  if ck300.Checked then mult := 300;

  if (edValor.Value>0) then
  with JvDBGrid1.DataSource.DataSet do
   if JvDBGrid1.SelectedRows.Count>0 then
   begin

    for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
       begin
         GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
         a := edValor.Value;
         vol := a * mult;  // calcula NOVO PESO
         peso := DM1.cdsNotasPESO.AsFloat;

         x := vol;
         if (peso > vol) then x := peso;

         sq := 'Update TB_NOTAF SET CUB_VOLUME = '+Formata_Num(a)+', PESO = '+Formata_Num(x);
         sq := sq  + '  where id = '+ DM1.cdsNotasID.AsString;
         DM2.Executa_SQL(DM1.Conexao, DM1.sdsNotas, sq, 'Altera');
       end;
    ShowMessage('Terminado!');
    sq := 'Select * from TB_NOTAF where '+onde+' order by dtcria ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
   end
   else ShowMessage('Nenhum registro selecionado!');
end;

procedure TCubagem.btAlteraClick(Sender: TObject);
  var sq : String;
      x, a, vol, peso, mult : double;
begin
  if (DM1.cdsNotas.RecordCount>0) and (edValor.Value > 0) then
  begin
    mult := 1;
    if ck300.Checked  then mult := 300;

    a := edValor.Value;
    vol := a * mult;  // calcula NOVO PESO
    peso := 1;

    x := vol;
    //if (peso > vol) then x := peso;

    sq := 'Update TB_NOTAF SET CUB_VOLUME = '+Formata_Num(a)+', PESO = '+Formata_Num(x);
    sq := sq  + '  where '+onde+' ';
    sq := sq  + ' and PESO < '+Formata_Num(vol);
    DM2.Executa_SQL(DM1.Conexao, DM1.sdsNotas, sq, 'Altera');

    sq := 'Update TB_NOTAF SET CUB_VOLUME = '+Formata_Num(a);
    sq := sq  + '  where '+onde+' ';
    sq := sq  + ' and PESO > '+Formata_Num(vol);
    DM2.Executa_SQL(DM1.Conexao, DM1.sdsNotas, sq, 'Altera');

    ShowMessage('Todas as notas alteradas!');
    sq := 'Select * from TB_NOTAF where '+onde+' order by dtcria ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
  end;
end;

procedure TCubagem.btPesqClick(Sender: TObject);
  VAR idC: Integer;
      sq : string;
begin
 if (cbCli.ItemIndex > 0) then
 begin
    idC := DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente', 'Nome');
    onde := ' (dtcria between '+QuotedStr(FormatDateTime('yyyy-MM-dd', dt1.DateTime))+ ' and '+QuotedStr(FormatDateTime('yyyy-MM-dd', dt2.DateTime))+ ') and ligcli = '+idC.ToString;
    sq := 'Select * from TB_NOTAF where '+onde+' order by dtcria ';
    DM2.Roda_SQL(DM1.sdsNotas, DM1.cdsNotas, sq);
    lbQuant.Caption := ' '+DM1.cdsNotas.RecordCount.ToString+ ' notas';
 end;


end;

procedure TCubagem.Entrar;
begin
  if (cbCli.Items.Count = 0) then
  begin
    cbCli.Clear;
    cbcli.Items.Append('<Todos>');
    DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 ');
    dt1.DateTime := Now-30;
    dt2.DateTime := Now;
    edValor.Value  := 0;
    ck300.Checked := false;
  end;

end;

procedure TCubagem.JvDBGrid1DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  //NotasP.Mostrar_Nota_id(DM1.cdsRomaNFID.Value);
  NotasP.set_idNota(DM1.cdsNotasNUMNF.Value);
  NotasP.AbreNf;
  NotasP.Show;
  //if (NotasP.Panel2.Enabled) then NotasP.edHora.SetFocus;
end;

procedure TCubagem.JvDBGrid1TitleClick(Column: TColumn);
begin
  DM1.cdsNotas.IndexFieldNames := Column.FieldName;
  JvDBGrid1.SortedField := Column.FieldName;
end;

procedure TCubagem.VoltarOriginalnosSelecionados1Click(Sender: TObject);
  var sq : string;
begin
    sq := 'Update TB_NOTAF SET CUB_VOLUME = Null, PESO = PESONF ';
    sq := sq  + '  where '+onde+' ';
    DM2.Executa_SQL(DM1.Conexao, DM2.sdsTMP, sq , 'Alterar');
end;

end.
