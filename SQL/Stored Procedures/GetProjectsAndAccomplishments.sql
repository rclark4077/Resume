SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetProjectsAndAccomplishments AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetProjectsAndAccomplishments
(
    @CompanyId          int				--REQUIRED
    ,@ErrorMsg          varchar(MAX)    OUTPUT
)
AS

SET NOCOUNT ON
SET XACT_ABORT ON

/**
CREATED BY: Randy Clark - 08/21/2020

DESCRIPTION:
    Returns Project info by company, includes Accomplishments (by company)

INPUT PARAMETERS:

    @CompanyId          -- the company id

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
Test With:
	use Resumes
	go

	DECLARE @CompanyId		int				= 2
			, @ErrorMsg		varchar(max)	= null
			, @ReturnValue	int				= null

	EXEC @ReturnValue = GetProjectsAndAccomplishments @CompanyId
														,@ErrorMsg OUTPUT
	SELECT @ReturnValue, @ErrorMsg

**/

-------------------------------------------------------
-- TRY CATCH
-------------------------------------------------------
BEGIN TRY

    -------------------------------------------------------
    -- Declaration
    -------------------------------------------------------
    DECLARE @LogValue               varchar(8000)
	DECLARE @ErrorLine				int

    -------------------------------------------------------
    -- Set Defaults
    -------------------------------------------------------
	SET @CompanyId = ISNULL(NULLIF(@CompanyId, ''), 0)

    -------------------------------------------------------
    -- Parameter(s) Checks
    -------------------------------------------------------
    IF @CompanyId IS NULL
    BEGIN
        SET @ErrorMsg='ERROR 2 '+OBJECT_NAME(@@PROCID)+', ' + 'MISSING_REQUIRED_PARAMETER [CompanyId]'
        RETURN 2
    END

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------

    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
    SELECT
		pro.ProjectId
			, pro.ProjectTypeId
			, pro.ProfileId
			, pro.ProjectDescription
			, co.CompanyId
			, co.CompanyName
			, ca.AccomplishmentId
			, ca.AccomplishmentDescription
			, ca.CareerHistoryId
		FROM dbo.Projects pro
			INNER JOIN dbo.Company					co ON pro.CompanyId=co.CompanyId
			INNER JOIN dbo.CareerHistory			ch ON co.CompanyId = ch.CompanyId
			INNER JOIN dbo.CareerAccomplishments	ca ON ch.CareerHistoryId = ca.CareerHistoryId
		WHERE @CompanyId IS NULL OR co.CompanyId = @CompanyId
    -------------------------------------------------------
    -- Normal return
    -------------------------------------------------------
    SET @ErrorMsg=NULL
    RETURN 0
END TRY
BEGIN CATCH
    -- Error Line Number << could be setup as an OUTPUT parameter to see this line error on PHP page
    SET @ErrorLine = ERROR_LINE();

    SET @ErrorMsg='%THERE_WAS_A_FATAL_ERROR*,PLEASE_CONTACT_HELP_DESK*,REFERENCE_LOG_ID* on Line: ' + @ErrorLine
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

