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

:r "..\BMI_BAT_MAN\Static Data\dbo.StubResultSet.Data.sql"

:r "..\BMI_BAT_MAN\Static Data\log4Private.JournalControl.data.sql"
:r "..\BMI_BAT_MAN\Static Data\log4Private.Severity.data.sql"

:r "..\BMI_BAT_MAN\Static Data\batch.RunStateFlag.data.sql"
:r "..\BMI_BAT_MAN\Static Data\batch.RunState.data.sql"


--!
--! Seems like not all the permissions are carried across to the dacpac
--! (which the "tests" project references so re-apply them again now
--!
:r "..\CreateRoleScripts\BMI_BAT_MAN Roles and Permissions.sql"
go

--!
--! We need to fool ReadyRoll into thinking that all migrations have already been applied
--! in BMI_BI_DW.tests (since it is derived from the BMI_BI_DW_ukglu_SHADOW dacpac which
--! is the latest version of the ReadyRoll project anyway)
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
	BMI_BAT_MAN.dbo.__MigrationLog
go

set identity_insert dbo.__MigrationLog off;
go

--!
--! Finally, run all un it tests as part of any build
--!
exec tSQLt.RunAll;
go



