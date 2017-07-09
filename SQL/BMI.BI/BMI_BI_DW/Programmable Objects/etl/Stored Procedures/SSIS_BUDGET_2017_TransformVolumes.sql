IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_TransformVolumes]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_TransformVolumes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [etl].[SSIS_BUDGET_2017_TransformVolumes]
(
  @LoadStart datetime = null
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_TransformVolumes
DESCRIPTION:		Transforms Budget Sales data in preparation for loading to the mart
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

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		--! If Load Start time hasn't been passed in then set it now
		set @LoadStart = coalesce(@LoadStart, getdate())

		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert BudgetVolumes'

		;with aggregateCte
		as
		(
			select
				  BusinessUnitKey
				, ProductCategoryKey
				, count(*) as [LineCount]
				, cast(round(sum(coalesce(Jan_YTD * 1000, 0)), 4) as decimal(28,4)) as [Jan_YTD]
				, cast(round(sum(coalesce(Feb_YTD * 1000, 0)), 4) as decimal(28,4)) as [Feb_YTD]
				, cast(round(sum(coalesce(Mar_YTD * 1000, 0)), 4) as decimal(28,4)) as [Mar_YTD]
				, cast(round(sum(coalesce(Apr_YTD * 1000, 0)), 4) as decimal(28,4)) as [Apr_YTD]
				, cast(round(sum(coalesce(May_YTD * 1000, 0)), 4) as decimal(28,4)) as [May_YTD]
				, cast(round(sum(coalesce(Jun_YTD * 1000, 0)), 4) as decimal(28,4)) as [Jun_YTD]
				, cast(round(sum(coalesce(Jul_YTD * 1000, 0)), 4) as decimal(28,4)) as [Jul_YTD]
				, cast(round(sum(coalesce(Aug_YTD * 1000, 0)), 4) as decimal(28,4)) as [Aug_YTD]
				, cast(round(sum(coalesce(Sep_YTD * 1000, 0)), 4) as decimal(28,4)) as [Sep_YTD]
				, cast(round(sum(coalesce(Oct_YTD * 1000, 0)), 4) as decimal(28,4)) as [Oct_YTD]
				, cast(round(sum(coalesce(Nov_YTD * 1000, 0)), 4) as decimal(28,4)) as [Nov_YTD]
				, cast(round(sum(coalesce(Dec_YTD * 1000, 0)), 4) as decimal(28,4)) as [Dec_YTD]
			from
				stg.SSIS_STG_BUDGET_2017_Volume
			group by
				  BusinessUnitKey
				, ProductCategoryKey
		)
		, sourceCte
		as
		(
			select
				  BusinessUnitKey
				, ProductCategoryKey
				, LineCount
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
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(cast(nullif(LineCount, 0) as nvarchar(30)), 'LineCount')
					+ coalesce(cast(nullif(Jan_YTD, 0) as nvarchar(30)), 'Jan_YTD')
					+ coalesce(cast(nullif(Feb_YTD, 0) as nvarchar(30)), 'Feb_YTD')
					+ coalesce(cast(nullif(Mar_YTD, 0) as nvarchar(30)), 'Mar_YTD')
					+ coalesce(cast(nullif(Apr_YTD, 0) as nvarchar(30)), 'Apr_YTD')
					+ coalesce(cast(nullif(May_YTD, 0) as nvarchar(30)), 'May_YTD')
					+ coalesce(cast(nullif(Jun_YTD, 0) as nvarchar(30)), 'Jun_YTD')
					+ coalesce(cast(nullif(Jul_YTD, 0) as nvarchar(30)), 'Jul_YTD')
					+ coalesce(cast(nullif(Aug_YTD, 0) as nvarchar(30)), 'Aug_YTD')
					+ coalesce(cast(nullif(Sep_YTD, 0) as nvarchar(30)), 'Sep_YTD')
					+ coalesce(cast(nullif(Oct_YTD, 0) as nvarchar(30)), 'Oct_YTD')
					+ coalesce(cast(nullif(Nov_YTD, 0) as nvarchar(30)), 'Nov_YTD')
					+ coalesce(cast(nullif(Dec_YTD, 0) as nvarchar(30)), 'Dec_YTD')), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
			from
				aggregateCte
		)
		merge into qvstg.BudgetVolumes as tgt
		using sourceCte as src
			on src.BusinessUnitKey = tgt.BusinessUnitKey
			and src.ProductCategoryKey = tgt.ProductCategoryKey
		when not matched by target
			then insert
			(  
			  EtlDeltaHash
			, EtlCreatedOn
			, EtlCreatedBy
			, EtlUpdatedOn
			, EtlUpdatedBy
			, EtlDeletedOn
			, EtlDeletedBy
			, IsDeleted
			, LineCount
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
			values
			(  
			  src.EtlDeltaHash
			, @LoadStart
			, @_FunctionName
			, @LoadStart
			, @_FunctionName
			, null -- EtlDeletedOn
			, null -- EtlDeletedBy
			, 'N' -- IsDeleted
			, src.LineCount
			, src.BusinessUnitKey
			, src.ProductCategoryKey
			, src.Jan_YTD
			, src.Feb_YTD
			, src.Mar_YTD
			, src.Apr_YTD
			, src.May_YTD
			, src.Jun_YTD
			, src.Jul_YTD
			, src.Aug_YTD
			, src.Sep_YTD
			, src.Oct_YTD
			, src.Nov_YTD
			, src.Dec_YTD
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.LineCount = src.LineCount
					, tgt.Jan_YTD = src.Jan_YTD
					, tgt.Feb_YTD = src.Feb_YTD
					, tgt.Mar_YTD = src.Mar_YTD
					, tgt.Apr_YTD = src.Apr_YTD
					, tgt.May_YTD = src.May_YTD
					, tgt.Jun_YTD = src.Jun_YTD
					, tgt.Jul_YTD = src.Jul_YTD
					, tgt.Aug_YTD = src.Aug_YTD
					, tgt.Sep_YTD = src.Sep_YTD
					, tgt.Oct_YTD = src.Oct_YTD
					, tgt.Nov_YTD = src.Nov_YTD
					, tgt.Dec_YTD = src.Dec_YTD
		when not matched by source
			then update set
					  tgt.IsDeleted = 'Y'
					, tgt.EtlDeletedOn = @LoadStart
					, tgt.EtlDeletedBy = @_FunctionName
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
		;

		set @RowsAffected = @@rowcount;

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to refresh product dimension at step '
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
EXEC sp_addextendedproperty N'MS_Description', 'Transforms Budget Sales data in preparation for loading to the mart', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_TransformVolumes', NULL, NULL
GO
