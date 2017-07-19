IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_StageSales]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_StageSales];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [etl].[SSIS_BUDGET_2017_StageSales]
(
  @BudgetYear char(4) = '2017'
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_StageSales
DESCRIPTION:		Transforms raw, landed sales data to interim staging table ready for further processing and validation
ORIGIN DATE:		21-JUN-2017
ORIGINAL AUTHOR:	Greg M. Lucas

Returns
=======
@@Error - always zero on success

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		21-JUN-2017		GML		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_ReturnValue int
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_Step varchar(128);
	declare	@_Now datetime = getdate();

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Clear Down SSIS_STG_BUDGET_2017_Sales'

		truncate table stg.SSIS_STG_BUDGET_2017_Sales;

		set @_Step = 'Clear Down SSIS_STG_BUDGET_2017_SalesCheck'

		truncate table stg.SSIS_STG_BUDGET_2017_SalesCheck;

		--!
		--!
		--!
		set @_Step = 'Populate SSIS_STG_BUDGET_2017_Sales'

		; with dateKeyCte
		as
		(
			select
				  min(DateKey) as [DateKey]
				, FiscalPeriodCode
			from
				dbo.Calendar
			where
				cast(FiscalYear as char(4)) = @BudgetYear
			group by
				FiscalPeriodCode
		)
		insert stg.SSIS_STG_BUDGET_2017_Sales
		(   
		  NativeBusinessUnit
		, NativeMonthCode
		, NativeRegionName
		, BusinessUnitKey
		, DateKey
		, InstallationServices_10000
		, ProducedGoods_10100
		, GroupGoods_10200
		, CommercialGoods_10300
		, ExternalSales_11890
		, IC_Transf_SBU_11000
		, IC_Transf_Region_11100
		, IC_Transf_Abroad_11200
		, IC_Transf_US_11300
		, Total_IC_Sales
		, TotalSalesAndTransfers_11990
		)
		select
			  src.RowHeader as [NativeBusinessUnit]
			, src.MonthCode as [NativeMonthCode]
			, r.RegionLookup as [NativeRegionName]
			---------------------------------------------------------------------------------------------------
			, case
				when coalesce(src.RowHeader, '') = '' then -1 -- Not Specified at Source
				else coalesce(bu.BusinessUnitKey, -2) -- Lookup Not Found
			  end as [BusinessUnitKey]
			---------------------------------------------------------------------------------------------------
			, case
				when coalesce(src.MonthCode, '') = '' then -1 -- Not Specified at Source
				else coalesce(dk.DateKey, -8) -- Invalid Source Format
			  end as [DateKey]
			---------------------------------------------------------------------------------------------------
			, try_cast(replace(src.InstallationServices_10000, ',', '') as decimal(38,16)) as [InstallationServices_10000]
			, try_cast(replace(src.ProducedGoods_10100, ',', '') as decimal(38,16)) as [ProducedGoods_10100]
			, try_cast(replace(src.GroupGoods_10200, ',', '') as decimal(38,16)) as [GroupGoods_10200]
			, try_cast(replace(src.CommercialGoods_10300, ',', '') as decimal(38,16)) as [CommercialGoods_10300]
			, try_cast(replace(src.ExternalSales_11890, ',', '') as decimal(38,16)) as [ExternalSales_11890]
			, try_cast(replace(src.IC_Transf_SBU_11000, ',', '') as decimal(38,16)) as [IC_Transf_SBU_11000]
			, try_cast(replace(src.IC_Transf_Region_11100, ',', '') as decimal(38,16)) as [IC_Transf_Region_11100]
			, try_cast(replace(src.IC_Transf_Abroad_11200, ',', '') as decimal(38,16)) as [IC_Transf_Abroad_11200]
			, try_cast(replace(src.IC_Transf_US_11300, ',', '') as decimal(38,16)) as [IC_Transf_US_11300]
			, try_cast(replace(src.Total_IC_Sales, ',', '') as decimal(38,16)) as [Total_IC_Sales]
			, try_cast(replace(src.TotalSalesAndTransfers_11990, ',', '') as decimal(38,16)) as [TotalSalesAndTransfers_11990]
		from
			stg.SSIS_LAND_BUDGET_2017_Sales as src
		inner join stg.SSIS_BUDGET_BusinessUnitLookup as lubu
			on lubu.BusinessUnitLookup = src.RowHeader
		inner join stg.SSIS_BUDGET_RegionLookup as r
			on r.RegionCode = lubu.RegionCode
		left join dateKeyCte as dk
			on dk.FiscalPeriodCode = src.MonthCode
		left join qvstg.BusinessUnit as bu
			on bu.SalesCenterSbuCode = lubu.SBU
		;

		--!
		--!
		--!
		set @_Step = 'Populate SSIS_STG_BUDGET_2017_SalesCheck'

		insert stg.SSIS_STG_BUDGET_2017_SalesCheck
		(   
		  RegionName
		, MonthCode
		, InstallationServices_10000
		, ProducedGoods_10100
		, GroupGoods_10200
		, CommercialGoods_10300
		, ExternalSales_11890
		, IC_Transf_SBU_11000
		, IC_Transf_Region_11100
		, IC_Transf_Abroad_11200
		, IC_Transf_US_11300
		, Total_IC_Sales
		, TotalSalesAndTransfers_11990
		)
		select
			  src.RowHeader as [RegionName]
			, src.MonthCode as [MonthCode]
			---------------------------------------------------------------------------------------------------
			, try_cast(replace(src.InstallationServices_10000, ',', '') as decimal(38,16)) as [InstallationServices_10000]
			, try_cast(replace(src.ProducedGoods_10100, ',', '') as decimal(38,16)) as [ProducedGoods_10100]
			, try_cast(replace(src.GroupGoods_10200, ',', '') as decimal(38,16)) as [GroupGoods_10200]
			, try_cast(replace(src.CommercialGoods_10300, ',', '') as decimal(38,16)) as [CommercialGoods_10300]
			, try_cast(replace(src.ExternalSales_11890, ',', '') as decimal(38,16)) as [ExternalSales_11890]
			, try_cast(replace(src.IC_Transf_SBU_11000, ',', '') as decimal(38,16)) as [IC_Transf_SBU_11000]
			, try_cast(replace(src.IC_Transf_Region_11100, ',', '') as decimal(38,16)) as [IC_Transf_Region_11100]
			, try_cast(replace(src.IC_Transf_Abroad_11200, ',', '') as decimal(38,16)) as [IC_Transf_Abroad_11200]
			, try_cast(replace(src.IC_Transf_US_11300, ',', '') as decimal(38,16)) as [IC_Transf_US_11300]
			, try_cast(replace(src.Total_IC_Sales, ',', '') as decimal(38,16)) as [Total_IC_Sales]
			, try_cast(replace(src.TotalSalesAndTransfers_11990, ',', '') as decimal(38,16)) as [TotalSalesAndTransfers_11990]
		from
			stg.SSIS_LAND_BUDGET_2017_Sales as src
		inner join stg.SSIS_BUDGET_RegionLookup as lur
			on lur.RegionLookup = src.RowHeader
		;

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to reset Business Unit control at step '
			+ coalesce('[' + @_Step + ']', 'NULL');

		--! If we have an uncommittable external transaction (see BOL), or a deadlock
		--! we can't do anything else until we roll that back. Alternatively, if we
		--! started the transaction we should roll it back otherwise or let the caller
		--! handle its own external txn 
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205) or (xact_state() = 1 and @_TxnIsExternal = 0)
			begin
				rollback tran;
				set @_ErrorContext = @_ErrorContext + ' (Forced roll back all changes)';
			end
		
		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndProc:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end
GO
EXEC sp_addextendedproperty N'MS_Description', 'Transforms raw, landed sales data to interim staging table ready for further processing and validation', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_StageSales', NULL, NULL
GO
