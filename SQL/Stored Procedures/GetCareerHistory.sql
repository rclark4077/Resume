use Resumes;
go

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetCareerHistorySummary AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetCareerHistorySummary
(
    @ProfileId			int				--REQUIRED
    , @ErrorMsg			varchar(900)    OUTPUT
)
AS

SET NOCOUNT ON
SET XACT_ABORT ON

/**
CREATED BY: Randy Clark - 07/12/2018

DESCRIPTION:
    Returns social network contact information for inbound contact id

INPUT PARAMETERS:
	@ProfileId			-- the person's contact id for this query
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
    2 - Error Occurred: Missing Required Parameter: @ProfileId

TEST WITH:
	use Resumes;
	go

	DECLARE @ProfileId			int				= 0
			,@ErrorMsg          varchar(MAX)	= null
			,@ReturnValue		int				= null

	EXEC @ReturnValue = GetCareerHistorySummary @ProfileId
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
    --DECLARE @LogValue               varchar(8000)

    -------------------------------------------------------
    -- Set Defaults
    -------------------------------------------------------

    -------------------------------------------------------
    -- Parameter(s) Checks
    -------------------------------------------------------
	SET @ProfileId = NULLIF(@ProfileId, 0)

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------



    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
	SELECT
		co.CompanyId
			, ch.ProfileId
			, ch.CareerHistoryId
			, co.CompanyName
			, cp.CareerPositionId
			, cp.Roleheader
			, cp.WorkTitle
			, cp.WorkDescription
			, ch.StartDate
			, ch.EndDate
		FROM dbo.Profiles					p
			INNER JOIN dbo.CareerHistory	ch ON p.ProfileId=ch.ProfileId
			INNER JOIN dbo.Company			co ON ch.CompanyId=co.CompanyId
			INNER JOIN dbo.CareerPositions	cp ON ch.CareerHistoryId=cp.CareerHistoryId
		WHERE @ProfileId IS NULL OR p.ProfileId=@ProfileId
		ORDER BY ch.StartDate DESC

    -------------------------------------------------------
    -- Normal return
    -------------------------------------------------------
    --SET @ErrorMsg=NULL
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

