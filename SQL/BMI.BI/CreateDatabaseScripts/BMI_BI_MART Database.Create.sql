--!
--! BMI_BI_MART Create Database.sql
--!
:setvar DatabaseName "BMI_BI_MART_PROD"
:setvar MaxSize "250 GB"-- { 250 | 500 | 750 | 1024 | 5120 | 10240 | 20480 | 30720 | 40960 | 51200 | 61440 | 71680 | 81920 | 92160 | 102400 | 153600 | 204800 | 245760 } GB
:setvar ServiceObjective "DW300" -- { 'DW100' | 'DW200' | 'DW300' | 'DW400' | 'DW500' | 'DW600' | 'DW1000' | 'DW1200' | 'DW1500' | 'DW2000' | 'DW3000' | 'DW6000' }
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

create database [$(DatabaseName)] collate SQL_Latin1_General_CP1_CI_AS
(
  maxsize = $(MaxSize)
, edition = 'DataWarehouse'
, service_objective = '$(ServiceObjective)'
)
go
