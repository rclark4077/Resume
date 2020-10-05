use Resumes
go

INSERT INTO dbo.NoteTypes
	(NoteTypeDescription)
VALUES('About Me')


SELECT NoteTypeId
      ,NoteTypeDescription
  FROM dbo.NoteTypes