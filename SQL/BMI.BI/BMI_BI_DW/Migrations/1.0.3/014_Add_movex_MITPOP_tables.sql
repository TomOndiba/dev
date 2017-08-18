-- <Migration ID="2316e66f-2421-4df6-a52b-8d12a0a81a4b" />
go

if objectpropertyex(object_id(N'[tsa].[ics_land_movex_MITPOP]'), N'IsUserTable') is not null
	drop table [tsa].[ics_land_movex_MITPOP] ;
go

if objectpropertyex(object_id(N'[psa].[ics_stg_movex_MITPOP]'), N'IsUserTable') is not null
	drop table [psa].[ics_stg_movex_MITPOP] ;
go

create table [tsa].[ics_land_movex_MITPOP]
(
  EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, ExcludeFromMerge bit not null constraint DF_tsa_ics_land_movex_MITPOP_ExcludeFromMerge default (0)
, IsDuplicate bit not null constraint DF_tsa_ics_land_movex_MITPOP_IsDuplicate default (0)

, MPCONO decimal(3, 0) null
, MPALWT decimal(2, 0) null
, MPALWQ nvarchar(255) null
, MPITNO nvarchar(255) null
, MPPOPN nvarchar(255) null
, MPE0PA nvarchar(255) null
, MPVFDT decimal(8, 0) null
, MPLVDT decimal(8, 0) null
, MPCNQT decimal(15, 6) null
, MPALUN nvarchar(255) null
, MPORCO nvarchar(255) null
, MPSEQN decimal(7, 0) null
, MPREMK nvarchar(255) null
, MPCFIN decimal(10, 0) null
, MPTXID decimal(13, 0) null
, MPSEA1 nvarchar(255) null
, MPATPE nvarchar(255) null
, MPATNR decimal(17, 0) null
, MPRGDT decimal(8, 0) null
, MPRGTM decimal(6, 0) null
, MPLMDT decimal(8, 0) null
, MPCHNO decimal(3, 0) null
, MPCHID nvarchar(255) null
, MPLMTS decimal(18, 0) null
) ;
go

create table [psa].[ics_stg_movex_MITPOP]
(
  EtlRecordId bigint not null identity(1,1)
, EtlBatchRunId int not null
, EtlStepRunId int not null
, EtlThreadRunId int not null
, DataSourceKey int not null
, EtlSourceTable varchar(200) not null
, EtlCreatedOn datetime not null
, EtlCreatedBy varchar(200) not null
, EtlUpdatedOn datetime not null
, EtlUpdatedBy varchar(200) not null
, EtlDeletedOn datetime null
, EtlDeletedBy varchar(200) null
, IsDeleted char(1) not null constraint DF_psa_ics_stg_movex_MITPOP_IsDeleted default ('N')
, IsIncomplete char(1) not null constraint DF_psa_ics_stg_movex_MITPOP_IsIncomplete default ('N')

, MPCONO decimal(3, 0) null
, MPALWT decimal(2, 0) null
, MPALWQ nvarchar(255) null
, MPITNO nvarchar(255) null
, MPPOPN nvarchar(255) null
, MPE0PA nvarchar(255) null
, MPVFDT decimal(8, 0) null
, MPLVDT decimal(8, 0) null
, MPCNQT decimal(15, 6) null
, MPALUN nvarchar(255) null
, MPORCO nvarchar(255) null
, MPSEQN decimal(7, 0) null
, MPREMK nvarchar(255) null
, MPCFIN decimal(10, 0) null
, MPTXID decimal(13, 0) null
, MPSEA1 nvarchar(255) null
, MPATPE nvarchar(255) null
, MPATNR decimal(17, 0) null
, MPRGDT decimal(8, 0) null
, MPRGTM decimal(6, 0) null
, MPLMDT decimal(8, 0) null
, MPCHNO decimal(3, 0) null
, MPCHID nvarchar(255) null
, MPLMTS decimal(18, 0) null
) ;
go
