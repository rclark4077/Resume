use Resumes
go


INSERT INTO dbo.TechnicalSkills
	(TechnicalSkillDescription
		, TechnicalSkillTypeId	, ProfileId)
SELECT 'Strong communications skills, analytical thinker and positive energy.  
        Possess extensive knowledge of vendor/service provider product and 
		services necessary to the successful decision making abilities needed 
		for today’s changing infrastructure'
		, 1						, 1
UNION
SELECT 'Network Engineering background provided extensive experience in
        understanding network communications protocols as it relates to software, 
		web and database development.  This background has been fruitful in debugging
		IIS web services along with web applications and services'
		, 2						, 1
UNION
SELECT 'Data is the heart of any application.  Possess strong TSql programming language 
        capabilities in both DDL & DML disciplines.  Have been programming MSSql 
		since 2005 and prior to that was Microsoft Access (since year 2000)'
		, 3						, 1
UNION
SELECT 'HTML 4 & 5, XHtml 1.0, XML, XSLT/XPATH, Pure JavaScript/JQuery, CSS, C#, PHP, both ASP.Net and ASP Classic, Visual Basic.Net and VB 6.0 and TSql with Microsoft SQL Server. Experienced in working with Microsoft .Net API, Bootstrap CSS framework among others'
		, 4						, 1
UNION
SELECT 'Not completely sold on framework usages as they are CSS and Javascript libraries, but 
        do have an affection for Bootstrap and Angular.  The idea behind all frameworks is that
		they make javascripting easier.  This does not apply to me as I have been programming 
		Javascript, CSS & Html/XHtml since 2000 through most of their evolutions
		
		Experienced in both Asp.Net webforms and Asp.Net MVC with Razor syntax.  Both have their
		proper application benefits.'
		, 5						, 1
UNION
SELECT 'Visual Studio variants (2019 present). Visual Studio Code, SmartGit, GitLab, 
        Beyond Compare (code diff software), Adobe Photoshop (many variants), IIS Webserver.  Various utilities 
		for network management.  MS Office as it pertains to COM Automation/API purposes'
		, 6						, 1
UNION
SELECT 'Experienced with Microsoft Azure Asp.Net & Sql Migration and deployment procedures.  Personal website (darthclark.azurewebsites.net) is hosted and driven by Microsoft Azure Web App & Azure Sql Server Resource Group'
		, 7						, 1

update s
	set s.TechnicalSkillDescription = 'Experienced with Microsoft Azure Asp.Net & Sql Migration and deployment procedures.  Personal website (darthclark.azurewebsites.net) is hosted and driven by Microsoft Azure Web App & Azure Sql Server Resource Group'
	from TechnicalSkills s
	where s.TechnicalSkillId = 7


SELECT
	TechnicalSkillId            
		, TechnicalSkillDescription	
		, TechnicalSkillTypeId        
		, ProfileId					
	FROM dbo.TechnicalSkills



SELECT *
	FROM TechnicalSkillTypes
