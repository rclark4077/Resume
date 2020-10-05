use Resumes
go

INSERT INTO dbo.SocialNetworkProfiles
	(ProfileId		,SocialNetworkId)
SELECT		1		, 1
UNION
SELECT		1		, 2
UNION
SELECT		1		, 3
UNION
SELECT		1		, 4



SELECT
	SocialNetworkProfileId
		, ProfileId             
		, SocialNetworkId       
	FROM SocialNetworkProfiles