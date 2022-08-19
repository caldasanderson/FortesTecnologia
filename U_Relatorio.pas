unit U_Relatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLReport;

type
  TFrmRelatorioAbastecimento = class(TForm)
    rlrprtAbastecimentos: TRLReport;
    qryAbastecimento: TFDQuery;
    dsAbastecimento: TDataSource;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    rlblTitulo: TRLLabel;
    rlsystmnf1: TRLSystemInfo;
    rlsystmnf2: TRLSystemInfo;
    rlblCodigo: TRLLabel;
    rlblDtAbastecimento: TRLLabel;
    rlblLitros1: TRLLabel;
    rlblPercentual: TRLLabel;
    rlblBOmba: TRLLabel;
    rlblVlAbastecimento1: TRLLabel;
    rldbtxtCodigo: TRLDBText;
    rldbtxtData: TRLDBText;
    rldbVL_LITROS: TRLDBText;
    rldbtxtVL_PERCENTUAL_IMPOSTO: TRLDBText;
    rldbtxtBomba: TRLDBText;
    rldbtxtVL_Abastecimento: TRLDBText;
    rlsystmnf3: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    procedure rlrprtAbastecimentosBeforePrint(Sender: TObject; var PrintIt:
        Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelatorioAbastecimento: TFrmRelatorioAbastecimento;

implementation

uses
  U_DM_Principal;

{$R *.dfm}

procedure TFrmRelatorioAbastecimento.rlrprtAbastecimentosBeforePrint(Sender:
    TObject; var PrintIt: Boolean);
begin
  qryAbastecimento.Open;
end;

end.
