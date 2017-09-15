-- <Migration ID="c02ad57c-ea22-4a97-9c1e-572ebbba926e" />
GO

if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ADR6]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ADR6]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ADRC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ADRC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_EKKO]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_EKKO]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_EKPO]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_EKPO]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNA1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNA1]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNB1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNB1]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNVH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNVH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNVK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNVK]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONP]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONV]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONV]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFA1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFA1]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFB1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFB1]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFBK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFBK]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LIKP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LIKP]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LIPS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LIPS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MACT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MACT]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MAKT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MAKT]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARM]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARM]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MBEW]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MBEW]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MVKE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MVKE]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T001]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T001]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T001W]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T001W]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T006]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T006]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T006A]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T006A]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T016T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T016T]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T023T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T023T]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T052]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T052]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T151T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T151T]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T25B2]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T25B2]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T52U]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T52U]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_TBRCT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_TBRCT]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_TVK0]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_TVK0]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBAK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBAK]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBAP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBAP]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBFA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBFA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBPA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBPA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBRK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBRK]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBRP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBRP]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBUK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBUK]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ZTERMS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ZTERMS]
go
