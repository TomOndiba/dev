IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_StageVolumes]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_StageVolumes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [etl].[SSIS_BUDGET_2017_StageVolumes]
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_StageVolumes
DESCRIPTION:		Transforms raw, landed volumes data to interim staging table ready for further processing and validation
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

		set @_Step = 'Clear Down SSIS_STG_BUDGET_2017_Volume'

		truncate table stg.SSIS_STG_BUDGET_2017_Volume;

		set @_Step = 'Clear Down SSIS_STG_BUDGET_2017_VolumeCheck'

		truncate table stg.SSIS_STG_BUDGET_2017_VolumeCheck;

		--!
		--!
		--!
		set @_Step = 'Populate SSIS_STG_BUDGET_2017_Volume'

		insert stg.SSIS_STG_BUDGET_2017_Volume
		(
		  NativeBusinessUnit
		, NativeProductCategory
		, BusinessUnitKey
		, ProductCategoryKey
		, Jan_YTD
		, Feb_YTD
		, Mar_YTD
		, Apr_YTD
		, May_YTD
		, Jun_YTD
		, Jul_YTD
		, Aug_YTD
		, Sep_YTD
		, Oct_YTD
		, Nov_YTD
		, Dec_YTD
		)
		select
			  src.BusinessUnit as [NativeBusinessUnit]
			, src.ProductGroup as [NativeProductCategory]
			-------------------------------------------------------------------------------
			, case
				when coalesce(src.BusinessUnit, '') = '' then -1 -- Not Specified at Source
				else coalesce(bu.BusinessUnitKey, -2) -- Lookup Not Found
			  end as [BusinessUnitKey]
			-------------------------------------------------------------------------------
			, case
				when coalesce(src.ProductGroup, '') = '' then -1 -- Not Specified at Source
				else coalesce(pc.ProductCategoryKey, -2) -- Lookup Not Found
			  end as [ProductCategoryKey]
			-------------------------------------------------------------------------------
			, try_cast(replace(src.Jan_YTD, ',', '') as decimal(38,16)) as [Jan_YTD]
			, try_cast(replace(src.Feb_YTD, ',', '') as decimal(38,16)) as [Feb_YTD]
			, try_cast(replace(src.Mar_YTD, ',', '') as decimal(38,16)) as [Mar_YTD]
			, try_cast(replace(src.Apr_YTD, ',', '') as decimal(38,16)) as [Apr_YTD]
			, try_cast(replace(src.May_YTD, ',', '') as decimal(38,16)) as [May_YTD]
			, try_cast(replace(src.Jun_YTD, ',', '') as decimal(38,16)) as [Jun_YTD]
			, try_cast(replace(src.Jul_YTD, ',', '') as decimal(38,16)) as [Jul_YTD]
			, try_cast(replace(src.Aug_YTD, ',', '') as decimal(38,16)) as [Aug_YTD]
			, try_cast(replace(src.Sep_YTD, ',', '') as decimal(38,16)) as [Sep_YTD]
			, try_cast(replace(src.Oct_YTD, ',', '') as decimal(38,16)) as [Oct_YTD]
			, try_cast(replace(src.Nov_YTD, ',', '') as decimal(38,16)) as [Nov_YTD]
			, try_cast(replace(src.Dec_YTD, ',', '') as decimal(38,16)) as [Dec_YTD]
		from
			stg.SSIS_LAND_BUDGET_2017_Volume as src
		inner join stg.SSIS_BUDGET_BusinessUnitLookup as lubu
			on lubu.BusinessUnitLookup = src.BusinessUnit
		inner join stg.SSIS_BUDGET_ProductCategoryLookup as lupc
			on lupc.ProductCategoryName = src.ProductGroup
		left join qvstg.BusinessUnit as bu
			on bu.NativeBusinessUnitKey = lubu.SBU
		left join qvstg.ProductCategory as pc
			on pc.NativeProductCategoryKey = cast(coalesce(lupc.QlikViewCategoryLevel4Id, lupc.QlikViewCategoryLevel3Id) as nvarchar(50))
		;

		--!
		--!
		--!
		set @_Step = 'Populate SSIS_STG_BUDGET_2017_VolumeCheck'

		insert stg.SSIS_STG_BUDGET_2017_VolumeCheck
		(
		  RegionName
		, ProductGroup
		, Jan_YTD
		, Feb_YTD
		, Mar_YTD
		, Apr_YTD
		, May_YTD
		, Jun_YTD
		, Jul_YTD
		, Aug_YTD
		, Sep_YTD
		, Oct_YTD
		, Nov_YTD
		, Dec_YTD
		)
		select
			  src.BusinessUnit as [RegionName]
			, src.ProductGroup as [ProductGroup]
			, try_cast(replace(src.Jan_YTD, ',', '') as decimal(38,16)) as [Jan_YTD]
			, try_cast(replace(src.Feb_YTD, ',', '') as decimal(38,16)) as [Feb_YTD]
			, try_cast(replace(src.Mar_YTD, ',', '') as decimal(38,16)) as [Mar_YTD]
			, try_cast(replace(src.Apr_YTD, ',', '') as decimal(38,16)) as [Apr_YTD]
			, try_cast(replace(src.May_YTD, ',', '') as decimal(38,16)) as [May_YTD]
			, try_cast(replace(src.Jun_YTD, ',', '') as decimal(38,16)) as [Jun_YTD]
			, try_cast(replace(src.Jul_YTD, ',', '') as decimal(38,16)) as [Jul_YTD]
			, try_cast(replace(src.Aug_YTD, ',', '') as decimal(38,16)) as [Aug_YTD]
			, try_cast(replace(src.Sep_YTD, ',', '') as decimal(38,16)) as [Sep_YTD]
			, try_cast(replace(src.Oct_YTD, ',', '') as decimal(38,16)) as [Oct_YTD]
			, try_cast(replace(src.Nov_YTD, ',', '') as decimal(38,16)) as [Nov_YTD]
			, try_cast(replace(src.Dec_YTD, ',', '') as decimal(38,16)) as [Dec_YTD]
		from
			stg.SSIS_LAND_BUDGET_2017_Volume as src
		inner join stg.SSIS_BUDGET_ProductCategoryGroupLookup as lupcg
			on lupcg.ProductCategoryGroupName = src.ProductGroup
		inner join stg.SSIS_BUDGET_RegionLookup as lur
			on lur.RegionLookup = src.BusinessUnit
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
EXEC sp_addextendedproperty N'MS_Description', 'Transforms raw, landed volumes data to interim staging table ready for further processing and validation', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_StageVolumes', NULL, NULL
GO
