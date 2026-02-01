unit uCTeErros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, JvDataSource, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Menus;

type
  TCteErros = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    JvDataSource1: TJvDataSource;
    JvDataSource2: TJvDataSource;
    JvDBGrid1: TJvDBGrid;
    JvDBGrid2: TJvDBGrid;
    Label1: TLabel;
    LbDT1: TLabel;
    Label3: TLabel;
    LbDT2: TLabel;
    lbMens: TLabel;
    PopupMenu1: TPopupMenu;
    REcalcularCTe1: TMenuItem;
    N1: TMenuItem;
    DuplicidadeCorrigir1: TMenuItem;
    Atrasadoscorrigirselecionados1: TMenuItem;
    N2: TMenuItem;
    AlterarCNPJ1: TMenuItem;
    ProcurarCdigodoMunicpio1: TMenuItem;
    ManterValorAlto1: TMenuItem;
    N3: TMenuItem;
    RetirarMarcadeErro1: TMenuItem;
    procedure JvDBGrid1CellClick(Column: TColumn);
    procedure JvDBGrid2DblClick(Sender: TObject);
    procedure REcalcularCTe1Click(Sender: TObject);
    procedure AlterarCNPJ1Click(Sender: TObject);
    procedure ProcurarCdigodoMunicpio1Click(Sender: TObject);
    procedure DuplicidadeCorrigir1Click(Sender: TObject);
    procedure Atrasadoscorrigirselecionados1Click(Sender: TObject);
    procedure RetirarMarcadeErro1Click(Sender: TObject);
    procedure ManterValorAlto1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Entrar(d1, d2:TDateTime);
  end;

var
  CteErros: TCteErros;
  dt1, dt2 : TDatetime;

implementation

{$R *.dfm}

{ TCteErros }

uses uDM2, uDM5, uBanco, uNotas, uCtePQ, uCteDet;

procedure Mostra_resumo;
  var Bco : TBco;
begin
  Bco := TBco.Create;
  Bco.Cte_erros_Lista(dt1, dt2);
  Bco.Cte_erros_Itens(dt1,dt2, 0);
  Bco.Destroy;
end;

procedure Retira_Erro(idCTe:Integer);
begin
  DM2.Altera_Status('TB_CONHEC', 'STATUS', idCTe, 0);
  DM2.Altera_Status('TB_CONHEC', 'STATUSENVIO', idCTe, 0);
  DM5.cdsErro2.Delete;

  DM5.cdsErro1.First;
  while not DM5.cdsErro1.Eof do
  begin
    if DM5.cdsErro1STATUS.Value = DM5.cdsErro2STATUS.Value then
    begin
      DM5.cdsErro1.Edit;
      DM5.cdsErro1QT.Value := DM5.cdsErro1QT.Value - 1;
      DM5.cdsErro1.Post;
    end;

    DM5.cdsErro1.Next;
  end;

end;

procedure Selecionados(tipo:smallint);
   var i,sel : Integer;
begin
  with CteErros do
  if DM5.cdsErro2.RecordCount > 0 then
  begin
  sel := JvDBGrid2.SelectedRows.Count;
  if sel>0 then
    with JvDBGrid2.DataSource.DataSet do
      for i:=0 to sel-1 do
      begin
        GotoBookmark((JvDBGrid2.SelectedRows.Items[i]));
            // ======= ITEM SELECIONADO ====================
            //pb.Position := i;
        // 1= Retira Normal, 2= Retira com Valor alto; 3= Duplicidade; 4= Atrasados
        if (tipo=1) and (DM5.cdsErro2STATUS.Value<>91) then Retira_erro(DM5.cdsErro2ID.Value);
        if (tipo=2) then
        begin
          DM2.Altera_Status('TB_CONHEC', 'STATUS', DM5.cdsErro2ID.Value, 0);
        end;
        if (tipo=3) and (DM5.cdsErro2STATUS.Value=208) then
        begin
          Retira_erro(DM5.cdsErro2ID.Value);
          DM2.Altera_Status('TB_CONHEC', 'STATUSENVIO', DM5.cdsErro2ID.Value, 4);
        end;
        if (tipo=4) and (DM5.cdsErro2STATUS.Value=238) then  Retira_erro(DM5.cdsErro2ID.Value);
      end;
  end;
end;

procedure TCteErros.AlterarCNPJ1Click(Sender: TObject);
begin
  CteDet.PageControl1.TabIndex := 0;
  CteDet.Show;
end;

procedure TCteErros.Atrasadoscorrigirselecionados1Click(Sender: TObject);
begin
  Selecionados(4);
end;

procedure TCteErros.DuplicidadeCorrigir1Click(Sender: TObject);
begin
  Selecionados(3);
end;

procedure TCteErros.Entrar(d1, d2:TDateTime);
begin
  dt1 := d1;
  dt2 := d2;
  lbDT1.Caption := FormatDateTime('dd/MM/yyyy ddd', dt1);
  lbDT2.Caption := FormatDateTime('dd/MM/yyyy ddd', dt2);

  Mostra_resumo;

end;

procedure TCteErros.JvDBGrid1CellClick(Column: TColumn);
  var Bco : TBco;
begin
  case DM5.cdsErro1STATUS.Value of
    90 :lbMens.Caption := 'Erro 90: Verifique se o Cadastro do Cliente está com os valores lançados. Corrija os valores na Nota e calcule novamente';
    91 :lbMens.Caption := 'Erro 91: Corrija os valores na Nota e calcule novamente ou peça para o Administrador autorizar esse valor';
    204:lbMens.Caption := 'Erro 204: Selecione os CT-e´s e com o botão direito converta-os para enviados';
    208:lbMens.Caption := 'Erro 208: Corrija o CNPJ do destinatário utilizano do botão direito do mouse ';
    238:lbMens.Caption := 'Erro 238: Selecione os CT-e´s e com o botão direito atualiza a data';
    424:lbMens.Caption := 'Erro 424: Altere o código do município com o botão direito do mouse';
    else lbMens.Caption := 'Erro ???: Erro não catalogado. Informe no e-mail tecnologia@flaydel.srv.br';
  end;

  Bco := TBco.Create;
  Bco.Cte_erros_Itens(dt1,dt2, DM5.cdsErro1STATUS.Value);
  Bco.Destroy;
end;

procedure TCteErros.JvDBGrid2DblClick(Sender: TObject);
begin
  NotasP.Entrar;
  NotasP.set_idNota(DM5.cdsErro2LIGNOTA.Value);
  NotasP.AbreNf;
  NotasP.Show;
end;

procedure TCteErros.ManterValorAlto1Click(Sender: TObject);
begin
  if MessageDlg('Tem certeza que Manter o Valor dos itens selecionados? ',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then Selecionados(2);
end;

procedure TCteErros.ProcurarCdigodoMunicpio1Click(Sender: TObject);
begin
  CteDet.PageControl1.TabIndex := 1;
  CteDet.Show;

end;

procedure TCteErros.REcalcularCTe1Click(Sender: TObject);
begin
  CtePq.PesqCTe(DM5.cdsErro2NUMC.AsString);
  CtePq.Show;
end;

procedure TCteErros.RetirarMarcadeErro1Click(Sender: TObject);
begin
  Selecionados(1);
end;

end.
