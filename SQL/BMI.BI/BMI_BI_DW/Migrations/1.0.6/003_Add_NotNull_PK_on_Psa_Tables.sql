﻿-- <Migration ID="ced52fd0-923e-4004-9d54-ed963902f7a1" />
go

print N'Dropping [tsa].[ICS_LAND_SAP_DEU_ZG01]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_ZG01
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBUP]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBUP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBUK]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBUK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBRK]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBRK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBPA]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBPA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBFA]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBFA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBAP]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBAP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBAK]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBAK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_TVKO]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_TVKO
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_TBRCT]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_TBRCT
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T052U]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T052U
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T016T]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T016T
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_T001]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001Z]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001Z
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001W]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001W
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MVKE]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MVKE
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARM]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARM
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARC]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARC
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARA]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MAKT]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MAKT
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_LIPS]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_LIPS
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_LIKP]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_LIKP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONV]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONV
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONP]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONH]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONH
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNVK]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNVK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNBK]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNBK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNB1]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNB1
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNA1]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNA1
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_ADRC]'
go
if objectpropertyex(object_id(N'[psa].[ICS_LAND_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_ADRC
go
print N'Dropping [tsa].[ics_land_SAP_DEU_ZG01]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_ZG01
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBUP]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBUP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBUK]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBUK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBRK]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBRK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBPA]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBPA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBFA]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBFA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBAP]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBAP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBAK]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBAK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_TVKO]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_TVKO
go
print N'Dropping [tsa].[ics_land_SAP_DEU_TBRCT]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_TBRCT
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T052U]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T052U
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T016T]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T016T
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_T001]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001Z]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001Z
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001W]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001W
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MVKE]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MVKE
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARM]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARM
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARC]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARC
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARA]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MAKT]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MAKT
go
print N'Dropping [tsa].[ics_land_SAP_DEU_LIPS]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_LIPS
go
print N'Dropping [tsa].[ics_land_SAP_DEU_LIKP]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_LIKP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONV]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONV
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONP]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONH]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONH
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNVK]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNVK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNBK]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNBK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNB1]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNB1
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNA1]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNA1
go
print N'Dropping [tsa].[ics_land_SAP_DEU_ADRC]'
go
if objectpropertyex(object_id(N'[psa].[ics_land_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_ADRC
go

print N'Altering [psa].[ics_stg_m3v7_CCURRA]'
go
alter table psa.ics_stg_m3v7_CCURRA alter column CUCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_CCURRA alter column CUDIVI nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_CCURRA alter column CUCUCD nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_CCURRA alter column CUCRTP decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_CCURRA alter column CUCUTD decimal (18, 0) not null
go
print N'Creating primary key [PK_stg_m3v7_CCURRA] on [psa].[ics_stg_m3v7_CCURRA]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_CCURRA'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_CCURRA add constraint PK_stg_m3v7_CCURRA primary key clustered  (CUCONO, CUCUCD, CUDIVI, CUCRTP, CUCUTD)
go
print N'Altering [psa].[ics_stg_m3v7_CSYTAB]'
go
alter table psa.ics_stg_m3v7_CSYTAB alter column CTCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_CSYTAB alter column CTDIVI nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_CSYTAB alter column CTSTCO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_CSYTAB alter column CTSTKY nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_CSYTAB alter column CTLNCD nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_CSYTAB] on [psa].[ics_stg_m3v7_CSYTAB]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_CSYTAB'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_CSYTAB add constraint PK_stg_m3v7_CSYTAB primary key clustered  (CTCONO, CTSTKY, CTDIVI, CTSTCO, CTLNCD)
go
print N'Altering [psa].[ics_stg_m3v7_MILOMA]'
go
alter table psa.ics_stg_m3v7_MILOMA alter column LMITNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MILOMA alter column LMBANO nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_MILOMA] on [psa].[ics_stg_m3v7_MILOMA]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MILOMA'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MILOMA add constraint PK_stg_m3v7_MILOMA primary key clustered  (LMITNO, LMBANO)
go
print N'Altering [psa].[ics_stg_m3v7_MITAUN]'
go
alter table psa.ics_stg_m3v7_MITAUN alter column MUITNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITAUN alter column MUAUTP decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITAUN alter column MUALUN nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_MITAUN] on [psa].[ics_stg_m3v7_MITAUN]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MITAUN'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MITAUN add constraint PK_stg_m3v7_MITAUN primary key clustered  (MUITNO, MUAUTP, MUALUN)
go
print N'Altering [psa].[ics_stg_m3v7_MITBAL]'
go
alter table psa.ics_stg_m3v7_MITBAL alter column MBCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITBAL alter column MBWHLO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITBAL alter column MBITNO nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_MITBAL] on [psa].[ics_stg_m3v7_MITBAL]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MITBAL'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MITBAL add constraint PK_stg_m3v7_MITBAL primary key clustered  (MBITNO, MBWHLO, MBCONO)
go
print N'Altering [psa].[ics_stg_m3v7_MITFAC]'
go
alter table psa.ics_stg_m3v7_MITFAC alter column M9CONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITFAC alter column M9FACI nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITFAC alter column M9ITNO nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_MITFAC] on [psa].[ics_stg_m3v7_MITFAC]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MITFAC'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MITFAC add constraint PK_stg_m3v7_MITFAC primary key clustered  (M9CONO, M9ITNO, M9FACI)
go
print N'Altering [psa].[ics_stg_m3v7_MITLOC]'
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLWHLO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLITNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLWHSL nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLBANO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITLOC alter column MLREPN decimal (18, 0) not null
go
print N'Creating primary key [PK_stg_m3v7_MITLOC] on [psa].[ics_stg_m3v7_MITLOC]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MITLOC'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MITLOC add constraint PK_stg_m3v7_MITLOC primary key clustered  (MLREPN, MLCONO, MLWHLO, MLITNO, MLWHSL, MLBANO)
go
print N'Altering [psa].[ics_stg_m3v7_MITMAS]'
go
alter table psa.ics_stg_m3v7_MITMAS alter column MMCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITMAS alter column MMITNO nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_MITMAS] on [psa].[ics_stg_m3v7_MITMAS]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_MITMAS'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_MITMAS add constraint PK_stg_m3v7_MITMAS primary key clustered  (MMCONO, MMITNO)
go
print N'Altering [psa].[ics_stg_m3v7_MITPOP]'
go
alter table psa.ics_stg_m3v7_MITPOP alter column MPCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_MITPOP alter column MPITNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITPOP alter column MPPOPN nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_MITPOP alter column MPE0PA nvarchar (255) not null
go
print N'Altering [psa].[ics_stg_m3v7_OCHCUS]'
go
alter table psa.ics_stg_m3v7_OCHCUS alter column OSCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OCHCUS alter column OSCUNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OCHCUS alter column OSFVDT decimal (18, 0) not null
go
print N'Creating primary key [PK_stg_m3v7_OCHCUS] on [psa].[ics_stg_m3v7_OCHCUS]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_OCHCUS'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_OCHCUS add constraint PK_stg_m3v7_OCHCUS primary key clustered  (OSCONO, OSCUNO, OSFVDT)
go
print N'Altering [psa].[ics_stg_m3v7_OCUSMA]'
go
alter table psa.ics_stg_m3v7_OCUSMA alter column OKCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OCUSMA alter column OKCUNO nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_OCUSMA] on [psa].[ics_stg_m3v7_OCUSMA]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_OCUSMA'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_OCUSMA add constraint PK_stg_m3v7_OCUSMA primary key clustered  (OKCONO, OKCUNO)
go
print N'Altering [psa].[ics_stg_m3v7_OINVOH]'
go
alter table psa.ics_stg_m3v7_OINVOH alter column UHCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOH alter column UHIVNO decimal (18, 0) not null
go
print N'Creating primary key [PK_stg_m3v7_OINVOH] on [psa].[ics_stg_m3v7_OINVOH]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_OINVOH'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_OINVOH add constraint PK_stg_m3v7_OINVOH primary key clustered  (UHCONO, UHIVNO)
go
print N'Altering [psa].[ics_stg_m3v7_OINVOL]'
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONDIVI nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONIVNO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONYEA4 decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONIVSQ decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONIVTP nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONORNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONDLIX decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONWHLO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONIVRF nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OINVOL alter column ONINPX nvarchar (255) not null
go
print N'Creating primary key [PK_stg_m3v7_OINVOL] on [psa].[ics_stg_m3v7_OINVOL]'
go
if objectpropertyex(object_id(N'psa.PK_stg_m3v7_OINVOL'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_OINVOL add constraint PK_stg_m3v7_OINVOL primary key clustered  (ONCONO, ONDIVI, ONYEA4, ONIVNO, ONINPX, ONIVTP, ONIVSQ, ONDLIX, ONORNO, ONWHLO, ONIVRF)
go
print N'Altering [psa].[ics_stg_m3v7_OOHEAD]'
go
alter table psa.ics_stg_m3v7_OOHEAD alter column OACONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OOHEAD alter column OAORNO nvarchar (255) not null
go
print N'Altering [psa].[ics_stg_m3v7_OOLINE]'
go
alter table psa.ics_stg_m3v7_OOLINE alter column OBCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OOLINE alter column OBORNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OOLINE alter column OBPONR decimal (18, 0) not null
go
print N'Creating primary key [_stg_m3v7_OOLINE] on [psa].[ics_stg_m3v7_OOLINE]'
go
if objectpropertyex(object_id(N'psa._stg_m3v7_OOLINE'), N'IsPrimaryKey') is null
	alter table psa.ics_stg_m3v7_OOLINE add constraint _stg_m3v7_OOLINE primary key clustered  (OBCONO, OBORNO, OBPONR)
go
print N'Altering [psa].[ics_stg_m3v7_OSBSTD]'
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCCONO decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCDIVI nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCORNO nvarchar (255) not null
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCDLIX decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCPONR decimal (18, 0) not null
go
alter table psa.ics_stg_m3v7_OSBSTD alter column UCWHLO nvarchar (255) not null
go
