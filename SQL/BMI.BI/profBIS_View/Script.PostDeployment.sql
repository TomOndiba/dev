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
:r ".\Static Data\log4Private.JournalControl.data.sql"
:r ".\Static Data\privy.StagingLoadParameter.data.sql"

:r ".\Static Data\log4Private.Severity.data.sql"

:r ".\Static Data\stg.ProductCategory.data.sql"
:r ".\Static Data\stg.Product.data.sql"
:r ".\Static Data\stg.Customer.data.sql"
:r ".\Static Data\stg.PaymentTerm.data.sql"
:r ".\Static Data\stg.BusinessUnit.data.sql"
:r ".\Static Data\stg.Site.data.sql"

