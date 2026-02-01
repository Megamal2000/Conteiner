unit ucadFunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ImgList, ExtCtrls, Grids, DBGrids, JvExStdCtrls, JvEdit,
  JvValidateEdit, StdCtrls, Buttons, Mask, ComCtrls, JvSpeedbar,
  JvExExtCtrls, JvExtComponent;

type
  TcadFunc = class(TForm)
    Label18: TLabel;
    JvSpeedBar1: TJvSpeedBar;
    Label14: TLabel;
    JvSpeedBarSection1: TJvSpeedBarSection;
    JvSpeedBarSection2: TJvSpeedBarSection;
    btNovo: TJvSpeedItem;
    btSalvar: TJvSpeedItem;
    btApagar: TJvSpeedItem;
    btPesq: TJvSpeedItem;
    btped: TJvSpeedItem;
    bthist: TJvSpeedItem;
    PageControl1: TPageControl;
    tsContato: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edNome: TEdit;
    edRG: TEdit;
    rbFisica: TRadioButton;
    rbJuridica: TRadioButton;
    edCNPJ: TMaskEdit;
    edCPF: TMaskEdit;
    tsEnder: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    procCEP: TSpeedButton;
    Label19: TLabel;
    Label21: TLabel;
    edEnder: TEdit;
    edBairro: TEdit;
    edCidade: TEdit;
    edCEP: TEdit;
    cbUF: TComboBox;
    edNum: TJvValidateEdit;
    edComp: TEdit;
    tsTels: TTabSheet;
    Label13: TLabel;
    lbTels: TLabel;
    Label20: TLabel;
    Label1: TLabel;
    Label26: TLabel;
    edTel: TEdit;
    cbDesc: TComboBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label24: TLabel;
    btSubNovo: TSpeedButton;
    btSubSalvar: TSpeedButton;
    btSubApagar: TSpeedButton;
    edDetalhes: TEdit;
    tsTelefone: TTabSheet;
    Label22: TLabel;
    Label23: TLabel;
    cbDesc2: TComboBox;
    edTel2: TEdit;
    tsWeb: TTabSheet;
    lbQtweb: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label25: TLabel;
    edDescricao: TEdit;
    edWEB: TEdit;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    Label27: TLabel;
    btiWEB: TSpeedButton;
    btsWEB: TSpeedButton;
    btaWEB: TSpeedButton;
    edObs: TEdit;
    Panel3: TPanel;
    lbAtual: TLabel;
    lbDTcad: TLabel;
    ImageList1: TImageList;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cadFunc: TcadFunc;

implementation

{$R *.dfm}

end.
