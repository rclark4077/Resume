use Resumes;
go


INSERT INTO EducationalInstitution
		(InstitutionDescription						, InstitutionStatus		, SortOrder)
SELECT	'New Horizons Learning Center'				, 1						, 1
UNION
SELECT	'Cisco Systems'								, 1						, 2
UNION
SELECT	'Kalamazoo Valley Community College'		, 1						, 3
UNION
SELECT	'Davenport University'						, 1						, 4


SELECT 
	InstitutionId
      ,InstitutionDescription
      ,InstitutionStatus
      ,SortOrder
  FROM Resumes.dbo.EducationalInstitution