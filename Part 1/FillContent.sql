
USE game_forum
GO

INSERT INTO sh.forum_user (name)
VALUES 
(N'Valeriy'),
(N'Valdislav'),
(N'Vdalimir'),
(N'Varvar4'),
(N'<_Valkyrie_>')

GO

INSERT INTO sh.developer(name)
VALUES 
(N'Nintendo'),
(N'Activision'),
(N'Capcom'),
(N'NetherRealm')
GO

INSERT INTO sh.platform(name)
VALUES 
(N'PC'),
(N'Playstation 4'),
(N'Nintendo Switch')
GO

INSERT INTO sh.game(name, developer_id)
VALUES 
(N'Legend of Zelda: Breath of the Wild', 1),
(N'Mortal Kombat 11', 4),
(N'Crash Team Racing: Nitro-Fueled', 2),
(N'Resident Evil 2 Remake', 3),
(N'Spyro: Reignited Trilogy', 2),
(N'Super Mario Odyssey', 2)
GO

INSERT INTO sh.game_platform (game_id, platform_id, release_date)
VALUES
(1, 3, '2017-3-3'),
(2, 3, '2021-2-23'),
(2, 2, '2019-4-23'),
(2, 1, '2021-2-23'),
(3, 2, '2021-3-21'),
(3, 3, '2019-6-21'),
(4, 2, '2019-1-25'),
(4, 1, '2021-2-25'),
(5, 3, '2019-9-3'),
(5, 2, '2018-11-13'),
(5, 1, '2019-9-3'),
(6, 3, '2017-10-27')
GO

INSERT INTO sh.rating (forum_user_id, game_platform_id, rating)
VALUES
(1, 1, 6),
(1, 2, 7),
(2, 2, 9),
(1, 3, 10),
(4, 3, 6),
(5, 3, 5),
(5, 4, 5),
(2, 5, 4),
(1, 6, 8),
(3, 7, 8),
(3, 8, 8),
(3, 9, 6),
(1, 10, 5),
(4, 11, 7),
(5, 12, 7),
(2, 12, 9),
(3, 12, 9),
(1, 12, 9),
(2, 11, 10),
(2, 9, 1),
(1, 4, 10),
(4, 4, 8)