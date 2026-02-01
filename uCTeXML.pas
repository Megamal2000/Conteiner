unit uCTeXML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, DateUtils,
  Vcl.ComCtrls;

type
  TCTeXML = class(TForm)
    Label1: TLabel;
    cbCli: TComboBox;
    Label2: TLabel;
    cbMes: TComboBox;
    cbAno: TComboBox;
    btCopiar: TBitBtn;
    Label3: TLabel;
    pb: TProgressBar;
    procedure btCopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar;
  end;

var
  CTeXML: TCTeXML;

implementation

{$R *.dfm}

uses uDM2, uDM4, uBanco, uLib;

procedure TCTeXML.btCopiarClick(Sender: TObject);
var nSel,i, j, idC : Integer;
    dirO, dirD, sData, sArq, sCte, sm, sPasta: String;
    d1, d2 : TDateTime;
    Bco : TBco;
    usa : TMarco;

begin
  // Lê dados
  idC := 0;
  if cbCli.ItemIndex>0 then
    idC :=  DM2.DBCp_leid(cbCli.Items[cbCli.ItemIndex], 'TB_Cliente','Nome');
  i := cbMes.ItemIndex + 1;
  j := cbAno.ItemIndex + 2020;

  // Destino
  sm := '00'+i.ToString;
  sm := j.ToString+sm.Substring(Length(sm)-2);
  sArq := 'FlaydelCTE'+sm;
  dirD := 'C:\MZp\CteXML'+ '\' + sArq;
  if idC > 0 then dirD := dirD + '_'+idC.ToString;
  if Not DirectoryExists(dirD) then CreateDir(dirD);

  // FAIXA DE DATAS
  d1 := EncodeDate(j, i, 1);

  if i < 12  then
  begin
    i := i + 1;
    d2 := EncodeDate(j, i, 1);
  end
  else
  begin
    i := 1;
    j := j + 1;
    d2 := EncodeDate(j, i, 1);
  end;
  d2 := d2 -1;

  // origem
  bco := TBco.Create;
  bco.Conhec_PesqData(d1, d2, idC);
  Bco.CTe_Padrao_Mostra(3);
  Bco.Destroy;
  dirO := DM4.cdsCtePPASTAXML.Value+'\'+sm;
  ShowMessage('Datas '+FormatDateTime('dd/MM/yy',d1) + ' - '+FormatDateTime('dd/MM/yy',d2) +#13+ DirO + ' // ' +DirD);

  j := 0;
  pb.Min := 0;
  pb.Position := 0;
  pb.Max := DM4.cdsConh.RecordCount + 1;
  if DM4.cdsConh.RecordCount >0 then
  begin
    DM4.cdsConh.First;
    usa := TMarco.Create;
    while not DM4.cdsConh.Eof do
    begin
      pb.Position := pb.Position +1;
      if (DM4.cdsConhSTATUSENVIO.Value = 4) then
      begin

        sArq := DM4.cdsConhARQUIVO.Value;
        sArq := copy(sArq, 4, length(sArq))+'-CTe.xml';

        sCte := dirO+ '\'+sArq;

        //ShowMessage(sCte + ' -- ' + dirD+'\'+sArq );
        if usa.FileCopy(sCte, dirD+'\'+sArq) then j := j + 1;

      end;
      DM4.cdsConh.Next;
    end;
    usa.Destroy;
    ShowMessage('XML copiados: '+j.ToString);
  end
  else ShowMessage('Nenhum arquivo XML encontrado ');


  {
        // teste  copia OK
        usa := TMarco.Create;
        usa.FileCopy('G:\Temp\page1.jpg', dirD+'\page1.jpg');
        usa.Destroy;
        }
end;


procedure TCTeXML.Entrar;
  var a, m : word;
      sArq, sm : String;
begin
  a := YearOf(Now);
  m := MonthOf(Now);
  m := m - 1;
  if m = 0 then m := 12;
  sm := '00'+m.ToString;
  sArq := 'FlaydelCTE'+a.ToString+sm.Substring(Length(sm)-2);
  cbMes.ItemIndex := m - 1;
  cbAno.ItemIndex := a - 2020;

  cbCli.Clear;
  cbCli.Items.Append('<TODOS>');
  DM2.DBCb_Preenche(cbCli, 'TB_Cliente', 'Nome',' ativo = 1 and Cteemite=1 ');
  cbCli.ItemIndex := 0;
end;

end.
