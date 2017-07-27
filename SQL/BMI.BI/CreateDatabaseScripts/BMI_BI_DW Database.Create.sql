--!
--! Create Database BMI_BI_DW.sql
--!
:setvar DatabaseName "BMI_BI_DW_DEV"
:setvar MaxSize "30 GB"-- { 100 MB | 500 MB | 1 | 5 | 10 | 20 | 30 … 150…500 } GB
:setvar Edition "Standard" --  {  'basic' | 'standard' | 'premium' | 'premiumrs'}  
:setvar ServiceObjective "S2" -- {  'basic' | 'S0' | 'S1' | 'S2' | 'S3' | 'P1' | 'P2' | 'P3' | 'P4'| 'P6' | 'P11'  | 'P15' | 'PRS1' | 'PRS2' | 'PRS4' | 'PRS6'| { ELASTIC_POOL(name = <elastic_pool_name>) } }
go

--!====================================================================================================================
--!
--! CHANGE NOTHING BEYOND THIS POINT
--!
--!====================================================================================================================

set noexec off
go
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar IsSqlCmdEnabled "True"
go

if '$(IsSqlCmdEnabled)' != 'True'
    begin
		declare @i int = 0;

		while @i < 900
		begin
			set @i += 1;
			raiserror('SQLCMD mode must be enabled to successfully execute this script (%d of 300)', 10, 1, @i) with nowait;
			waitfor delay '00:00:01'
		end
		
		set noexec on;
    end
go

if exists (select * from sys.databases where name = '$(DatabaseName)')
	drop database [$(DatabaseName)]
go

create database [$(DatabaseName)] collate Latin1_General_BIN
(
  maxsize = $(MaxSize)
, edition = '$(Edition)'
, service_objective = '$(ServiceObjective)'
)
go

