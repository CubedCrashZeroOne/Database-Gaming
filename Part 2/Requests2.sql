USE game_forum
GO

-- 1. Вывести количество игр для каждой платформы в каждой возрастной категории.
SELECT platform.name, esrb_rating.name, COUNT(game_platform.id) count
FROM sh.game_platform 
join sh.platform on platform_id = platform.id 
join sh.esrb_rating on esrb_rating_id = esrb_rating.id
GROUP BY platform.name, esrb_rating.name
GO
-- 2. Выбрать наименее обсуждаемые игры, среди тех, которые относятся только к одному жанру.

SELECT TOP 3 game.name
FROM sh.game
join sh.game_platform on game_id = game.id
join sh.rating on game_platform_id = game_platform.id
WHERE CAST(is_action AS int) + is_rpg + is_strategy + is_puzzle = 1
GROUP BY game.name
ORDER BY AVG(rating.rating)
GO
-- 3. Выбрать для каждой платформы по одной лучшей игре каждого жанра, если игра жанра есть на данной платформе.

-- creating separate groups for each genre to select the best game
WITH group_action AS (
SELECT platform_name = platform.name, genre = 'Action', game_name = game.name,
      ROW_NUMBER() OVER (
                     PARTITION BY platform.id
                     ORDER BY AVG(rating.rating) DESC
         	   ) AS row_num
  FROM sh.game
join sh.game_platform on game_id = game.id
join sh.platform on platform.id = platform_id
join sh.rating on game_platform_id = game_platform.id
WHERE is_action = 1
GROUP BY platform.name, game.name, platform.id
  ),


  group_strategy AS (
SELECT platform_name = platform.name, genre = 'Strategy', game_name = game.name,
      ROW_NUMBER() OVER (
                     PARTITION BY platform.id
                     ORDER BY AVG(rating.rating) DESC
         	   ) AS row_num
  FROM sh.game
join sh.game_platform on game_id = game.id
join sh.platform on platform.id = platform_id
join sh.rating on game_platform_id = game_platform.id
WHERE is_strategy = 1
GROUP BY platform.name, game.name, platform.id
  ),
  
  
  group_rpg AS (
SELECT platform_name = platform.name, genre = 'RPG', game_name = game.name,
      ROW_NUMBER() OVER (
                     PARTITION BY platform.id
                     ORDER BY AVG(rating.rating) DESC
         	   ) AS row_num
  FROM sh.game
join sh.game_platform on game_id = game.id
join sh.platform on platform.id = platform_id
join sh.rating on game_platform_id = game_platform.id
WHERE is_rpg = 1
GROUP BY platform.name, game.name, platform.id
  ),
  
  
  group_puzzle AS (
SELECT platform_name = platform.name, genre = 'Puzzle', game_name = game.name,
      ROW_NUMBER() OVER (
                     PARTITION BY platform.id
                     ORDER BY AVG(rating.rating) DESC
         	   ) AS row_num
  FROM sh.game
join sh.game_platform on game_id = game.id
join sh.platform on platform.id = platform_id
join sh.rating on game_platform_id = game_platform.id
WHERE is_puzzle = 1
GROUP BY platform.name, game.name, platform.id
  )

  -- Here starts the actual select
SELECT platform_name, genre, game_name
FROM group_action
WHERE row_num = 1

UNION

SELECT platform_name, genre, game_name
FROM group_rpg
WHERE row_num = 1

UNION

SELECT platform_name, genre, game_name
FROM group_strategy
WHERE row_num = 1

UNION

SELECT platform_name, genre, game_name
FROM group_puzzle
WHERE row_num = 1





