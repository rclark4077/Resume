use Resumes;
go

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetCareerHistoryDetail AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetCareerHistoryDetail
(
    @CareerHistoryId	int				--REQUIRED
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
	@CareerHistoryId	-- the reference Career History Id

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

	DECLARE @CareerHistoryId	int				= 2
			,@ErrorMsg          varchar(MAX)	= null
			,@ReturnValue		int				= null

	EXEC @ReturnValue = GetCareerHistoryDetail @CareerHistoryId
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

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------

    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
	SELECT
		ch.CareerHistoryId
			, cp.CareerPositionId
			, cp.RoleHeader
			, cp.WorkTitle
			, cp.WorkDescription
		FROM CareerHistory 							ch
			LEFT OUTER JOIN CareerPositions			cp ON cp.CareerHistoryId=ch.CareerHistoryId
		WHERE (@CareerHistoryId IS NULL OR ch.CareerHistoryId=@CareerHistoryId)
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

