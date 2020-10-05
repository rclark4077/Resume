use Resumes
go


INSERT INTO dbo.TechnicalSkillTypes
		(TechnicalSkillTypeDescription			, SortOrder)
SELECT	'Personal Skills'						, 1
UNION
SELECT	'Infrastructure/Protocols'				, 2
UNION
SELECT	'Database Systems'						, 3
UNION
SELECT	'Programming Languages'					, 4
UNION
SELECT	'Frameworks & Design Patterns'			, 5
UNION
SELECT	'Software Skills'						, 6
UNION
SELECT	'Cloud Services & Deployments'				, 7





SELECT *
	FROM TechnicalSkillTypes
	ORDER BY SortOrder
