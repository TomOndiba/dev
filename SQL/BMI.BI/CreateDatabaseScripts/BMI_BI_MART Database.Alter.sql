--!
--! BMI_BI_MART Database Options.sql
--!
:setvar DatabaseName "BMI_BI_MART_DUMMY"
:setvar MaxSize "250 GB"-- { 250 | 500 | 750 | 1024 | 5120 | 10240 | 20480 | 30720 | 40960 | 51200 | 61440 | 71680 | 81920 | 92160 | 102400 | 153600 | 204800 | 245760 } GB
:setvar ServiceObjective "DW100" -- { 'DW100' | 'DW200' | 'DW300' | 'DW400' | 'DW500' | 'DW600' | 'DW1000' | 'DW1200' | 'DW1500' | 'DW2000' | 'DW3000' | 'DW6000' }
go


alter database [$(DatabaseName)] 
--	modify name = [new_name]
modify
	(
	  maxsize = $(MaxSize)
	, service_objective = '$(ServiceObjective)'
	)
go
