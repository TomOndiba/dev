if object_id('[ics].[ProcessRunStart]') is not null
	drop procedure [ics].[ProcessRunStart];
go
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [ics].[ProcessRunStart]
(
	@ProcessName   varchar(200)
  , @IcrtProcessId int
  , @ProcessRunId  int			= null output
  , @RunType	   varchar(8)	= null output
  , @Instruction   varchar(16)	= null output
  , @Message	   varchar(500) = null output
  , @SetDate	   datetime =null
)
as
	--<CommentHeader>
	/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		ics.ProcessRunStart
DESCRIPTION:		Checks that the requested process is runnable and if so, initiates a new process run instance
					(adding a row to the table: batch.ProcessRun)
ORIGIN DATE:		24-JUL-2017
ORIGINAL AUTHOR:	Razia Nazir

Returns
=======
@@Error - always zero on success

Additional Notes


================
Stubs 

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		24-JUL-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
	--</CommentHeader>

	begin
		set nocount on ;

		--! Standard/ExceptionHandler variables
		declare @_FunctionName nvarchar(255) = quotename(object_schema_name(@@procid)) + '.' + quotename(object_name(@@procid)) ;
		declare @_Error int = 0 ;
		declare @_RowCount int = 0 ;
		declare @_ReturnValue int = 0 ;
		declare @_Message nvarchar(512) ;
		declare @_ErrorContext nvarchar(512) ;
		declare @_Step varchar(128) ;
		declare @_ExceptionId int ;
		declare @BatchProcessId int ;
		declare @_Isdisable bit=1;

		begin try
			set @_Step = 'Fetch dummy values for stub' ;
			set @SetDate=isnull(@SetDate,getdate());

			exec [batch].[ProcessGetIdFromIcrtProcessName]
				@IcrtProcessName = @ProcessName
			  , @BatchProcessName = null	---optinal if null set to @ProcessName in the sp
			  , @BatchProcessId = @BatchProcessId output ;
			  			  		  
			set @_Isdisable=(select IsDisabled from batch.Process where BatchProcessId=@BatchProcessId)
			set @_Isdisable=isnull(@_Isdisable,0);


		select @_Isdisable
			if exists
			(select	1 from [batch].[ProcessRun]	where BatchProcessId = @BatchProcessId
				and EndTime is null)
				begin
							
					declare  @_ProcessRunID int =(select	ProcessRunId from [batch].[ProcessRun]	where BatchProcessId = @BatchProcessId		and EndTime is null)
					set @ProcessRunId = NULL;
					set @Message = 'Failed to start new batch process as it is already in progress with a ProcessRunId of '	+ coalesce(cast(@_ProcessRunID as varchar(16)), '' );
					set @ProcessRunId = null ;
					set @Instruction = 'STOP' ;

					select
						@RunType = RunType
					from
						dbo.StubResultSet
					where
						FunctionName = @_FunctionName ;

					insert into batch.ProcessRun
					(
						BatchProcessId
					  , IcrtProcessId
					  , StartTime
					  , EndTime
					  , RunStateId
					  , EndState
					  , EndMessage
					  , MinChangeDataCapturePoint
					  , MaxChangeDataCapturePoint
					)
					values
					(
						@BatchProcessId		
					  , @IcrtProcessId
					  , @SetDate			
					  , @SetDate			
					  , 4					
					  , 'process stopped'	
					  , 'process already existed'					
					  , @SetDate		
					  , @SetDate		
					) ;

		
				end ;

			if not exists(select	1	from	[batch].[ProcessRun]	where		BatchProcessId = @BatchProcessId
				and EndTime is null 
				
				)
				begin
			

					if  @_Isdisable=0
			begin
            select '1'
					insert into batch.ProcessRun
					(
						BatchProcessId
					  , IcrtProcessId
					  , StartTime
					  , RunStateId
					  , EndState
					  , EndMessage
					  , MinChangeDataCapturePoint
					  , MaxChangeDataCapturePoint
					)
					values
					(

						@BatchProcessId
					  , @IcrtProcessId	
					  , @SetDate
					  , 1			
					  , ''			
					  , ''			
					  , @SetDate
					  , @SetDate
					) ;

					set @ProcessRunId =
					(
						select
							max(ProcessRunId)
						from
							batch.ProcessRun
						where
							IcrtProcessId = @IcrtProcessId
							and EndState = ''
					) ;

					set @Instruction = 'RUN' ;
					set @Message = '' ;

					select	@RunType = RunType	from	dbo.StubResultSet	where		FunctionName = @_FunctionName ;
					set @ProcessRunId =	(select	ProcessRunId from batch.ProcessRun	where BatchProcessId = @BatchProcessId and EndState = ''	) ;
					end 




					
					if  @_Isdisable=1
			begin
            select '1'
					insert into batch.ProcessRun
					(
						BatchProcessId
					  , IcrtProcessId
					  , StartTime
					  , RunStateId
					  , EndState
					  , EndMessage
					  , MinChangeDataCapturePoint
					  , MaxChangeDataCapturePoint
					)
					values
					(

						@BatchProcessId
					  , @IcrtProcessId	
					  , @SetDate
					  , 1			
					  , ''			
					  , ''			
					  , @SetDate
					  , @SetDate
					) ;

					set @ProcessRunId =
					(
						select
							max(ProcessRunId)
						from
							batch.ProcessRun
						where
							IcrtProcessId = @IcrtProcessId
							and EndState = ''
					) ;

					set @Instruction = 'RUN' ;
					set @Message = '' ;

					select	@RunType = RunType	from	dbo.StubResultSet	where		FunctionName = @_FunctionName ;
					set @ProcessRunId =	(select	ProcessRunId from batch.ProcessRun	where BatchProcessId = @BatchProcessId and EndState = ''	) ;
					end 
				end ;

				

			
			
				
		end try
		begin catch
			set @_ErrorContext = 'Failed to start new process run' + ' for ICRT Process Name: ' + coalesce('"' + @ProcessName + '"', 'NULL')
								 + ' and ICRT Process Id: ' + coalesce(cast(@IcrtProcessId as varchar(32)), 'NULL') + ' at step: '
								 + coalesce('[' + @_Step + ']', 'NULL') + ' (New Process Run Id: ' + coalesce(cast(@ProcessRunId as varchar(32)), 'NULL') + ')' ;

							
	
			exec log4.ExceptionHandler
				@ErrorContext = @_ErrorContext
			  , @ErrorProcedure = @_FunctionName
			  , @ErrorNumber = @_Error out
			  , @ReturnMessage = @_Message out
			  , @ExceptionId = @_ExceptionId out ;

	
		end catch ;

		--/////////////////////////////////////////////////////////////////////////////////////////////////
		EndEx:
		--/////////////////////////////////////////////////////////////////////////////////////////////////

		--! Finally, throw an exception that will be detected by the caller
		--select 'finally'

		if @_Error > 0
			begin
				--select @_Error
				raiserror(@_Message, 16, 99) ;
			end ;
		set nocount off ;

		--! Return the value of @@ERROR (which will be zero on success)
		return (@_Error) ;
	end ;
GO
EXEC sp_addextendedproperty N'MS_Description', N'Checks that the requested process is runnable and if so, initiates a new process run instance (adding a row to the table: batch.ProcessRun)', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the ID of the ICRT execution instance/process that initiated this batch run', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@IcrtProcessId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates what action the caller should take in relation to this run attempt, always populated.  Will be one of the following four values: "RUN", "SKIP", "STOP" or "ERROR"', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@Instruction'
GO
EXEC sp_addextendedproperty N'MS_Description', N'A user-friendly message relating to any reason behind the Instruction output – especially if the result is anything other than “RUN”', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@Message'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Mandatory, the name of the ICRT/ICS process responsible for running the end-to-end data load for a source (from which the Batch Process Id can be derived)', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@ProcessName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique Id for the new process run context initiated by this procedure.', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@ProcessRunId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Output, indicates whether this is a “FULL” or “DELTA” load (and allows the caller to choose the appropriate code path according to expected data quantities.  Always populated.', 'SCHEMA', N'ics', 'PROCEDURE', N'ProcessRunStart', 'PARAMETER', N'@RunType'
GO
