create PROCEDURE [dbo].[sp_Update_Supplier] @SystemID Int, 
                                            @SUPPLIER_CODE nVarChar(50), 
                                            @SUPPLIER_NAME nVarChar(200)
AS

Set nocount on

BEGIN TRANSACTION

  Update PU_SUPPLIER
    Set SUPPLIER_NAME = @SUPPLIER_NAME
    Where SYSTEM_ID     = @SystemID and
          SUPPLIER_CODE = @SUPPLIER_CODE

Commit