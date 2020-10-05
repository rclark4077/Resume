use Resumes
go


INSERT INTO dbo.Students
	(ProfileId										, InstitutionId					, GraduationDate
	   , Curriculum									, Major							, Degree)
SELECT
	1												, 1								, '2004'
		, 'Cisco ICND'								, null							, null
UNION
SELECT
	1												, 2								, '2006'
		, 'CNT'										, null							, null
UNION
SELECT
	1												, 2								, '2006'
		, 'AVVID/Voip Technology'					, null							, null
UNION
SELECT
	1												, 3								, '2004'
		, 'Transferred to Davenport University'		, 'Microcomputer Technology'	, null
UNION
SELECT
	1												, 4								, '2010'
		, 'BA, Applied Science'						, 'Network Security'			, 'Bachelor of Arts'


SELECT *
	FROM Students

SELECT *
	FROM EducationalInstitution		e
		INNER JOIN dbo.Students		s ON e.InstitutionId=s.InstitutionId
	ORDER BY s.EducationalPathId DESC