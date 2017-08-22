CREATE   procedure [tsa-to-psa-tests].[test privy.TsaToPsaValidateSchema throws error on missing psa tables]
as

begin
	create table [tsa-to-psa-tests].Expected
	(
		ErrorContext   nvarchar(512)  null
	  , ErrorProcedure nvarchar(128)  null
	) ;

	insert into [tsa-to-psa-tests].Expected
	(
		ErrorContext
	  , ErrorProcedure
	)
	values
	(
		'schema validation failed at step: [check for tsa tables missing from psa]', '[privy].[TsaToPsaValidateSchema]'
	) ;

	exec tSQLt.SpyProcedure N'log4.ExceptionHandler' ;

	exec tSQLt.FakeTable 'dbo.TsaToPsaLoadControlTable' ;
	insert into dbo.TsaToPsaLoadControlTable
	(
	   SourceSchema
	  , SourceTable
	  , TargetSchema
	  , TargetTable
	  ,DataSourceKey
	)
	values
	(
	     N'test_tsa'			
	  , 'ICS_LAND_Dummy'		
	  , 'test_psa'		
	  , 'ICS_STG_Dummy'			
	  , 1
	) 

	exec (N'create schema test_tsa;')
	exec (N'create schema test_psa;')

	create table test_tsa.ICS_LAND_Dummy
	(col1 int)

	execute [privy].[TsaToPsaValidateSchema] 1

	exec tSQLt.AssertEqualsTable
		  @Expected = '[tsa-to-psa-tests].Expected'
		, @Actual = N'log4.ExceptionHandler_SpyProcedureLog' ;
end