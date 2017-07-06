create procedure [privy].[ProductCategoryHierarchyRebuild]
(
  @LoadStart datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.ProductCategoryHierarchyRebuild
DESCRIPTION:		Truncates and reloads the privy.ProductCategoryHierarchy table (which is subsequently used to
					generate a flattened and somwhat conformed product category hierarchy in the dimProduct view
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
		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Truncate'

		truncate table stg.ProductCategoryHierarchy;

		--!
		--!
		--!
		set @_Step = 'Reload'

		;with productCategoryLink
		as
		(
				select
					  ITEM_CATEGORY_ID as [LeafId]
					, ITEM_CATEGORY_ID as [ChildId]
					, ITEM_CATEGORY_ID as [ParentId]
					, cast(0 as int) as [hNode]
				from
					[$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY
			union all
				select
					  c.LeafId
					, p.ITEM_CATEGORY_ID
					, p.ITEM_PARENT_ID
					, hNode + 1
				from
					productCategoryLink as c
				inner join [$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY as p
					on p.ITEM_CATEGORY_ID = c.ParentId
				where
						p.ITEM_CATEGORY_ID <> p.ITEM_PARENT_ID -- exclude self-references
					and p.ITEM_PARENT_ID <> c.ChildId -- exclude other other intra-node self-references
		)
		, rootsCte
		as
		(
			select
				  LeafId
				, ParentId as [RootId]
				, row_number() over(partition by LeafId order by hNode desc, ParentId asc) as [RootIdentifier]
			from
				productCategoryLink
		)
		insert stg.ProductCategoryHierarchy
		( 
		  LeafId
		, ChildId
		, ParentId
		, RootId
		, hNodeFromLeaf
		, hNodeFromRoot
		, LeafName
		, ChildName
		, ParentName
		, RootName
		, EtlCreatedOn
		)
		select
			  h.LeafId
			, h.ChildId
			, h.ParentId
			, r.RootId
			, h.hNode as [hNodeFromLeaf]
			, row_number() over(partition by h.LeafId order by h.hNode desc) - 1 as [hNodeFromRoot]
			, l.ITEM_CATEGORY_NAME as [LeafName]
			, c.ITEM_CATEGORY_NAME as [ChildName]
			, p.ITEM_CATEGORY_NAME as [ParentName]
			, u.ITEM_CATEGORY_NAME as [RootName]
			, @LoadStart
		from
			ProductCategoryLink as h
		inner join rootsCte as r
			on r.LeafId = h.LeafId
			and r.RootIdentifier = 1
		inner join [$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY as l
			on l.ITEM_CATEGORY_ID = h.LeafId
		inner join [$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY as c
			on c.ITEM_CATEGORY_ID = h.ChildId
		inner join [$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY as p
			on p.ITEM_CATEGORY_ID = h.ParentId
		inner join [$(Icopal_profBIS)].dbo.SA_ITEM_CATEGORY as u
			on u.ITEM_CATEGORY_ID = r.RootId

		set @RowsAffected = @@rowcount;

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to rebuild product category hierarchy at step '
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
, 'Truncates and reloads the privy.ProductCategoryHierarchy table (which is subsequently used to generate a flattened and somwhat conformed product category hierarchy in the prpoduct extract view'
, 'SCHEMA', 'privy', 'PROCEDURE', 'ProductCategoryHierarchyRebuild', null, null;
go

