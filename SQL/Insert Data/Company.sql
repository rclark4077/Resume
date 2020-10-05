use Resumes
go

INSERT INTO dbo.Company
	(CompanyName					, City							, StateInitials
	 , Address1						, Address2						, Address3
	 , ZipCode						, ZipCodeSuffix					, PhoneNumber)
SELECT
	'SPX Corporation'				, 'Portage'						, 'MI'
	, null							, null							, null
	, null							, null							, null
UNION 
SELECT
	'Stafford-Smith, Inc'			, 'Kalamazoo'					, 'MI'
	, null							, null							, null
	, null							, null							, null
UNION 
SELECT
	'Kendall Electric'				, 'Portage'						, 'MI'
	, null							, null							, null
	, null							, null							, null
UNION 
SELECT
	'Uniform Color Company'			, 'Holland'						, 'MI'
	, null							, null							, null
	, null							, null							, null
