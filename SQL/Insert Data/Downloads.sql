use Resumes
go


;WITH cte
			(SubmoduleId	, DownloadDescription			, DownloadUrl										, UrlSourceTypeId		, Status)
 AS(
	SELECT	 23				, 'asp.net mvc code'			, 'https://github.com/rclark4077/Resume'			, 1						, 1		UNION
	SELECT	 24				, 'asp.net mvc code'			, 'https://github.com/rclark4077/ResumeTSQLScripts'	, 1						, 1
)	INSERT INTO Downloads
		(SubmoduleId		, DownloadDescription			, DownloadUrl										, UrlSourceTypeId		, Status)
	SELECT cte.SubmoduleId	, cte.DownloadDescription		, cte.DownloadUrl									, cte.UrlSourceTypeId	, cte.Status
		FROM cte
		ORDER BY cte.SubmoduleId


SELECT *
	FROM UrlSourceType


--23:  https://github.com/rclark4077/Resume
--24:  https://github.com/rclark4077/ResumeTSQLScripts

--		UPDATE s
--			set s.DownloadURL = 'test1'
--			from Submodule s
--			where s.SubmoduleId = 23

select *
	from Module
	where ModuleId = 6

SELECT *
  FROM [Resumes].[dbo].[Submodule]
  --WHERE SubmoduleID IN (23, 24)


SELECT *
	FROM dbo.Downloads

SELECT *
	FROM dbo.UrlSourceType