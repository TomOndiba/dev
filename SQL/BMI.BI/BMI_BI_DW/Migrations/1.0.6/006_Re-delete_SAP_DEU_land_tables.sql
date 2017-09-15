-- <Migration ID="66f195aa-6f1b-4dc5-9ad7-76f73557e808" />
GO

print N'Dropping [tsa].[ICS_LAND_SAP_DEU_ZG01]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_ZG01
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBUP]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBUP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBUK]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBUK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBRK]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBRK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBPA]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBPA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBFA]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBFA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBAP]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBAP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_VBAK]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_VBAK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_TVKO]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_TVKO
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_TBRCT]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_TBRCT
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T052U]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T052U
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T016T]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T016T
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001Z]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001Z
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_T001W]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_T001W
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MVKE]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MVKE
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARM]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARM
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARC]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARC
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MARA]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MARA
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_MAKT]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_MAKT
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_LIPS]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_LIPS
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_LIKP]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_LIKP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONV]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONV
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONP]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONP
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KONH]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KONH
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNVK]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNVK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNBK]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNBK
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNB1]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNB1
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_KNA1]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_KNA1
go
print N'Dropping [tsa].[ICS_LAND_SAP_DEU_ADRC]'
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table tsa.ICS_LAND_SAP_DEU_ADRC
go
print N'Dropping [tsa].[ics_land_SAP_DEU_ZG01]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_ZG01
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBUP]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBUP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBUK]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBUK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBRK]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBRK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBPA]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBPA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBFA]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBFA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBAP]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBAP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_VBAK]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_VBAK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_TVKO]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_TVKO
go
print N'Dropping [tsa].[ics_land_SAP_DEU_TBRCT]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_TBRCT
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T052U]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T052U
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T016T]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T016T
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_T001]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001Z]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001Z
go
print N'Dropping [tsa].[ics_land_SAP_DEU_T001W]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_T001W
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MVKE]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MVKE
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARM]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARM
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARC]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARC
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MARA]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MARA
go
print N'Dropping [tsa].[ics_land_SAP_DEU_MAKT]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_MAKT
go
print N'Dropping [tsa].[ics_land_SAP_DEU_LIPS]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_LIPS
go
print N'Dropping [tsa].[ics_land_SAP_DEU_LIKP]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_LIKP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONV]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONV
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONP]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONP
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KONH]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KONH
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNVK]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNVK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNBK]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNBK
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNB1]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNB1
go
print N'Dropping [tsa].[ics_land_SAP_DEU_KNA1]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_KNA1
go
print N'Dropping [tsa].[ics_land_SAP_DEU_ADRC]'
go
if objectpropertyex(object_id(N'[tsa].[ics_land_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table tsa.ics_land_SAP_DEU_ADRC
go

