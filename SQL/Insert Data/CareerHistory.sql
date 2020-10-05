use Resumes
go

INSERT INTO dbo.CareerHistory
	(ProfileId			, CompanyId			, StartDate			, EndDate)
SELECT			1		, 1					, '1998'			, '2002'

UNION
SELECT			1		, 2					, '2002'			, '2014'

UNION 
SELECT			1		, 3					, '2014'			, '2016'

UNION 
SELECT			1		, 4					, 'June 2016'		, 'January 2016'



SELECT CareerHistoryId
      ,ProfileId
      ,CompanyId
      ,StartDate
      ,EndDate
  FROM Resumes.dbo.CareerHistory


SELECT *
	FROM Company