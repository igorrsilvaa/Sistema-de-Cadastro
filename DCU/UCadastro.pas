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
  dxGDIPlusClasses, Vcl.Grids, Vcl.Outline, Vcl.Buttons;

type
  TForm1 = class(TForm)
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
    Db_Cliente: TDBEdit;
    Label1: TLabel;
    Db_Nome: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Ed_cpf: TDBEdit;
    Ed_DtNasc: TDBEdit;
    Ed_Rg: TDBEdit;
    Ed_Apelido: TDBEdit;
    Ed_Celular: TDBEdit;
    Label7: TLabel;
    Ed_Telefone: TDBEdit;
    Label8: TLabel;
    Ed_Email: TDBEdit;
    Ed_Endereco: TDBEdit;
    Label11: TLabel;
    Ed_Cidade: TDBEdit;
    Label12: TLabel;
    Ed_Bairro: TDBEdit;
    Label13: TLabel;
    Ed_Uf: TDBEdit;
    Label14: TLabel;
    Ed_Num: TDBEdit;
    Label15: TLabel;
    Ed_Complemento: TDBEdit;
    Label16: TLabel;
    Ed_referencia: TDBEdit;
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
    procedure btn_NovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_NovoClick(Sender: TObject);
var prox: integer;
  begin
    Q_clientes.Last;
    prox := Q_clientesid_cliente.AsInteger + 1;
    Q_clientes.Append;
    Q_clientesid_cliente.AsInteger := prox;
    Db_Nome.SetFocus;
  end;

end.