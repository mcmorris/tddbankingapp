ALTER TABLE [dbo].[Accounts]			DROP CONSTRAINT FK_AccountTotals
ALTER TABLE [dbo].[Accounts]			DROP CONSTRAINT FK_AccountUser
GO

DROP TABLE [dbo].[Accounts]
GO

DROP TABLE [dbo].[AuditAll]
GO