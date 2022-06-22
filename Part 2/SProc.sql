USE game_forum
GO

CREATE PROCEDURE sh.esrb_by_age_range 
@lower_bound int,
@upper_bound int
AS 
SELECT esrb_rating.name
FROM sh.esrb_rating 
WHERE 
NOT @lower_bound = 0 
AND NOT @upper_bound = 0 
AND NOT @upper_bound < @lower_bound
AND
(lower_bound BETWEEN @lower_bound AND @upper_bound
OR upper_bound BETWEEN @lower_bound AND @upper_bound
OR @lower_bound BETWEEN lower_bound AND upper_bound
OR @upper_bound BETWEEN lower_bound AND upper_bound
)
GO

EXECUTE sh.esrb_by_age_range null, null
GO

EXECUTE sh.esrb_by_age_range null, 5
GO

EXECUTE sh.esrb_by_age_range 18, null
GO

EXECUTE sh.esrb_by_age_range 5, 17
GO

EXECUTE sh.esrb_by_age_range 17, 17
GO

EXECUTE sh.esrb_by_age_range 13, 12
GO

EXECUTE sh.esrb_by_age_range 13, 17
GO