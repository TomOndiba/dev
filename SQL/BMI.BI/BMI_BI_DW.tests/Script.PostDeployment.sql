/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
:r "..\BMI_BI_DW\Static Data\log4Private.JournalControl.data.sql"
:r "..\BMI_BI_DW\Static Data\log4Private.Severity.data.sql"

:r "..\BMI_BI_DW\Static Data\dbo.DataSource.data.sql"

:r "..\BMI_BI_DW\Static Data\stg.SSIS_BUDGET_RegionLookup.data.sql"
:r "..\BMI_BI_DW\Static Data\stg.SSIS_BUDGET_BusinessUnitLookup.data.sql"
:r "..\BMI_BI_DW\Static Data\stg.SSIS_BUDGET_ProductCategoryGroupLookup.data.sql"
:r "..\BMI_BI_DW\Static Data\stg.SSIS_BUDGET_ProductCategoryLookup.data.sql"

:r "..\BMI_BI_DW\Static Data\dbo.Country.data.sql"
:r "..\BMI_BI_DW\Static Data\dbo.Culture.data.sql"

:r "..\BMI_BI_DW\Static Data\dbo.TranslationStatus.data.sql"

--! It appears that not all roles and permissions get pulled across so re-apply those now
:r "..\CreateRoleScripts\BMI_BI_DW Roles and Permissions.sql"
go

--!
--! We need to fool ReadyRoll into thinking that all migrations have already been applied
--! in BMI_BI_DW.tests (since it is derived from the BMI_BI_DW_ukglu_SHADOW dacpac which
--! is the latest version of the ReadyRoll project anyway).  We need to do this because
--! sometimes, if we have done a lot of application development in the tests database,
--! we temporarily reditect the BMI_BI_DW ReadyRoll project to BMI_BI_DW.tests so we can
--! ensure we capture all completed and tests application code changes.
--!
truncate table dbo.__MigrationLog;
go

set identity_insert dbo.__MigrationLog on;
go

insert dbo.__MigrationLog
(
  migration_id
, script_checksum
, script_filename
, complete_dt
, applied_by
, deployed
, [version]
, package_version
, release_version
, sequence_no
)
select
	migration_id
  , script_checksum
  , script_filename
  , complete_dt
  , applied_by
  , deployed
  , [version]
  , package_version
  , release_version
  , sequence_no
from
	BMI_BI_DW.dbo.__MigrationLog
go

set identity_insert dbo.__MigrationLog off;
go

--!
--! Remove these tests from the tests database for now (they will be removed from the main project too soon)
--!
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_ADRC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_ADRC]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNA1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KNA1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNB1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KNB1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNBK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KNBK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KNVK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KNVK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KONH]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KONP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_KONV]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_KONV]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_LIKP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_LIKP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_LIPS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_LIPS]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MAKT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_MAKT]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_MARA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_MARC]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MARM]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_MARM]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_MVKE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_MVKE]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_T001]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001W]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_T001W]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T001Z]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_T001Z]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T016T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_T016T]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_T052U]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_T052U]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_TBRCT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_TBRCT]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_TVKO]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_TVKO]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBAK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBAK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBAP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBAP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBFA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBFA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBPA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBPA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBRK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBRK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBUK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBUK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_VBUP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_VBUP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_DEU_ZG01]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_DEU_ZG01]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ADR6]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ADR6]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ADRC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ADRC]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_EKKO]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_EKKO]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_EKPO]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_EKPO]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNA1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNA1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNB1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNB1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNVH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNVH]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KNVK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KNVK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONH]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONH]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_KONV]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_KONV]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFA1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFA1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFB1]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFB1]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LFBK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LFBK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LIKP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LIKP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_LIPS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_LIPS]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MACT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MACT]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MAKT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MAKT]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARC]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARC]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARD]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARD]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MARM]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MARM]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MBEW]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MBEW]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_MVKE]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_MVKE]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T001]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T001]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T001W]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T001W]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T006]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T006]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T006A]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T006A]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T016T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T016T]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T023T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T023T]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T052]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T052]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T151T]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T151T]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T25B2]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T25B2]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_T52U]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_T52U]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_TBRCT]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_TBRCT]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_TVK0]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_TVK0]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBAK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBAK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBAP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBAP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBFA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBFA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBPA]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBPA]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBRK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBRK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBRP]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBRP]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_VBUK]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_VBUK]
if objectpropertyex(object_id(N'[tsa].[ICS_LAND_SAP_GBR_ZTERMS]'), N'IsUserTable') is not null drop table [tsa].[ICS_LAND_SAP_GBR_ZTERMS]
go

--!
--! Finally, run all un it tests as part of any build
--!
exec tSQLt.RunAll;
go


