unit UPesquisa;

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
  dxSkinXmas2008Blue, Vcl.StdCtrls, Vcl.Buttons, cxTextEdit, Vcl.ExtCtrls,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMaskEdit,
  cxDropDownEdit, Vcl.Grids, Vcl.DBGrids;

type
  TFrm_pesquisa = class(TForm)
    Panel1: TPanel;
    edt_valor: TcxTextEdit;
    Label1: TLabel;
    Label3: TLabel;
    Btn_Pesquisa: TBitBtn;
    Btn_Imprimi: TBitBtn;
    Cb_Filtro: TcxComboBox;
    DBGrid1: TDBGrid;
    procedure Btn_PesquisaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_pesquisa: TFrm_pesquisa;

implementation

uses
  UCadastro;

{$R *.dfm}



procedure TFrm_pesquisa.Btn_PesquisaClick(Sender: TObject);
begin
  Frm_Cadastro.Q_clientes.Close;
  Frm_Cadastro.Q_clientes.Open('');
  Frm_Cadastro.Q_clientes.Params.Clear;
  Frm_Cadastro.Q_clientes.SQL.Text := ('SELECT * FROM clientes');

  if edt_valor.Text <> '' then
   begin

      case Cb_Filtro.ItemIndex of   //case aceita penas numeros inteiros ou boolean
      //0=codigo
        0: begin
            Frm_Cadastro.Q_clientes.SQL.Add('WHERE id_cliente =:pcodigo');
            Frm_Cadastro.Q_clientes.ParamByName('pcodigo').AsInteger:=StrToInt(edt_valor.Text)
          end;
        //1=nome
        1: begin
            Frm_Cadastro.Q_clientes.SQL.Add('WHERE nome =:pnome');
            Frm_Cadastro.Q_clientes.ParamByName('pnome').AsString:=(edt_valor.Text)
          end;
        //2=cpf
        2: begin
            Frm_Cadastro.Q_clientes.SQL.Add('WHERE cpf =:pcpf');
            Frm_Cadastro.Q_clientes.ParamByName('pcpf').AsString:=(edt_valor.Text)
          end;

          //3=RG
        3: begin
            Frm_Cadastro.Q_clientes.SQL.Add('WHERE rg =:prg');
            Frm_Cadastro.Q_clientes.ParamByName('prg').AsString:=(edt_Valor.Text)
          end;

      end;
    end;

    Frm_Cadastro.Q_clientes.Open;
    if Frm_Cadastro.Q_clientes.IsEmpty then
      begin
        MessageDlg('Nenhum registro encontrado', mtInformation, [mbOK], 0);
      end;
end;

end.
