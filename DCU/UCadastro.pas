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
  dxSkinXmas2008Blue, cxTextEdit, cxDBEdit, cxImage, Vcl.DBGrids, cxMaskEdit,
  cxDropDownEdit, cxCheckBox, dxSkinscxPCPainter, dxBarBuiltInMenu, cxPC,
  cxCalendar, cxMemo, RxToolEdit, Vcl.Menus, cxButtons, ACBrBase, ACBrValidador;

type
  TFrm_Cadastro = class(TForm)
    conexao: TFDConnection;
    DS_Cadastro: TDataSource;
    Q_clientes: TFDQuery;
    drivePG: TFDPhysPgDriverLink;
    Panel1: TPanel;
    Label4: TLabel;
    CbAtivo: TcxDBComboBox;
    Label5: TLabel;
    CbTipoPessoa: TcxDBComboBox;
    Label6: TLabel;
    Db_Date_Nascimento: TcxDBDateEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    CbOptSimples: TcxDBComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    CbGrpCliente: TcxDBComboBox;
    Label13: TLabel;
    PButtons: TPanel;
    btn_Alterar: TBitBtn;
    btn_Atualiza: TBitBtn;
    btn_Cancelar: TBitBtn;
    btn_Deletar: TBitBtn;
    btn_Novo: TBitBtn;
    btn_Salvar: TBitBtn;
    Panel2: TPanel;
    PgCtrlCadastro: TcxPageControl;
    BtnPesquisar: TBitBtn;
    BtnImprimir: TBitBtn;
    Db_Date_Cadastro: TcxDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    CbTipoSexo: TcxDBComboBox;
    CbEstdCivil: TcxDBComboBox;
    ImgCliente: TcxImage;
    LineLogradouro: TOutline;
    Dadosprincipais: TcxTabSheet;
    Label1: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel3: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Outline1: TOutline;
    MMObservacaoP: TcxDBMemo;
    Label32: TLabel;
    MMObservacao: TcxDBMemo;
    LineObs1: TOutline;
    Label33: TLabel;
    LineAno: TOutline;
    MMAnotacao: TcxDBMemo;
    DadosComplementares: TcxTabSheet;
    ImgCadastro: TcxImage;
    BtnCarregarFoto: TBitBtn;
    BtnExcluirFoto: TBitBtn;
    Label34: TLabel;
    LineDadosComp: TOutline;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    LineConjugue: TOutline;
    cxDBTextEdit1: TcxDBTextEdit;
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
    Q_clientesreferencia: TWideStringField;
    Q_clientestipo_pessoa: TWideStringField;
    Q_clientesgrupo_cliente: TWideStringField;
    Q_clientessexo: TWideStringField;
    Q_clientesestado_civil: TWideStringField;
    Q_clientessite: TWideStringField;
    Q_clientesobs_publica: TWideStringField;
    Q_clientesobservacao: TWideStringField;
    Q_clientesanotacao: TWideStringField;
    Q_clientesflg_ativo: TWideStringField;
    Q_clientesprofissao: TWideStringField;
    Q_clienteslocal_trabalho: TWideStringField;
    Q_clientesendereco_trabalho: TWideStringField;
    Q_clientestelefone_trabalho: TIntegerField;
    Q_clientesvlr_renda: TIntegerField;
    Q_clientescargo: TWideStringField;
    Q_clientestipo_sanguinio: TWideStringField;
    Q_clientestelefone_extra: TIntegerField;
    Q_clientesoptante_simp: TWideStringField;
    EdtNome: TcxDBTextEdit;
    EdtApelido_Fantasia: TcxDBTextEdit;
    MmGrpCliente: TcxDBTextEdit;
    EdtCidadeNatural: TcxDBTextEdit;
    EdtTelefone: TcxDBTextEdit;
    EdtCelular: TcxDBTextEdit;
    EdtFax: TcxDBTextEdit;
    EdtEndereco: TcxDBTextEdit;
    EdtBairro: TcxDBTextEdit;
    EdtNum: TcxDBTextEdit;
    EdtComplemento: TcxDBTextEdit;
    EdtUF: TcxDBTextEdit;
    EdtReferencia: TcxDBTextEdit;
    EdtEmail: TcxDBTextEdit;
    EdtCidade: TcxDBTextEdit;
    EdtSite: TcxDBTextEdit;
    DateAlteracao: TcxDBDateEdit;
    EdtCep: TcxDBTextEdit;
    EdtProfissao: TcxDBTextEdit;
    EdtLocalTrabalho: TcxDBTextEdit;
    EdtTelTrabalho: TcxDBTextEdit;
    EdtEndLocalTrabalho: TcxDBTextEdit;
    EdtRenda: TcxDBTextEdit;
    EdtTpSangue: TcxDBTextEdit;
    EdtTelExtra: TcxDBTextEdit;
    EdtCargo: TcxDBTextEdit;
    EdtCpf_Cnpj: TcxDBTextEdit;
    EdtRg_Ie: TcxDBTextEdit;
    Q_clientescidade_natural: TWideStringField;
    Edt_Conjugue: TcxDBTextEdit;
    Label44: TLabel;
    Label45: TLabel;
    Edt_Dt_Casamento: TcxDBTextEdit;
    Label46: TLabel;
    Edt_Dt_Conjugue: TcxDBDateEdit;
    Edt_Cpf_Conjuge: TcxDBTextEdit;
    Label47: TLabel;
    Edt_Rg_Conjuge: TcxDBTextEdit;
    Label48: TLabel;
    Edt_Profi_Conjuge: TcxDBTextEdit;
    Label49: TLabel;
    Edt_Tel_Trab_conjuge: TcxDBTextEdit;
    Label50: TLabel;
    Edt_Local_Trabalho_Conjuge: TcxDBTextEdit;
    Label51: TLabel;
    Outline2: TOutline;
    Edt_Nome_Pai: TcxDBTextEdit;
    Label52: TLabel;
    Edt_Nome_Mae: TcxDBTextEdit;
    Label53: TLabel;
    Q_clientesconjuge: TWideStringField;
    Q_clientesdt_nasc_conjuge: TWideStringField;
    Q_clientesdt_casamento: TWideStringField;
    Q_clientescpf_conjuge: TWideStringField;
    Q_clientesrg_conjuge: TWideStringField;
    Q_clientesprofissao_conjuge: TWideStringField;
    Q_clientestel_trab_conjuge: TWideStringField;
    Q_clienteslocal_trab_conjuge: TWideStringField;
    Q_clientesnome_pai: TWideStringField;
    Q_clientesnome_mae: TWideStringField;
    Financeiro: TcxTabSheet;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    cbFormaPagamento: TcxDBComboBox;
    Q_clientesgrupo_negociacao: TWideStringField;
    Q_clientesplano_pagto: TWideStringField;
    cbGrupoNegociacao: TcxDBComboBox;
    Label57: TLabel;
    Panel4: TPanel;
    Label58: TLabel;
    cxConsignadoAberto: TcxDBTextEdit;
    Label59: TLabel;
    Edt_Receber: TcxDBTextEdit;
    Label60: TLabel;
    Label61: TLabel;
    cbSituacaoContas: TcxDBComboBox;
    Label62: TLabel;
    cbComprasAte: TcxDBComboBox;
    dbgrdContas: TDBGrid;
    btnFiltroContasFinanceiro: TcxButton;
    Edt_JurosFinanceiro: TcxDBTextEdit;
    Label63: TLabel;
    Edt_TotalJurosFinanceiro: TcxDBTextEdit;
    Label64: TLabel;
    Edt_MediaAtrasoFinanceiro: TcxDBTextEdit;
    Label65: TLabel;
    Q_clientestipo_situacao: TWideStringField;
    Q_clientescompras_ate: TWideStringField;
    Q_clientesconsig_aberto: TWideStringField;
    Q_clientespagar: TWideStringField;
    Q_clientesjuros: TWideStringField;
    Q_clientestotal_juros: TWideStringField;
    Q_clientesmedia_atraso: TWideStringField;
    CAcbr: TACBrValidador;
    Label18: TLabel;
    procedure btn_NovoClick(Sender: TObject);
    procedure btn_AlterarClick(Sender: TObject);
    procedure btn_DeletarClick(Sender: TObject);
    procedure btn_SalvarClick(Sender: TObject);
    procedure btn_CancelarClick(Sender: TObject);
    procedure btn_AtualizaClick(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);
    procedure btnFiltroContasFinanceiroClick(Sender: TObject);
    procedure EdtCpf_CnpjExit(Sender: TObject);
    procedure EdtCepExit(Sender: TObject);
    procedure EdtRg_IeExit(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cadastro: TFrm_Cadastro;

implementation

uses
   UPesquisa, UTelaPrincipal;

{$R *.dfm}

//Botao pesquisar
procedure TFrm_Cadastro.btnFiltroContasFinanceiroClick(Sender: TObject);
begin
 Frm_Cadastro.Q_clientes.Close;
 Frm_Cadastro.Q_clientes.Open('');
 Frm_Cadastro.Q_clientes.Params.Clear;
 Frm_Cadastro.Q_clientes.SQL.Text :=('SELECT * FROM clientes')
end;

procedure TFrm_Cadastro.BtnPesquisarClick(Sender: TObject);
begin
  Frm_pesquisa := Tfrm_pesquisa.Create(self);
  Frm_pesquisa.ShowModal;
  try

  finally
    Frm_Pesquisa.Free;
    Frm_Pesquisa := nil;
  end;
end;

procedure TFrm_Cadastro.btn_AlterarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente editar o cadastro?', mtConfirmation, [mbyes, mbNo],0) = mrYes then
    begin
      Q_clientes.Edit;
    end
    else
      Abort;
end;

//Botao Atualizar
procedure TFrm_Cadastro.btn_AtualizaClick(Sender: TObject);
begin
  Q_clientes.Refresh;
  MessageDlg('Registro atualizado', mtInformation, [mbOk], 0);
end;

//Botao Cancelar
procedure TFrm_Cadastro.btn_CancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes   then
    begin
      Q_clientes.Cancel;
    end
    else
    Abort;
end;

//Botao deletar
procedure TFrm_Cadastro.btn_DeletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja remover o cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      Q_clientes.Delete;
    end
    else
    Abort;
end;

//Botao Incluir
procedure TFrm_Cadastro.btn_NovoClick(Sender: TObject);
var proximo: integer;
  begin
    Q_clientes.Active := True; //Abre a conexao com a Query quando clicado em novo
    Q_clientes.Last;  //joga o cadastro sempre p ultimo registro
    proximo := Q_clientesid_cliente.AsInteger + 1; //vai acresentar +1 a cada novo cadastro
    Q_clientes.Append; //abre a conexao com a query
    Q_clientesid_cliente.AsInteger := proximo;
    CbTipoPessoa.SetFocus;  //joga o foco da tela no Nome
  end;

//Botao salvar
procedure TFrm_Cadastro.btn_SalvarClick(Sender: TObject);
begin
  try
    Q_clientes.Post;
    MessageDlg('Registro salvo com sucesso', mtInformation, [mbOk], 0);
  except on E: Exception do
    begin
    if E.message.Contains('not-null')then
      begin
         ShowMessage('Campo obrigat?rio');
      end
    else
      begin
        ShowMessage('Preencha os campos Obrigatorios' + sLineBreak + E.Message);
      end;

    end;
  end;
end;

// Validador CEP
procedure TFrm_Cadastro.EdtCepExit(Sender: TObject);
var Lcep    : string;
var LUf     : string;
var Lresult : string;
  begin
     Lcep := EdtCep.Text;
     LUf  := EdtUF.Text;
     if (trim(Lcep) <> '') and (Trim(Luf) <> '')then
     begin
       Lresult := ACBrValidador.ValidarCEP(Lcep, LUf);
       if Lresult <> '' then
       begin
         Application.MessageBox('(CEP) invalido', 'Erro no reconhecimento do CEP', MB_ICONERROR + MB_OK);
         EdtCep.SetFocus;
       end;
     end;
  end;

//Validador CPF e CNPJ
procedure TFrm_Cadastro.EdtCpf_CnpjExit(Sender: TObject);
var Lcpf_Cnpj : string;
var Retorno : string;
begin
  if CbTipoPessoa.Text = 'FISICA' then
  begin
    Lcpf_Cnpj := EdtCpf_Cnpj.text;
    if Lcpf_Cnpj  <> '' then        //se for diferente de vazio
    begin
      Retorno := ACBrValidador.ValidarCNPJouCPF(Lcpf_Cnpj);
      if Retorno <> '' then
      begin
        Application.MessageBox('(CPF) invalido', 'Erro no reconhecimento do CPF', MB_ICONERROR + MB_OK);
        EdtCpf_Cnpj.SetFocus;
      end;
    end;
  end;

  if CbTipoPessoa.Text = 'JURIDICA' then
  begin
    Lcpf_Cnpj := EdtCpf_Cnpj.text;

     if Lcpf_Cnpj  <> '' then        //se meu campo EdtCpf for diferente de vazio
     begin
        Retorno := ACBrValidador.ValidarCNPJouCPF(Lcpf_Cnpj);

        if Retorno <> '' then
        begin
         Application.MessageBox('(CNPJ) invalido', 'Erro no reconhecimento do CNPJ', MB_ICONERROR + MB_OK);
         EdtCpf_Cnpj.SetFocus;
        end;
     end;
  end;

end;

procedure TFrm_Cadastro.EdtRg_IeExit(Sender: TObject);
var
  LRg_IE   : string;
  LRetorno : string;
  Luf      : String;
begin
if CbTipoPessoa.Text = 'JURIDICA' then
  begin
    LRg_IE := EdtRg_Ie.Text;
    Luf := EdtUf.Text;
    if (EdtRg_Ie.Text <> '') and (EdtUF.Text <> '') then    //se for diferente de vazio
      begin
        LRetorno := ACBrValidador.ValidarIE(LRg_IE, Luf);
          if LRetorno <> '' then
          begin
           Application.MessageBox('(IE) invalido', 'Erro no reconhecimento da IE', MB_ICONERROR + MB_OK);
           EdtRg_Ie.SetFocus;
          end;
      end;
  end;
end;

end.
