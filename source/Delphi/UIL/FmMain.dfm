object Fm_Main: TFm_Main
  Left = 0
  Top = 0
  Caption = #1052#1086#1076#1077#1083#1100#1085#1072#1103' '#1089#1080#1089#1090#1077#1084#1072' '#1091#1082#1083#1072#1076#1082#1080' '#1087#1083#1080#1090#1082#1080
  ClientHeight = 341
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MM_Main
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object cxLFC_1: TcxLookAndFeelController
    Left = 16
    Top = 32
  end
  object AL_1: TActionList
    Images = cxIL_1
    Left = 56
    Top = 32
    object Act_New: TAction
      Category = 'File'
      Caption = #1053#1086#1074#1086#1077' '#1087#1086#1083#1077
      Hint = #1053#1086#1074#1086#1077' '#1087#1086#1083#1077
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = Act_NewExecute
    end
    object Act_Open: TAction
      Category = 'File'
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Hint = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = Act_OpenExecute
    end
    object Act_Close: TAction
      Category = 'File'
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076
      ImageIndex = 2
      OnExecute = Act_CloseExecute
    end
    object Act_About: TAction
      Category = 'Help'
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnExecute = Act_AboutExecute
    end
    object WindowCascade: TWindowCascade
      Category = 'Window'
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1082#1072#1089#1082#1072#1076#1086#1084
      Enabled = False
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1082#1072#1089#1082#1072#1076#1086#1084
      ImageIndex = 3
    end
    object WindowTileHorizontal: TWindowTileHorizontal
      Category = 'Window'
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      ImageIndex = 4
    end
    object WindowTileVertical: TWindowTileVertical
      Category = 'Window'
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      ImageIndex = 5
    end
    object WindowMinimizeAll: TWindowMinimizeAll
      Category = 'Window'
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Enabled = False
      Hint = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
    end
    object WindowArrange: TWindowArrange
      Category = 'Window'
      Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1089#1074#1105#1088#1085#1091#1090#1099#1077
      Enabled = False
      Hint = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1089#1074#1105#1088#1085#1091#1090#1099#1077' '#1086#1082#1085#1072
    end
    object WindowClose: TWindowClose
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Enabled = False
      Hint = #1047#1072#1082#1088#1099#1090#1100
    end
    object WindowCloseAll: TWindowAction
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
      Enabled = False
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077
      OnExecute = WindowCloseAllExecute
    end
  end
  object cxIL_1: TcxImageList
    SourceDPI = 96
    FormatVersion = 1
    DesignInfo = 2097248
    ImageInfo = <
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          00020000000A0000000F00000011000000110000001200000012000000130000
          00130000001300000014000000130000000D0000000300000000000000000000
          0009624338C1B37A66FFB27A65FFB27965FFB27763FFB17864FFB17864FFB176
          64FFB17662FFB07563FFB07563FF604137C50000000C00000000000000000000
          000DB57C6AFFFDFBF9FFFBF6F2FFFBF5F2FFFAF5F1FFFBF4EFFFF9F3EEFFF9F2
          EEFFFAF2ECFFF8F0EBFFF9F0EAFFB17765FF0000001200000000000000000000
          000DB7816CFFFDFBFAFFF7EEE7FFF8EDE7FFF7EDE7FFF7EDE6FFF6ECE5FFF6EC
          E5FFF8EBE4FFF6EBE4FFF9F1ECFFB37967FF0000001300000000000000000000
          000DB98471FFFDFCFBFFF8EFE8FFF7EEE8FFF7EEE8FFF8EEE7FFF7EEE7FFF7EC
          E6FFF7ECE5FFF6ECE5FFFAF2EEFFB57C6AFF0000001200000000000000000000
          000CBB8774FFFEFCFBFFF9F0EAFFF8F0EAFFF8EFE9FFF8EFE8FFF8EEE9FFF8EE
          E7FFF8EEE7FFF8EDE7FFFAF4EFFFB7816DFF0000001100000000000000000000
          000BBE8A78FFFEFDFCFFF9F2EDFFF9F2EDFFF9F0EBFFF9F0EAFFF8F0EAFFF8F0
          E9FFF8EFE9FFF8EFE8FFFAF5F1FFBA8570FF0000001000000000000000000000
          000AC08F7DFFFEFDFDFFFAF3EFFFFAF4EEFFFAF3EEFFFAF1ECFFF9F1EBFFF9F0
          EBFFF9F1EBFFF8F0EAFFFBF6F3FFBB8974FF0000000F00000000000000000000
          0009C49380FFFEFEFDFFFBF5F1FFFBF5F0FFFBF4F0FFFAF3EFFFFAF3EFFFF9F3
          EDFFF9F2EDFFF9F1EBFFFCF7F4FFBE8B78FF0000000F00000000000000000000
          0009C69686FFFEFEFDFFFAF5F3FFFBF6F2FFFBF5F1FFFBF5F0FFFBF5F0FFFAF4
          EFFFFAF4EEFFFAF3EFFFFDF9F7FFC18E7CFF0000000E00000000000000000000
          0008C99B8AFFFEFEFEFFFBF6F4FFFBF6F4FFFCF6F3FFFCF6F3FFFCF4F2FFFBF5
          F1FFFBF5F0FFFAF5F0FFFDFAF8FFC39382FF0000000D00000000000000000000
          0007C99E8DFFFFFEFEFFFCF8F6FFFCF7F5FFFCF7F5FFFBF6F4FFFBF6F4FFFCF6
          F3FFFCF6F2FFFBF6F1FFFDFBF9FFC69786FF0000000C00000000000000000000
          0006CEA190FFFFFFFEFFFDF9F7FFFDF9F7FFFCF8F7FFFCF8F6FFFCF7F5FFFBF7
          F5FFFBF7F4FFFCF7F3FFFDFCFAFFC89B8AFF0000000B00000000000000000000
          0006CEA393FFFFFFFFFFFDFAF9FFFDFAF8FFFDFAF8FFFDF9F7FFFCF8F7FFFBF8
          F6FFFBF7F6FFFCF7F5FFFEFCFCFFCB9D8DFF0000000B00000000000000000000
          0005D0A696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFEFEFFFEFEFEFFFFFE
          FEFFFEFEFEFFFEFEFEFFFEFEFDFFCDA191FF0000000900000000000000000000
          0003755D54C0D2A898FFD1A897FFD1A897FFD1A797FFD0A696FFD0A696FFD0A6
          95FFD0A595FFCFA595FFCFA494FF735B53C20000000600000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000090000
          000E000000100000001000000010000000100000001000000011000000110000
          001100000011000000100000000B000000030000000000000000133460CA2359
          A5FF245BA7FF245AA7FF2359A6FF2358A6FF2257A5FF2257A4FF2255A4FF2155
          A4FF2154A3FF2053A3FF2052A1FF183E7BE30001022900000002245CA5FF306A
          AEFF6CA6D5FF86CAF0FF45A6E4FF43A3E4FF40A1E3FF3EA0E2FF3B9EE2FF3A9C
          E1FF379BE0FF359AE0FF3398DFFF2B76C1FF0815298B000000082A67AEFF4884
          BEFF4A8BC5FFB2E3F8FF67BBECFF54B0E8FF51AEE8FF4DACE7FF4BA9E6FF48A8
          E5FF46A6E4FF43A4E4FF40A2E3FF3992D6FF173B6FD50000000D2E6EB4FF6BA7
          D2FF3E87C4FFAED9F0FF9AD8F5FF65BDEEFF62BBEDFF5FB9EBFF5CB6EBFF5AB5
          EAFF56B2EAFF54B0E9FF50AEE7FF4EABE7FF2C68B1FF0002032F3175B9FF8FC7
          E6FF4F9FD4FF86BCE0FFC5EFFCFF77CAF2FF73C8F1FF71C5F0FF6EC4F0FF6CC2
          EFFF68C0EEFF65BDEEFF62BBEDFF5FB9EBFF438BC9FF09162681347BBCFFAFE3
          F5FF74C8EDFF58A2D4FFDDF7FDFFDFF8FEFFDDF7FEFFDBF7FEFFD8F5FEFFD4F4
          FDFFD0F2FDFFCCEFFCFFC7EDFBFFC1EBFBFF9ACBE9FF1A406BCB3782C1FFC7F5
          FEFF97E5FCFF63BAE5FF4C9FD3FF4C9DD2FF4A9BD1FF4999CFFF4898CFFF4796
          CEFF4594CCFF4492CBFF2F72B7FF2F71B6FF2E70B5FF265C96EA3988C5FFCDF7
          FEFFA6ECFEFF9CE8FDFF93E4FBFF8EE1FBFF89DFFBFF86DEFAFF81DAFAFF7DD8
          F9FF7AD7F9FF78D6F9FF296AB0FF000000140000000A000000073C8EC8FFD0F8
          FEFFAEF0FEFFAAEEFEFFA6EDFEFFA5EBFDFFBBF2FDFFD4F9FEFFD5F9FEFFD3F8
          FEFFD1F8FEFFCEF7FDFF3580BFFF0000000800000000000000003E92CBFFD3F9
          FEFFB6F3FEFFB3F1FDFFB0F1FEFFB8EDFAFF4795CBFF3A8CC6FF3A8AC6FF3989
          C5FF3988C5FF3987C3FF1F4B6EC20000000500000000000000004097CEFFE2FC
          FEFFE2FCFEFFE1FCFEFFD4F3FAFF3F84B1EC0001011B00000006000000060000
          0006000000060000000600000004000000010000000000000000245573BF419A
          D0FF4199D0FF4199D0FF4197CFFF071117590000000200000000000000000000
          0000000000000000000000000000000000000000000000000000000000020000
          0003000000030000000400000003000000020000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000030000
          000B000000120000001300000013000000140000001400000014000000140000
          0014000000140000001500000015000000140000000D000000030000000B150C
          52C3251696FF261596FF251595FF251494FF241494FF241494FF231294FF2311
          93FF231192FF221192FF221092FF221091FF130950C50000000C0000000F2A1B
          9BFF3749D3FF2536CEFF2F41D2FF4153D9FF3545D4FF2336CCFF2333CCFF3343
          D3FF3B4DD6FF2939CEFF1F2EC9FF1D2BC9FF241495FF000000120000000F3020
          A0FF4255D7FF364AD5FF3E4ACBFF2726ABFF353BBEFF3D4ED6FF3C4DD5FF3439
          BEFF2726ABFF3A44C9FF2E40D0FF2231CCFF281999FF000000120000000E3428
          A5FF4D61DBFF434ECCFF5F5CBDFFEDEDF8FF8B89CEFF373BBCFF373BBBFF8B89
          CEFFEDEDF8FF5E5CBDFF3C46C9FF2839CEFF2C1E9EFF000000110000000D382E
          ABFF586EDFFF2621A5FFECE7ECFFF5EBE4FFF8F2EEFF9491D1FF9491D1FFF8F1
          EDFFF3E9E2FFECE6EBFF2620A5FF2E41D1FF3225A3FF0000000F0000000C3F35
          B1FF6479E2FF3034B7FF806FADFFEBDBD3FFF4EAE4FFF7F2EDFFF8F1EDFFF4E9
          E2FFEADAD1FF7E6EACFF2D30B6FF3448D5FF362BA9FF0000000E0000000B443C
          B6FF6D83E5FF475DDCFF383AB7FF8A7EB9FFF6ECE7FFF5ECE6FFF4EBE5FFF6EB
          E5FF897CB8FF3638B6FF3F53D9FF3C50D7FF3B32AFFF0000000D0000000A4943
          BCFF778FE8FF5F76E3FF4A4ABBFF9189C7FFF7EFE9FFF6EEE9FFF6EFE8FFF7ED
          E8FF9087C5FF4848BAFF586EDFFF4258DAFF4139B4FF0000000C000000094F4B
          C2FF92A7EEFF5554BCFF8F89CAFFFBF6F4FFF7F1ECFFEDE1D9FFEDE0D9FFF7F0
          EAFFFAF5F2FF8F89CAFF5352BCFF6177E2FF4842B9FF0000000B000000086A69
          D0FFADC1F4FF291D9BFFE5DADEFFF6EEEBFFEDDFDAFF816DA9FF816DA9FFEDDF
          D8FFF4ECE7FFE5D9DCFF291C9BFF8B9EEBFF6462C9FF0000000A000000077476
          D6FFB1C6F5FF6D76D1FF5646A1FFCCB6BCFF7967A8FF4D4BB7FF4E4DB8FF7967
          A8FFCBB5BCFF5645A1FF6A74D0FF8EA1ECFF6F6DD0FF0000000900000006787A
          DAFFB5CAF6FF93A7EEFF6F78D2FF2D219BFF5352BBFF93A7EEFF93A7EEFF5454
          BCFF2D209BFF6E76D1FF91A4EDFF90A3EDFF7374D4FF00000008000000057C80
          DEFFB9CDF6FFB9CDF6FFB9CCF6FFB9CCF6FFB9CDF6FFB8CCF6FFB8CCF6FFB7CC
          F6FFB7CBF6FFB6CBF6FFB5C9F6FFB5C9F6FF7779D8FF00000006000000034849
          7DC08184E1FF8183E0FF8083E0FF7E83DFFF7E83DFFF7E82DFFF7D81DFFF7D81
          DEFF7C81DEFF7C80DEFF7C7EDEFF7B7EDDFF45467BC100000004000000000000
          0002000000030000000400000004000000040000000400000004000000040000
          0004000000040000000400000005000000050000000300000001}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000}
      end
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000008000000080000000800000008000
          0000800000008000000080000000800000008000000080000000000000000000
          00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
          00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
          00000000000000000000000000000000000080000000FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000000000000000
          0000000000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000008000000080000000000000000000
          00000000000080000000FFFFFF00FFFFFF008000000080000000800000008000
          000080000000800000008000000080000000FFFFFF0080000000000000000000
          00000000000080000000FFFFFF00FFFFFF008000000080000000800000008000
          0000800000008000000080000000800000008000000080000000000000000000
          00000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF0080000000000000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000000000000000000000000000000000008000
          0000FFFFFF008000000080000000800000008000000080000000800000008000
          000080000000FFFFFF0080000000000000000000000000000000000000008000
          0000FFFFFF008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000000000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00800000000000000000000000000000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000000000000000000000000000000000000000000000000000008000
          000080000000800000008000000080000000800000008000000080000000FFFF
          FF00800000000000000000000000000000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FC000000FC000000FC000000FC000000E0000000E0000000E0000000E007
          0000800700008007000080070000801F0000801F0000801F0000801F0000FFFF
          0000}
      end
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          00008000000080000000FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          00008000000080000000FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF00008003000080030000800300008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000FFFF0000FFFF
          0000}
      end
      item
        ImageClass = 'TBitmap'
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000008000
          000080000000800000008000000080000000FFFFFF0080000000800000008000
          00008000000080000000FFFFFF00800000000000000000000000000000008000
          0000800000008000000080000000800000008000000080000000800000008000
          0000800000008000000080000000800000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        Mask.Data = {
          7E000000424D7E000000000000003E0000002800000010000000100000000100
          010000000000400000000000000000000000020000000000000000000000FFFF
          FF00FFFF00008003000080030000800300008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000FFFF0000FFFF
          0000}
      end>
  end
  object MM_Main: TMainMenu
    Left = 136
    Top = 32
    object N1: TMenuItem
      Caption = #1044#1072#1085#1085#1099#1077
      object N4: TMenuItem
        Action = Act_New
      end
      object N6: TMenuItem
        Action = Act_Open
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Action = Act_Close
      end
    end
    object N8: TMenuItem
      Caption = #1054#1082#1085#1072
      object N13: TMenuItem
        Action = WindowCascade
      end
      object N12: TMenuItem
        Action = WindowTileHorizontal
      end
      object N11: TMenuItem
        Action = WindowTileVertical
      end
      object N10: TMenuItem
        Action = WindowMinimizeAll
      end
      object N9: TMenuItem
        Action = WindowArrange
      end
      object N14: TMenuItem
        Action = WindowCloseAll
      end
    end
    object N3: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N2: TMenuItem
        Action = Act_About
      end
    end
  end
  object dxBrMr_Menu: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = cxIL_1
    ImageOptions.StretchGlyphs = False
    LookAndFeel.NativeStyle = False
    LookAndFeel.ScrollbarMode = sbmDefault
    MenusShowRecentItemsFirst = False
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 176
    Top = 32
    PixelsPerInch = 96
    DockControlHeights = (
      0
      0
      22
      0)
    object dxBar_Main: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      BorderStyle = bbsNone
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 610
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarBtn_New'
        end
        item
          Visible = True
          ItemName = 'dxBarBtn_Open'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarBtn_Close'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarBtn_New: TdxBarButton
      Action = Act_New
      Category = 0
    end
    object dxBarBtn_Open: TdxBarButton
      Action = Act_Open
      Category = 0
    end
    object dxBarBtn_Close: TdxBarButton
      Action = Act_Close
      Category = 0
    end
  end
end
