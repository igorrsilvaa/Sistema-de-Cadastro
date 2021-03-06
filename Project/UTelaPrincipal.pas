unit UTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, RxMenus,
  cxControls, cxContainer, cxEdit, dxGDIPlusClasses, cxImage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrm_Principal = class(TForm)
    Panel1: TPanel;
    RxMainMenu1: TRxMainMenu;
    N1: TMenuItem;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    Fornecedor1: TMenuItem;
    ImgPrincipal: TcxImage;
    Relatorios1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

uses
  UCadastro, UFornecedor, UPesquisa;

{$R *.dfm}

procedure TFrm_Principal.Cliente1Click(Sender: TObject);
begin
  Frm_Cadastro := TFrm_Cadastro.Create(nil);
  try
    Frm_Cadastro.ShowModal;
  finally
    FreeAndNil(Frm_Cadastro);
  end;
end;

procedure TFrm_Principal.FormCreate(Sender: TObject);
begin
  Frm_Principal.WindowState := wsMaximized;
end;

procedure TFrm_Principal.Fornecedor1Click(Sender: TObject);
begin
  Frm_Fornecedor := TFrm_Fornecedor.Create(nil);
  try
    Frm_Fornecedor.ShowModal;
  finally
    FreeAndNil(Frm_Fornecedor);
  end;
end;

end.
