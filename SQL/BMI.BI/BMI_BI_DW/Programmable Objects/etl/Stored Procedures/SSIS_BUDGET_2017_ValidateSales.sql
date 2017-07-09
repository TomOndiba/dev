IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_ValidateSales]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_ValidateSales];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [etl].[SSIS_BUDGET_2017_ValidateSales]
(
  @ShowResults bit = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_ValidateSales
DESCRIPTION:		Includes all validation checks for Budget Sales by Region and Month (will throw an exception on any failure)
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
	declare	@_RowCount int = 0;
	declare	@_Error int = 0;
	declare @_ReturnValue int
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_Step varchar(128);
	declare	@_Now datetime = getdate();

	begin try
		set @_Step = 'Check that Sales by Region and Month are correct'

		;with salesToCheckCte
		as
		(
			select
				  NativeRegionName
				, NativeMonthCode
				-------------------------------------------------------------------------------
				, sum(coalesce(InstallationServices_10000, 0))
					+ sum(coalesce(ProducedGoods_10100, 0))
					+ sum(coalesce(GroupGoods_10200, 0))
					+ sum(coalesce(CommercialGoods_10300, 0))
					+ sum(coalesce(ExternalSales_11890, 0))
					+ sum(coalesce(IC_Transf_SBU_11000, 0))
					+ sum(coalesce(IC_Transf_Region_11100, 0))
					+ sum(coalesce(IC_Transf_Abroad_11200, 0))
					+ sum(coalesce(IC_Transf_US_11300, 0))
					+ sum(coalesce(Total_IC_Sales, 0))
					+ sum(coalesce(TotalSalesAndTransfers_11990, 0)) as [SalesTotal]
				-------------------------------------------------------------------------------
				, sum(coalesce(InstallationServices_10000, 0.0)) as [InstallationServices_10000]
				, sum(coalesce(ProducedGoods_10100, 0.0)) as [ProducedGoods_10100]
				, sum(coalesce(GroupGoods_10200, 0.0)) as [GroupGoods_10200]
				, sum(coalesce(CommercialGoods_10300, 0.0)) as [CommercialGoods_10300]
				, sum(coalesce(ExternalSales_11890, 0.0)) as [ExternalSales_11890]
				, sum(coalesce(IC_Transf_SBU_11000, 0.0)) as [IC_Transf_SBU_11000]
				, sum(coalesce(IC_Transf_Region_11100, 0.0)) as [IC_Transf_Region_11100]
				, sum(coalesce(IC_Transf_Abroad_11200, 0.0)) as [IC_Transf_Abroad_11200]
				, sum(coalesce(IC_Transf_US_11300, 0.0)) as [IC_Transf_US_11300]
				, sum(coalesce(Total_IC_Sales, 0.0)) as [Total_IC_Sales]
				, sum(coalesce(TotalSalesAndTransfers_11990, 0.0)) as [TotalSalesAndTransfers_11990]
			from
				stg.SSIS_STG_BUDGET_2017_Sales
			group by
				  NativeRegionName
				, NativeMonthCode
		)
		, resultCte as
		(
			select
				  ctrl.RegionName
				, ctrl.MonthCode
				-------------------------------------------------------------------------------
				, coalesce(ctrl.InstallationServices_10000, 0)
					+ coalesce(ctrl.ProducedGoods_10100, 0)
					+ coalesce(ctrl.GroupGoods_10200, 0)
					+ coalesce(ctrl.CommercialGoods_10300, 0)
					+ coalesce(ctrl.ExternalSales_11890, 0)
					+ coalesce(ctrl.IC_Transf_SBU_11000, 0)
					+ coalesce(ctrl.IC_Transf_Region_11100, 0)
					+ coalesce(ctrl.IC_Transf_Abroad_11200, 0)
					+ coalesce(ctrl.IC_Transf_US_11300, 0)
					+ coalesce(ctrl.Total_IC_Sales, 0)
					+ coalesce(ctrl.TotalSalesAndTransfers_11990, 0) as [ControlTotal]
				-------------------------------------------------------------------------------
				, s.SalesTotal
				, ctrl.InstallationServices_10000 as [CTRL_InstallationServices]
				, s.InstallationServices_10000 as [SALES_InstallationServices]
				, ctrl.ProducedGoods_10100 as [CTRL_ProducedGoods]
				, s.ProducedGoods_10100 as [SALES_ProducedGoods]
				, ctrl.GroupGoods_10200 as [CTRL_GroupGoods]
				, s.GroupGoods_10200 as [SALES_GroupGoods]
				, ctrl.CommercialGoods_10300 as [CTRL_CommercialGoods]
				, s.CommercialGoods_10300 as [SALES_CommercialGoods]
				, ctrl.ExternalSales_11890 as [CTRL_ExternalSales]
				, s.ExternalSales_11890 as [SALES_ExternalSales]
				, ctrl.IC_Transf_SBU_11000 as [CTRL_IC_Transf_SBU]
				, s.IC_Transf_SBU_11000 as [SALES_IC_Transf_SBU]
				, ctrl.IC_Transf_Region_11100 as [CTRL_IC_Transf_Region]
				, s.IC_Transf_Region_11100 as [SALES_IC_Transf_Region]
				, ctrl.IC_Transf_Abroad_11200 as [CTRL_IC_Transf_Abroad]
				, s.IC_Transf_Abroad_11200 as [SALES_IC_Transf_Abroad]
				, ctrl.IC_Transf_US_11300 as [CTRL_IC_Transf_US]
				, s.IC_Transf_US_11300 as [SALES_IC_Transf_US]
				, ctrl.Total_IC_Sales as [CTRL_Total_IC_Sales]
				, s.Total_IC_Sales as [SALES_Total_IC_Sales]
				, ctrl.TotalSalesAndTransfers_11990 as [CTRL_TotalSalesAndTransfers]
				, s.TotalSalesAndTransfers_11990 as [SALES_TotalSalesAndTransfers]
			from
				stg.SSIS_STG_BUDGET_2017_SalesCheck as ctrl
			full outer join salesToCheckCte as s
				on s.NativeRegionName = ctrl.RegionName
				and s.NativeMonthCode = ctrl.MonthCode
			where
				ctrl.RegionName not in ('ELIM Icopal/GAF Europe division', 'Icopal/GAF Europe division')
		)
		select
			  RegionName
			, MonthCode
			, round(ControlTotal * 1000, 4) as [ControlTotal]
			, round(SalesTotal * 1000, 4) as [SalesTotal]
			, CTRL_InstallationServices
			, SALES_InstallationServices
			, CTRL_ProducedGoods
			, SALES_ProducedGoods
			, CTRL_GroupGoods
			, SALES_GroupGoods
			, CTRL_CommercialGoods
			, SALES_CommercialGoods
			, CTRL_ExternalSales
			, SALES_ExternalSales
			, CTRL_IC_Transf_SBU
			, SALES_IC_Transf_SBU
			, CTRL_IC_Transf_Region
			, SALES_IC_Transf_Region
			, CTRL_IC_Transf_Abroad
			, SALES_IC_Transf_Abroad
			, CTRL_IC_Transf_US
			, SALES_IC_Transf_US
			, CTRL_Total_IC_Sales
			, SALES_Total_IC_Sales
			, CTRL_TotalSalesAndTransfers
			, SALES_TotalSalesAndTransfers
		into #tmp
		from
			resultCte
		where
			round(coalesce(ControlTotal * 1000, -9999.9999), 4) <> round(coalesce(SalesTotal * 1000, -9999.9999), 4) -- 0

		set @_RowCount = @@rowcount ;

		if @ShowResults = 1
			select * from #tmp ;

		if @_RowCount > 0
			raiserror('Found %i records with total sales value mismatch', 16, 0, @_RowCount) ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to validate Sales by Region and Month'
			+ coalesce('[' + @_Step + ']', 'NULL');

		--! If we have an uncommittable external transaction (see BOL), or a deadlock
		--! we can't do anything else until we roll that back. Alternatively, if we
		--! started the transaction we should roll it back
		if (xact_state() = -1) or (xact_state() = 1 and error_number() = 1205)
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
EXEC sp_addextendedproperty N'MS_Description', 'Includes all validation checks for Budget Sales by Region and Month (will throw an exception on any failure)', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_ValidateSales', NULL, NULL
GO
