IF OBJECT_ID('[etl].[SSIS_BUDGET_2017_TransformSales]') IS NOT NULL
	DROP PROCEDURE [etl].[SSIS_BUDGET_2017_TransformSales];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [etl].[SSIS_BUDGET_2017_TransformSales]
(
  @LoadStart datetime = null
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SSIS_BUDGET_2017_TransformSales
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

		set @_Step = 'Upsert BudgetSales' ;

		;with aggregateCte
		as
		(
			select
				  BusinessUnitKey
				, DateKey
				, count(*) as [LineCount]
				, cast(round(sum(coalesce(InstallationServices_10000 * 1000, 0)), 4) as decimal(28,4)) as [InstallationServices]
				, cast(round(sum(coalesce(ProducedGoods_10100 * 1000, 0)), 4) as decimal(28,4)) as [ProducedGoods]
				, cast(round(sum(coalesce(GroupGoods_10200 * 1000, 0)), 4) as decimal(28,4)) as [GroupGoods]
				, cast(round(sum(coalesce(CommercialGoods_10300 * 1000, 0)), 4) as decimal(28,4)) as [CommercialGoods]
				, cast(round(sum(coalesce(ExternalSales_11890 * 1000, 0)), 4) as decimal(28,4)) as [ExternalSales]
				, cast(round(sum(coalesce(IC_Transf_SBU_11000 * 1000, 0)), 4) as decimal(28,4)) as [IC_Transf_SBU]
				, cast(round(sum(coalesce(IC_Transf_Region_11100 * 1000, 0)), 4) as decimal(28,4)) as [IC_Transf_Region]
				, cast(round(sum(coalesce(IC_Transf_Abroad_11200 * 1000, 0)), 4) as decimal(28,4)) as [IC_Transf_Abroad]
				, cast(round(sum(coalesce(IC_Transf_US_11300 * 1000, 0)), 4) as decimal(28,4)) as [IC_Transf_US]
				, cast(round(sum(coalesce(Total_IC_Sales * 1000, 0)), 4) as decimal(28,4)) as [Total_IC_Sales]
				, cast(round(sum(coalesce(TotalSalesAndTransfers_11990 * 1000, 0)), 4) as decimal(28,4)) as [TotalSalesAndTransfers]
			from
				stg.SSIS_STG_BUDGET_2017_Sales
			group by
				  BusinessUnitKey
				, DateKey
		)
		, sourceCte
		as
		(
			select
				  BusinessUnitKey
				, DateKey
				, LineCount
                , InstallationServices
                , ProducedGoods
                , GroupGoods
                , CommercialGoods
                , ExternalSales
                , IC_Transf_SBU
                , IC_Transf_Region
                , IC_Transf_Abroad
                , IC_Transf_US
                , Total_IC_Sales
                , TotalSalesAndTransfers
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(cast(LineCount as nvarchar(30)), 'LineCount')
					+ coalesce(cast(InstallationServices as nvarchar(30)), 'ProducedGoods')
					+ coalesce(cast(ProducedGoods as nvarchar(30)), 'ProducedGoods')
					+ coalesce(cast(GroupGoods as nvarchar(30)), 'GroupGoods')
					+ coalesce(cast(CommercialGoods as nvarchar(30)), 'CommercialGoods')
					+ coalesce(cast(ExternalSales as nvarchar(30)), 'ExternalSales')
					+ coalesce(cast(IC_Transf_SBU as nvarchar(30)), 'IC_Transf_SBU')
					+ coalesce(cast(IC_Transf_Region as nvarchar(30)), 'IC_Transf_Region')
					+ coalesce(cast(IC_Transf_Abroad as nvarchar(30)), 'IC_Transf_Abroad')
					+ coalesce(cast(IC_Transf_US as nvarchar(30)), 'IC_Transf_US')
					+ coalesce(cast(Total_IC_Sales as nvarchar(30)), 'Total_IC_Sales')
					+ coalesce(cast(TotalSalesAndTransfers as nvarchar(30)), 'TotalSalesAndTransfers')), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
			from
				aggregateCte
		)
		merge into qvstg.BudgetSales as tgt
		using sourceCte as src
			on src.BusinessUnitKey = tgt.BusinessUnitKey
			and src.DateKey = tgt.BudgetMonthDateKey
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
			, BudgetMonthDateKey
			, InstallationServices
			, ProducedGoods
			, GroupGoods
			, CommercialGoods
			, ExternalSales
			, IC_Transf_SBU
			, IC_Transf_Region
			, IC_Transf_Abroad
			, IC_Transf_US
			, Total_IC_Sales
			, TotalSalesAndTransfers
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
			, src.DateKey
			, src.InstallationServices
			, src.ProducedGoods
			, src.GroupGoods
			, src.CommercialGoods
			, src.ExternalSales
			, src.IC_Transf_SBU
			, src.IC_Transf_Region
			, src.IC_Transf_Abroad
			, src.IC_Transf_US
			, src.Total_IC_Sales
			, src.TotalSalesAndTransfers
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.LineCount = src.LineCount
					, tgt.InstallationServices = src.InstallationServices
					, tgt.ProducedGoods = src.ProducedGoods
					, tgt.GroupGoods = src.GroupGoods
					, tgt.CommercialGoods = src.CommercialGoods
					, tgt.ExternalSales = src.ExternalSales
					, tgt.IC_Transf_SBU = src.IC_Transf_SBU
					, tgt.IC_Transf_Region = src.IC_Transf_Region
					, tgt.IC_Transf_Abroad = src.IC_Transf_Abroad
					, tgt.IC_Transf_US = src.IC_Transf_US
					, tgt.Total_IC_Sales = src.Total_IC_Sales
					, tgt.TotalSalesAndTransfers = src.TotalSalesAndTransfers
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
EXEC sp_addextendedproperty N'MS_Description', 'Transforms Budget Sales data in preparation for loading to the mart', 'SCHEMA', N'etl', 'PROCEDURE', N'SSIS_BUDGET_2017_TransformSales', NULL, NULL
GO
