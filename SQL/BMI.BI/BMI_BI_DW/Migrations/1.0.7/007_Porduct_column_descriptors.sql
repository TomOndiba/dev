-- <Migration ID="d39d7074-9bcd-486e-af63-4b8a4000760a" />
GO

PRINT N'Altering extended properties'
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Represents a Strategic Business Unit as imported from the QlikView data store.  An SBU may operate within a single country jurisdiction or across multiple countries; similarly a country may have more than one business unit', 'SCHEMA', N'qvstg', 'TABLE', N'BusinessUnit', NULL, NULL
GO
EXEC sp_updateextendedproperty N'MS_Description', N'A Customer is any legal entity to or through whom Icopal sells products (as imported from the QlikView data store) - including direct sales (e.g. construction company or contractor) or indirect (e.g. specifying architect)', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', NULL, NULL
GO
EXEC sp_updateextendedproperty N'MS_Description', N'Business-friendly name for a customer in the local language, is not guaranteed unique even within a single source system', 'SCHEMA', N'qvstg', 'TABLE', N'Customer', 'COLUMN', N'CustomerName'
GO
PRINT N'Creating extended properties'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Product, material or other goods sold by Icopal (regardless of whether made or bought in)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', NULL, NULL
GO
EXEC sp_addextendedproperty N'MS_Description', N'The unique identifier for a product record as maintained in the source system of record indicated by DataSourceKey', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'NativeProductKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The category that is directly associated with a product in the source system of record. "Base" in this context implies direct association but is no indication of actual level of the named category in any hierarchy.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryBaseLevel'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the top level node in the product category hierarchy.  Will typically always be the generic ultimate parent: "Icopal Sales Categories"', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel1 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel2'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel2 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel3'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel3 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel4'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of the next level down from ProductCategoryLevel4 in the product category hierarchy as defined at source (down to the minimum level of ProductCategoryBaseLevel)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductCategoryLevel5'
GO
EXEC sp_addextendedproperty N'MS_Description', N'More detailed description for a product which may include information about brand, colour, size etc.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductDescription1'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Database-specific surrogate key that uniquely identifies an Icopal product ', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductKey'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Business-friendly name for a product in the local language, is not guaranteed unique even within a single source system (may also include information about brand, colour, size etc.)', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductName'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Alternate operational number or code used to uniquely identify a product within the source business.  May or may not be the same as NativeProductKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductNumber'
GO
EXEC sp_addextendedproperty N'MS_Description', N'Reference to the unique identifier for a product type as identified within the source system of record indicated by DataSourceKey.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductTypeId'
GO
EXEC sp_addextendedproperty N'MS_Description', N'The name of a customer type used to classify products within a given source system indicated by DataSourceKey.  Meaning and range of values will vary between sources.', 'SCHEMA', N'qvstg', 'TABLE', N'Product', 'COLUMN', N'ProductTypeName'
GO
