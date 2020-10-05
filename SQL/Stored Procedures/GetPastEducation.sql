SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetPastEducation AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetPastEducation
(
    @Id					int				--REQUIRED
    , @ErrorMsg         varchar(400)    OUTPUT
)
AS

SET NOCOUNT ON
SET XACT_ABORT ON

/**
CREATED BY: Randy Clark - 04/12/2018

DESCRIPTION:
    Returns the the open Cash Receipts Header data - used more to grab already saved Voucher header (that has not been Posted)

INPUT PARAMETERS:

    @Id					-- the Student Id

OUTPUT PARAMETERS:
    @ErrorMsg           -- used to output a error message if one occurs, otherwise returns null

NORMAL RESULT SET:
    see query

ERROR RESULT SET:
    none

RETURN VALUES:
    0 - Everything is fine, Normal Return
    1 - Error Occurred: Fatal Error
    2 - Error Occurred: Missing Required Parameter

TEST WITH:
	use Resumes;
	go

	DECLARE @ProfileId			int				= 1
			,@ErrorMsg          varchar(MAX)	= null
			,@ReturnValue		int				= null

	EXEC @ReturnValue = GetPastEducation @ProfileId
											  ,@ErrorMsg 
	SELECT @ReturnValue, @ErrorMsg

**/

-------------------------------------------------------
-- TRY CATCH
-------------------------------------------------------
BEGIN TRY
    --#BEGIN_GLOBAL_SECTION#
    --DECLARE @SpIncludeSpName        varchar(128)
    --DECLARE @SpIncludeErrorMsg      varchar(400)
    --DECLARE @SpIncludeReturnValue   int

    --SET @SpIncludeSpName=OBJECT_NAME(@@PROCID)

    --EXECUTE @SpIncludeReturnValue=GEN_SP_GEN_SpInclude @SpIncludeSpName, @LastChgID, @SpIncludeErrorMsg OUTPUT

    ----Get Time Zone
    --DECLARE @TimeZoneReturnValue    int
    --DECLARE @TimeZoneErrorMsg       varchar(400)
    --DECLARE @TimeZoneOffset         int
    --DECLARE @TimeZoneCode           varchar(6)
    --DECLARE @TimeZoneDescription    varchar(100)

    --EXECUTE @TimeZoneReturnValue=GEN_SP_REG_Lookup_TimeZoneInfo NULL, NULL, @LastChgID, @TimeZoneErrorMsg OUTPUT, @TimeZoneOffset OUTPUT, @TimeZoneCode OUTPUT, @TimeZoneDescription OUTPUT

    --IF @TimeZoneReturnValue!=0
    --BEGIN
    --    SET @ErrorMsg='ERROR 1000, '+OBJECT_NAME(@@PROCID)+': '+@TimeZoneErrorMsg
    --    RETURN 1000
    --END
    --#END_GLOBAL_SECTION#

    -------------------------------------------------------
    -- Declaration
    -------------------------------------------------------
    DECLARE @LogValue               varchar(8000)
	DECLARE @ErrorLine				int

    -------------------------------------------------------
    -- Set Defaults
    -------------------------------------------------------
	SET @Id = ISNULL(NULLIF(@Id, ''), 1)

    -------------------------------------------------------
    -- Parameter(s) Checks
    -------------------------------------------------------
    IF @Id IS NULL
    BEGIN
        SET @ErrorMsg='ERROR 2 '+OBJECT_NAME(@@PROCID)+', MISSING_REQUIRED_PARAMETER [@Id'
        RETURN 2
    END

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------

    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
    -- Query goes here

	SELECT
		s.ProfileId
			, s.InstitutionId
			, ei.InstitutionDescription
			, s.Major
			, s.Curriculum
			, s.Degree
			, s.GraduationDate
		FROM dbo.Students							s 
			INNER JOIN dbo.EducationalInstitution	ei ON s.InstitutionId=ei.InstitutionId
		WHERE @Id IS NULL OR s.ProfileId = @Id

    -------------------------------------------------------
    -- Normal return
    -------------------------------------------------------
    SET @ErrorMsg=NULL
    RETURN 0
END TRY
BEGIN CATCH
    -- Error Line Number << could be setup as an OUTPUT parameter to see this line error on PHP page
    SET @ErrorLine = ERROR_LINE();


    SET @ErrorMsg='%THERE_WAS_A_FATAL_ERROR*,PLEASE_CONTACT_HELP_DESK*,REFERENCE_LOG_ID*'
    SET @LogValue=CASE WHEN ERROR_NUMBER()     IS NOT NULL THEN 'Msg '         +CONVERT(varchar(30),   ERROR_NUMBER()     ) ELSE '' END
                 +CASE WHEN ERROR_SEVERITY()   IS NOT NULL THEN ', Level '     +CONVERT(varchar(30),   ERROR_SEVERITY()   ) ELSE '' END
                 +CASE WHEN ERROR_STATE()      IS NOT NULL THEN ', State '     +CONVERT(varchar(30),   ERROR_STATE()      ) ELSE '' END
                 +CASE WHEN ERROR_PROCEDURE()  IS NOT NULL THEN ', Procedure ' +                       ERROR_PROCEDURE()    ELSE '' END
                 +CASE WHEN ERROR_LINE()       IS NOT NULL THEN ', Line '      +CONVERT(varchar(30),   ERROR_LINE()       ) ELSE '' END
                 +CASE WHEN ERROR_MESSAGE()    IS NOT NULL THEN ', '           +                       ERROR_MESSAGE()      ELSE '' END

    RETURN 1
END CATCH

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO 

