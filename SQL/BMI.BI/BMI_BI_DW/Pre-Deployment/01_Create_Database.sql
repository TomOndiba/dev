if (db_id(N'$(DatabaseName)') is null)
begin
	print N'Creating $(DatabaseName)...';
end
go
if (db_id(N'$(DatabaseName)') is null)
begin
	create database [$(DatabaseName)] collate Latin1_General_BIN; -- MODIFY THIS STATEMENT TO SPECIFY A COLLATION FOR YOUR DATABASE
end
go

alter database [$(DatabaseName)] set compatibility_level = 130
go

--! Default all new columns to NOT NULL
alter database [$(DatabaseName)] set ansi_null_default on 
go

--! ON: NULL = NULL will always be false
alter database [$(DatabaseName)] set ansi_nulls on 
go

--! ON: Null and non null (n)char/binary are both padded, (n)varchar trailing spaces are retained
--! OFF: Not null (n)char and binary are padded but null (n)char/binary and (n)varchar trailing spaces are trimmed 
alter database [$(DatabaseName)] set ansi_padding off 
go
alter database [$(DatabaseName)] set ansi_warnings on 
go
alter database [$(DatabaseName)] set arithabort on 
go
alter database [$(DatabaseName)] set concat_null_yields_null on 
go
alter database [$(DatabaseName)] set numeric_roundabort off 
go
alter database [$(DatabaseName)] set quoted_identifier on 
go

--!
--!
--!
alter database [$(DatabaseName)] set auto_create_statistics on 
go
alter database [$(DatabaseName)] set auto_shrink off 
go
alter database [$(DatabaseName)] set auto_update_statistics on 
go
alter database [$(DatabaseName)] set auto_update_statistics_async off 
go

--!
--!
--!
alter database [$(DatabaseName)] set cursor_close_on_commit off 
go

--!
--!
--!
alter database [$(DatabaseName)] set read_write 
go

--!
--!
--!
alter database [$(DatabaseName)] set multi_user;
go

--!
--!
--!
alter database [$(DatabaseName)] set allow_snapshot_isolation on ;
go
alter database [$(DatabaseName)] set read_committed_snapshot on ;
go

