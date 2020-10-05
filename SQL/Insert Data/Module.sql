use Resumes
go
	

--INSERT INTO Module
--	(ModuleDescription			, SortOrder		, ControllerName			, ActionName	, SecurityLevel		, MaterialIcon		, Status)
;WITH cte 
	(ModuleDescription			, SortOrder		, ControllerName			, ActionName	, SecurityLevel		, MaterialIcon		, Status) 
AS (
		SELECT 'home'					, 1				, 'Home'				 	, 'Index'		, 70				, 'home'			, 1			UNION ALL
		SELECT 'qualifications'			, 2				, 'Qualifications'			, 'Index'		, 70				, 'beenhere'		, 1			UNION ALL
		SELECT 'education'				, 3				, 'Education'				, 'Index'		, 70				, 'school'			, 1			UNION ALL
		SELECT 'professiona history'	, 4				, 'CareerHistory'			, 'Index'		, 70				, 'history'			, 1			UNION ALL
		SELECT 'projects'				, 5				, 'Projects'				, 'Index'		, 100				, 'engineering'		, 1			UNION ALL
		SELECT 'downloads'				, 6				, 'Downloads'				, 'Index'		, 100				, 'get_app'			, 1			UNION ALL
		SELECT 'administration'			, 7				, 'Administration'			, 'Index'		, 10				, 'settings'		, 0				
)	INSERT INTO dbo.Module
		(ModuleDescription				, SortOrder			, ControllerName		, ActionName		, SecurityLevel			, MaterialIcon		, Status)
	SELECT cte.ModuleDescription		, cte.SortOrder		, cte.ControllerName	, cte.ActionName	, cte.SecurityLevel		, cte.MaterialIcon	, cte.Status
		FROM cte ORDER BY cte.SortOrder

--UPDATE m
--	set m.ControllerName = 'CareerHistory'
--		, m.moduleDescription = 'professional history'
--	FROM Module m
--	WHERE m.ModuleId = 4

--SELECT * FROM Module


-- Ring Security 0 thru 100....smaller integer has more access
--	world				100
--	user				70
--	group				70
--	managers			50
--	directors			40
--	admins				20
--	root				0


ModuleId			ModuleDescription		ControllerName			ActionName		SecurityLevel	SortOrder
1					home					Home					Index			70				1
2					qualifications			Qualifications			Index			70				2
3					education				Education				Index			70				3
4					professional history	Professiona history		Index			70				4
5					projects				Projects				Index			100				5
6					downloads				Downloads				Index			70				6
7					administration			Administration			Index			10				7

home
beenhere
school
history
engineering
settings