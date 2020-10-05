use Resumes
go

INSERT INTO dbo.ContactNotes
	(ProfileId		, NoteTypeId	, Note)
VALUES(1			, 1				, 'Accomplished software/web/database developer and network engineer 
                                       with proven track record of successful project management.  With respect 
									   to software, web and database programming, possess strong familiarity 
									   with the practices of the Systems Development Life Cycle methodologies.  

									   With respect to project management, I hold considerable experience with
									   both Scrum and Kanban, dependent on the work assignments given.
									   
									   Possess effective communication and technicals skills.  Self-motivation and 
									   analytical thinking drives passion for learning')


SELECT ContactNoteId
      ,ProfileId
      ,NoteTypeId
	  ,Note
  FROM dbo.ContactNotes