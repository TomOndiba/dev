-- <Migration ID="5aca517d-212d-4a19-a512-50d18e21ae31" />
go
print N'Renaming [dbo].[dimDate] to Calendar'
go
exec sp_rename N'[dbo].[dimDate]', N'Calendar', N'OBJECT'
go
print N'Renaming primary key [PK_dimDate] to PK_Calendar'
go
exec sp_rename N'[dbo].[PK_dimDate]', N'PK_Calendar', N'OBJECT'
go
