unit uRel2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, JvExDBGrids, JvDBGrid,
  ComCtrls, ExtCtrls;

type
  TRel2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    dte: TDateTimePicker;
    JvDBGrid1: TJvDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    btCalc: TBitBtn;
    pb: TProgressBar;
    lbR: TStaticText;
    Panel2: TPanel;
    Label2: TLabel;
    edRoma: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure JvDBGrid1DblClick(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
    procedure edRomaKeyPress(Sender: TObject; var Key: Char);
    procedure edRomaEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Rel2: TRel2;

implementation

{$R *.dfm}

uses uDm3, uBanco, uRel3, uFrete1, uRel4;

procedure TRel2.BitBtn1Click(Sender: TObject);

var Bco : TBco;

begin
  Bco := TBco.Create;
  Bco.Relatorio_Mostrar(dte.DateTime);
  Bco.Destroy;

  Label2.Visible := False;
  edRoma.Visible := False;

  if (DM3.cdsRelV.RecordCount > 0) then
  begin
    Label2.Visible := True;
    edRoma.Visible := True;

    edRoma.Text    := '';
    edRoma.SetFocus;
  end;

  
end;

procedure TRel2.JvDBGrid1DblClick(Sender: TObject);
begin
  Rel3.set_idRel(DM3.cdsRelVID.Value);
  Rel3.lbRel.Caption := Dm3.cdsRelVID.AsString;
  rel3.show;
end;

procedure TRel2.btCalcClick(Sender: TObject);

var Bco : TBco;
    i, pos : Integer;
    marca : TBookMark;

begin
  if JvDBGrid1.SelectedRows.Count>0 then
  begin
    pb.Min := 0;
    pb.Max := JvDBGrid1.SelectedRows.Count;

    with JvDBGrid1.DataSource.DataSet do
      for i:=0 to JvDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark((JvDBGrid1.SelectedRows.Items[i]));
        Bco := TBco.Create;
        Bco.Relatorio_Notas(DM3.cdsRelVID.Value);
        Bco.Destroy;
        pos := pos + 1;
        pb.Position := i+1;
        lbR.Caption := DM3.cdsRelVID.AsString;

        if (DM3.cdsRelN.RecordCount > 0) then
        begin
          Bco := TBco.Create;
          Bco.Cliente_MostraId(DM3.cdsRelNLIGCLI.Value);
          Bco.Destroy;

          pos := 0;
          DM3.cdsRelN.First;
          while not DM3.cdsRelN.Eof do
          begin

            Rel3.Calcula_Frete(DM3.cdsRelNNROMA.Value);
            DM3.cdsRelN.Next;
          end;
        end;
      end; // for

      marca := DM3.cdsRelV.GetBookmark;

      Bco := TBco.Create;
      Bco.Relatorio_Mostrar(dte.DateTime);
      Bco.Destroy;

      DM3.cdsRelV.GotoBookmark(marca);
      
  end; // selected > 0
end;

procedure TRel2.edRomaKeyPress(Sender: TObject; var Key: Char);

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

procedure TRel2.edRomaEnter(Sender: TObject);
begin
  edRoma.Text := '';
end;

procedure TRel2.FormActivate(Sender: TObject);
begin
  dte.DateTime := Now;
end;

end.
