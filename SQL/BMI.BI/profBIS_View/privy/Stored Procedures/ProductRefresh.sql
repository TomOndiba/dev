create procedure [privy].[ProductRefresh]
(
  @LoadStart datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.ProductRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		08-JUN-2017
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
001		08-JUN-2017		GML		N/A		Created
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
		set @_Step = 'Collect Runtime Parameters';

		declare @_UnmappedProductCategory varchar(50) = (select TEKST from [$(Icopal_profBIS)].dbo.FLEXPARAMS where PARAMTYPE = 'DWH' and PARAMNAVN = 'SA_UNMAPPED_ITEM') ;

		declare @_UnmappedProductCategoryId int ;
		if len(@_UnmappedProductCategory) > 0 and isnumeric(@_UnmappedProductCategory) = 1
			set @_UnmappedProductCategoryId = cast(@_UnmappedProductCategory as int)

		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert Main'

		;with sourceCte
		as
		(
			select
				  p.SYSTEM_ID													as [QlikViewSourceSystemId]
				, cast(p.ITEM_NO as nvarchar(50))								as [NativeProductKey]
				, p.ITEM_NO														as [ProductNumber]
				, coalesce(p.ITEM_NAME, 'NOT SPECIFIED AT SOURCE')				as [ProductName]
				, coalesce(p.ITEM_TYPE_ID, 9)									as [ProductTypeId]
				, coalesce(p.ITEM_TYPE, 'UNKNOWN')								as [ProductTypeName]
				, coalesce(p.ITEM_GNIT, '')										as [ProductGnit]
				, coalesce(p.ITEM_DESCRIPTION_1, '')							as [ProductDescription1]
				, coalesce(p.ITEM_DESCRIPTION_2, '')							as [ProductDescription2]
				, coalesce(p.ITEM_GROUP_1, '')									as [LocalProductGroup1]
				, coalesce(p.ITEM_GROUP_2, '')									as [LocalProductGroup2]
				, coalesce(p.ITEM_GROUP_3, '')									as [LocalProductGroup3]
				, coalesce(p.ITEM_GROUP_4, '')									as [LocalProductGroup4]
				, coalesce(p.ITEM_GROUP_5, '')									as [LocalProductGroup5]
				, coalesce(ic.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId)	as [NativeProductCategoryKey]
				, coalesce(pc.ProductCategoryName, 'NOT SPECIFIED AT SOURCE')	as [ProductCategoryBaseLevel]
				, coalesce(pc.Level1Id, -1)										as [ProductCategoryLevel1Id]
				, coalesce(pc.Level1Name, 'NOT SPECIFIED AT SOURCE')			as [ProductCategoryLevel1]
				, coalesce(pc.Level2Id, -1)										as [ProductCategoryLevel2Id]
				, coalesce(pc.Level2Name, 'NOT SPECIFIED AT SOURCE')			as [ProductCategoryLevel2]
				, coalesce(pc.Level3Id, -1)										as [ProductCategoryLevel3Id]
				, coalesce(pc.Level3Name, 'NOT SPECIFIED AT SOURCE')			as [ProductCategoryLevel3]
				, cast(null as int)												as [ProductCategoryLevel4Id]
				, ''															as [ProductCategoryLevel4]
				, cast(null as int)												as [ProductCategoryLevel5Id]
				, ''															as [ProductCategoryLevel5]
				, cast(null as int)												as [ProductCategoryLevel6Id]
				, ''															as [ProductCategoryLevel6]
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(p.ITEM_NAME, 'ITEM_NAME')
					+ coalesce(cast(p.ITEM_TYPE_ID as nvarchar(30)), 'ITEM_TYPE_ID')
					+ coalesce(p.ITEM_TYPE, 'ITEM_TYPE')
					+ coalesce(p.ITEM_GNIT, 'ITEM_GNIT')
					+ coalesce(p.ITEM_DESCRIPTION_1, 'ITEM_DESCRIPTION_1')
					+ coalesce(p.ITEM_DESCRIPTION_2, 'ITEM_DESCRIPTION_2')
					+ coalesce(p.ITEM_GROUP_1, 'ITEM_GROUP_1')
					+ coalesce(p.ITEM_GROUP_2, 'ITEM_GROUP_2')
					+ coalesce(p.ITEM_GROUP_3, 'ITEM_GROUP_3')
					+ coalesce(p.ITEM_GROUP_4, 'ITEM_GROUP_4')
					+ coalesce(p.ITEM_GROUP_5, 'ITEM_GROUP_5')
					+ coalesce(cast(coalesce(ic.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as nvarchar(30)), 'ITEM_CATEGORY_ID')
					+ coalesce(pc.ProductCategoryName, 'pc.ProductCategoryName')
					+ coalesce(cast(pc.Level1Id as nvarchar(30)), 'pc.Level1Id')
					+ coalesce(pc.Level1Name, 'pc.Level1Name')
					+ coalesce(cast(pc.Level2Id as nvarchar(30)), 'pc.Level2Id')
					+ coalesce(pc.Level2Name, 'pc.Level2Name')
					+ coalesce(cast(pc.Level3Id as nvarchar(30)), 'pc.Level3Id')
					+ coalesce(pc.Level3Name, 'pc.Level3Name')
					+ 'Level4Id'
					+ 'Level4Name'
					+ 'Level5Id'
					+ 'Level5Name'
					+ 'Level6Id'
					+ 'Level6Name'), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
			from
				[$(Icopal_profBIS)].[dbo].[MD_ITEMS] as p
			inner join [$(Icopal_profBIS)].[dbo].[SA_LINK_ITEM] as ic
				on ic.SYSTEM_ID = p.SYSTEM_ID
				and ic.ITEM_NO = p.ITEM_NO
			inner join stg.ProductCategory as pc
				on pc.NativeProductCategoryKey = cast(coalesce(ic.ITEM_CATEGORY_ID, @_UnmappedProductCategoryId) as nvarchar(50))
		)
		merge into stg.Product as tgt
		using sourceCte as src
			on src.QlikViewSourceSystemId = tgt.QlikViewSourceSystemId
			and src.NativeProductKey collate SQL_Latin1_General_CP1_CI_AS = tgt.NativeProductKey collate SQL_Latin1_General_CP1_CI_AS
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
			, QlikViewSourceSystemId
			, NativeProductKey
			, ProductNumber
			, ProductName
			, ProductTypeId
			, ProductTypeName
			, ProductGnit
			, ProductDescription1
			, ProductDescription2
			, LocalProductGroup1
			, LocalProductGroup2
			, LocalProductGroup3
			, LocalProductGroup4
			, LocalProductGroup5
			, NativeProductCategoryKey
			, ProductCategoryBaseLevel
			, ProductCategoryLevel1Id
			, ProductCategoryLevel1
			, ProductCategoryLevel2Id
			, ProductCategoryLevel2
			, ProductCategoryLevel3Id
			, ProductCategoryLevel3
			, ProductCategoryLevel4Id
			, ProductCategoryLevel4
			, ProductCategoryLevel5Id
			, ProductCategoryLevel5
			, ProductCategoryLevel6Id
			, ProductCategoryLevel6
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
			, src.QlikViewSourceSystemId
			, src.NativeProductKey
			, src.ProductNumber
			, src.ProductName
			, src.ProductTypeId
			, src.ProductTypeName
			, src.ProductGnit
			, src.ProductDescription1
			, src.ProductDescription2
			, src.LocalProductGroup1
			, src.LocalProductGroup2
			, src.LocalProductGroup3
			, src.LocalProductGroup4
			, src.LocalProductGroup5
			, src.NativeProductCategoryKey
			, src.ProductCategoryBaseLevel
			, src.ProductCategoryLevel1Id
			, src.ProductCategoryLevel1
			, src.ProductCategoryLevel2Id
			, src.ProductCategoryLevel2
			, src.ProductCategoryLevel3Id
			, src.ProductCategoryLevel3
			, src.ProductCategoryLevel4Id
			, src.ProductCategoryLevel4
			, src.ProductCategoryLevel5Id
			, src.ProductCategoryLevel5
			, src.ProductCategoryLevel6Id
			, src.ProductCategoryLevel6
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or tgt.IsDeleted = 'Y'
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, tgt.ProductName = src.ProductName
					, tgt.ProductTypeId = src.ProductTypeId
					, tgt.ProductTypeName = src.ProductTypeName
					, tgt.ProductGnit = src.ProductGnit
					, tgt.ProductDescription1 = src.ProductDescription1
					, tgt.ProductDescription2 = src.ProductDescription2
					, tgt.LocalProductGroup1 = src.LocalProductGroup1
					, tgt.LocalProductGroup2 = src.LocalProductGroup2
					, tgt.LocalProductGroup3 = src.LocalProductGroup3
					, tgt.LocalProductGroup4 = src.LocalProductGroup4
					, tgt.LocalProductGroup5 = src.LocalProductGroup5
					, tgt.NativeProductCategoryKey = src.NativeProductCategoryKey
					, tgt.ProductCategoryBaseLevel = src.ProductCategoryBaseLevel
					, tgt.ProductCategoryLevel1Id = src.ProductCategoryLevel1Id
					, tgt.ProductCategoryLevel1 = src.ProductCategoryLevel1
					, tgt.ProductCategoryLevel2Id = src.ProductCategoryLevel2Id
					, tgt.ProductCategoryLevel2 = src.ProductCategoryLevel2
					, tgt.ProductCategoryLevel3Id = src.ProductCategoryLevel3Id
					, tgt.ProductCategoryLevel3 = src.ProductCategoryLevel3
					, tgt.ProductCategoryLevel4Id = src.ProductCategoryLevel4Id
					, tgt.ProductCategoryLevel4 = src.ProductCategoryLevel4
					, tgt.ProductCategoryLevel5Id = src.ProductCategoryLevel5Id
					, tgt.ProductCategoryLevel5 = src.ProductCategoryLevel5
					, tgt.ProductCategoryLevel6Id = src.ProductCategoryLevel6Id
					, tgt.ProductCategoryLevel6 = src.ProductCategoryLevel6
		when not matched by source and tgt.ProductKey >= 100
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
go
exec sp_addextendedproperty 'MS_Description'
, 'Merges any changes from the QlikView source into the staging area ready for consumption by the QV-to-IDW ETL process'
, 'SCHEMA', 'privy', 'PROCEDURE', 'ProductRefresh', null, null;
go
