object About_Fr: TAbout_Fr
  Left = 468
  Top = 235
  Width = 333
  Height = 189
  Caption = 'About'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 51
    Top = 11
    Width = 248
    Height = 29
    Caption = 'Graphic Font Maker v1.1'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Impact'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 165
    Top = 36
    Width = 151
    Height = 18
    Caption = 'Creating '#39'GF'#39' Files'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Georgia'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 60
    Top = 80
    Width = 163
    Height = 13
    Caption = 'CopyRight 2000 By Reza Meshkat'
  end
  object Label4: TLabel
    Left = 60
    Top = 98
    Width = 140
    Height = 13
    Caption = 'Tel : (IRAN) - ( 051 ) - 811247'
  end
  object Label5: TLabel
    Left = 60
    Top = 62
    Width = 185
    Height = 13
    Caption = 'With Spicial Thanks To Salim MirAlaiee'
  end
  object Button1: TButton
    Left = 125
    Top = 124
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Animate1: TAnimate
    Left = 12
    Top = 13
    Width = 25
    Height = 25
    Active = False
    Color = clSilver
    ParentColor = False
    StopFrame = 101
    Transparent = False
  end
end
