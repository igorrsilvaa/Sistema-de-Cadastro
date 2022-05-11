unit UCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls,
  dxGDIPlusClasses, Vcl.Grids, Vcl.Outline, Vcl.Buttons, Vcl.ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit;

type
  TFrm_Cadastro = class(TForm)
    conexao: TFDConnection;
    DS_Cadastro: TDataSource;
    Q_clientes: TFDQuery;
    drivePG: TFDPhysPgDriverLink;
    Q_clientesid_cliente: TIntegerField;
    Q_clientesnome: TWideStringField;
    Q_clientesapelido: TWideStringField;
    Q_clientesdata_nasc: TDateField;
    Q_clientescpf: TWideStringField;
    Q_clientesrg: TWideStringField;
    Q_clientescep: TWideStringField;
    Q_clientesendereco: TWideStringField;
    Q_clientesbairro: TWideStringField;
    Q_clientesnum: TIntegerField;
    Q_clientescidade: TWideStringField;
    Q_clientesuf: TWideStringField;
    Q_clientescomplemento: TWideStringField;
    Q_clientestelefone: TWideStringField;
    Q_clientescelular: TWideStringField;
    Q_clientesemail: TWideStringField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Q_clientesreferencia: TWideStringField;
    Panel1: TPanel;
    Label10: TLabel;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label9: TLabel;
    Outline1: TOutline;
    Outline2: TOutline;
    Label20: TLabel;
    btn_Novo: TBitBtn;
    btn_Alterar: TBitBtn;
    btn_Deletar: TBitBtn;
    btn_Salvar: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Atualiza: TBitBtn;
    btn_Pesquisa: TBitBtn;
    pnl_buttons: TPanel;
    Outline3: TOutline;
    Label21: TLabel;
    Outline4: TOutline;
    Ed_Apelido: TcxDBTextEdit;
    Ed_cpf: TcxDBTextEdit;
    Db_Nome: TcxDBTextEdit;
    Ed_Rg: TcxDBTextEdit;
    Db_Cliente: TcxDBTextEdit;
    Ed_Email: TcxDBTextEdit;
    Ed_Telefone: TcxDBTextEdit;
    Ed_Celular: TcxDBTextEdit;
    Ed_Bairro: TcxDBTextEdit;
    Ed_Endereco: TcxDBTextEdit;
    Ed_Uf: TcxDBTextEdit;
    Ed_Num: TcxDBTextEdit;
    Ed_Complemento: TcxDBTextEdit;
    Ed_referencia: TcxDBTextEdit;
    Ed_Cidade: TcxDBTextEdit;
    Ed_DtNasc: TcxDBTextEdit;
    Ed_Cep: TcxDBTextEdit;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_DeletarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_AtualizaClick(Sender: TObject);
    procedure btn_PesquisaClick(Sender: TObject);
   // procedure TForm1.FormKeyPress(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cadastro: TFrm_Cadastro;

implementation

uses
   UPesquisa;

{$R *.dfm}

procedure TFrm_Cadastro.btn_AlterarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente editar o cadastro?', mtConfirmation, [mbyes, mbNo],0) = mrYes then
    begin
      Q_clientes.Edit;
    end
    else
      Abort;
end;

procedure TFrm_Cadastro.btn_AtualizaClick(Sender: TObject);
begin
  Q_clientes.Refresh;
  MessageDlg('Registro atualizado', mtInformation, [mbOk], 0);
end;

procedure TFrm_Cadastro.btn_CancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes   then
    begin
      Q_clientes.Cancel;
    end
    else
    Abort;
end;

procedure TFrm_Cadastro.btn_DeletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover o cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Q_clientes.Delete;
    end
    else
    Abort;
end;

//procedure TForm1.FormKeyPress(Sender: TObject; var key: Char);
//  begin
//    if key = #13 then
//    begin
//      key := #0;
//      Perform(WM_NEXTDLGCTL, 0, 0);
//    end;
//  end;

procedure TFrm_Cadastro.btn_NovoClick(Sender: TObject);
var prox: integer;
  begin
    Q_clientes.Active := True; //Abre a conexao com a Query quando clicado em novo
    Q_clientes.Last;  //joga o cadastro sempre p ultimo registro
    prox := Q_clientesid_cliente.AsInteger + 1; //vai acresentar +1 a cada novo cadastro
    Q_clientes.Append; //abre a conexao com a query
    Q_clientesid_cliente.AsInteger := prox;
    Db_Nome.SetFocus;  //joga o foco da tela no Nome
  end;

procedure TFrm_Cadastro.btn_PesquisaClick(Sender: TObject);
begin
  Frm_pesquisa := Tfrm_pesquisa.Create(self);
  Frm_pesquisa.ShowModal;
  try

  finally
    Frm_Pesquisa.Free;
    Frm_Pesquisa := nil;
  end;
end;

procedure TFrm_Cadastro.btn_SalvarClick(Sender: TObject);
begin

  try
    Q_clientes.Post;
    MessageDlg('Registro salvo com sucesso', mtInformation, [mbOk], 0);
  except on E: Exception do
    begin
    if E.message.Contains('not-null')then
      begin
         ShowMessage('Campo obrigatório');
      end
    else
    begin
      ShowMessage('Preencha os campos Obrigatorios' + sLineBreak + E.Message);
    end;

    end;
  end;
end;

end.
