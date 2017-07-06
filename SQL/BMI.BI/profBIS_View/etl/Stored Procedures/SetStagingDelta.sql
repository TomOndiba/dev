create procedure [etl].[SetStagingDelta]
(
  @LoadEnd datetime = null
, @DebugLevel tinyint = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.SetStagingDelta
DESCRIPTION:		Executes a series of private worker procedures to caputure current state (delta hash values) to
					facillitate subsequent delta loads
					into interim data warehouse
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
	declare @_JobName nvarchar(128) = 'QlikView Staging Data' ;

	set @_ProgressMessage = @_FunctionName
			+ ' starting at ' + coalesce(convert(varchar(24), @_SprocStartTime, 120), '') + ' with inputs: '
			+ char(10) + '    @LoadEnd   : ' + coalesce(convert(varchar(24), @LoadEnd, 120), '')
			+ char(10) + '    @DebugLevel      : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
			+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 5
	/**/     begin
	/**/         raiserror('', 0, 1) with nowait;
	/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
	/**/     end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


	begin try
		--! If Load Start time hasn't been passed in then set it now
		set @LoadEnd = coalesce(@LoadEnd, getdate())

		--!
		--!
		--!
		set @_Step = 'Record Product Category Deltas';
		set @_StepStartTime = getdate();

		exec privy.ProductCategoryControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Product Deltas';
		set @_StepStartTime = getdate();

		exec privy.ProductControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Customer Deltas';
		set @_StepStartTime = getdate();

		exec privy.CustomerControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Business Unit Deltas';
		set @_StepStartTime = getdate();

		exec privy.BusinessUnitControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Site Deltas';
		set @_StepStartTime = getdate();

		exec privy.SiteControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Payment Term Deltas';
		set @_StepStartTime = getdate();

		exec privy.PaymentTermControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record Invoice Deltas';
		set @_StepStartTime = getdate();

		exec privy.InvoiceControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record OrderShippedNotInvoiced Deltas';
		set @_StepStartTime = getdate();

		exec privy.OrderShippedNotInvoicedControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = 'Record OrderBacklog Deltas';
		set @_StepStartTime = getdate();

		exec privy.OrderBacklogControlReset @LoadEnd = @LoadEnd, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/





		--!
		--! By this point there should be no uncommitted transactions
		--!
		if xact_state() = -1 or xact_state() = 1 or @@trancount > 0
			raiserror('Completed running all steps but found %i uncommitted transactions (expected zero)', 16, 1, @@trancount);

		--!
		--! If we get here, every step completed successfully so report final state
		--!
		set @_Message = 'Completed all staging data preparation steps'
--		set @_Message = 'WARNING! All steps temporarily disabled to support ICS load testing'
		set @_Error = 0 ;
	end try
	begin catch
		set @_ErrorContext = 'Failed to prepare staging data at step: ' + coalesce('[' + @_Step + ']', 'NULL')

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
go
exec sp_addextendedproperty N'MS_Description'
, N'Executes a series of private worker procedures to caputure current state (delta hash values) to facillitate subsequent delta loads'
, 'SCHEMA', N'etl', 'PROCEDURE', N'SetStagingDelta', NULL, NULL
go

