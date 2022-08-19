object DM_Principal: TDM_Principal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object CONGERAL: TFDConnection
    ConnectionName = 'C:\SQLLite3\sqlitestudio-3.3.3\SQLiteStudio\TesteFortes'
    Params.Strings = (
      'DriverID=SQLite'
      'Database=C:\SQLLite3\sqlitestudio-3.3.3\SQLiteStudio\TesteFortes')
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = []
    UpdateOptions.AssignedValues = [uvUpdateMode, uvLockMode, uvLockWait, uvAutoCommitUpdates]
    UpdateOptions.UpdateMode = upWhereAll
    UpdateOptions.LockMode = lmOptimistic
    UpdateOptions.LockWait = True
    UpdateOptions.AutoCommitUpdates = True
    Left = 87
    Top = 40
  end
end
