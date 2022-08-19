unit U_Classes;

interface

Uses
  FireDAC.Comp.Client, System.SysUtils;

type
TTanque = class
  private
    Fcd_Tanque : Integer;
    Fds_Tanque : string;

    procedure SetCd_Tanque(value: Integer);
    procedure SetDs_Tanque(value: string);

  public
    //propriedades
    property cd_Tanque: Integer read Fcd_Tanque write SetCd_Tanque;
    property ds_Tanque: string read Fds_Tanque  write SetDs_Tanque;

    constructor Create ( );
    destructor Destroy;override;
end;

type
TBomba = class
  private
    Fcd_Bomba : Integer;
    Fds_Bomba : string;
    FC_Tanque : TTanque;

    procedure SetCd_Bomba(value: Integer);
    procedure SetDs_Bomba(value: string);
    procedure SetC_Tanque(value: TTanque);
  public
    //propriedades
    property cd_Bomba: Integer read Fcd_Bomba write Setcd_Bomba;
    property ds_Bomba: string read Fds_Bomba  write Setds_Bomba;
    property C_Tanque: TTanque read FC_Tanque  write SetC_Tanque;
  constructor Create ( );
  destructor Destroy;override;
end;

type
TAbastecimento = class
  private
    Fconexao : TFDConnection;
    Fcd_Abastecimento : Integer;
    Fdt_Abastecimento : Tdate;
    Fvl_Litros : Real;
    Fvl_Abastecimento : Real;
    Fvl_Percentual_Imposto : Real;
    FC_Bomba: TBomba;


    procedure SetCd_Abastecimento(value: Integer);
    procedure SetDt_Abastecimento(value: TDate);
    procedure SetVl_Litros(value: Real);
    procedure SetVl_Abastecimento(value: Real);
    procedure SetVl_Percentual_Imposto(value: Real);
    procedure SetC_Bomba(value: TBomba);
  public
  //propriedades
    property cd_Abastecimento: Integer read Fcd_Abastecimento write SetCd_Abastecimento;
    property dt_Abastecimento: Tdate read Fdt_Abastecimento  write SetDt_Abastecimento;
    property vl_Litros: Real read Fvl_Litros  write SetVl_Litros;
    property vl_Abastecimento: Real read  Fvl_Abastecimento write SetVl_Abastecimento;
    property vl_Percentual_Imposto: Real read Fvl_Percentual_Imposto write SetVl_Percentual_Imposto;
    property C_Bomba: TBomba read FC_Bomba write SetC_Bomba;

  //metodos
  Function Salvar(PAcao:String) : Boolean;
  constructor Create (PConexao : TFDConnection );
  destructor Destroy;override;

end;


implementation



{ TAbastecimento }

constructor TAbastecimento.Create(PConexao: TFDConnection);
begin
  Fconexao := PConexao;
  FC_Bomba := TBomba.Create;
end;

destructor TAbastecimento.Destroy;
begin
  Fconexao.Free;
  FC_Bomba.Free;
  inherited;
end;

function TAbastecimento.Salvar(PAcao: String): Boolean;
var
QRY : TFDQuery;
begin
  
  QRY := TFDQuery.Create(nil);
  QRY.Connection := Fconexao;
  try
    if PAcao = 'I' then
    begin
      try
        QRY.SQL.Add('INSERT INTO TB_ABASTECIMENTO ');
        QRY.SQL.Add('  (dt_abastecimento, vl_litros, vl_abastecimento, vl_percentual_imposto, cd_bomba) ');
        QRY.SQL.Add('values ');
        QRY.SQL.Add('  (:dt_abastecimento, :vl_litros, :vl_abastecimento, :vl_percentual_imposto, :cd_bomba) ');

        QRY.ParamByName('dt_abastecimento').AsDate := Fdt_Abastecimento;
        QRY.ParamByName('vl_litros').AsFloat := Fvl_litros;
        QRY.ParamByName('vl_abastecimento').AsFloat := Fvl_abastecimento;
        QRY.ParamByName('vl_percentual_imposto').AsFloat := Fvl_percentual_imposto;
        QRY.ParamByName('cd_bomba').AsInteger := FC_Bomba.cd_Bomba;
        QRY.ExecSQL;
        Result := true;
      except
        Result := False;
        raise Exception.Create('Erro ao salvar o registro');
      end;
    end;
  finally
    QRY.Free;
  end;
end;

procedure TAbastecimento.SetCd_Abastecimento(value: Integer);
begin
  Fcd_Abastecimento := value;
end;

procedure TAbastecimento.SetC_Bomba(value: TBomba);
begin
  FC_Bomba := value;
end;

procedure TAbastecimento.SetDt_Abastecimento(value: TDate);
begin
  Fdt_Abastecimento := value;
end;

procedure TAbastecimento.SetVl_Abastecimento(value: Real);
begin
  FVl_Abastecimento := value;
end;

procedure TAbastecimento.SetVl_Litros(value: Real);
begin
  FVl_Litros := value;
end;

procedure TAbastecimento.SetVl_Percentual_Imposto(value: Real);
begin
  FVl_Percentual_Imposto := value;
end;

{ TBomba }

constructor TBomba.Create;
begin
  FC_Tanque := TTanque.Create;
end;

destructor TBomba.Destroy;
begin
  FC_Tanque.Free;
  inherited;
end;

procedure TBomba.SetCd_Bomba(value: Integer);
begin
  FCd_Bomba := value;
end;

procedure TBomba.SetC_Tanque(value: TTanque);
begin
  FC_Tanque := value;
end;

procedure TBomba.SetDs_Bomba(value: string);
begin
  FDs_Bomba := value;
end;

{ TTanque }

constructor TTanque.Create;
begin

end;

destructor TTanque.Destroy;
begin

  inherited;
end;

procedure TTanque.SetCd_Tanque(value: Integer);
begin
  Fcd_Tanque := value;
end;

procedure TTanque.SetDs_Tanque(value: string);
begin
  Fds_Tanque := value;
end;

end.
