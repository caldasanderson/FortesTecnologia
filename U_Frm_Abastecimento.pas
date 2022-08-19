unit U_Frm_Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls;

type
  Tfrm_Abastecimento = class(TForm)
    pnlPrincipal: TPanel;
    lblCdAbastecimento: TLabel;
    edtCdAbastecimento: TEdit;
    lblVlPercentualImposto: TLabel;
    medtVlPercentualImposto: TMaskEdit;
    dtpDtAbastecimento: TDateTimePicker;
    lblDtAbastecimento: TLabel;
    lblVlLitros: TLabel;
    medtVlLitros: TMaskEdit;
    lblVlAbastecimento: TLabel;
    medtVlAbastecimento: TMaskEdit;
    lblBomba: TLabel;
    btnSalvar: TSpeedButton;
    qryAbastecimentoBomba: TFDQuery;
    dsBomba: TDataSource;
    dblkcbbcdBomba: TDBLookupComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function Campos_Obrigatorios:Boolean;
  public
    { Public declarations }

  end;

var
  frm_Abastecimento: Tfrm_Abastecimento;

implementation

uses
  U_DM_Principal, U_Classes;

{$R *.dfm}

procedure Tfrm_Abastecimento.btnSalvarClick(Sender: TObject);
var
  Abastecimento : TAbastecimento;
begin
  Abastecimento := TAbastecimento.Create(DM_Principal.CONGERAL);
  if (edtCdAbastecimento.Text = EmptyStr) then
  begin
    if Campos_Obrigatorios then
    begin
      Abastecimento.dt_Abastecimento := dtpDtAbastecimento.Date;
      Abastecimento.C_Bomba.cd_Bomba := dblkcbbcdBomba.ListSource.DataSet.FieldByName('cd_bomba').AsInteger;
      Abastecimento.vl_Litros :=  StrToFloat(medtVlLitros.Text);
      Abastecimento.vl_Abastecimento := StrToFloat(medtVlAbastecimento.Text);
      Abastecimento.vl_Percentual_Imposto := StrToFloat(medtVlPercentualImposto.Text);

      if Abastecimento.Salvar('I') then
      begin
        ShowMessage('Abastecimento inserido com sucesso!');
      end;
    end;
  end;

end;

procedure Tfrm_Abastecimento.FormShow(Sender: TObject);
begin
  qryAbastecimentoBomba.Open;
end;

function Tfrm_Abastecimento.Campos_Obrigatorios: Boolean;
begin
  Result := True;
  if medtVlLitros.Text = EmptyStr then
  begin
    ShowMessage('Favor preencher a quantidade de litros do abastecimento');
    medtVlLitros.SetFocus;
    Result := False;
    Exit;
  end;
  if medtVlAbastecimento.Text = EmptyStr then
  begin
    ShowMessage('Favor preencher o valor do abastecimento');
    medtVlAbastecimento.SetFocus;
    Result := False;
    Exit;
  end;
  if medtVlAbastecimento.Text = EmptyStr then
  begin
    ShowMessage('Favor preencher a quantidade de litros do abastecimento');
    medtVlAbastecimento.SetFocus;
    Result := False;
    Exit;
  end;
  if dblkcbbcdBomba.Text = EmptyStr then
  begin
    ShowMessage('Favor selecionar a bomba utilizada no abastecimento');
    dblkcbbcdBomba.SetFocus;
    Result := False;
    Exit;
  end;


end;

end.
