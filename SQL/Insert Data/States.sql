use Resumes
go

;WITH cte AS (
	SELECT
		StateInitials
			,StateName
		FROM Lottery.dbo.LotteryTicketState
)	INSERT INTO Resumes.dbo.States
		(StateInitials
		  ,StateName
		  ,StateStatus)
	SELECT
		c.StateInitials
			,c.StateName
			,1
		FROM cte c