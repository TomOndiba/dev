use iPRD ; ---, ------gPRD--gendonevPRD
go

set nocount on ;
drop table #Tables ;
go

drop table #TsqlTable ;
go

create table #TsqlTable (sql nvarchar(max));
go

declare @sn nvarchar(500) ='MVXJDTA';

select
	0 as Flag
  , *
into
	#Tables
from
	INFORMATION_SCHEMA.COLUMNS
where
	TABLE_NAME in

		(
		
		--'CCURRA', 'CIDMAS', 'CIDVEN', 'CSYTAB', 'CSYTXH', 'FGLEDG', 'FRCALP', 'FSCASH', 'FSLEDG', 'FSLEDX', 'FSYTXH', 'MITAUN', 'MITBAL', 'MITFAC', 'MITLOC'
	 --  , 'MITMAS', 'MITVEN', 'MPDEPR', 'MPHEAD', 'MPLIND', 'MPLINE', 'MPLIRE', 'MPOEXP', 'MPOPLA', 'MPPOAD', 'MPPOEX', 'MPPOPA', 'MSYTXH', 'MSYTXL', 'MWOPOL'
	 --  , 'OCUSMA', 'ODHEAD', 'ODLINE', 'OINVOH', 'OINVOL', 'OOHEAD', 'OOLINE', 'OPAYMD', 'OPAYMH', 'OSBSTD',
	   
	   
	   'CIDADR','CMNCMP','CMNDIV')





		
		and TABLE_SCHEMA=@sn;
		
declare
	@c as int			= (
							  select	count(*) from	#Tables
						  )
  , @i as int			= 1
  , @cn	  varchar(500)
  , @tsql nvarchar(max) = ''
  , @tn	  varchar(500)	= ''
  , @tn1  varchar(500)	= (
							  select top 1
									TABLE_NAME
							  from
									#Tables
							  where
									Flag = 0
							  order by
									TABLE_NAME
								  , COLUMN_NAME
						  ) ;
while (@i <= @c)
	begin
		set @cn =
		(
			select top 1
				COLUMN_NAME
			from
				#Tables
			where
				Flag = 0
			order by
				TABLE_NAME
			  , COLUMN_NAME
		) ;
		set @tn =
		(
			select top 1
				TABLE_NAME
			from
				#Tables
			where
				Flag = 0
			order by
				TABLE_NAME
			  , COLUMN_NAME
		) ;

	--print @tn
		if (@tn1 <> @tn)
			begin
			insert into #TsqlTable
			select 
				--'Create table tsa.ics_land_M3V10gen_POL_' ---gen
			'Create table tsa.ics_land_M3V10vil_POL_' ---vil
			--'Create table tsa.ics_land_M3V10ved_POL_' --vprd
			
			+ @tn1 + ' (' +
				'EtlBatchRunId int not null,EtlStepRunId int not null,EtlThreadRunId int not null,DataSourceKey int not null,EtlSourceTable varchar(200) not null,EtlCreatedOn datetime not null,EtlCreatedBy varchar(200) not null,
				ExcludeFromMerge bit not null CONSTRAINT DF_tsa' +'_'+ @tn1 +'_ExcludeFromMerge default 0,IsDuplicate bit not null CONSTRAINT DF_tsa' +'_'+ @tn1 +'_IsDuplicate default 0'
				+ @tsql + ' ) ' ;
				set @tsql = '' ;
			end ;

			
			set @tsql = @tsql +	(select	','+COLUMN_NAME +' '+ 
		
		
		 case
                           when data_type  in ('char','varchar','varbinary','nchar','nvarchar')
                                  then data_type +'('+cast(CHARACTER_MAXIMUM_LENGTH as varchar(255)) +')'
                               when data_type in ('decimal','numeric')
                                  then data_type +'('+cast(Numeric_precision as varchar(255))+','+cast(Numeric_scale as varchar(255))+')'
                           when data_type in ('time','datetime2','datetimeoffset')
                                  then data_type +'('+ cast(Numeric_precision as varchar(255)) +')'
                           else data_type
                       end

					   	from INFORMATION_SCHEMA.COLUMNS
							where COLUMN_NAME = @cn	and TABLE_NAME = @tn and TABLE_SCHEMA=@sn) ;

		update	#Tables set Flag = 1 where	COLUMN_NAME = @cn and	TABLE_NAME = @tn ;

		set @i = @i + 1 ;
		set @tn1 = @tn ;
	end ;

	    
	insert into #TsqlTable
			select 
			--'Create table tsa.ics_land_M3V10gen_POL_' ---gen
			'Create table tsa.ics_land_M3V10vil_POL_' ---vil
			--'Create table tsa.ics_land_M3V10ved_POL_' --vprd
			+ @tn1 + ' (' +
				'EtlBatchRunId int not null,EtlStepRunId int not null,EtlThreadRunId int not null,DataSourceKey int not null,EtlSourceTable varchar(200) not null,EtlCreatedOn datetime not null,EtlCreatedBy varchar(200) 	not null,
	ExcludeFromMerge bit not null CONSTRAINT DF_tsa' +'_'+ @tn1 +'_ExcludeFromMerge default 0,IsDuplicate bit not null CONSTRAINT DF_tsa' +'_'+ @tn1 +'_IsDuplicate default 0'
				+ @tsql + ' ) ' ;
	
go
select
	'if object_id('' ' + replace(substring(sql, 1, charindex('(', sql) - 1), 'Create table ', '') + ''',''U'') is not null '
	+ replace(substring(sql, 1, charindex('(', sql) - 1), 'Create table ', 'drop table ')
from
	#TsqlTable ;

go
select	sql from #TsqlTable ;


































































































































































































































































































































































































































































































































































































































































































































































































































































































































