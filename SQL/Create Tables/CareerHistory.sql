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


    SET @tbl = 'CareerHistory'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.CareerHistory
            (
                CareerHistoryId         int             NOT NULL    IDENTITY (1, 1),
                ProfileId               int             NOT NULL,
                CompanyId               int             NOT NULL,
                StartDate               varchar(50)         NULL,
                EndDate                 varchar(50)         NULL
            )  ON [PRIMARY]
			
            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.CareerHistory 
                ADD CONSTRAINT [PK_CareerHistory] PRIMARY KEY CLUSTERED (CareerHistoryId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.CareerHistory
               ADD CONSTRAINT FK_CareerHistory_ProfileId FOREIGN KEY (ProfileId)
                  REFERENCES dbo.Profiles (ProfileId)
                  
            ALTER TABLE dbo.CareerHistory
               ADD CONSTRAINT FK_CareerHistory_CompanyId FOREIGN KEY (CompanyId)
                  REFERENCES dbo.Company (CompanyId)

            -- Defaults & Check Constraints
            ---===========---
            ---== INDEX ==---
            ---===========---
            CREATE NONCLUSTERED INDEX IX_CareerHistory_ProfileId ON dbo.CareerHistory
                (ProfileId) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

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
			DBCC CHECKIDENT('CareerHistory', RESEED, 1)
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


