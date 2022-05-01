unit UFormulario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrm_pesquisa = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edt_Pesquisa: TEdit;
    Label1: TLabel;
    Btn_Pesquisar: TBitBtn;
    Btn_Imprimir: TBitBtn;
    Label2: TLabel;
    cb_filtro: TComboBox;
    procedure Btn_PesquisarClick(Sender: TObject);
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

procedure TFrm_pesquisa.Btn_PesquisarClick(Sender: TObject);
begin
  Frm_Cadastro.Q_clientes.Close;
  Frm_Cadastro.Q_clientes.Params.Clear;
  Frm_Cadastro.Q_clientes.SQL.Add('');
  Frm_Cadastro.Q_clientes.SQL.Clear;
  Frm_Cadastro.Q_clientes.SQL.Add('SELECT * FROM clientes');

  case cb_filtro.ItemIndex of
    0: begin
      Frm_Cadastro.Q_clientes.SQL.Add('WHERE id_cliente =:pcodigo');
      Frm_Cadastro.Q_clientes.ParamByName('pcodigo').AsInteger:=StrToInt(edt_Pesquisa.Text)
    end;

    1: begin
      Frm_Cadastro.Q_clientes.SQL.Add('WHERE nome =:pnome');
      Frm_Cadastro.Q_clientes.ParamByName('pnome').AsString:=(edt_Pesquisa.Text)
    end;

    3: begin
      Frm_Cadastro.Q_clientes.SQL.Add('WHERE apelido =:papelido');
      Frm_Cadastro.Q_clientes.ParamByName('papelido').AsString:=(edt_Pesquisa.Text)
    end;

    4: begin
      Frm_Cadastro.Q_clientes.SQL.Add('WHERE cpf =:pcpf');
      Frm_Cadastro.Q_clientes.ParamByName('pcpf').AsString:=StrToInt(edt_Pesquisa.Text)
    end;

    5: begin
      Frm_Cadastro.Q_clientes.SQL.Add('WHERE rg =:prg');
      Frm_Cadastro.Q_clientes.ParamByName('prg').AsString:=StrToInt(edt_Pesquisa.Text)
    end;

  end;
     Frm_Cadastro.Q_clientes.Open;
     if Frm_Cadastro.Q_clientes.IsEmpty then
      begin
        MessageDlg('Nenhum Registro Encontrado.', mtInformation, [mbOK], 0);
      end;


end;

end.