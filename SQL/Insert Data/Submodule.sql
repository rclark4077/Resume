use Resumes
go

;WITH cte
	(SubmoduleDescription					, ModuleId		, SortOrder		, ControllerName		, ActionName		, SecurityLevel		, CompanyId		, ProjectId			, Status)
AS (
	--SELECT 'personal skills'				, 2				, 1				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'programming languages'			, 2				, 2				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'database systems'				, 2				, 3				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'software'						, 2				, 4				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'davenport university'			, 3				, 1				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'kalamazoo community college'	, 3				, 2				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'cisco systems'					, 3				, 3				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'new horizons learning center'	, 3				, 4				, null					, null				, 70				, null			, null				, 0				UNION ALL	-- module:  qualifications
	--SELECT 'uniform color co'				, 4				, 1				, null					, null				, 70				, 4				, null				, 1				UNION ALL	-- module:  professional history
	--SELECT 'kendall electric co'			, 4				, 2				, null					, null				, 70				, 3				, null				, 1				UNION ALL	-- module:  professional history
	--SELECT 'stafford-smith inc'				, 4				, 3				, null					, null				, 70				, 2				, null				, 1				UNION ALL	-- module:  professional history
	--SELECT 'spx corporation'				, 4				, 4				, null					, null				, 70				, 1				, null				, 1				UNION ALL	-- module:  professional history
	--SELECT 'tech discussion board'			, 5				, 1				, null					, null				, 70				, 1				, 1					, 1				UNION ALL	-- module:  projects
	--SELECT 'baan-2-web'						, 5				, 2				, null					, null				, 70				, 1				, 2					, 1				UNION ALL	-- module:  projects
	--SELECT 'ssi intranet'					, 5				, 3				, null					, null				, 70				, 2				, 3					, 1				UNION ALL	-- module:  projects
	--SELECT 'rebates accrual tracking'		, 5				, 4				, null					, null				, 70				, 2				, 4					, 1				UNION ALL	-- module:  projects
	--SELECT 'rebates reconciliation'			, 5				, 5				, null					, null				, 70				, 2				, 5					, 1				UNION ALL	-- module:  projects
	--SELECT 'purchase analysis'				, 5				, 6				, null					, null				, 70				, 2				, 6					, 1				UNION ALL	-- module:  projects
	--SELECT 'cpg llc web services'			, 5				, 7				, null					, null				, 70				, 2				, 7					, 1				UNION ALL	-- module:  projects
	--SELECT 'mykdw.com csr intranet'			, 5				, 8				, null					, null				, 70				, 3				, 8					, 1				UNION ALL	-- module:  projects
	--SELECT 'Bid-to-sale notification system', 5				, 9				, null					, null				, 70				, 3				, 9					, 1				UNION ALL	-- module:	projects
	--SELECT 'primos erp system'				, 5				, 10			, null					, null				, 70				, 4				, 10				, 1				UNION ALL	-- module:  projects
	--SELECT 'asp.net mvc code'				, 6				, 1				, null					, null				, 70				, null			, null				, 1				UNION ALL	-- module:  downloads
	--SELECT 'database scripts'				, 6				, 2				, null					, null				, 70				, null			, null				, 1				UNION ALL	-- module:  downloads
	--SELECT 'resume'				            , 6				, 3				, null					, null				, 70				, null			, null				, 1				--UNION ALL	module:  downloads
	SELECT 'software projects'				, 6				, 5				, null					, null				, 70				, null			, null				, 1
)	INSERT INTO dbo.Submodule
		(SubmoduleDescription				, ModuleId		, SortOrder		, ControllerName		, ActionName		, SecurityLevel		, CompanyId		, ProjectId			, Status)
	SELECT cte.SubmoduleDescription			, cte.ModuleId	, cte.SortOrder	, cte.ControllerName	, cte.ActionName	, cte.SecurityLevel	, cte.CompanyId	, cte.ProjectId		, cte.Status
		FROM cte
		ORDER BY cte.ModuleId, cte.SortOrder


		
--  UPDATE s
--  	SET s.ModuleId = 6
--  	FROM Submodule s
--  	WHERE s.SubmoduleId in (23, 24)
		

SELECT * FROM Module WHERE ModuleId = 6

SELECT * FROM Submodule WHERE ModuleId = 6
SELECT * FROM Company