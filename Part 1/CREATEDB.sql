
CREATE DATABASE game_forum
GO

USE game_forum
GO

CREATE SCHEMA sh
GO

CREATE TABLE sh.developer
(
	id int IDENTITY PRIMARY KEY,
	name nvarchar(100) NOT NULL
)
GO

CREATE TABLE sh.game
(
	id int IDENTITY PRIMARY KEY,
	name nvarchar(100) NOT NULL,
	developer_id int REFERENCES sh.developer
)
GO

CREATE TABLE sh.platform
(
	id int IDENTITY PRIMARY KEY,
	name nvarchar(30) NOT NULL
)
GO

CREATE TABLE sh.game_platform
(
	id int IDENTITY PRIMARY KEY,
	game_id int REFERENCES sh.game,
	platform_id int REFERENCES sh.platform,
	release_date date NOT NULL,

)
 GO

CREATE TABLE sh.forum_user
(
	id int IDENTITY PRIMARY KEY,
	name nvarchar(50) NOT NULL
)
GO

CREATE TABLE sh.rating
(
	id int IDENTITY PRIMARY KEY,
	forum_user_id int REFERENCES sh.forum_user,
	game_platform_id int REFERENCES sh.game_platform,
	rating int NOT NULL CHECK (rating > 0 AND rating < 11)
)