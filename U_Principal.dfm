object frm_Principal: Tfrm_Principal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'POSTO FORTES'
  ClientHeight = 201
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmPrincipal: TMainMenu
    Left = 32
    Top = 24
    object mniCadastrar: TMenuItem
      Caption = 'Cadastrar'
      object mniAbastecimento: TMenuItem
        Caption = 'Abastecimento'
        OnClick = mniAbastecimentoClick
      end
    end
    object mniRelatorios: TMenuItem
      Caption = 'Relat'#243'rios'
      object mniRelatriodeabastecimentos: TMenuItem
        Caption = 'Relat'#243'rio de abastecimentos'
        OnClick = mniRelatriodeabastecimentosClick
      end
    end
  end
end
