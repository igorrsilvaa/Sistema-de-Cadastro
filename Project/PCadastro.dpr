program PCadastro;

uses
  Vcl.Forms,
  UCadastro in '..\DCU\UCadastro.pas' {Frm_Cadastro},
  UPesquisa in '..\Forms\UPesquisa.pas' {Frm_pesquisa},
  UFornecedor in 'UFornecedor.pas' {Frm_Fornecedor},
  UTelaPrincipal in 'UTelaPrincipal.pas' {Frm_Principal},
  UFormFornecedor in 'UFormFornecedor.pas' {Frm_PesquisaFornecedor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.Run;
end.
