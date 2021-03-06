unit UFornecedor;

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
  dxSkinXmas2008Blue, cxTextEdit, Vcl.Grids, Vcl.Outline, Vcl.StdCtrls,
  cxMaskEdit, cxDropDownEdit, Vcl.ExtCtrls, cxMemo, cxRichEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.PGDef,
  FireDAC.Phys.PG, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Buttons, dxGDIPlusClasses, cxImage, cxDBEdit, Vcl.DBCtrls,
  dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC;

type
  TFrm_Fornecedor = class(TForm)
    Ds_Fornecedor: TDataSource;
    Q_Fornecedor: TFDQuery;
    CONEXAO: TFDConnection;
    Drive_Postgres: TFDPhysPgDriverLink;
    Q_Fornecedorid_fornecedor: TIntegerField;
    Q_Fornecedorraz_social: TWideStringField;
    Q_Fornecedorfantasia: TWideStringField;
    Q_Fornecedorcnpj: TWideStringField;
    Q_Fornecedorie: TWideStringField;
    Q_Fornecedorcep: TWideStringField;
    Q_Fornecedorendereco: TWideStringField;
    Q_Fornecedorbairro: TWideStringField;
    Q_Fornecedornum: TIntegerField;
    Q_Fornecedorcidade: TWideStringField;
    Q_Fornecedoruf: TWideStringField;
    Q_Fornecedorcomplemento: TWideStringField;
    Q_Fornecedortelefone: TWideStringField;
    Q_Fornecedoremail: TWideStringField;
    Q_Fornecedortipopessoa: TWideStringField;
    Q_Fornecedortipofornecedor: TWideStringField;
    Q_Fornecedorgrupofornecedor: TWideStringField;
    Q_Fornecedorfax: TWideStringField;
    Q_Fornecedorsite: TWideStringField;
    Q_Fornecedorobservacao: TWideStringField;
    Q_Fornecedoremitenotaavulsa: TWideStringField;
    Q_Fornecedorreferencia: TWideStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    cxPageControl1: TcxPageControl;
    procedure Btn_NovoClick(Sender: TObject);
    procedure Btn_CancelarClick(Sender: TObject);
    procedure Btn_SalvarClick(Sender: TObject);
    procedure Btn_AlterarClick(Sender: TObject);
    procedure Btn_DeletarClick(Sender: TObject);
    procedure Btn_AtualizarClick(Sender: TObject);
    procedure Btn_PesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Fornecedor: TFrm_Fornecedor;

implementation

uses
  UTelaPrincipal, UFormFornecedor;

{$R *.dfm}

procedure TFrm_Fornecedor.Btn_AlterarClick(Sender: TObject);
begin
  if MessageDlg('Deseja alterar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    begin
      Q_Fornecedor.Edit;
    end
    else
      Abort;
end;

procedure TFrm_Fornecedor.Btn_AtualizarClick(Sender: TObject);
begin
  Q_Fornecedor.Refresh;
  MessageDlg('Registro atualizado!', mtInformation, [mbOk], 0);
end;

procedure TFrm_Fornecedor.Btn_CancelarClick(Sender: TObject);
begin
  if messageDlg('Deseja cancelar o regitro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Q_Fornecedor.Cancel;
    end
    else
    Abort;
end;

procedure TFrm_Fornecedor.Btn_DeletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir o registro?', mtInformation, [mbYes, mbNo], 0) = mrYes
  then
    begin
      Q_Fornecedor.Delete;
    end
    else
      Abort;
end;

procedure TFrm_Fornecedor.Btn_NovoClick(Sender: TObject);
  var Prox: integer;
begin
  Q_Fornecedor.Active := True;   //abrindo a conexao com o banco
  Q_Fornecedor.Last;            //Jogando o cadastro para o ultimo registro
  Prox := Q_FornecedorId_Fornecedor.AsInteger + 1; //adicionando mais um no novo registro
  Q_Fornecedor.Append;         //abre a conexao com a Query
  Q_Fornecedorid_fornecedor.AsInteger := Prox;
  //TipoPessoa.SetFocus;        //joga o fogo no tipo pessoa
end;

procedure TFrm_Fornecedor.Btn_PesquisaClick(Sender: TObject);
begin
  Frm_PesquisaFornecedor := TFrm_PesquisaFornecedor.Create(Self);
  Frm_PesquisaFornecedor.ShowModal;
  try

  finally
    Frm_PesquisaFornecedor.Free;
    Frm_PesquisaFornecedor := nil;
  end;
end;

procedure TFrm_Fornecedor.Btn_SalvarClick(Sender: TObject);
begin
  try
    Q_Fornecedor.Post;
    MessageDlg('Registro Salvo com sucesso!', mtInformation, [mbOk], 0);
  except  on E: EExternalException do
    begin
      if E.Message.Contains('not-null') then
        begin
          ShowMessage('Campo Obrigat?rio!');
        end
        else
          begin
            ShowMessage('Preencha os campos obrigat?rios' + sLineBreak + E.Message);
          end;
    end;
  end;
end;

end.
