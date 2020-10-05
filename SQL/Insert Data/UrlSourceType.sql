use Resumes
go


;WITH cte
		(UrlSourceTypeDescription			, Status)
AS (
	--SELECT 'Github'							, 1		UNION
	SELECT 'Word DOcument'					, 1
)	INSERT INTO UrlSourceType
		(UrlSourceTypeDescription			, Status)
	SELECT UrlSourceTypeDescription			, Status
		FROM cte


SELECT *
	FROM UrlSourceType