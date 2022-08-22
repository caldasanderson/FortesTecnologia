unit U_Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Vcl.Menus,
  Data.DB, FireDAC.Comp.Client;

type
  Tfrm_Principal = class(TForm)
    mmPrincipal: TMainMenu;
    mniCadastrar: TMenuItem;
    mniRelatorios: TMenuItem;
    mniAbastecimento: TMenuItem;
    mniRelatriodeabastecimentos: TMenuItem;
    procedure mniAbastecimentoClick(Sender: TObject);
    procedure mniRelatriodeabastecimentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Principal: Tfrm_Principal;

implementation

uses
  U_Frm_Abastecimento, U_Relatorio;

{$R *.dfm}

procedure Tfrm_Principal.mniAbastecimentoClick(Sender: TObject);
begin
  try
    Application.CreateForm(Tfrm_Abastecimento,frm_Abastecimento );
    frm_Abastecimento.ShowModal;
  finally
    FreeAndNil(frm_Abastecimento);
  end;
end;

procedure Tfrm_Principal.mniRelatriodeabastecimentosClick(Sender: TObject);
begin
  try
    Application.CreateForm(TFrmRelatorioAbastecimento,FrmRelatorioAbastecimento );
    FrmRelatorioAbastecimento.rlrprtAbastecimentos.Preview();
  finally
    FreeAndNil(FrmRelatorioAbastecimento);
  end;
end;

end.
