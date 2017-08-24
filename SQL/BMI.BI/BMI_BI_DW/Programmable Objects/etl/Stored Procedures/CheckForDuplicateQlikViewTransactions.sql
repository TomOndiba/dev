IF OBJECT_ID('[etl].[CheckForDuplicateQlikViewTransactions]') IS NOT NULL
	DROP PROCEDURE [etl].[CheckForDuplicateQlikViewTransactions];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [etl].[CheckForDuplicateQlikViewTransactions]
(
  @DebugLevel tinyint = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.CheckForDuplicateQlikViewTransactions
DESCRIPTION:		Checks qvstg.Invoice, qvstg.OrderBacklog and qvstg.OrderShippedNotInvoiced for duplicates and if
					found on any table generates an exception (which should result in a load failure)
ORIGIN DATE:		24-AUG-2017
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
001		24-AUG-2017		GML		BSR-234	Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
--</CommentHeader>

begin
	set nocount on;

	--! Journal Constants
	declare @SEVERITY_CRITICAL int = 1;
	declare @SEVERITY_SEVERE int = 2;
	declare @SEVERITY_MAJOR int = 4;
	declare @SEVERITY_MODERATE int = 8;
	declare @SEVERITY_MINOR int = 16;
	declare @SEVERITY_CONCURRENCY int = 32;
	declare @SEVERITY_INFORMATION int = 256;
	declare @SEVERITY_SUCCESS int = 512;
	declare @SEVERITY_DEBUG int = 1024;

	--! Standard/ExceptionHandler variables
	declare	@_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid));
	declare	@_Error int = 0;
	declare @_RowCount int = 0;
	declare @_ReturnValue int = 0;
	declare	@_Message nvarchar(512);
	declare	@_ErrorContext nvarchar(512);
	declare	@_SprocStartTime datetime = getdate()
	declare	@_StepStartTime datetime
	declare	@_StepEndTime datetime
	declare	@_Step varchar(128);
	declare	@_ProgressMessage varchar(2000)
	declare	@_ExceptionId int
	declare @_JournalOnOff varchar(3) = log4.GetJournalControl(@_FunctionName, null);
	declare @_Severity smallint = @SEVERITY_INFORMATION;
	declare @_ProgressLog nvarchar(max);
	declare @_RowsAffected int = 0;
	declare @_JobName nvarchar(128) = 'QlikView-to-DW Load' ;

	set @_ProgressMessage = @_FunctionName
			+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
			+ char(10) + '    @DebugLevel      : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
			+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	--! If debug level is not passed (or NULL) then no degug is required
	set @DebugLevel = isnull(@DebugLevel, 0) ;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 4
	/**/     begin
	/**/         raiserror('', 0, 1) with nowait;
	/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
	/**/     end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

	if object_id(N'tempdb..#InvoiceDupes') is not null drop table #InvoiceDupes ;
	if object_id(N'tempdb..#OrderBacklogDupes') is not null drop table #OrderBacklogDupes ;
	if object_id(N'tempdb..#OrderShippedNotInvoicedDupes') is not null drop table #OrderShippedNotInvoicedDupes ;

	declare @_InvoiceDupeCount int = 0;
	declare @_OrderBacklogDupeCount int = 0;
	declare @_OrderShippedNotInvoicedDupeCount int = 0;

	begin try
		--!
		--!
		--!
		set @_Step = 'Check for Invoice Duplicates' ;
		set @_StepStartTime = getdate() ;

		select
			  DataSourceKey
			, InvoiceNumber
			, NativeInvoiceLineNumber
			, OrderNumber
			, NativeOrderLineNumber
			, count(*) as [DupeCount]
		into
			#InvoiceDupes
		from
			qvstg.Invoice
		where
			IsDeleted = 'N'
		group by
			  DataSourceKey
			, InvoiceNumber
			, NativeInvoiceLineNumber
			, OrderNumber
			, NativeOrderLineNumber
		having
			count(*) > 1

		set @_InvoiceDupeCount = @@rowcount ;

		if @_InvoiceDupeCount > 0
			begin
				select @_RowCount = sum(DupeCount) from #InvoiceDupes ;

				set @_ProgressLog = @_ProgressLog + char(10)
					+ 'Found ' + coalesce(cast(@_InvoiceDupeCount as varchar(16)), 'NULL')
					+ ' duplicate invoice(s) affecting a total of '  + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' rows' ;
			end

		--!
		--!
		--!
		set @_Step = 'Check for Invoice Duplicates' ;
		set @_StepStartTime = getdate() ;

		select
			  DataSourceKey
			, OrderNumber
			, NativeOrderLineNumber
			, count(*) as [DupeCount]
		into
			#OrderBacklogDupes
		from
			qvstg.OrderBacklog
		where
			IsDeleted = 'N'
		group by
			  DataSourceKey
			, OrderNumber
			, NativeOrderLineNumber
		having
			count(*) > 1

		set @_OrderBacklogDupeCount = @@rowcount ;

		if @_OrderBacklogDupeCount > 0
			begin
				select @_RowCount = sum(DupeCount) from #OrderBacklogDupes ;

				set @_ProgressLog = @_ProgressLog + char(10)
					+ 'Found ' + coalesce(cast(@_OrderBacklogDupeCount as varchar(16)), 'NULL')
					+ ' duplicate backlog order(s) affecting a total of '  + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' rows' ;
			end

		--!
		--!
		--!
		set @_Step = 'Check for Invoice Duplicates' ;
		set @_StepStartTime = getdate() ;

		select
			  DataSourceKey
			, OrderNumber
			, NativeOrderLineNumber
			, NativeShippingDocumentKey
			, count(*) as [DupeCount]
		into
			#OrderShippedNotInvoicedDupes
		from
			qvstg.OrderShippedNotInvoiced
		where
			IsDeleted = 'N'
		group by
			  DataSourceKey
			, OrderNumber
			, NativeOrderLineNumber
			, NativeShippingDocumentKey
		having
			count(*) > 1

		set @_OrderShippedNotInvoicedDupeCount = @@rowcount ;

		if @_OrderShippedNotInvoicedDupeCount > 0
			begin
				select @_RowCount = sum(DupeCount) from #OrderShippedNotInvoicedDupes ;

				set @_ProgressLog = @_ProgressLog + char(10)
					+ 'Found ' + coalesce(cast(@_OrderShippedNotInvoicedDupeCount as varchar(16)), 'NULL')
					+ ' duplicate orders(s) shipped not invoiced affecting a total of '  + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' rows' ;
			end

		--!
		--!
		--!
		set @_Step = 'Validate Results' ;

		if @_InvoiceDupeCount > 0 or @_OrderBacklogDupeCount > 0 or @_OrderShippedNotInvoicedDupeCount > 0
			begin
				set @_Message = 'Check for Duplicates failed!'
					+ '  Invoice: ' + coalesce(cast(@_InvoiceDupeCount as varchar(16)), 'NULL') + ' record(s) duplicated'
					+ ';  Order Backlog: ' + coalesce(cast(@_OrderBacklogDupeCount as varchar(16)), 'NULL') + ' record(s) duplicated'
					+ ';  Order SNI: ' + coalesce(cast(@_OrderShippedNotInvoicedDupeCount as varchar(16)), 'NULL') + ' record(s) duplicated'
				
				set @_Error = 1 ;
			end
		else
			begin
				--!
				--! If we get here, every step completed successfully so report final state
				--!
				set @_Message = 'Found no active duplicate Invoices or Orders'
				set @_Error = 0 ;
			end
	end try
	begin catch
		set @_ErrorContext = 'Check for duplicate invoices and orders failed at step: ' + coalesce('[' + @_Step + ']', 'NULL')

		--! Clean up any leftover transactions
		if xact_state() = -1 or xact_state() = 1
			begin
				rollback tran;
				set @_ErrorContext = @_ErrorContext + ' (Forced roll back all changes)';
			end

		exec log4.ExceptionHandler
				  @ErrorContext   = @_ErrorContext
				, @ErrorProcedure = @_FunctionName
				, @ErrorNumber    = @_Error out
				, @ReturnMessage  = @_Message out
				, @ExceptionId    = @_ExceptionId out
		;
	end catch

--/////////////////////////////////////////////////////////////////////////////////////////////////
EndEx:
--/////////////////////////////////////////////////////////////////////////////////////////////////

	if @_Error = 0
		begin
			set @_Step = 'OnComplete'
			set @_Severity = @SEVERITY_SUCCESS
			set @_Message = case when len(@_Message) > 450 then substring(@_Message, 1, 450) + '...' else coalesce(@_Message, @_Step) end
							+ ' in a total run time of ' + log4.FormatElapsedTime(@_SprocStartTime, null, 3)
			set @_ProgressLog = @_ProgressLog + char(10) + @_Message
		end
	else
		begin
			set @_Step = coalesce(@_Step, 'OnError')
			set @_Severity = @SEVERITY_SEVERE
			set @_Message = case when len(@_Message) > 450 then substring(@_Message, 1, 450) + '...' else coalesce(@_Message, @_Step) end
							+ ' after a total run time of ' + log4.FormatElapsedTime(@_SprocStartTime, null, 3)
			set @_ProgressLog = @_ProgressLog + char(10) + @_Message
		end

	if @DebugLevel != 0 and @_Severity = @SEVERITY_INFORMATION set @_Severity = @SEVERITY_DEBUG;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 3
	/**/	begin
	/**/		raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_Message) with nowait;
	/**/		raiserror('', 0, 1) with nowait;
	/**/	end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

	if @_JournalOnOff = 'ON'
		exec log4.JournalWriter
				  @Task = @_JobName
				, @FunctionName = @_FunctionName
				, @StepInFunction = @_Step
				, @MessageText = @_Message
				, @ExtraInfo = @_ProgressLog
				, @Severity = @_Severity
				, @ExceptionId = @_ExceptionId

	--! Finally, throw an exception that will be detected by the caller
	if @_Error > 0 raiserror(@_Message, 16, 99);

	set nocount off;

	--! Return the value of @@ERROR (which will be zero on success)
	return (@_Error);
end
GO
EXEC sp_addextendedproperty N'MS_Description', N'Checks qvstg.Invoice, qvstg.OrderBacklog and qvstg.OrderShippedNotInvoiced for duplicates and if found on any table generates an exception (which should result in a load failure)', 'SCHEMA', N'etl', 'PROCEDURE', N'CheckForDuplicateQlikViewTransactions', NULL, NULL
GO
