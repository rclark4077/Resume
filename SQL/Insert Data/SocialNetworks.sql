use Resumes
go

INSERT INTO dbo.SocialNetworks
	(SocialNetworkTypeId		, SocialNetworkAddress)
	SELECT					1	, '(269) 365-3689'
UNION
	SELECT					2	, 'randy.clark@live.com'
UNION
	SELECT					3	, 'https://www.linkedin.com/in/darthclark'
UNION
	SELECT					7	, 'http://http://darthclark.azurewebsites.net'
