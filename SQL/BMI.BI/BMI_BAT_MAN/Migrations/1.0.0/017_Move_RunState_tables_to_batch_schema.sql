-- <Migration ID="3719c8ec-e310-46f6-a7e6-e0da328b4d9a" />
GO
print N'Dropping foreign keys from [privy].[RunState]'
go
alter table [privy].[RunState] drop constraint [FK_RunState_RunStateFlag]
go
alter schema [batch] transfer [privy].[RunState]
go
print N'Adding foreign keys to [batch].[RunState]'
go
alter table [batch].[RunState] add constraint [FK_batch_RunState_batch_RunStateFlag] foreign key ([FlagBit]) references [privy].[RunStateFlag] ([FlagBit])
go
print N'Dropping foreign keys from [batch].[RunState]'
go
alter table [batch].[RunState] drop constraint [FK_batch_RunState_batch_RunStateFlag]
go
alter schema [batch] transfer [privy].[RunStateFlag]
go
print N'Adding foreign keys to [batch].[RunState]'
go
alter table [batch].[RunState] add constraint [FK_batch_RunState_batch_RunStateFlag] foreign key ([FlagBit]) references [batch].[RunStateFlag] ([FlagBit])
go
