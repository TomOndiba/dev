-- <Migration ID="b8a844b5-6f23-4191-9acd-8bb8d4e04b91" />
GO

if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_ADRC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KNA1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KNB1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KNBK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KNVK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KONH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KONP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_KONV]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_LIKP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_LIPS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_MAKT]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_MARA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_MARC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_MARM]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_MVKE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_T001]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_T001]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_T001W]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_T001Z]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_T016T]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_T052U]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_TBRCT]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_TVKO]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBAK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBAP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBFA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBPA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBRK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBUK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_VBUP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_DEU_ZG01]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_ADR6]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_ADR6]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_ADRC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_ADRC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_EKKO]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_EKKO]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_EKPO]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_EKPO]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KNA1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KNA1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KNB1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KNB1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KNVH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KNVH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KNVK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KNVK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KONH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KONH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KONP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KONP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_KONV]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_KONV]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_LFA1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_LFA1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_LFB1]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_LFB1]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_LFBK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_LFBK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_LIKP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_LIKP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_LIPS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_LIPS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MACT]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MACT]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MAKT]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MAKT]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MARA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MARA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MARC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MARC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MARD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MARD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MARM]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MARM]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MBEW]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MBEW]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_MVKE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_MVKE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T001]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T001]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T001W]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T001W]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T006]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T006]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T006A]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T006A]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T016T]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T016T]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T023T]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T023T]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T052]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T052]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T151T]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T151T]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T25B2]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T25B2]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_T52U]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_T52U]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_TBRCT]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_TBRCT]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_TVK0]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_TVK0]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBAK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBAK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBAP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBAP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBFA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBFA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBPA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBPA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBRK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBRK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBRP]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBRP]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_VBUK]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_VBUK]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SAP_GBR_ZTERMS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_SAP_GBR_ZTERMS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_CCURRA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_CCURRA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_CSYTAB]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_CSYTAB]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MITAUN]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MITAUN]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_MITMAS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_MITMAS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OCHCUS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OCHCUS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OCUSMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OCUSMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OINVOH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OINVOH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OINVOL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OINVOL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OOHEAD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OOHEAD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OOLINE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OOLINE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_BEL_OSBSTD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_BEL_OSBSTD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_CCURRA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_CCURRA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_CSYTAB]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_CSYTAB]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MITAUN]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MITAUN]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_MITMAS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_MITMAS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OCHCUS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OCHCUS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OCUSMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OCUSMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OINVOH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OINVOH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OINVOL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OINVOL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OOHEAD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OOHEAD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OOLINE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OOLINE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_ESP_OSBSTD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_ESP_OSBSTD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_CCURRA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_CCURRA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_CSYTAB]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_CSYTAB]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MITAUN]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MITAUN]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_MITMAS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_MITMAS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OCHCUS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OCHCUS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OCUSMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OCUSMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OINVOH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OINVOH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OINVOL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OINVOL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OOHEAD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OOHEAD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OOLINE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OOLINE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3_SWE_OSBSTD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3_SWE_OSBSTD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_CCURRA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_CCURRA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_CSYTAB]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_CSYTAB]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MITAUN]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MITAUN]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_MITMAS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_MITMAS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OCHCUS]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OCHCUS]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OCUSMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OCUSMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OINVOH]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OINVOH]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OINVOL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OINVOL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OOHEAD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OOHEAD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OOLINE]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OOLINE]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_DNK_OSBSTD]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_DNK_OSBSTD]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_FRA_MILOMA]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_FRA_MILOMA]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_FRA_MITFAC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_FRA_MITFAC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_FRA_MITLOC]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_FRA_MITLOC]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_MITBAL]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_MITBAL]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_ccurra]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_ccurra]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_csytab]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_csytab]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_mitaun]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_mitaun]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_mitmas]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_mitmas]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_ochcus]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_ochcus]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_ocusma]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_ocusma]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_oinvoh]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_oinvoh]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_oinvol]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_oinvol]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_oohead]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_oohead]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_ooline]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_ooline]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_m3v7_fra_osbstd]'), N'IsUserTable') is not null drop table [psa].[ICS_STG_m3v7_fra_osbstd]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]'), N'IsUserTable') is not null
	drop table [tsa].[ICS_LAND_SampleSystemName_SourceCountryCode_SampleTableName]
go
if objectpropertyex(object_id(N'[psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]'), N'IsUserTable') is not null
	drop table [psa].[ICS_STG_SampleSystemName_SourceCountryCode_SampleTableName]
go
