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

:r "..\BMI_BAT_MAN\Static Data\privy.RunStateFlag.data.sql"
:r "..\BMI_BAT_MAN\Static Data\privy.RunState.data.sql"

exec tSQLt.RunAll;

