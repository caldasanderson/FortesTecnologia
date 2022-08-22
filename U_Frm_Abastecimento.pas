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
    dtpDtAbastecimento: TDateTimePicker;
    lblDtAbastecimento: TLabel;
    lblVlLitros: TLabel;
    lblVlAbastecimento: TLabel;
    lblBomba: TLabel;
    btnSalvar: TSpeedButton;
    qryAbastecimentoBomba: TFDQuery;
    dsBomba: TDataSource;
    dblkcbbcdBomba: TDBLookupComboBox;
    edtLitros: TEdit;
    edtVL_Abastecimento: TEdit;
    edtVl_Imposto: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure edtLitrosExit(Sender: TObject);
    procedure edtLitrosKeyPress(Sender: TObject; var Key: Char);
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
      Abastecimento.vl_Litros :=   StrToFloat(edtLitros.Text);
      Abastecimento.vl_Abastecimento := StrToFloat(edtVL_Abastecimento.Text);
      Abastecimento.vl_Percentual_Imposto := StrToFloat(edtVl_Imposto.Text);

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
  if ((edtLitros.Text = EmptyStr) or (edtLitros.Text = '0,00')) then
  begin
    ShowMessage('Favor preencher a quantidade de litros do abastecimento');
    edtLitros.SetFocus;
    Result := False;
    Exit;
  end;
  if ((edtVL_Abastecimento.Text = EmptyStr) or (edtVL_Abastecimento.Text = '0,00'))  then
  begin
    ShowMessage('Favor preencher o valor do abastecimento');
    edtVL_Abastecimento.SetFocus;
    Result := False;
    Exit;
  end;
  if ((edtVl_Imposto.Text = EmptyStr) or (edtVl_Imposto.Text = '0,00')) then
  begin
    ShowMessage('Favor preencher a quantidade de litros do abastecimento');
    edtVl_Imposto.SetFocus;
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

procedure Tfrm_Abastecimento.edtLitrosExit(Sender: TObject);
var
   TextoEdit: UnicodeString;
   Valor: Currency;
begin
   TextoEdit := TCustomEdit(Sender).Text;

  if TryStrToCurr(TextoEdit, Valor) then
    TCustomEdit(Sender).Text := FormatFloat('#.##', Valor)
  else
  begin
    ShowMessage('Valor inválido!');
    TCustomEdit(Sender).Text := '0,00';
    TCustomEdit(Sender).SetFocus;
  end;
end;

procedure Tfrm_Abastecimento.edtLitrosKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', ',', #8]) then
 begin
   Key := #0;
 end;
end;

end.
