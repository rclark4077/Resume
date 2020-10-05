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


    SET @tbl = 'TechnicalSkills'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.TechnicalSkills
            (
                TechnicalSkillId            int             NOT NULL    IDENTITY (1, 1),
                TechnicalSkillDescription	varchar(MAX)	NOT NULL,
                TechnicalSkillTypeId        int             NOT NULL,
                ProfileId					int                 NULL,
				Status						int				NOT NULL	DEFAULT(1)
            )  ON [PRIMARY]


            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.TechnicalSkills 
                ADD CONSTRAINT [PK_TechnicalSkills] PRIMARY KEY CLUSTERED (TechnicalSkillId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.TechnicalSkills
               ADD CONSTRAINT FK_TechnicalSkills_TechnicalSkillTypeId FOREIGN KEY (TechnicalSkillTypeId)
                  REFERENCES dbo.TechnicalSkillTypes (TechnicalSkillTypeId)
                  
            -- Foreign Key Constraints
            ALTER TABLE dbo.TechnicalSkills
               ADD CONSTRAINT FK_TechnicalSkills_ProfileId FOREIGN KEY (ProfileId)
                  REFERENCES dbo.Profiles (ProfileId)

            -- Defaults & Check Constraints
			ALTER TABLE dbo.TechnicalSkills WITH CHECK
				ADD CONSTRAINT UC_TechnicalSkills_ProfileId_TechnicalSkillTypeId
					UNIQUE NONCLUSTERED (ProfileId, TechnicalSkillTypeId)

            ---===========---
            ---== INDEX ==---
            ---===========---

            ---=========================---
            ---== COLUMN DESCRIPTIONS ==---
            ---=========================---
            SET @v = N'0=Disabled, 1=Active'
            EXECUTE sp_addextendedproperty N'MS_Description', @v, N'SCHEMA', N'dbo', N'TABLE', N'INV_T_IMR_Request_Detail', N'COLUMN', N'Status'
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


