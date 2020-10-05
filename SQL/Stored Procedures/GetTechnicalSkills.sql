use Resumes;
go

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetTechnicalSkills AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetTechnicalSkills
(
    @ContactId			int				--REQUIRED
    ,@ErrorMsg          varchar(MAX)    OUTPUT
)
AS

SET NOCOUNT ON
SET XACT_ABORT ON

/**
CREATED BY: Randy Clark - 07/12/2020

DESCRIPTION:
    Returns social network contact information for inbound contact id

INPUT PARAMETERS:
	@ContactId			-- the person's contact id for this query
    @LastChgID          -- the employee logged in
    @ParentPhp_LogId    -- the php log id

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
    1000 - Error with TimeZone

TEST WITH:
	use Resumes;
	go

	DECLARE @ContactId			int				= 1
			,@ErrorMsg          varchar(MAX)	= null
			,@ReturnValue		int				= null

	EXEC @ReturnValue = GetTechnicalSkills @ContactId
											  ,@ErrorMsg 
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

    -------------------------------------------------------
    -- Set Defaults
    -------------------------------------------------------

    -------------------------------------------------------
    -- Parameter(s) Checks
    -------------------------------------------------------
    IF @ContactId IS NULL
    BEGIN
        SET @ErrorMsg='ERROR 2 '+OBJECT_NAME(@@PROCID)+', MISSING_REQUIRED_PARAMETER'
        RETURN 2
    END

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------

    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
	SELECT
		p.ProfileId
			, tst.TechnicalSkillTypeDescription
			, ts.TechnicalSkillDescription
		FROM Profiles					 	p
			INNER JOIN TechnicalSkills 		ts ON p.ProfileId=ts.ProfileId
			INNER JOIN TechnicalSkillTypes tst ON ts.TechnicalSkillTypeId=tst.TechnicalSkillTypeId
		WHERE (@ContactId IS NULL OR p.ProfileId=@ContactId)
		ORDER BY tst.SortOrder

    -------------------------------------------------------
    -- Normal return
    -------------------------------------------------------
    SET @ErrorMsg=NULL
    RETURN 0
END TRY
BEGIN CATCH
	SET @ErrorMsg = @@ERROR

    RETURN 1
END CATCH

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO 

