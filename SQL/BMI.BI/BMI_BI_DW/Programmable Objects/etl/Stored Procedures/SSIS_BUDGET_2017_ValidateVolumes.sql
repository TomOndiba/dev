IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_ValidateVolumes]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_ValidateVolumes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [etl].[SSIS_BUDGET_2017_ValidateVolumes]
(
  @ShowResults bit = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_ValidateVolumes
DESCRIPTION:		Includes all validation checks for Budget Volumes by Product Category Group (will throw an exception on any failure)
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
		set @_Step = 'Check that Volumes by Product Category Group are correct'

		;with volsToCheckCte
		as
		(
			select
				  r.RegionLookup as [RegionName]
				, pcg.ProductCategoryGroupName as [ProductGroup]
				-------------------------------------------------------------------------------
				, sum(coalesce(v.Jan_YTD, 0))
					+ sum(coalesce(v.Feb_YTD, 0))
					+ sum(coalesce(v.Mar_YTD, 0))
					+ sum(coalesce(v.Apr_YTD, 0))
					+ sum(coalesce(v.May_YTD, 0))
					+ sum(coalesce(v.Jun_YTD, 0))
					+ sum(coalesce(v.Jul_YTD, 0))
					+ sum(coalesce(v.Aug_YTD, 0))
					+ sum(coalesce(v.Sep_YTD, 0))
					+ sum(coalesce(v.Oct_YTD, 0))
					+ sum(coalesce(v.Nov_YTD, 0))
					+ sum(coalesce(v.Dec_YTD, 0)) as [TotalSum]
				-------------------------------------------------------------------------------
				, sum(coalesce(v.Jan_YTD, 0.0)) as [Jan_YTD]
				, sum(coalesce(v.Feb_YTD, 0.0)) as [Feb_YTD]
				, sum(coalesce(v.Mar_YTD, 0.0)) as [Mar_YTD]
				, sum(coalesce(v.Apr_YTD, 0.0)) as [Apr_YTD]
				, sum(coalesce(v.May_YTD, 0.0)) as [May_YTD]
				, sum(coalesce(v.Jun_YTD, 0.0)) as [Jun_YTD]
				, sum(coalesce(v.Jul_YTD, 0.0)) as [Jul_YTD]
				, sum(coalesce(v.Aug_YTD, 0.0)) as [Aug_YTD]
				, sum(coalesce(v.Sep_YTD, 0.0)) as [Sep_YTD]
				, sum(coalesce(v.Oct_YTD, 0.0)) as [Oct_YTD]
				, sum(coalesce(v.Nov_YTD, 0.0)) as [Nov_YTD]
				, sum(coalesce(v.Dec_YTD, 0.0)) as [Dec_YTD]
			from
				stg.SSIS_STG_BUDGET_2017_Volume as v
			inner join stg.SSIS_BUDGET_BusinessUnitLookup as bu
				on bu.BusinessUnitLookup = v.NativeBusinessUnit
			inner join stg.SSIS_BUDGET_RegionLookup as r
				on r.RegionCode = bu.RegionCode
			inner join stg.SSIS_BUDGET_ProductCategoryLookup as pc
				on pc.ProductCategoryName = v.NativeProductCategory
			inner join stg.SSIS_BUDGET_ProductCategoryGroupLookup as pcg
				on pcg.ProductCategoryGroupId = pc.ProductCategoryGroupId
			group by
				  r.RegionLookup
				, pcg.ProductCategoryGroupName
		)
		, resultCte
		as
		(
			select
				  ctrl.RegionName
				, ctrl.ProductGroup
				-------------------------------------------------------------------------------
				, coalesce(ctrl.Jan_YTD, 0)
					+ coalesce(ctrl.Feb_YTD, 0)
					+ coalesce(ctrl.Mar_YTD, 0)
					+ coalesce(ctrl.Apr_YTD, 0)
					+ coalesce(ctrl.May_YTD, 0)
					+ coalesce(ctrl.Jun_YTD, 0)
					+ coalesce(ctrl.Jul_YTD, 0)
					+ coalesce(ctrl.Aug_YTD, 0)
					+ coalesce(ctrl.Sep_YTD, 0)
					+ coalesce(ctrl.Oct_YTD, 0)
					+ coalesce(ctrl.Nov_YTD, 0)
					+ coalesce(ctrl.Dec_YTD, 0) as [CheckTotalSum]
				-------------------------------------------------------------------------------
				, v.TotalSum as [VolumeTotalSum]
				, ctrl.Jan_YTD as [Check_Jan]
				, v.Jan_YTD as [Volume_Jan]
				, ctrl.Feb_YTD as [Check_Feb]
				, v.Feb_YTD as [Volume_Feb]
				, ctrl.Mar_YTD as [Check_Mar]
				, v.Mar_YTD as [Volume_Mar]
				, ctrl.Apr_YTD as [Check_Apr]
				, v.Apr_YTD as [Volume_Apr]
				, ctrl.May_YTD as [Check_May]
				, v.May_YTD as [Volume_May]
				, ctrl.Jun_YTD as [Check_Jun]
				, v.Jun_YTD as [Volume_Jun]
				, ctrl.Jul_YTD as [Check_Jul]
				, v.Jul_YTD as [Volume_Jul]
				, ctrl.Aug_YTD as [Check_Aug]
				, v.Aug_YTD as [Volume_Aug]
				, ctrl.Sep_YTD as [Check_Sep]
				, v.Sep_YTD as [Volume_Sep]
				, ctrl.Oct_YTD as [Check_Oct]
				, v.Oct_YTD as [Volume_Oct]
				, ctrl.Nov_YTD as [Check_Nov]
				, v.Nov_YTD as [Volume_Nov]
				, ctrl.Dec_YTD as [Check_Dec]
				, v.Dec_YTD as [Volume_Dec]
			from
				stg.SSIS_STG_BUDGET_2017_VolumeCheck as ctrl
			full outer join volsToCheckCte as v
				on v.RegionName = ctrl.RegionName
				and v.ProductGroup = ctrl.ProductGroup
			where
					ctrl.RegionName not in ('ELIM Icopal/GAF Europe division', 'Icopal/GAF Europe division')
				and ctrl.ProductGroup not in ('Products Total', 'Total')
		)
		select
			RegionName
		  , ProductGroup
		  , round(CheckTotalSum * 1000, 2) as [CheckTotalSum]
		  , round(VolumeTotalSum * 1000, 2) as [VolumeTotalSum]
		  , Check_Jan
		  , Volume_Jan
		  , Check_Feb
		  , Volume_Feb
		  , Check_Mar
		  , Volume_Mar
		  , Check_Apr
		  , Volume_Apr
		  , Check_May
		  , Volume_May
		  , Check_Jun
		  , Volume_Jun
		  , Check_Jul
		  , Volume_Jul
		  , Check_Aug
		  , Volume_Aug
		  , Check_Sep
		  , Volume_Sep
		  , Check_Oct
		  , Volume_Oct
		  , Check_Nov
		  , Volume_Nov
		  , Check_Dec
		  , Volume_Dec
		into #tmp
		from
			resultCte
		where
			round(coalesce(CheckTotalSum * 1000, -9999.9999), 2) <> round(coalesce(VolumeTotalSum * 1000, -9999.9999), 2) -- 24

		set @_RowCount = @@rowcount ;

		if @ShowResults = 1
			select * from #tmp order by 1, 2;

		if @_RowCount > 0
			raiserror('Found %i records with total volumes value mismatch', 16, 0, @_RowCount) ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to validate Volumes by Product Category Group'
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
EXEC sp_addextendedproperty N'MS_Description', 'Includes all validation checks for Budget Volumes by Product Category Group (will throw an exception on any failure)', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_ValidateVolumes', NULL, NULL
GO
