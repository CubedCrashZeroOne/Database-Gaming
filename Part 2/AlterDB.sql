USE game_forum
GO

ALTER TABLE sh.game_platform ADD CONSTRAINT GMPL_unique UNIQUE NONCLUSTERED (game_id, platform_id) 
GO

ALTER TABLE sh.rating ADD CONSTRAINT RT_unique UNIQUE NONCLUSTERED (forum_user_id, game_platform_id) 
GO

CREATE TABLE sh.esrb_rating
(
	id int IDENTITY PRIMARY KEY,
	name varchar(5) UNIQUE,
	lower_bound int,
	upper_bound int,
	CONSTRAINT ESRB_compare_bounds CHECK (lower_bound <= upper_bound)
)
GO
INSERT INTO sh.esrb_rating (name, lower_bound, upper_bound)
VALUES ('RP', null, null),
('E', 0, 9),
('E10+', 10, 12),
('T', 13, 16),
('M', 17, 17),
('AO', 18, 130)


ALTER TABLE sh.forum_user 
ADD is_critic bit NOT NULL DEFAULT(0)
GO

ALTER TABLE sh.game_platform
ADD esrb_rating_id int REFERENCES sh.esrb_rating NOT NULL DEFAULT(1)
GO

ALTER TABLE sh.game 
ADD is_action bit NOT NULL DEFAULT(1),
is_rpg bit NOT NULL DEFAULT(0),
is_strategy bit NOT NULL DEFAULT(0),
is_puzzle bit NOT NULL DEFAULT(0),
CONSTRAINT GM_has_genre CHECK (is_action = 1 OR is_rpg = 1 OR is_strategy = 1 OR is_puzzle = 1)