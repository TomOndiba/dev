IF OBJECT_ID('[privy].[BuildAndRunMerge]') IS NOT NULL
	DROP PROCEDURE [privy].[BuildAndRunMerge];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create   procedure [privy].[BuildAndRunMerge]
(
	@Runtype		  varchar(10)
  , @SourceTableName  varchar(200)
  , @SourceSchemaName varchar(200)
  , @TargetTableName  varchar(200)
  , @TargetSchemaName varchar(200)
  , @LoadDateTime	  varchar(50) = null
)
as
	begin

		--<CommentHeader>
/**********************************************************************************************************************

Properties
==========
PROCEDURE NAME:		privy.BuildAndRunMerge
DESCRIPTION:		run merge statement dynamically for loading data from tsa to psa
ORIGIN DATE:		03-Aug-2017
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

		set nocount on;

		if object_id(N'TableStructure') is not null drop table TableStructure ;

		if object_id(N'PkeyTable') is not null drop table PkeyTable ;

		--declare
		--	@Runtype		  varchar(10)  = 'full'
		--  , @SourceTableName  varchar(200) = 'customer'
		--  , @SourceSchemaName varchar(200) = 'tsa'
		--  , @TargetTableName  varchar(200) = 'customer'
		--  , @TargetSchemaName varchar(200) = 'psa'
		--  , @LoadDateTime	  datetime	   = null 
	
		declare @STableName nvarchar(200) = @SourceSchemaName + '.' + @SourceTableName ;
		declare @TTableName nvarchar(200) = @TargetSchemaName + '.' + @TargetTableName ;
		declare @sql nvarchar(max) = '' ;
		declare @_LoadDateTime varchar(50) = isnull(@LoadDateTime, getdate()) ;
	    declare @maxid int=null;
		select
			COLUMN_NAME ColumnName
		into
			TableStructure
		from
			INFORMATION_SCHEMA.COLUMNS
		where
			TABLE_SCHEMA + '.' + TABLE_NAME = @STableName ;

			
		alter table TableStructure add id int identity(1, 1) ;

		declare @i int = 1 ;
		declare @insertcolumnstring nvarchar(max) = '' ; ---prepares insert list of column
		declare @updatecolumnstring nvarchar(max) = '' ; --prepares update list of column
		declare @columnname nvarchar(255) = '' ;
		declare @updatesetcolumnstring nvarchar(max) = '' ; --prepares set list of columns for update statement
		declare @pkcolumns varchar(500) = '' ;
		declare @pkcolumnsTemp varchar(500) = '' ;

		select
			col_name(ic.object_id, ic.column_id) as PK
		into
			PkeyTable
		from
			sys.indexes				 as i
		inner join sys.index_columns as ic
			on i.object_id = ic.object_id
				and i.index_id = ic.index_id
		where
			1 = 1
			and i.is_primary_key = 1
			and ic.object_id = object_id(@STableName) ;
						
		alter table PkeyTable add id int identity(1, 1) ;


		set @maxid  = (select max(id) from PkeyTable) ;
		
	
			while (@i <=@maxid )
			begin

			set @pkcolumnsTemp =(select PK from dbo.PkeyTable where id=@i );
	
			
			if (@maxid>1)

			begin
			set @pkcolumns= ' and '+'s.'+@pkcolumnsTemp + '=t.'+@pkcolumnsTemp + @pkcolumns
			end
			
			set @i=@i+1;
		end

		set @pkcolumns= substring(@pkcolumns,5,len(@pkcolumns))
			
        set @i=1;
		set @maxid  = (select max(id) from TableStructure) ;
		while (@i <= @maxid)
			begin

				set @columnname =(select ColumnName from TableStructure where id = @i) ;
								
				if (@columnname not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted'))
					set @insertcolumnstring = @insertcolumnstring + ',' + @columnname ;
															
				if (@columnname not in   (  select	PK from PkeyTable  )  and	@columnname not in	('EtlBatchRunId', 'EtlStepRunId', 'EtlThreadRunId', 'DataSourceKey', 'EtlCreatedOn', 'EtlCreatedBy', 'EtlSourceTable', 'EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted'	) )
					set @updatecolumnstring = @updatecolumnstring + ' or ' + 's.' + @columnname + '<>' + 't.' + @columnname ;

				if ( @columnname not in  ( select	PK from PkeyTable )  and 	@columnname not in ('EtlRecordId', 'IsIncomplete', 'EtlUpdatedOn', 'EtlUpdatedBy', 'EtlDeletedOn', 'EtlDeletedBy', 'IsDeleted') )
					set @updatesetcolumnstring = @updatesetcolumnstring + ' , ' + 't.' + @columnname + '=' + 's.' + @columnname ;

				set @i = @i + 1 ;
			end ;


		set @insertcolumnstring = substring(@insertcolumnstring, 2, len(@insertcolumnstring)) ;
		set @updatesetcolumnstring = substring(@updatesetcolumnstring, 3, len(@updatesetcolumnstring)) ;
		set @updatecolumnstring = substring(@updatecolumnstring, 4, len(@updatecolumnstring)) ;
		set @updatecolumnstring = '( ' + @updatecolumnstring + ' )' ;

		
		if @Runtype = 'Delta'
			begin

				set @sql = 'merge ' + @TTableName + ' t using ' + @STableName + ' s on ' + @pkcolumns 
						   + ' when not matched by target then 	insert ('	+ @insertcolumnstring + ',EtlUpdatedBy,EtlUpdatedOn' + ') values('
						   + @insertcolumnstring + ',EtlCreatedBy,' + '''' + @_LoadDateTime + '''' + ')' + 'when matched and ' + @updatecolumnstring
						   + ' then update set  ' + @updatesetcolumnstring + ', t.EtlUpdatedOn=' + '''' + @_LoadDateTime + ''''
						   + ', t.EtlUpDatedBy=s.EtlCreatedBy' + ';' ;
			end ;


		if @Runtype = 'Full' ---soft delete
			begin

				set @sql = 'merge ' + @TTableName + ' t using ' + @STableName + ' s on ' + @pkcolumns 
						   + ' when not matched by target then 	insert ('	+ @insertcolumnstring + ',EtlUpdatedBy,EtlUpdatedOn' + ') values('
						   + @insertcolumnstring + ',EtlCreatedBy,' + '''' + @_LoadDateTime + '''' + ')' + 'when matched and ' + @updatecolumnstring
						   + ' then update set  ' + @updatesetcolumnstring + ', t.EtlUpdatedOn=' + '''' + @_LoadDateTime + ''''
						   + ', t.EtlUpDatedBy=s.EtlCreatedBy' + ' when not matched by source then update set  t.EtlDeletedOn=' + '''' + @_LoadDateTime + ''''
						   + ', t.EtlDeletedBy=EtlCreatedBy, t.IsDeleted=1' + ';' ;
			end ;

		select	@sql ;

		execute sp_executesql @sql ;

	end ;

GO
