CREATE procedure [StaticDataTests].[test batch.RunStateFlag static data]
as
begin
	--! Assemble
	;with sourceCte (FlagBit, FlagName)
	as
	(
			  select cast(-1 as int), cast('' as varchar(500))
		union all select 00	, 'Not applicable'
		union all select 01	, 'Started'
		union all select 02	, 'In-progress'
		union all select 04	, 'Succeeded'
		union all select 08	, 'Stopped'
		union all select 16 , 'Failed'
		union all select 32 , 'Skipped'
	)
	select * into #expected from sourceCte where FlagBit >= 0

	--! Assert
	exec tSQLt.AssertEqualsTable @Expected = '#expected', @Actual = 'batch.RunStateFlag';
end