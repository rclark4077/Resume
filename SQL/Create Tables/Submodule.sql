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

    SET @tbl = 'Submodule'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.Submodule
            (
                SubmoduleId				int             NOT NULL    IDENTITY (1, 1),
                SubmoduleDescription	varchar(50)     NOT NULL,
				ModuleId				int				NOT NULL,
				SortOrder				int				NOT NULL,
				ControllerName			varchar(50)			NULL,
				ActionName				varchar(50)			NULL,
                SecurityLevel           int             NOT NULL,
				CompanyId				int					NULL,
				ProjectId				int					NULL,
				DownloadURL				varchar(254)		NULL,
				Status					int				NOT NULL	DEFAULT (0), -- 0=No, 1=Yes
            )  ON [PRIMARY]
			
            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.Submodule 
                ADD CONSTRAINT [PK_Submodule] PRIMARY KEY CLUSTERED (SubmoduleId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.Submodule
               ADD CONSTRAINT FK_Submodule_ModuleId FOREIGN KEY (ModuleId)
                  REFERENCES dbo.Module (ModuleId)

            -- Defaults & Check Constraints
			ALTER TABLE dbo.Submodule WITH CHECK
				ADD CONSTRAINT UC_Submodule_SubmoduleDescription UNIQUE (SubmoduleDescription)

			ALTER TABLE dbo.Submodule WITH CHECK
				ADD CONSTRAINT UC_SubModule_SortOrder UNIQUE (ModuleId, SortOrder)

            ---===========---
            ---== INDEX ==---
            ---===========---

            ---=========================---
            ---== COLUMN DESCRIPTIONS ==---
            ---=========================---
            SET @v = N'0=No, 1=Yes'
            EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Submodule', N'COLUMN', N'Status'
			
            SET @v = N'Must be unique by ModuleId:  If ModuleId=1, then no 2 Submodules can be same sort order having the same ModuleId'
            EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'Submodule', N'COLUMN', N'SortOrder'
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
			DBCC CHECKIDENT('Submodule', RESEED, 1)
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


