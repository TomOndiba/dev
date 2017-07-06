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
:r ".\_data\log4Private.JournalControl.data.sql"
:r ".\_data\privy.StagingLoadParameter.data.sql"

:r ".\_data\log4Private.Severity.data.sql"

:r ".\_data\stg.ProductCategory.data.sql"
:r ".\_data\stg.Product.data.sql"
:r ".\_data\stg.Customer.data.sql"
:r ".\_data\stg.PaymentTerm.data.sql"
:r ".\_data\stg.BusinessUnit.data.sql"
:r ".\_data\stg.Site.data.sql"

