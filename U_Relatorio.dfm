object FrmRelatorioAbastecimento: TFrmRelatorioAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de abastecimentos'
  ClientHeight = 546
  ClientWidth = 774
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlrprtAbastecimentos: TRLReport
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimentos'
    BeforePrint = rlrprtAbastecimentosBeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 27
      BandType = btHeader
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = False
      object rlblTitulo: TRLLabel
        Left = 0
        Top = 0
        Width = 224
        Height = 16
        Align = faLeftTop
        Caption = 'RELAT'#211'RIO DE ABASTECIMENTOS'
        Transparent = False
      end
      object rlsystmnf1: TRLSystemInfo
        Left = 299
        Top = 0
        Width = 119
        Height = 16
        Align = faCenterTop
        Text = 'Data:'
        Transparent = False
      end
      object rlsystmnf2: TRLSystemInfo
        Left = 594
        Top = 0
        Width = 124
        Height = 16
        Align = faRightTop
        Info = itPageNumber
        Text = 'Pag:'
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 65
      Width = 718
      Height = 24
      BandType = btHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      object rlblCodigo: TRLLabel
        Left = 24
        Top = 0
        Width = 49
        Height = 16
        Align = faTopOnly
        Caption = 'Codigo'
      end
      object rlblDtAbastecimento: TRLLabel
        Left = 79
        Top = 0
        Width = 33
        Height = 16
        Align = faTopOnly
        Caption = 'Data'
      end
      object rlblLitros1: TRLLabel
        Left = 153
        Top = 0
        Width = 65
        Height = 16
        Align = faTopOnly
        Caption = 'Qtd Litros'
      end
      object rlblPercentual: TRLLabel
        Left = 245
        Top = 0
        Width = 90
        Height = 16
        Align = faTopOnly
        Caption = '% Impostos'
      end
      object rlblBOmba: TRLLabel
        Left = 435
        Top = 0
        Width = 49
        Height = 16
        Align = faTopOnly
        Caption = 'Bomba'
      end
      object rlblVlAbastecimento1: TRLLabel
        Left = 559
        Top = 0
        Width = 156
        Height = 16
        Align = faTopOnly
        Caption = 'Valor do Abastecimento'
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 24
      BandType = btFooter
      object rlsystmnf3: TRLSystemInfo
        Left = 648
        Top = 0
        Width = 70
        Height = 16
        Align = faRightTop
        Info = itHour
        Text = 'Hora:'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 528
        Top = 0
        Width = 120
        Height = 16
        Align = faRightTop
        Text = 'Data:'
      end
    end
    object rlgrp1: TRLGroup
      Left = 38
      Top = 89
      Width = 718
      Height = 56
      object TRLBand: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 24
        object rldbtxtCodigo: TRLDBText
          Left = 29
          Top = 0
          Width = 44
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'CD_ABASTECIMENTO'
          DataSource = dsAbastecimento
          Text = ''
        end
        object rldbtxtCodigoDT_ABASTECIMENTO: TRLDBText
          Left = 79
          Top = 0
          Width = 74
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'DT_ABASTECIMENTO'
          DataSource = dsAbastecimento
          Text = ''
        end
        object rldbtxtCodigoVL_LITROS: TRLDBText
          Left = 159
          Top = 0
          Width = 74
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'VL_LITROS'
          DataSource = dsAbastecimento
          Text = ''
        end
        object rldbtxtCodigoVL_PERCENTUAL_IMPOSTO: TRLDBText
          Left = 261
          Top = 0
          Width = 74
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'VL_PERCENTUAL_IMPOSTO'
          DataSource = dsAbastecimento
          Text = ''
        end
        object rldbtxtCodigoDS_BOMBA: TRLDBText
          Left = 432
          Top = 0
          Width = 113
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'DS_BOMBA'
          DataSource = dsAbastecimento
          Text = ''
        end
        object rldbtxtCodigoVL_ABASTECIMENTO: TRLDBText
          Left = 594
          Top = 0
          Width = 121
          Height = 16
          Align = faTopOnly
          AutoSize = False
          DataField = 'VL_ABASTECIMENTO'
          DataSource = dsAbastecimento
          Text = ''
        end
      end
      object TRLBand5: TRLBand
        Left = 0
        Top = 24
        Width = 718
        Height = 25
        BandType = btFooter
        object rlblValorGeral: TRLLabel
          Left = 448
          Top = 0
          Width = 134
          Height = 16
          Align = faTopOnly
          Caption = 'Total Abastecimentos:'
        end
        object rldbrsltTotal_Abastecimentos: TRLDBResult
          Left = 632
          Top = 0
          Width = 176
          Height = 16
          Align = faTopOnly
          DataField = 'VL_ABASTECIMENTO'
          DataSource = dsAbastecimento
          Info = riSum
          Text = ''
        end
      end
    end
  end
  object qryAbastecimento: TFDQuery
    Connection = DM_Principal.CONGERAL
    SQL.Strings = (
      'select'
      
        ' a.cd_abastecimento, a.dt_abastecimento, a.vl_litros, a.vl_abast' +
        'ecimento, a.vl_percentual_imposto, b.ds_bomba'
      'from'
      '    tb_abastecimento a'
      '    inner join tb_bomba b on a.cd_bomba = b.cd_bomba'
      'order by a.dt_abastecimento')
    Left = 576
    Top = 16
  end
  object dsAbastecimento: TDataSource
    DataSet = qryAbastecimento
    Left = 456
    Top = 16
  end
end
