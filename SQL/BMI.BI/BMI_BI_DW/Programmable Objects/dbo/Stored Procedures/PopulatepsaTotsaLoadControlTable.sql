IF OBJECT_ID('[dbo].[PopulatepsaTotsaLoadControlTable]') IS NOT NULL
	DROP PROCEDURE [dbo].[PopulatepsaTotsaLoadControlTable];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE   procedure [dbo].[PopulatepsaTotsaLoadControlTable]
as

	--<CommentHeader>
	/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		dbo.PopulatepsaTotsaLoadControlTable
DESCRIPTION:		Populate psaTotsaLoadControlTable
ORIGIN DATE:		01-Aug-2017
ORIGINAL AUTHOR:	Razia Nazir

Returns
=======
@@Error - always zero on success

Additional Notes
================

REVISION HISTORY
=====================================================================================================================
Version	ChangeDate		Author	BugRef	Narrative
=======	============	======	=======	=============================================================================
001		01-Aug-2017		RN		N/A		Created
------- ------------	------	-------	-----------------------------------------------------------------------------

**********************************************************************************************************************/
	--</CommentHeader>
	begin

	set nocount on;
		truncate table psaTotsaLoadControlTable ;

		insert into dbo.psaTotsaLoadControlTable
		(
			CreatedDate
		  , CreatedBy
		  , SourceDB
		  , SourceSchema
		  , SourceTable
		  , TargetDB
		  , TargetSchema
		  , TargetTable
		  , LoadMode
		  , DataSourceKey
		)
		
		select
			getdate()		as CreatedDate
		  , system_user		as CreatedBy
		  , s.TABLE_CATALOG as SourceDB
		  , s.TABLE_SCHEMA	as SourceSchema
		  , s.TABLE_NAME	as SourceTable
		  , t.TABLE_CATALOG as TargetDB
		  , t.TABLE_SCHEMA	as TargetSchema
		  , t.TABLE_NAME	as TargetTable
		  , 'Delta Full'	as LoadMode
		  , 0				as DataSourceKey
		--,'y n' as Action 
		from
			INFORMATION_SCHEMA.TABLES			  s
		left outer join INFORMATION_SCHEMA.TABLES t
			on replace(s.TABLE_NAME, 'ICS_LAND', '') = replace(t.TABLE_NAME, 'ICS_STG', '')
		where
			s.TABLE_SCHEMA = 'tsa'
			and s.TABLE_TYPE = 'BASE TABLE'
			and t.TABLE_SCHEMA = 'psa'
			and t.TABLE_TYPE = 'BASE TABLE' ;


	end ;
GO
