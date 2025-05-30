object frmKagbaMediaPlayer: TfrmKagbaMediaPlayer
  Left = 0
  Top = 0
  Caption = 'KIMP'
  ClientHeight = 478
  ClientWidth = 911
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 911
    Height = 97
    Align = alTop
    ParentBackground = False
    TabOrder = 0
    object lblHeader: TLabel
      Left = 1
      Top = 1
      Width = 909
      Height = 46
      Align = alTop
      Alignment = taCenter
      Caption = 'Kagba Industries Media Player'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -35
      Font.Name = 'Tempus Sans ITC'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 465
    end
    object mediaPlayer: TMediaPlayer
      Left = 408
      Top = 53
      Width = 85
      Height = 33
      Align = alCustom
      EnabledButtons = [btPlay, btPause, btStop, btStep, btBack]
      VisibleButtons = [btPlay, btPause, btStop]
      Anchors = [akTop]
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object btnLoad: TButton
      Left = 16
      Top = 14
      Width = 73
      Height = 32
      Align = alCustom
      Caption = 'Load'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnLoadClick
    end
    object cbxLoop: TCheckBox
      Left = 16
      Top = 69
      Width = 97
      Height = 17
      Caption = 'Loop Video'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object scrollBar: TScrollBar
    Left = 0
    Top = 461
    Width = 911
    Height = 17
    Align = alBottom
    PageSize = 0
    TabOrder = 1
    OnScroll = scrollBarScroll
  end
  object pnlMedia: TPanel
    Left = 0
    Top = 97
    Width = 911
    Height = 364
    Align = alClient
    TabOrder = 2
    OnResize = pnlMediaResize
  end
  object openDialogBox: TOpenDialog
    Filter = 'Media|'#39'*.wav;*.wmv;*.WMV;*.WAV'#39
    Left = 144
    Top = 16
  end
  object tTimer: TTimer
    Enabled = False
    Interval = 30
    OnTimer = tTimerTimer
    Left = 824
    Top = 16
  end
  object tLoop: TTimer
    Interval = 20
    OnTimer = tLoopTimer
    Left = 744
    Top = 17
  end
end
