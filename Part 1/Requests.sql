
USE game_forum

-- 1. ������� �������� ���, ������� ������ ������������ � �������� ������ ������� ������;

SELECT DISTINCT game.name
FROM sh.forum_user 
join sh.rating on forum_user_id = forum_user.id
join sh.game_platform on game_platform_id = game_platform.id
join sh.game on game_id = game.id
WHERE forum_user.name = N'Varvar4'

-- 2. ������� ������ ���� �� PC �� ��������� �����;

SELECT TOP 3 game.name
FROM sh.game 
join sh.game_platform on game_id = game.id
join sh.rating on game_platform_id = game_platform.id
join sh.platform on platform.id = platform_id
WHERE release_date > DATEADD(month, -1, GETDATE()) AND platform.name = N'PC'
GROUP BY game.name
ORDER BY AVG(rating) DESC

-- 3. ������� ��� 3 �������� ����������� ��� (������� ���������� ����� ������);

SELECT TOP 3 game.name
FROM sh.game 
join sh.game_platform on game_id = game.id
join sh.rating on game_platform_id = game_platform.id
GROUP BY game.name
ORDER BY COUNT(rating) DESC

-- 4. ������� �������� ������, ����������� ���� ����� ��� �� ���� ������ ����������. 

SELECT developer.name
FROM sh.game 
join sh.game_platform on game_id = game.id
join sh.developer on developer_id = developer.id
GROUP BY developer.name
HAVING COUNT(DISTINCT platform_id) > 2