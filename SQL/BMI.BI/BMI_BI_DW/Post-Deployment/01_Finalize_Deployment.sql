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
:r "..\Static Data\log4Private.JournalControl.data.sql"
:r "..\Static Data\log4Private.Severity.data.sql"

:r "..\Static Data\dbo.DataSource.data.sql"

:r "..\Static Data\stg.SSIS_BUDGET_RegionLookup.data.sql"
:r "..\Static Data\stg.SSIS_BUDGET_BusinessUnitLookup.data.sql"
:r "..\Static Data\stg.SSIS_BUDGET_ProductCategoryGroupLookup.data.sql"
:r "..\Static Data\stg.SSIS_BUDGET_ProductCategoryLookup.data.sql"
