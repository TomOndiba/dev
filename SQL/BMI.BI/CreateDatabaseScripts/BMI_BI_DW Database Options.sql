--!
--! BMI_BI_DW Database Options.sql
--!
:setvar DatabaseName "BMI_BI_DW_PROD"
:setvar MaxSize "30 GB"-- { 100 MB | 500 MB | 1 | 5 | 10 | 20 | 30 … 150…500 } GB
:setvar Edition "Standard" --  {  'basic' | 'standard' | 'premium' | 'premiumrs'}  
:setvar ServiceObjective "S2" -- {  'basic' | 'S0' | 'S1' | 'S2' | 'S3' | 'P1' | 'P2' | 'P3' | 'P4'| 'P6' | 'P11'  | 'P15' | 'PRS1' | 'PRS2' | 'PRS4' | 'PRS6'| { ELASTIC_POOL(name = <elastic_pool_name>) } }
go


/*
ALTER DATABASE { database_name }  
{  
    MODIFY NAME =new_database_name  
  | MODIFY ( <edition_options> [, ... n] )   
  | SET { <option_spec> [ ,... n ] }   
  | ADD SECONDARY ON SERVER <partner_server_name>  
      [WITH (\<add-secondary-option>::= [, ... n] ) ]  
  | REMOVE SECONDARY ON SERVER <partner_server_name>  
  | FAILOVER  
  | FORCE_FAILOVER_ALLOW_DATA_LOSS  
}  
*/

--alter database [$(DatabaseName)] 
----	modify name = [new_name]
--modify
--	(
--	  maxsize = $(MaxSize)
--	, edition = '$(Edition)'
--	, service_objective = '$(ServiceObjective)'
--	)
--go

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


--!
--!
--!
alter database [$(DatabaseName)] set temporal_history_retention on ;
go

