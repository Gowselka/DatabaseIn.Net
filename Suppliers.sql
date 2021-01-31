CREATE TABLE [dbo].[Table]
(
	[SupplierID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [CompanyName] NCHAR(250) NOT NULL, 
    [Country] NCHAR(300) NOT NULL, 
    [ContactName] NCHAR(300) NOT NULL
)
