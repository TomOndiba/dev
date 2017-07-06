create procedure [privy].[ProductCategoryRefresh]
(
  @LoadStart datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.ProductCategoryRefresh
DESCRIPTION:		Merges any changes from the QlikView source into the staging area ready for consumption by the
					QV-to-IDW ETL process
ORIGIN DATE:		19-JUN-2017
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
001		19-JUN-2017		GML		N/A		Created
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

		; with leafNode4Cte
		as
		(
			select
				LeafId
			from
				stg.ProductCategoryHierarchy
			where
					hNodeFromLeaf = 0
				and hNodeFromRoot = (select max(hNodeFromRoot) from stg.ProductCategoryHierarchy)
		)
		, leafNode3Cte
		as
		(
			select
				LeafId
			from
				stg.ProductCategoryHierarchy
			where
					hNodeFromLeaf = 0
				and hNodeFromRoot = 2
		)
		, leafNode2Cte
		as
		(
			select
				LeafId
			from
				stg.ProductCategoryHierarchy
			where
					hNodeFromLeaf = 0
				and hNodeFromRoot = 1
		)
		, catageoriesCte
		as
		(
				select
					  x.ChildId as [ProductCategoryId]
					, x.ChildName as [ProductCategoryName]
					, cast(4 as tinyint) as [NodeDepth]
					, y.ChildId as [Level3Id]
					, y.ChildName as [Level3Name]
					, z.ChildId as [Level2Id]
					, z.ChildName as [Level2Name]
					, z.ParentId as [Level1Id]
					, z.ParentName as [Level1Name]
				from
					leafNode4Cte as leaf
				inner join stg.ProductCategoryHierarchy as x
					on x.LeafId = leaf.LeafId
					and x.hNodeFromLeaf = 1
				left join stg.ProductCategoryHierarchy as y
					on y.LeafId = leaf.LeafId
					and y.ChildId = x.ParentId
					and y.hNodeFromLeaf = x.hNodeFromLeaf + 1
				left join stg.ProductCategoryHierarchy as z
					on z.LeafId = leaf.LeafId
					and z.ChildId = y.ParentId
					and z.hNodeFromLeaf = y.hNodeFromLeaf + 1
			union all
				select 
					  x.ChildId as [ProductCategoryId]
					, x.ChildName as [ProductCategoryName]
					, cast(3 as tinyint) as [NodeDepth]
					, x.ChildId as [Level3Id]
					, x.ChildName as [Level3Name]
					, y.ChildId as [Level2Id]
					, y.ChildName as [Level2Name]
					, y.ParentId as [Level1Id]
					, y.ParentName as [Level1Name]
				from
					leafNode3Cte as leaf
				inner join stg.ProductCategoryHierarchy as x
					on x.LeafId = leaf.LeafId
					and x.hNodeFromLeaf = 1
				left join stg.ProductCategoryHierarchy as y
					on y.LeafId = leaf.LeafId
					and y.ChildId = x.ParentId
					and y.hNodeFromLeaf = x.hNodeFromLeaf + 1
			union all
				select 
					  x.ChildId as [ProductCategoryId]
					, x.ChildName as [ProductCategoryName]
					, cast(2 as tinyint) as [NodeDepth]
					, x.ChildId as [Level3Id]
					, x.ChildName as [Level3Name]
					, x.ChildId as [Level2Id]
					, x.ChildName as [Level2Name]
					, x.ParentId as [Level1Id]
					, x.ParentName as [Level1Name]
				from
					leafNode2Cte as leaf
				inner join stg.ProductCategoryHierarchy as x
					on x.LeafId = leaf.LeafId
					and x.hNodeFromLeaf = 1
			union all
				select 
					  x.ChildId as [ProductCategoryId]
					, x.ChildName as [ProductCategoryName]
					, cast(1 as tinyint) as [NodeDepth]
					, x.ChildId as [Level3Id]
					, x.ChildName as [Level3Name]
					, x.ChildId as [Level2Id]
					, x.ChildName as [Level2Name]
					, x.ChildId as [Level2Id]
					, x.ChildName as [Level2Name]
				from
					stg.ProductCategoryHierarchy as x
				where
						x.hNodeFromRoot = 0
					and x.hNodeFromLeaf = 0
		)
		, sourceCte
		as
		(
			select
				  cast(c.ProductCategoryId as nvarchar(50)) as [NativeProductCategoryKey]
				, c.ProductCategoryId
				, c.ProductCategoryName
				, c.NodeDepth
				, c.Level3Id
				, c.Level3Name
				, c.Level2Id
				, c.Level2Name
				, c.Level1Id
				, c.Level1Name
				, '' as [ProductCategoryDescription]
				---------------------------------------------------------------------------------------------------
				--! Encapsulate ALL non-key columns into a hash value to speed up CDC checks during susbseqent loads
				, convert(nvarchar(32), hashbytes('MD5'
					, coalesce(c.ProductCategoryName, 'ProductCategoryName')
					+ coalesce(cast(c.NodeDepth as nvarchar(30)), 'NodeDepth')
					+ coalesce(cast(c.Level3Id as nvarchar(30)), 'Level3Id')
					+ coalesce(c.Level3Name, 'Level3Name')
					+ coalesce(cast(c.Level2Id as nvarchar(30)), 'Level2Id')
					+ coalesce(c.Level2Name, 'Level2Name')
					+ coalesce(cast(c.Level1Id as nvarchar(30)), 'Level1Id')
					+ coalesce(c.Level1Name, 'Level1Name')
					+ 'ProductCategoryDescription'), 2) as [EtlDeltaHash]
				---------------------------------------------------------------------------------------------------
			from
				catageoriesCte as c

		)
		merge into stg.ProductCategory as tgt
		using sourceCte as src
			on src.NativeProductCategoryKey collate SQL_Latin1_General_CP1_CI_AS = tgt.NativeProductCategoryKey collate SQL_Latin1_General_CP1_CI_AS
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
			, NativeProductCategoryKey
			, ProductCategoryId
			, ProductCategoryName
			, NodeDepth
			, Level3Id
			, Level3Name
			, Level2Id
			, Level2Name
			, Level1Id
			, Level1Name
			, ProductCategoryDescription
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
			, src.NativeProductCategoryKey
			, src.ProductCategoryId
			, src.ProductCategoryName
			, src.NodeDepth
			, src.Level3Id
			, src.Level3Name
			, src.Level2Id
			, src.Level2Name
			, src.Level1Id
			, src.Level1Name
			, src.ProductCategoryDescription
			)
		when matched and tgt.EtlDeltaHash <> src.EtlDeltaHash or tgt.IsDeleted = 'Y'
			then update set
					  tgt.EtlDeltaHash = src.EtlDeltaHash
					, tgt.EtlUpdatedOn = @LoadStart
					, tgt.EtlUpdatedBy = @_FunctionName
					, tgt.IsDeleted = 'N'
					, ProductCategoryName = src.ProductCategoryName
					, NodeDepth = src.NodeDepth
					, tgt.Level3Id = src.Level3Id
					, tgt.Level3Name = src.Level3Name
					, tgt.Level2Id = src.Level2Id
					, tgt.Level2Name = src.Level2Name
					, tgt.Level1Id = src.Level1Id
					, tgt.Level1Name = src.Level1Name
					, tgt.ProductCategoryDescription = src.ProductCategoryDescription
		when not matched by source and tgt.ProductCategoryKey >= 100
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
		set @_ErrorContext = 'Failed to refresh ProductCategory dimension at step '
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
, 'SCHEMA', 'privy', 'PROCEDURE', 'ProductCategoryRefresh', null, null;
go
