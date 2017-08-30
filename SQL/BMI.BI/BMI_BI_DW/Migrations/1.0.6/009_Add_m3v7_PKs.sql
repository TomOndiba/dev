-- <Migration ID="92bb7c33-57a1-48ec-8721-02cce73d6ab5" />
GO
-------drop mev7

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MILOMA'
)
	alter table psa.ics_stg_m3v7_MILOMA drop constraint PK_stg_m3v7_MILOMA ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITAUN'
)
	alter table psa.ics_stg_m3v7_MITAUN drop constraint PK_stg_m3v7_MITAUN ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITBAL'
)
	alter table psa.ics_stg_m3v7_MITBAL drop constraint PK_stg_m3v7_MITBAL ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITFAC'
)
	alter table psa.ics_stg_m3v7_MITFAC drop constraint PK_stg_m3v7_MITFAC ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITLOC'
)
	alter table psa.ics_stg_m3v7_MITLOC drop constraint PK_stg_m3v7_MITLOC ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITMAS'
)
	alter table psa.ics_stg_m3v7_MITMAS drop constraint PK_stg_m3v7_MITMAS ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_MITPOP'
)
	alter table psa.ics_stg_m3v7_MITPOP drop constraint PK_stg_m3v7_MITPOP ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OCHCUS'
)
	alter table psa.ics_stg_m3v7_OCHCUS drop constraint PK_stg_m3v7_OCHCUS ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OCUSMA'
)
	alter table psa.ics_stg_m3v7_OCUSMA drop constraint PK_stg_m3v7_OCUSMA ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OINVOH'
)
	alter table psa.ics_stg_m3v7_OINVOH drop constraint PK_stg_m3v7_OINVOH ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OOHEAD'
)
	alter table psa.ics_stg_m3v7_OOHEAD drop constraint PK_stg_m3v7_OOHEAD ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OOLINE'
)
	alter table psa.ics_stg_m3v7_OOLINE drop constraint PK_stg_m3v7_OOLINE ;

go


if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OSBSTD'
)
	alter table psa.ics_stg_m3v7_OSBSTD drop constraint PK_stg_m3v7_OSBSTD ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_CCURRA'
)
	alter table psa.ics_stg_m3v7_CCURRA drop constraint PK_stg_m3v7_CCURRA ;

go

if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_CSYTAB'
)
	alter table psa.ics_stg_m3v7_CSYTAB drop constraint PK_stg_m3v7_CSYTAB ;

go


if exists
(
	select
		*
	from
		INFORMATION_SCHEMA.TABLE_CONSTRAINTS
	where
		CONSTRAINT_SCHEMA = 'psa'
		and CONSTRAINT_NAME = 'PK_stg_m3v7_OINVOL'
)
	alter table psa.ics_stg_m3v7_OINVOL drop constraint PK_stg_m3v7_OINVOL ;
go
------------------------add

alter table psa.ics_stg_m3v7_MILOMA
add constraint PK_stg_m3v7_MILOMA primary key (LMITNO, LMBANO) ;

go
alter table psa.ics_stg_m3v7_MITAUN
add constraint PK_stg_m3v7_MITAUN primary key (MUITNO, MUAUTP, MUALUN) ;

go
alter table psa.ics_stg_m3v7_MITBAL
add constraint PK_stg_m3v7_MITBAL primary key (MBITNO, MBWHLO, MBCONO) ;

go
alter table psa.ics_stg_m3v7_MITFAC
add constraint PK_stg_m3v7_MITFAC primary key (M9CONO, M9ITNO, M9FACI) ;

go
alter table psa.ics_stg_m3v7_MITLOC
add constraint PK_stg_m3v7_MITLOC primary key (MLREPN, MLCONO, MLWHLO, MLITNO, MLWHSL, MLBANO) ;

go
alter table psa.ics_stg_m3v7_MITMAS
add constraint PK_stg_m3v7_MITMAS primary key (MMCONO, MMITNO) ;

go
alter table psa.ics_stg_m3v7_MITPOP
add constraint PK_stg_m3v7_MITPOP primary key (MPCONO, MPITNO, MPE0PA, MPPOPN) ;

go
alter table psa.ics_stg_m3v7_OCHCUS
add constraint PK_stg_m3v7_OCHCUS primary key (OSCONO, OSCUNO, OSFVDT) ;

go
alter table psa.ics_stg_m3v7_OCUSMA
add constraint PK_stg_m3v7_OCUSMA primary key (OKCONO, OKCUNO) ;

go
alter table psa.ics_stg_m3v7_OINVOH
add constraint PK_stg_m3v7_OINVOH primary key (UHCONO, UHIVNO) ;

go
alter table psa.ics_stg_m3v7_OOHEAD
add constraint PK_stg_m3v7_OOHEAD primary key (OACONO, OAORNO) ;

go
alter table psa.ics_stg_m3v7_OOLINE
add constraint PK_stg_m3v7_OOLINE primary key (OBCONO, OBORNO, OBPONR) ;

go
alter table psa.ics_stg_m3v7_OSBSTD
add constraint PK_stg_m3v7_OSBSTD primary key (UCCONO, UCORNO, UCPONR, UCDIVI, UCWHLO, UCDLIX) ;

go
alter table psa.ics_stg_m3v7_CCURRA
add constraint PK_stg_m3v7_CCURRA primary key (CUCONO, CUCUCD, CUDIVI, CUCRTP, CUCUTD) ;

go
alter table psa.ics_stg_m3v7_CSYTAB
add constraint PK_stg_m3v7_CSYTAB primary key (CTCONO, CTSTKY, CTDIVI, CTSTCO, CTLNCD) ;

go
alter table psa.ics_stg_m3v7_OINVOL
add constraint PK_stg_m3v7_OINVOL primary key (ONCONO, ONDIVI, ONYEA4, ONIVNO, ONINPX, ONIVTP, ONIVSQ, ONDLIX, ONORNO, ONWHLO, ONIVRF) ;
go
