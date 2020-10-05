use Resumes
go

INSERT INTO dbo.CareerPositions
	(CareerHistoryId		, WorkTitle
	, RoleHeader
	, WorkDescription)
SELECT 1					, 'Web Developer/IIS Administrator'
	, 'Technical Customer Support Representative for this Global Leader of After-Market and
	   Specialty Tools Company to various industries'

	, 'While attending community college, gained the respect of both peers and management
	   through personal initiative to use computer programming talents to help increase office
	   administration efficiencies.  One of two people to develop an Intranet web-portal enabling
	   connection to our ERP system as a backend middle-ware that allowed our office personnel
	   as well as field technicians to connect and perform administrative functions'
UNION
SELECT 2					, 'Network Engineer/Administrator'
	, 'Served as IT Manager and Network Engineer/Administrator for this industry leading 
	   supplier of restaurant and kitchen/vending equipment'

	, 'Ensure the smooth running of day-to-day operations within 
	   the information systems framework.  Servers, storage systems, switches, routers, firewalls, 
	   telephony equipment are some of the equipments that were under my administration.  Brought into 
	   this company Voice over IP technology which we’ve used to dramatically decrease telecom/data 
	   operations costs on a year-over-year basis'
UNION
SELECT 2					, 'Webmaster'
	, 'Served as IT Manager and Network Engineer/Administrator for this industry leading 
	   supplier of restaurant and kitchen/vending equipment'

	, 'Involved in all phases of dealing with ISP’s & telcos.  This includes service requirement studies, 
	   contract negotiation, vendor/support relationship management, web/email content updates, domain 
	   registration/record keeping and liaising with any outsourced firms'
UNION
SELECT 2					, 'Software, Web & Database Developer'
	, 'Served as IT Manager and Network Engineer/Administrator for this industry leading 
	   supplier of restaurant and kitchen/vending equipment'

	, 'Use SDLC methodologies and various computer languages to meet and exceed executive-level software requests.  
	   Created and programmed a heavily used CRM intranet system that queries and updates data warehouses connected 
	   to our Accounting/Job costing DBMS which has saved our end-users time and increased efficiencies.  
	   Data-mining is a major leverage to increasing the bottom line through these software and intranet-based programs'
UNION
SELECT 3					, 'Software & Web Developer/SQL Database Programmer'
	, 'Served as software, web & database programmer for custom Sales Analytics and Forecasting intranet CRM'

	, 'Author and primary developer of the new myKDW.com sales/CRM intranet web portal exclusively used by Kendall’s 
	   Sale and Management team.  This new platform replaces the original intranet sales reporting site written 
	   in Classic ASP/IIS 6.0 technology.  By use of Web 2.0 techniques and extensive use of CSS,  Javascript, 
	   Ajax/XHTTPXMLResponse, reporting analytics has never been easier to access and manipulate, flexible in device 
	   selection for viewing, but also visually appealing'
UNION
SELECT 3					, 'Webmaster'
	, 'Served as software, web & database programmer for custom Sales Analytics and Forecasting intranet CRM'

	, 'As a full-stack developer, used all of my extensive network engineering and software development knowledge 
	   in conjunction with network administrative experience to deliver a rock-solid, highly secure and robust 
	   CRM application platform that has greatly impacted how Kendall analyze sales and forecasting data'
UNION
SELECT 4					, 'Systems Analyst/Programmer'
	, 'Company ERP Software Analyst/Programmer'

	, 'Full stack developer to support and create new features and hotfixes for company’s customized in-house ERP
	   system called Primos.  Web technologies is the platform, while TSql and PHP/Javascript/HTML are the primary 
	   languages.  Contributed extensive Javascript knowledge & experience to code new front-end capabilities for this 
	   ERP system, directly increasing end-user efficiencies, productivity and responsiveness.  Heavily impacted end user
	   reporting analysis to make use of warehoused Production BOMs'



SELECT CareerPositionId
      ,CareerHistoryId
      ,WorkTitle
	  ,RoleHeader
      ,WorkDescription
  FROM Resumes.dbo.CareerPositions


SELECT * from CareerHistory


UPDATE ch
	SET ch.RoleHeader =  'Served as IT Manager and Network Engineer/Administrator for this industry leading       supplier of restaurant and kitchen/vending equipment'
	FROM CareerPositions ch
	WHERE CareerHistoryId=2