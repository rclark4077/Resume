/*  -------------------------------------------------------

    RETURN Type
            0   - Normal Return
            9   - Catch Block Error

    ------------------------------------------------------- */
use Resumes
go

DECLARE @tbl        varchar(254)
        ,@output    varchar(254)
        ,@v         sql_variant

    SET @tbl = 'Downloads'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.Downloads
            (
                DownloadId				int             NOT NULL    IDENTITY (1, 1),
				SubmoduleId				int					NULL,
				ProfileId				int				NOT NULL,
				DownloadDescription		varchar(254)	NOT NULL,
				DownloadUrl				varchar(254)	NOT NULL,
				UrlSourceTypeId			int				NOT NULL,
				Status					int				NOT NULL	DEFAULT (1), -- 0=Inactive, 1=Active
            )  ON [PRIMARY]
			
            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.Downloads 
                ADD CONSTRAINT [PK_Downloads] PRIMARY KEY CLUSTERED (DownloadId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.Downloads
               ADD CONSTRAINT FK_Downloads_SubmoduleId FOREIGN KEY (SubmoduleId)
                  REFERENCES dbo.Submodule (SubmoduleId)

            ALTER TABLE dbo.Downloads
               ADD CONSTRAINT FK_Downloads_ProfileId FOREIGN KEY (ProfileId)
                  REFERENCES dbo.Profiles (ProfileId)

            ALTER TABLE dbo.Downloads
               ADD CONSTRAINT FK_Downloads_UrlSourceTypeId FOREIGN KEY (UrlSourceTypeId)
                  REFERENCES dbo.UrlSourceType (UrlSourceTypeId)

            -- Defaults & Check Constraints

            ---===========---
            ---== INDEX ==---
            ---===========---

            ---=========================---
            ---== COLUMN DESCRIPTIONS ==---
            ---=========================---
            SET @v = N'0=Inactive, 1=Active'
            EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Downloads', N'COLUMN', N'Status'
        END
        ELSE -- stop sql code execution and jump to CATCH Block [Commit will not execute]
        BEGIN
            SET @output = (SELECT 'table: ' + db_name() + '.'+ @tbl + ' already exists')
            RAISERROR(@output, 16, 1)
        END
        ---========================---
        ---== COMMIT Transaction ==---
        ---========================---
        IF XACT_STATE()!=0
        BEGIN
            COMMIT
            
            -- Display Success
            SET @output = (SELECT 'Successfully added table: ' + @tbl + ' with all keys, indices, constraints and descriptions in database: ' + db_name() + ' ------------------------')
            PRINT @output

			-- reseed if had to drop & re-create
			DBCC CHECKIDENT('Downloads', RESEED, 1)
        END
END TRY
BEGIN CATCH
    ---==========================---
    ---== ROLLBACK Transaction ==---
    ---==========================---
    SET @output = ERROR_MESSAGE()

    ROLLBACK TRANSACTION
    PRINT 'RESULTS: ' + @output
END CATCH


