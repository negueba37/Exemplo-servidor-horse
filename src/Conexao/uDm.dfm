object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 362
  Width = 606
  object memAmigos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 272
    Top = 64
    object memAmigosNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object memAmigosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 21
    end
  end
  object ConexaoFB: TFDConnection
    Params.Strings = (
      'Database=C:\Projetos\Servidor\Banco\CADASTRO.FDB'
      'User_Name=SYSDBA'
      'DriverID=FB')
    LoginPrompt = False
    Left = 24
    Top = 16
  end
  object qAmigo: TFDQuery
    Connection = ConexaoFB
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    Left = 32
    Top = 160
    object qAmigoNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qAmigoTELEFONE: TWideStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
  end
end
