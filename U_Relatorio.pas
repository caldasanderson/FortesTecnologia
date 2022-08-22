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
    rlsystmnf3: TRLSystemInfo;
    RLSystemInfo1: TRLSystemInfo;
    rlgrp1: TRLGroup;
    TRLBand: TRLBand;
    rldbtxtCodigo: TRLDBText;
    rldbtxtCodigoDT_ABASTECIMENTO: TRLDBText;
    rldbtxtCodigoVL_LITROS: TRLDBText;
    rldbtxtCodigoVL_PERCENTUAL_IMPOSTO: TRLDBText;
    rldbtxtCodigoDS_BOMBA: TRLDBText;
    rldbtxtCodigoVL_ABASTECIMENTO: TRLDBText;
    TRLBand5: TRLBand;
    rlblValorGeral: TRLLabel;
    rldbrsltTotal_Abastecimentos: TRLDBResult;
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
