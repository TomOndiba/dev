CREATE ROLE [CodeReviewers]
AUTHORIZATION [dbo]GRANT VIEW DEFINITION TO [CodeReviewers]

GO
EXEC sp_addrolemember N'CodeReviewers', N'EtlDevelopersDEV'
GO
