USE game_forum
GO

INSERT INTO sh.forum_user(name, is_critic)
VALUES (N'Valentine', 0),
(N'Violet', 1),
(N'Virg1n1a', 0),
(N'vine-_-vine', 1)
GO


UPDATE sh.forum_user 
SET is_critic = 1
WHERE id = 5
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 6
WHERE id = 7 OR id = 8
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 5
WHERE id = 2 OR id = 3 OR id = 4
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 4
WHERE id = 1
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 3
WHERE id = 5 OR id = 6
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 2
WHERE id = 12
GO

UPDATE sh.game_platform 
SET esrb_rating_id = 6
WHERE id = 7 OR id = 8
GO

UPDATE sh.game 
SET is_rpg = 1, is_puzzle = 1
WHERE id = 1
GO

UPDATE sh.game 
SET is_strategy = 1
WHERE id = 2
GO

UPDATE sh.game 
SET is_puzzle = 1
WHERE id = 4
GO

UPDATE sh.game 
SET is_action = 0, is_rpg = 1, is_strategy = 1
WHERE id = 6
GO

