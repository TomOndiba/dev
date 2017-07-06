create procedure [etl].[PrepareStagingData]
(
  @LoadStart datetime = null
, @DebugLevel tinyint = 0
)
as
--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		etl.PrepareStagingData
DESCRIPTION:		Executes a series of private worker procedures to prepare all staging data prior to ETL extract
					into interim data warehouse
ORIGIN DATE:		09-JUN-2017
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
001		09-JUN-2017		GML		N/A		Created
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
			+ char(10) + '    @LoadStart       : ' + coalesce(convert(varchar(24), @LoadStart, 120), '')
			+ char(10) + '    @DebugLevel      : ' + coalesce(cast(@DebugLevel as varchar(16)), 'NULL')
			+ char(10)
	set @_ProgressLog = @_ProgressMessage;

	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
	/**/ if @DebugLevel > 4
	/**/     begin
	/**/         raiserror('', 0, 1) with nowait;
	/**/         raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
	/**/     end
	/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


	begin try
		--! If Load Start time hasn't been passed in then set it now
		set @LoadStart = coalesce(@LoadStart, getdate())

		--!
		--!
		--!
		set @_Step = '1. Rebuild Product Category Hierarchy (Map)';
		set @_StepStartTime = getdate();

		exec privy.ProductCategoryHierarchyRebuild @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--!
		--!
		set @_Step = '2. Rebuild Product Category Hierarchy (Flat)';
		set @_StepStartTime = getdate();

		exec privy.ProductCategoryRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '3. Rebuild Customer Category Hierarchy';
		set @_StepStartTime = getdate();

		exec privy.CustomerCategoryHierarchyRebuild @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '4. Refresh Product (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.ProductRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '5. Refresh Customer (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.CustomerRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '6. Refresh BusinessUnit (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.BusinessUnitRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '7. Refresh Site (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.SiteRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/


		--!
		--!
		--!
		set @_Step = '8. Refresh Payment Term (Dimension)';
		set @_StepStartTime = getdate();

		exec privy.PaymentTermRefresh @LoadStart = @LoadStart, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--!
		--!
		set @_Step = '9. Refresh Invoice (Fact)';
		set @_StepStartTime = getdate();

		exec privy.InvoiceRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--!
		--!
		set @_Step = '10. Refresh OrderShippedNotInvoiced (Fact)';
		set @_StepStartTime = getdate();

		exec privy.OrderShippedNotInvoicedRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

		set @_ProgressMessage = 'Step: "' +  @_Step + '" processed ' + coalesce(cast(@_RowCount as varchar(16)), 'NULL') + ' row(s)'
				+ ' in ' + log4.FormatElapsedTime(@_StepStartTime, null, 3)
		set @_ProgressLog += coalesce(char(10) + @_ProgressMessage, '');

		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/
		/**/ if @DebugLevel > 4 raiserror('DEBUG - %s: %s', 0, 1, @_FunctionName, @_ProgressMessage) with nowait;
		/*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

		--!
		--!
		--!
		set @_Step = '11. Refresh OrderBacklog (Fact)';
		set @_StepStartTime = getdate();

		exec privy.OrderBacklogRefresh @LoadStart = @LoadStart, @DebugLevel = @DebugLevel, @RowsAffected = @_RowCount out ;

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
--		set @_Message = 'Completed all active staging data preparation steps (some steps were disabled)'
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
, N'Executes a series of private worker procedures to prepare all staging data prior to ETL extract into interim data warehouse'
, 'SCHEMA', N'etl', 'PROCEDURE', N'PrepareStagingData', NULL, NULL
go

