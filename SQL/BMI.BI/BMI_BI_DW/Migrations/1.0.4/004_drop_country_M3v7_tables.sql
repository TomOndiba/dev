-- <Migration ID="b43a199a-fbf2-42fa-b18b-9a65fb465e6d" />
go

print 'Dropping country-specific M3v7 landing tables...';
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_CCURRA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_CCURRA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_CSYTAB]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_CSYTAB]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MILOMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MILOMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MITAUN]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MITAUN]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MITBAL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MITBAL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MITFAC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MITFAC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MITLOC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MITLOC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_MITMAS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_MITMAS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OCHCUS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OCHCUS]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OCUSMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OCUSMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OINVOH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OINVOH]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OINVOL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OINVOL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OOHEAD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OOHEAD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OOLINE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OOLINE]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_DNK_OSBSTD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_DNK_OSBSTD]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_ccurra]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_ccurra]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_csytab]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_csytab]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_FRA_MILOMA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_FRA_MILOMA]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_mitaun]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_mitaun]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_MITBAL]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_MITBAL]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_FRA_MITFAC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_FRA_MITFAC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_FRA_MITLOC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_FRA_MITLOC]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_mitmas]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_mitmas]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_ochcus]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_ochcus]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_ocusma]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_ocusma]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_oinvoh]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_oinvoh]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_oinvol]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_oinvol]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_oohead]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_oohead]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_ooline]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_ooline]
go
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_m3v7_fra_osbstd]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_m3v7_fra_osbstd]
go
