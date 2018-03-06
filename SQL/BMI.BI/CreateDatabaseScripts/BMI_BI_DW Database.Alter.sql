--!
--! BMI_BI_DW Database Options.sql
--!
:setvar DatabaseName "BMI_BI_DW_DEV"
:setvar MaxSize "250 GB"-- { 100 MB | 500 MB | 1 | 5 | 10 | 20 | 30 … 150…500 } GB
:setvar Edition "premiumrs" -- standard {  'basic' | 'standard' | 'premium' | 'premiumrs'}  
:setvar ServiceObjective "PRS2" -- S2 {  'basic' | 'S0' | 'S1' | 'S2' | 'S3' | 'P1' | 'P2' | 'P3' | 'P4'| 'P6' | 'P11'  | 'P15' | 'PRS1' | 'PRS2' | 'PRS4' | 'PRS6'| { ELASTIC_POOL(name = <elastic_pool_name>) } }
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

alter database [$(DatabaseName)] 
--	modify name = [new_name]
modify
	(
	  maxsize = $(MaxSize)
	, edition = '$(Edition)'
	, service_objective = '$(ServiceObjective)'
	)
go

/*
select
	  @@version as [AzureVersion]
	, databasepropertyex(db_name(), 'Edition') as [AzureEdition]
	, databasepropertyex(db_name(), 'ServiceObjective') as [ServiceTier]
	, cast((try_convert(bigint, databasepropertyex(db_name(), N'MaxSizeInBytes')) / 1024) / 1024 as decimal(18,0)) as [MaxSizeMB]
	, cast(((try_convert(bigint, databasepropertyex(db_name(), N'MaxSizeInBytes')) / 1024) / 1024) / 1024.0 as decimal(18,2)) as [MaxSizeGB]
go
*/

/*
select * from sys.database_firewall_rules

exec sys.sp_set_database_firewall_rule
		@name = N'Air_St_Guest_WiFi_01'
	, @start_ip_address = '62.254.106.194'
	, @end_ip_address = '62.254.106.194'
go

exec sys.sp_set_database_firewall_rule
		@name = N'dba_temp_2018'
	, @start_ip_address = '81.129.146.215'
	, @end_ip_address = '81.129.146.215'
go

*/