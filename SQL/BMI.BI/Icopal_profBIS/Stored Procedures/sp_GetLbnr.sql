CREATE PROCEDURE [dbo].[sp_GetLbnr] @LbnrType VarChar(100), @Lbnr int Output
AS

Set nocount on

BEGIN TRANSACTION

  If not exists (Select LbnrType from FlexLbnr where LbnrType = @LbnrType)
  Begin
     Insert into FlexLbnr (LbnrType,Lbnr) Values (@LbnrType,0)
  End

  Update FlexLbnr
    Set Lbnr = Lbnr + 1
    Where LbnrType = @LbnrType

  Select @Lbnr = (Select Lbnr From FlexLbnr
     Where LbnrType = @LbnrType)

Commit