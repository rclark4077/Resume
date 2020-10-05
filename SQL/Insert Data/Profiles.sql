use Resumes;
go

INSERT INTO dbo.Profiles
	(FirstName						, MiddleName					, LastName
		, Address1					, Address2						, Address3
		, City						, StateInitials
		, ZipCode					, ZipCodeSuffix
		, PhoneNumber				, IsSelf						, CompanyId)
VALUES
	('Randy'			, 'Michael'									, 'Clark'
		, '192 Country Club Blvd'	, null							, null
		, 'Plainwell'				, 'MI'
		, 49080						, null
		, '269-365-3689'			, 1								, null)


SELECT *
	FROM Profiles