use Resumes;
go

SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

BEGIN TRY
    --if procedure does not exist, create a simple version that the ALTER will replace.  if it does exist, the BEGIN CATCH will eliminate any error message or batch stoppage
    EXEC ('CREATE PROCEDURE GetProfileInformation AS DECLARE @M varchar(100); SET @M=ISNULL(OBJECT_NAME(@@PROCID), ''unknown'')+'' was not created!''; RAISERROR(@M,16,1);return 9999')
END TRY
BEGIN CATCH
END CATCH
GO

ALTER PROCEDURE GetProfileInformation
(
    @ProfileId			int				--REQUIRED
    ,@ErrorMsg          varchar(900)    OUTPUT
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
    2 - Error Occurred: Missing Required Parameter
    1000 - Error with TimeZone

TEST WITH:
	use Resumes;
	go

	DECLARE @ProfileId			int				= 1
			,@ErrorMsg          varchar(MAX)	= null
			,@ReturnValue		int				= null

	EXEC @ReturnValue = GetProfileInformation @ProfileId
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
    --IF @ProfileId IS NULL
    --BEGIN
    --    SET @ErrorMsg='ERROR 2 '+OBJECT_NAME(@@PROCID)+', MISSING_REQUIRED_PARAMETER'
    --    RETURN 2
    --END

    -------------------------------------------------------
    -- Log
    -------------------------------------------------------

    -------------------------------------------------------
    -- Query
    -------------------------------------------------------
	SELECT	
		p.ProfileId
			, ISNULL(p.FirstName, '')						as FirstName
			, ISNULL(p.MiddleName, '')						as MiddleName
			, ISNULL(p.LastName, '')						as LastName
			, ISNULL(p.Address1, '')						as Address1
			, ISNULL(CONVERT(varchar, p.Address2), '')		as Address2
			, ISNULL(CONVERT(varchar, p.Address3), '')		as Address3
			, ISNULL(p.City, '')							as City
			, ISNULL(p.StateInitials, '')					as StateInitials
			, ISNULL(p.ZipCode, '')							as ZipCode
			, ISNULL(CONVERT(varchar, p.ZipCodeSuffix), '')	as ZipCodeSuffix
			, ISNULL(p.PhoneNumber, '')						as PhoneNumber
			, ISNULL(p.IsSelf, 0)							as IsSelf
			, 0												as CompanyId
		FROM dbo.Profiles p
			INNER JOIN dbo.ProfileAttributes
		WHERE (@ProfileId IS NULL OR p.ProfileId=@ProfileId)

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

