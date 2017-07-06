create procedure [privy].[ProductCategoryControlReset]
(
  @LoadEnd datetime
, @RowsAffected int = null out
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.ProductCategoryControlReset
DESCRIPTION:		Records new, changed and deleted Product Category records (used to identify deltas on the next load)
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
	declare	@_Now datetime = getdate();

	--! Find out if we are already in a transaction
	declare	@_TxnIsExternal bit = case when @@trancount > 0 then 1 else 0 end;

	begin try
		--! If there no outer transaction, use an explicit transaction so we can roll this piece back if required 
		if @_TxnIsExternal = 0 begin tran;

		set @_Step = 'Upsert Control'

		merge into stg.ProductCategoryControl as tgt
		using stg.ProductCategory as src
			on src.ProductCategoryKey = tgt.ProductCategoryKey
		when not matched
			then insert
			(
			  ProductCategoryKey
			, PreviousDeltaHash
			, IsDeleted
			, LastTouchedOn
			)
			values
			(
			  src.ProductCategoryKey
			, src.EtlDeltaHash
			, src.IsDeleted
			, @LoadEnd
			)
		when matched and tgt.PreviousDeltaHash <> src.EtlDeltaHash
			or tgt.IsDeleted <> src.IsDeleted
		then update set
			  tgt.PreviousDeltaHash = src.EtlDeltaHash
			, tgt.IsDeleted = src.IsDeleted
			, tgt.LastTouchedOn = @LoadEnd
		;

		set @RowsAffected = @@rowcount;

		--!
		--! Only commit transactions started within this procedure
		--!
		if @_TxnIsExternal = 0 and (xact_state() = 1 or @@trancount > 0) commit tran ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to reset Product Category control at step '
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
, 'Records new, changed and deleted Product Category records (used to identify deltas on the next load)'
, 'SCHEMA', 'privy', 'PROCEDURE', 'ProductCategoryControlReset', null, null;
go

