#create database world;

use world;
/*
CREATE TABLE IF NOT EXISTS Artists
(   pkArtistId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Name NVARCHAR(120) NULL);
*/

#insert into Artists(Name) values("First Artist");
#insert into Artists(Name) values('Second Artist');

UPDATE artists SET Name = 'Second One One Artist' WHERE (pkArtistId = 3);

