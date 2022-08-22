program Posto_Fortes;

uses
  Vcl.Forms,
  U_Principal in 'U_Principal.pas' {frm_Principal},
  U_DM_Principal in 'U_DM_Principal.pas' {DM_Principal: TDataModule},
  U_Classes in 'U_Classes.pas',
  U_Frm_Abastecimento in 'U_Frm_Abastecimento.pas' {frm_Abastecimento},
  U_Relatorio in 'U_Relatorio.pas' {FrmRelatorioAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfrm_Principal, frm_Principal);
  Application.CreateForm(TDM_Principal, DM_Principal);
  Application.Run;
end.
