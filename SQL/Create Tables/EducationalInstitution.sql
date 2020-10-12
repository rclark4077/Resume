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


    SET @tbl = 'EducationalInstitution'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.EducationalInstitution
            (
                InstitutionId           int             NOT NULL    IDENTITY (1, 1),
                InstitutionDescription  varchar(100)    NOT NULL,
				InstitutionStatus		int				NOT NULl	DEFAULT(1),
				SortOrder				int				NOT NULL
            )  ON [PRIMARY]


            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.EducationalInstitution 
                ADD CONSTRAINT [PK_EducationalInstitution] PRIMARY KEY CLUSTERED (InstitutionId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints

            -- Defaults & Check Constraints

            ---===========---
            ---== INDEX ==---
            ---===========---
            CREATE NONCLUSTERED INDEX IX_EducationalInstitution_SortOrder ON dbo.EducationalInstitution
                (SortOrder) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            ---=========================---
            ---== COLUMN DESCRIPTIONS ==---
            ---=========================---
            SET @v = N'InstitutionStatus valid values: 0=Inactive, 1=Active'
            EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'EducationalInstitution', N'COLUMN', N'InstitutionStatus'
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


