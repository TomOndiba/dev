-- <Migration ID="0b6860b0-c3ed-45bd-b15c-40a904944f87" />
go

print 'Dropping country-specific M3 landing tables...';
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_CCURRA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_CCURRA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_CSYTAB]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_CSYTAB]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MILOMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MILOMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MITAUN]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MITAUN]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MITBAL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MITBAL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MITFAC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MITFAC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MITLOC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MITLOC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_MITMAS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_MITMAS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OCHCUS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OCHCUS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OCUSMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OCUSMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OINVOH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OINVOH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OINVOL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OINVOL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OOHEAD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OOHEAD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OOLINE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OOLINE]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_BEL_OSBSTD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_BEL_OSBSTD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_CCURRA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_CCURRA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_CSYTAB]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_CSYTAB]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MILOMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MILOMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MITAUN]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MITAUN]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MITBAL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MITBAL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MITFAC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MITFAC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MITLOC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MITLOC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_MITMAS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_MITMAS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OCHCUS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OCHCUS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OCUSMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OCUSMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OINVOH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OINVOH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OINVOL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OINVOL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OOHEAD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OOHEAD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OOLINE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OOLINE]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_ESP_OSBSTD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_ESP_OSBSTD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_CCURRA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_CCURRA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_CSYTAB]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_CSYTAB]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MILOMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MILOMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MITAUN]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MITAUN]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MITBAL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MITBAL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MITFAC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MITFAC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MITLOC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MITLOC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_MITMAS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_MITMAS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OCHCUS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OCHCUS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OCUSMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OCUSMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OINVOH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OINVOH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OINVOL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OINVOL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OOHEAD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OOHEAD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OOLINE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OOLINE]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3_SWE_OSBSTD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3_SWE_OSBSTD]
go
