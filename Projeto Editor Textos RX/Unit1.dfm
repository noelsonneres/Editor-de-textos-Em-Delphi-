object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 468
  ClientWidth = 824
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 824
    Height = 73
    Align = alTop
    TabOrder = 0
    ExplicitTop = -6
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 81
      Height = 41
      Caption = 'Abrir'
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 144
      Top = 0
      Width = 121
      Height = 49
      Caption = 'Alinhar no centro'
      OnClick = SpeedButton2Click
    end
  end
  object RxRichEdit1: TRxRichEdit
    Left = 0
    Top = 73
    Width = 824
    Height = 395
    DrawEndPage = False
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    WantTabs = True
    ExplicitTop = 96
    ExplicitHeight = 372
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 216
    Top = 152
  end
end
