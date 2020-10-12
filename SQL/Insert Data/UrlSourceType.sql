use Resumes
go


;WITH cte
		(UrlSourceTypeDescription			, Status)
AS (
	--SELECT 'Github'							, 1		UNION
	SELECT 'Word Document'					, 1
)	INSERT INTO UrlSourceType
		(UrlSourceTypeDescription			, Status)
	SELECT UrlSourceTypeDescription			, Status
		FROM cte


UPDATE u
	set u.UrlSourceTypeDescription = 'Word Document'
	from UrlSourceType u
	WHERE UrlSourceTypeId = 2



SELECT *
	FROM UrlSourceType