--!
--! BMI_BAT_MAN Database Options.sql
--!
:setvar DatabaseName "BMI_BAT_MAN_DEV"
:setvar MaxSize "100 MB"-- { 100 MB | 500 MB | 1 | 5 | 10 | 20 | 30 … 150…500 } GB
:setvar Edition "basic" --  {  'basic' | 'standard' | 'premium' | 'premiumrs'}  
:setvar ServiceObjective "basic" -- {  'basic' | 'S0' | 'S1' | 'S2' | 'S3' | 'P1' | 'P2' | 'P3' | 'P4'| 'P6' | 'P11'  | 'P15' | 'PRS1' | 'PRS2' | 'PRS4' | 'PRS6'| { ELASTIC_POOL(name = <elastic_pool_name>) } }
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
select * from sys.database_firewall_rules

exec sys.sp_set_database_firewall_rule
		@name = N'Air_St_Guest_WiFi_01'
	, @start_ip_address = '62.254.106.194'
	, @end_ip_address = '62.254.106.194'
go

exec sys.sp_set_database_firewall_rule
		@name = N'dba_temp_2018'
	, @start_ip_address = '86.162.93.212'
	, @end_ip_address = '86.162.93.212'
go

*/