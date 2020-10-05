use Resumes
go

INSERT INTO dbo.CareerAccomplishments
		(AccomplishmentDescription
		,CareerHistoryId)
SELECT	'Awarded SPX Corporation Merit of Accomplishment called the President’s Pen signed by Tom Riordian, President of SPX Corporation’s Aftermarket division'
		, 1
UNION
SELECT	'Achieved vast experience in areas of network engineering/administration, web & software development, database programming as well as relationship experiences with outsourced service providers such as ISPs and Telcos'
		, 2
UNION
SELECT	'Gained experience in Asp.Nets Webforms/C# experience while learning the nuances of Inventory Systems as it pertains to CRM database programming'
		, 3
UNION
SELECT	'Achieved considerable experience in working with GitLab/SmartGit in a 14-person software engineering team using both SCRUM and KANBAN workflow/backlog scheduling methodologies'
		, 4

SELECT 
	AccomplishmentId
      ,AccomplishmentDescription
      ,CareerHistoryId
  FROM Resumes.dbo.CareerAccomplishments


  

SELECT *
	FROM dbo.CareerPositions

SELECT *
	FROM dbo.CareerHistory

SELECT *
	FROM dbo.Company