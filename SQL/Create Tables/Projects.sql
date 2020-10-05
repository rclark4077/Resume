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


    SET @tbl = 'Projects'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.Projects
            (
                ProjectId				int             NOT NULL    IDENTITY (1, 1),
                ProjectTypeId           int             NOT NULL,
				ProfileId				int				NOT NULL,
                CompanyId               int             NOT NULL,
                ProjectTitle			varchar(100)        NULL,
                ProjectDescription		varchar(MAX)        NULL
            )  ON [PRIMARY]
			
            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.Projects 
                ADD CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED (ProjectId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.Projects
               ADD CONSTRAINT FK_Projects_ProjectTypeId FOREIGN KEY (ProjectTypeId)
                  REFERENCES dbo.ProjectTypes (ProjectTypeId)

            ALTER TABLE dbo.Projects
               ADD CONSTRAINT FK_Projects_ProfileId FOREIGN KEY (ProfileId)
                  REFERENCES dbo.Profiles (ProfileId)
                  
            ALTER TABLE dbo.Projects
               ADD CONSTRAINT FK_Projects_CompanyId FOREIGN KEY (CompanyId)
                  REFERENCES dbo.Company (CompanyId)

            -- Defaults & Check Constraints
            ---===========---
            ---== INDEX ==---
            ---===========---
            CREATE NONCLUSTERED INDEX IX_Projects_ProjectTitle ON dbo.Projects
                (ProjectTitle) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            ---=========================---
            ---== COLUMN DESCRIPTIONS ==---
            ---=========================---
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
			DBCC CHECKIDENT('Projects', RESEED, 1)
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


