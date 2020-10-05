use Resumes
go


INSERT INTO Projects
	(ProjectTypeId			, ProfileId			, CompanyId
		,ProjectTitle							, ProjectDescription)
SELECT
	1						, 1					, 1
		,'Online Tech Discussion Board'			
		,'This secured website allowed for our field technicians to be able to post and answer technical questions in a manner than maximized their worktime, their technical troubleshooting abilities and effectiveness as it related to their daily duties of troubleshooting and fixing the PC-based automotive aftermarket testing equipment manufactured and sold by SPX Corporation (ie – ODBII testers, smog testing machines, battery testers..etc).  Also allowed them to download specs and training videos which effectively decreased SPX’s training costs drastically.  This was written in ASP 1.0, Javascript, xhtml and css with heavy TSQL'
UNION
SELECT
	1						, 1					, 1
		,'BAAN-2-Web'			
		,'This secured web portal was more than just a website.  What we programmed was an easy to use web interface that allowed field service technicians to ‘close out work orders’ themselves.  Prior to this, our technicians were obliged to call into a large call-center where a CSR would enter in finished work order details, such as parts used, mileage, solution steps, notes to customers and total work order sales…etc  The baan-2-web web portal + API software was written in Visual Basic 6.0 as DLL’s which used the installed BAAN client on the IIS webserver to communicate with the BAAN MRP database back-end as if the field service technician were sitting in the Customer Call Center and typing their work order themselves.  This had 2 positive effects:  1) SPX was able to drastically reduce the call center man-hours and effectively increase monthly bottom line; 2) Allowed the field technician to self-service their work orders and effectively become more efficient with their daily drives.  This had the effect of allowing field technicians to service more customers on a daily basis and again, increase SPX’s bottom line.  I was awarded SPX Corporation’s President’s Pen award'
UNION
SELECT
	1						, 1					, 2
		,'Accounting, Projects & Job Costing Intranet'			
		,'This web portal is extremely thorough in its reporting and analytics.  Like many ERP’s and CRM systems, the out of the box reporting is not enough for real-world applications.  This intranet was created in asp classic, javascript, xml, xhtml and css along with extensive use of SQL server.  DTS packages were created to batch export and update the Microsoft sql server from Maxwell System’s ERP/Job Costing system to bring near real-time reporting analytics to the end-users.  One such report created brought (roughly) 80% of the most important aspects of 10 different reports natively ran through the ERP system into this single web-report.  This effectively cut down time and effort to the sales support and accounting team.  I was only able to bring this and many other useful reports to fruition by the direct input and interviewing of end users and managers alike.  Their needs and specifications drive my imagination and technical savvy.'
UNION
SELECT
	1						, 1					, 2
		,'Rebates accrual and tracking software'			
		,'This desktop software was created using Visual Basic.net and the .net 3.5 library along with such technologies as multi-threading and Microsoft office (excel) automation.  It goes without saying that heavy use of stored procedures, functions and views were used to make this software as efficient as can be.  The direction for this software was to greatly cut down the time and effort that it took out of the native ERP system (Maxwell) limited functionality in order to match invoices with the (hundreds of) differing rebate programs offered by the commercial kitchen equipment manufacturing community.  The time it took to have a working spreadsheet full of invoices from the ERP system formatted in a way that Excel could work with only accounted for about 10% of the manufacturers stafford-smith did business with.  This ‘invoice’ massaging practice took typically about a weeks’ worth of one person’s normal time….the last 3 weeks of the month were in reconciling the invoices to the manufacturer’s reports.  This was highly inefficient and thus I wrote this automation reporting and reconciling software to automate the ‘1 week long procedure’ into a 45 minute process.  The bottom line is,is that we were able to reconcile much more of the manufacturers rebate programs and recouped ‘lost dollars’ when invoices didn’t match reported numbers provided by the manufacturers (which tends to happen from time to time)'
UNION
SELECT
	1						, 1					, 2
		,'Rebates reconciliation'			
		,'As an add-on feature to the previously mentioned ‘rebates accrual’ software, this reconciliation companion was built in order to quickly separate into 2 worksheets (on same excel workbook) which invoices matches, and those that did not.  Every invoice selected from the ERP date-range was found on either the one worksheet or the other.  By working with the manufacturers to standardize input and output files for reconcile matching, we were able to cut down what would take over a week to reconcile down to less than 30 minutes.  This did not account for all manufacturers, but of the larger (by volume) manufacturers, this software automated reconciliation app greatly simplified what was ultimately rebates revenue recouping program'
UNION
SELECT
	1						, 1					, 2
		,'Purchase analysis software'			
		,'The primary goal was to make bulk purchasing more efficient.  Stafford-Smith knew that there were unaccounted for waste in spending.  This desktop software written in C# and the .net library leveraged the power of Microsoft excel automation and outlook emailing in order to capture, notify and report on opportunities for lowering or eliminating freight costs as one responsibility of this software service.  Another function was to allow for consolidations of purchase orders in order to leverage volume purchase discounts allowed by manufacturers without any additional purchase expenditures above what was needed for contracted jobs.  Before this software, stafford-smith simply did not have the analytics necessary to purchase intelligently, nor save freight by volume consolidations.  This software also caught mistakes made by sales support personnel where upfront purchase discounts as well as free freights were allowed, but not taken at the time of purchase order processing'
UNION
SELECT
	1						, 1					, 2
		,'channel partners group purchase reporting'			
		,'Stafford-smith was a member of a buying consortium of commercial kitchen equipment dealers, like most dealers of this industry.  This particular buying consortium was a brand new group started by a number (around 50) of the largest commercial FSE dealers in the country; stafford-smith being ranked #13 at the time.  When ‘CPG’ got its start, it did not have a reporting facility from which the manufacturers could report what each FSE dealer had purchased for the month, nor a means by which the dealers could view total volumes, ranking by member, ranking by manufacturer, forecasted versus actual targets and other such analytics that would allow for member visibility to the buying group as a whole.  This software development project beat out other contenders from IT Departments from other member dealers.  I wrote this software using VB.NET with high-level technology such as Microsoft Office automation for the end-reporting, heavy TSQL stored procedures to maximize speed of operations, binary file transference IO namespace, web-credentials namespace, SOAP based XML web services, as well as the .net multi-threading library necessary when writing desktop client and server applications running in asynchronous mode which locks up the GUI until the main cpu process event is complete.  This served to allow for multiple asynchronous web services API calls to the web service gateway (server side soap xml listener service), allowing for multiple simultaneous reports to be automated into Microsoft office (both word and excel).  As a side note, I also built the VMWare vSphere hypervisor environment (ESX 5.0), installed the Windows 2008 OS, installed MS SQL Server, built the relational database, programmed the IIS web server, programmed the manufacturer and dealer desktop software, authored the xml web services (around 25 different web service methods), created documentation and software usage requirements and programmed the Cisco PIX 515e firewall to allow for inbound NAT translations from a global IP by which the xml web services listened on.  One last word on this software project is that it was so complex with the amount of different manufacturers and dealers (around 200 corporate entities to start) with their varying ERP systems and the various flavors of Microsoft Office each end user would use, that I needed a logging facility built into all 3 software (both desktop and web side) that could tell me exactly ‘who, what, where, when and why’ a system problem came about.  I wrote that logging facility to tell me exactly which software-tier, what function and line number triggered the error.  This made troubleshooting easy.  This was also the most difficult software project I’ve ever authored, but fun!'
UNION
SELECT
	1						, 1					, 3
		,'MyKDW.com'			
		,'This asp.net, c#, jQuery and javascript driven website arose from a need for better analytics.  The original sales reporting intranet website was just that.  A means to view sales reports when you’re physically connected to the intranet.  Being a full-stack developer, I was and am able to incorporate my network engineering talents to engage the infrastructure in a manner capable of securely allowing traffic on the DMZ and querying protected data assets behind the corporate firewall.  myKDW.com was programmed to allow the salesforce to view customer sales historical data at the time of principal meetings onsite with customers.  This empowered our salesforce the ability to know more about each and every customer, but also allocate their time more efficiently with a powerful visual dashboard and trends charting canvas with drill down capabilities sinking deeper into detail as appropriate.  Because of the powerful jQuery architecture I leveraged for this portal, no longer are our salesforce required to view their reports on a laptop, but can be done on the major smart devices.  Heavy use of TSQL was and is the focal point for this project as analytics runs most efficiently within set-based operations in relational databases.  This website truly needs to be seen in order to be appreciated.  The following are the list of 3rd-party libraries that I’ve incorporated to bring power to this CRM web portal and can be looked up and reviewed for better understanding: [1] Microsoft .Net 4.0  [2] jQuery 2.1.4  [3] High Charts 4.0.4  [4]  AdminLTE 2.0'
UNION
SELECT
	1						, 1					, 3
		,'Bid-to-sale notification system '			
		,'This software is a console service software written in C# and works in conjunction with Windows Task Scheduler to select all BIDS in the ERP system.  Upon a set task schedule, it checks to see if the bids had been converted to real sales.  If so, a comparison to sales amount thresh hold set by the end user inside the web portal preferences area allows for bid-to-sales conversion notifications to his/her email account.  This lets our salesforce know the good news the 21st century way'
UNION
SELECT
	1						, 1					, 4
		,'primos erp'			
		,'This php based intranet is a full-blown plastics-formulation, inventory management, manufacturing and product development website with complimentary logistics, purchasing, HR & accounting modules built into its vast manufacturing and formula researching capabilities.  Collaborated with other Primos developers to help build new features & hot-fixes to this manufacturing information system allowing for the smooth transition of UCC onto this ERP platform used by Washington Penn Plastics Companies (also known as Audia Plastics). Heavy collaboration with end users in a hybrid Kanban-Agile development group to receive detailed end user software usage behaviors to fully understand functional roles within the company to meet their expectations'



SELECT *
	FROM dbo.Company

SELECT *
	FROM dbo.Projects
	
SELECT *
	FROM dbo.ProjectTypes
