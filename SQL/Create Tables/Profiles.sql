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


    SET @tbl = 'Profiles'

BEGIN TRY
    BEGIN TRANSACTION
        -- add table
        IF NOT EXISTS (SELECT *
                            FROM sys.objects            o
                                INNER JOIN sys.columns  c ON  o.[object_id] = c.[object_id]
                            WHERE o.name = @tbl)
        BEGIN
            PRINT '-- Create Table '+@tbl+ ' in '+db_name()+ ' ----------------------------------------------'
            CREATE TABLE dbo.Profiles
            (
                ProfileId           int             NOT NULL    IDENTITY (1, 1),
                FirstName           char(50)        NOT NULL,
                MiddleName          char(50)        NOT NULL,
                LastName            char(50)        NOT NULL,
                Address1            char(75)            NULL,
                Address2            char(75)            NULL,
                Address3            char(75)            NULL,
				City				char(100)		NOT NULL,
				StateInitials		char(2)			NOT NULL,
				ZipCode				int				NOT NULL,
				ZipCodeSuffix		int					NULL,
                PhoneNumber         varchar(25)         NULL,
                IsSelf              bit             NOT NULL    DEFAULT(0),
                CompanyId           int                 NULL    DEFAULT(null)
            )  ON [PRIMARY]
			
            ---========================---
            ---== KEYS & CONSTRAINTS ==---
            ---========================---
            -- Primary Key Clustered ASC
            ALTER TABLE dbo.Profiles 
                ADD CONSTRAINT [PKProfiles] PRIMARY KEY CLUSTERED (ProfileId ASC)
                WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

            -- Foreign Key Constraints
            ALTER TABLE dbo.Profiles
               ADD CONSTRAINT FK_Profiles_StateInitials FOREIGN KEY (StateInitials)
                  REFERENCES dbo.States (StateInitials)

            -- Defaults & Check Constraints

            ---===========---
            ---== INDEX ==---
            ---===========---

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
			
			-- Reseed if had to drop & re-create
			DBCC CHECKIDENT('Profiles', RESEED, 1)
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


