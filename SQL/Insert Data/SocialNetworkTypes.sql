use Resumes;
go


INSERT INTO SocialNetworkTypes
	(SocialNetworkDescription	, SortOrder)
	SELECT 'Phone Number'		, 1
UNION
	SELECT 'Email'				, 2
UNION
	SELECT 'LinkedIn'			, 3
UNION
	SELECT 'FaceBook'			, 4
UNION
	SELECT 'Twitter'			, 5
UNION
	SELECT 'Instagram'			, 6
UNION
	SELECT 'WebPage'			, 7