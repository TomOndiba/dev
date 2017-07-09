IF OBJECT_ID('[log4Private].[SessionInfoOutput]') IS NOT NULL
	DROP PROCEDURE [log4Private].[SessionInfoOutput];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*************************************************************************************************/
--</MaintenanceHeader>

CREATE PROCEDURE [log4Private].[SessionInfoOutput]
(
  @SessionId          int
, @HostName           nvarchar( 128 ) = null  out
, @ProgramName        nvarchar( 128 ) = null  out
, @NTDomain           nvarchar( 128 ) = null  out
, @NTUsername         nvarchar( 128 ) = null  out
, @LoginName          nvarchar( 128 ) = null  out
, @OriginalLoginName  nvarchar( 128 ) = null  out
, @SessionLoginTime   datetime        = null  out
)

as

--<CommentHeader>
/**********************************************************************************************************************

Properties
=====================================================================================================================
PROCEDURE NAME:  SessionInfoOutput
DESCRIPTION:     Outputs session info from master.sys.dm_exec_sessions for the current @@SPID
DATE OF ORIGIN:  15-APR-2008
ORIGINAL AUTHOR: Greg M. Lucas (data-centric solutions ltd. http://www.data-centric.co.uk)
BUILD DATE:      13-MAR-2012
BUILD VERSION:   0.0.11
DEPENDANTS:      log4.ExceptionHandler
                 log4.JournalWriter
DEPENDENCIES:    Called functions

Returns
=====================================================================================================================
@@ERROR - always zero on success

Additional Notes
=====================================================================================================================


Revision history
=====================================================================================================================
ChangeDate		Author	Version		Narrative
============	======	=======		=================================================================================
15-APR-2008		GML		vX.Y.z		Created
------------	------	-------		---------------------------------------------------------------------------------
17-OCT-2015		GML		vX.Y.z		Now works on SQL Azure DB
------------	------	-------		---------------------------------------------------------------------------------

=====================================================================================================================
(C) Copyright 2006-14 data-centric solutions ltd. (http://log4tsql.sourceforge.net/)

This library is free software; you can redistribute it and/or modify it under the terms of the
GNU Lesser General Public License as published by the Free Software Foundation (www.fsf.org);
either version 3.0 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along with this
library; if not, you can find it at http://www.opensource.org/licenses/lgpl-3.0.html
or http://www.gnu.org/licenses/lgpl.html

**********************************************************************************************************************/
--</CommentHeader>

begin
	SET NOCOUNT ON

	begin try
		--! These system attributes come from master.sys.dm_exec_sessions which isn't available in Azure
		set @HostName			= 'N/S in Azure'
		set @ProgramName		= 'N/S in Azure'
		set @NTDomain			= 'N/S in Azure'
		set @NTUsername			= 'N/S in Azure'
		set @LoginName			= 'N/S in Azure'
		set @OriginalLoginName	= 'N/S in Azure'
		set @SessionLoginTime	= '19000101 00:00:00'

	end try
	begin catch
		--! Make sure we return non-null values
		set @SessionId			= 0
		set @HostName			= ''
		set @ProgramName		= 'log4.SessionInfoOutput Error!'
		set @NTDomain			= ''
		set @NTUsername			= ''
		set @LoginName			= 'log4.SessionInfoOutput Error!'
		set @OriginalLoginName	= ''

		declare @context nvarchar(512); set @context = 'log4.SessionInfoOutput failed to retrieve session info';

		--! Only rollback if we have an uncommitable transaction
		if (xact_state() = -1)
		or (@@trancount > 0 and xact_state() != 1)
			begin
				rollback tran;
				set @context = @context + ' (Forced rolled back of all changes due to uncommitable transaction)';
			end

		--! Log this error directly
		--! Don't call ExceptionHandler in case we get another
		--! SessionInfoOutput error and and up in a never-ending loop)
		insert log4Private.SqlException
		(
		  UtcDate
		, SystemDate
		, ErrorContext
		, ErrorNumber
		, ErrorSeverity
		, ErrorState
		, ErrorProcedure
		, ErrorLine
		, ErrorMessage
		, ErrorDatabase
		, SessionIdent
		, ServerName
		, HostName
		, ProgramName
		, NTDomain
		, NTUsername
		, LoginName
		, OriginalLoginName
		, SessionLoginTime
		)
		select
			  getutcdate()
			, getdate()
			, @context
			, error_number()
			, error_severity()
			, error_state()
			, error_procedure()
			, error_line()
			, error_message()
			, db_name()
			, @@spid
			, @@servername
			, '' -- HostName
			, '' -- ProgramName
			, '' -- NTDomain
			, '' -- NTUsername
			, '' -- LoginName
			, '' -- OriginalLoginName
			, null
	end catch

	set nocount off
end
GO
GRANT EXECUTE ON  [log4Private].[SessionInfoOutput] TO [public]
GO
EXEC sp_addextendedproperty N'MS_Description', N'Outputs session info from master.sys.dm_exec_sessions for the current @@SPID', 'SCHEMA', N'log4Private', 'PROCEDURE', N'SessionInfoOutput', NULL, NULL
GO
