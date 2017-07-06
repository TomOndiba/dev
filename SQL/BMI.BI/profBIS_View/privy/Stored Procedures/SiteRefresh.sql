create procedure [privy].[SiteRefresh]
(
  @LoadStart datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.SiteRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		12-JUN-2017
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
001		12-JUN-2017		GML		N/A		Created
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
		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert Main'

		;with sourceCte
		as
		(
			select
				  cast(si.SITE_ID as nvarchar(50))			as [NativeSiteKey]
				, coalesce(si.NAME, '')						as [SiteName]
				, coalesce(si.SITE_DESCRIPTION, '')			as [SiteDescription]
				, coalesce(si.SBU, '')						as [StrategicBusinessUnitCode]
				, coalesce(u.SALESCENTER_SBU, '')			as [SalesCenterSbuCode]
				, coalesce(u.SBU_NAME, '')					as [BusinessUnitName]
				, u.REGION_ID								as [RegionId]
				, coalesce(r.REGION, '')					as [RegionName]
				, coalesce(r.REGION_DESCRIPTION, '')		as [RegionDescription]
				, si.SYSTEM_ID								as [SourceSystemId]
				, coalesce(sy.NAME, '')						as [SourceSystemName]
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(si.NAME, 'si.NAME')
					+ coalesce(si.SITE_DESCRIPTION, 'SITE_DESCRIPTION')
					+ coalesce(si.SBU, 'SBU')
					+ coalesce(u.SALESCENTER_SBU, 'SALESCENTER_SBU')
					+ coalesce(u.SBU_NAME, 'SBU_NAME')
					+ coalesce(cast(u.REGION_ID as nvarchar(30)), 'REGION_ID')
					+ coalesce(r.REGION, 'REGION')
					+ coalesce(r.REGION_DESCRIPTION, 'REGION_DESCRIPTION')
					+ coalesce(cast(si.SYSTEM_ID as nvarchar(30)), 'SYSTEM_ID')
					+ coalesce(sy.NAME, 'sy.NAME')), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
			from
				[$(Icopal_profBIS)].[dbo].[V_MD_SBU_SABIS] as u
			inner join [$(Icopal_profBIS)].[dbo].[MD_SITE] as si
				on u.SBU = si.SBU
			left join [$(Icopal_profBIS)].[dbo].[MD_SYSTEMID] as [sy]
				on sy.SYSTEM_ID = si.SYSTEM_ID
			left join [$(Icopal_profBIS)].[dbo].[MD_REGION] as r
				on u.REGION_ID = r.REGION_ID
		)
		merge into stg.Site as tgt
		using sourceCte as src
			on src.NativeSiteKey collate SQL_Latin1_General_CP1_CI_AS = tgt.NativeSiteKey collate SQL_Latin1_General_CP1_CI_AS
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
			, NativeSiteKey
			, SiteName
			, SiteDescription
			, StrategicBusinessUnitCode
			, SalesCenterSbuCode
			, BusinessUnitName
			, RegionId
			, RegionName
			, RegionDescription
			, SourceSystemId
			, SourceSystemName
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
			, src.NativeSiteKey
			, src.SiteName
			, src.SiteDescription
			, src.StrategicBusinessUnitCode
			, src.SalesCenterSbuCode
			, src.BusinessUnitName
			, src.RegionId
			, src.RegionName
			, src.RegionDescription
			, src.SourceSystemId
			, src.SourceSystemName
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or tgt.IsDeleted = 'Y'
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.SiteName = src.SiteName
					, tgt.SiteDescription = src.SiteDescription
					, tgt.StrategicBusinessUnitCode = src.StrategicBusinessUnitCode
					, tgt.SalesCenterSbuCode = src.SalesCenterSbuCode
					, tgt.BusinessUnitName = src.BusinessUnitName
					, tgt.RegionId = src.RegionId
					, tgt.RegionName = src.RegionName
					, tgt.RegionDescription = src.RegionDescription
					, tgt.SourceSystemId = src.SourceSystemId
					, tgt.SourceSystemName = src.SourceSystemName
		when not matched by source and tgt.SiteKey >= 100
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
		set @_ErrorContext = 'Failed to refresh Site dimension at step '
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
go
exec sp_addextendedproperty 'MS_Description'
, 'Merges any changes from the QlikView source into the staging area ready for consumption by the QV-to-IDW ETL process'
, 'SCHEMA', 'privy', 'PROCEDURE', 'SiteRefresh', null, null;
go
