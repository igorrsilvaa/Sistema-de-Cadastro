unit UFormFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Data.DB, Vcl.Grids, Vcl.DBGrids, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFrm_PesquisaFornecedor = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    CbBoxFiltro: TcxComboBox;
    Label2: TLabel;
    CxEdtValor: TcxTextEdit;
    dbgrdFornecedor: TDBGrid;
    btnPesquisar: TBitBtn;
    btnImprimir: TBitBtn;
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_PesquisaFornecedor: TFrm_PesquisaFornecedor;

implementation

uses
  UFornecedor;

{$R *.dfm}

procedure TFrm_PesquisaFornecedor.btnPesquisarClick(Sender: TObject);
begin
  Frm_Fornecedor.Q_Fornecedor.Close;
  Frm_Fornecedor.Q_Fornecedor.Open('');
  Frm_Fornecedor.Q_Fornecedor.Params.Clear;
  Frm_Fornecedor.Q_Fornecedor.SQL.Text := ('SELECT * FROM fornecedor');

    case CbBoxFiltro.ItemIndex of
    //id
      0:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE id_fornecedor =:pId_fornecedor');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pId_fornecedor').AsInteger:=StrToInt(CxEdtValor.Text);
      end;

      //CNPJ
      1:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE Cnpj =:pCnpj');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pCnpj').AsInteger:=StrToInt(CxEdtValor.Text); 
      end;

      //Inscriçao estadual
      2:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE IE =:pIE');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pIE').AsInteger:=StrToInt(CxEdtValor.Text); 
      end;

      //Razao social
      3:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE raz_social =:praz_social');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pRazao Social').AsString:=(CxEdtValor.Text);
      end;

      //Fantasia
      4:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE fantasia =:pFantasia');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pFantasia').AsString:=(CxEdtValor.Text);
      end;

      //Tipo Fornecedor
      5:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE tipofornecedor =:pTipo Fornecedor');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pTipo Fornecedor').AsString:=(CxEdtValor.Text);
      end;

      //Grupo Fornecedor
      6:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE grupofornecedor =:pGrupo');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pTipo Fornecedor').AsString:=(CxEdtValor.Text);
      end;

      //Cidade 
      7:begin
        Frm_Fornecedor.Q_Fornecedor.SQL.Add('WHERE cidade =:pCidade');
        Frm_Fornecedor.Q_Fornecedor.ParamByName('pCidade').AsString:=(CxEdtValor.Text);
      end;
    end;

    Frm_Fornecedor.Q_Fornecedor.Open;
    if Frm_Fornecedor.Q_Fornecedor.IsEmpty then
      begin
        MessageDlg('Nenhum registro encontrado', mtInformation, [mbOK], 0);
      end;

end;

end.
