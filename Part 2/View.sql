USE game_forum
GO

CREATE VIEW sh.game_scores_view
AS
WITH user_score_table AS
(SELECT user_gameid = game.id, AVG(rating.rating) user_score
FROM sh.game
join sh.game_platform on game_id = game.id
join sh.rating on game_platform.id = game_platform_id
join sh.forum_user on forum_user_id = forum_user.id
GROUP BY game.id, is_critic
HAVING is_critic = 0 
),
critic_score_table AS
(
SELECT critic_gameid = game.id, AVG(rating.rating) critic_score
FROM sh.game
join sh.game_platform on game_id = game.id
join sh.rating on game_platform.id = game_platform_id
join sh.forum_user on forum_user_id = forum_user.id
GROUP BY game.id, is_critic
HAVING is_critic = 1
)
SELECT name, is_action, is_rpg, is_strategy, is_puzzle, user_score, critic_score
FROM user_score_table
full outer join critic_score_table on user_gameid = critic_gameid 
inner join sh.game on user_gameid = game.id
GO
