--!
--! BMI_BI_DW Database Options.sql
--!
:setvar DatabaseName "BMI_BI_DW_PROD"
:setvar MaxSize "30 GB"-- { 100 MB | 500 MB | 1 | 5 | 10 | 20 | 30 … 150…500 } GB
:setvar Edition "premium" --  {  'basic' | 'standard' | 'premium' | 'premiumrs'}  
:setvar ServiceObjective "P2" -- {  'basic' | 'S0' | 'S1' | 'S2' | 'S3' | 'P1' | 'P2' | 'P3' | 'P4'| 'P6' | 'P11'  | 'P15' | 'PRS1' | 'PRS2' | 'PRS4' | 'PRS6'| { ELASTIC_POOL(name = <elastic_pool_name>) } }
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

