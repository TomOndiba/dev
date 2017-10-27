-- <Migration ID="3fe34721-f69e-437d-bffc-bc5809c74cb0" />
go

if not exists
	(
		select 1 from INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA = 'dbo'
		and TABLE_NAME = 'DataSource'
		and COLUMN_NAME = 'PbiTxnViewSource'
		and DATA_TYPE = 'char'
		and CHARACTER_MAXIMUM_LENGTH = 3
	)
	alter table dbo.DataSource add PbiTxnViewSource char(3) not null constraint DF_DataSource_PbiTxnViewSource default ('QVS')
go

if exists
	(
		select 1 from INFORMATION_SCHEMA.COLUMNS
		where TABLE_SCHEMA = 'dbo'
		and TABLE_NAME = 'DataSource'
		and COLUMN_NAME = 'PbiTxnViewSource'
		and DATA_TYPE = 'char'
		and CHARACTER_MAXIMUM_LENGTH = 3
	)
	begin
		if objectpropertyex(object_id(N'dbo.CK_DataSource_PbiTxnViewSource'), N'IsCheckCnst') is null
			alter table dbo.DataSource add constraint CK_DataSource_PbiTxnViewSource
				check (PbiTxnViewSource in ('QVS', 'PSA')) ;

		if exists(select * from sys.fn_listextendedproperty('MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'DataSource', 'COLUMN', 'PbiTxnViewSource'))
			exec sys.sp_dropextendedproperty 'MS_Description', 'SCHEMA', 'dbo', 'TABLE', 'DataSource', 'COLUMN', 'PbiTxnViewSource' ;

		exec sp_addextendedproperty N'MS_Description'
		, 'Flag to indicate from where transactioonal data should be retrieved for each data source. E.g. "QVS" = the data drawn from the QlikView source database and stored in the qvstg schema; "PSA" = the views over the PSA tables which hold raw data extracted directly from source ERP systems'
		, 'SCHEMA', 'dbo', 'TABLE', 'DataSource', 'COLUMN', 'PbiTxnViewSource' ;
	end
go


