use Resumes
go

INSERT INTO dbo.ProfileAttributes
	(ProfileAttributeDescription	, ProfileId)
SELECT 'Positive Energy'			, 1
UNION
SELECT 'Adaptability'				, 1
UNION
SELECT 'Critical Thinker'			, 1
UNION
SELECT 'Strong Work Ethic'			, 1
UNION
SELECT 'Calm Under Pressure'		, 1
UNION
SELECT 'Self Motivated'				, 1





SELECT ProfileAttributeId
      ,ProfileAttributeDescription
      ,ProfileId
  FROM dbo.ProfileAttributes