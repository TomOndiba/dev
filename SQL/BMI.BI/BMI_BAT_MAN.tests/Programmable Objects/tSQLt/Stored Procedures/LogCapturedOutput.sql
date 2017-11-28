﻿IF OBJECT_ID('[tSQLt].[LogCapturedOutput]') IS NOT NULL
	DROP PROCEDURE [tSQLt].[LogCapturedOutput];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---Build+
CREATE PROCEDURE [tSQLt].[LogCapturedOutput] @text NVARCHAR(MAX)
AS
BEGIN
  INSERT INTO tSQLt.CaptureOutputLog (OutputText) VALUES (@text);
END;
---Build-
GO
