DROP TABLE IF EXISTS dbo.PlayerRegistration
DROP TABLE IF EXISTS dbo.TeamEntry
DROP TABLE IF EXISTS dbo.Player
DROP TABLE IF EXISTS dbo.Club
DROP TABLE IF EXISTS dbo.Season

CREATE TABLE Player (
PlayerID int 
, Fname nvarchar(100) Not Null
, Lname nvarchar(100) Not Null
, Phone nvarchar(100) Null
, Primary Key (PlayerID)
);

CREATE TABLE Season (
Year                int 
, SeasonName        nvarchar(6)
, Primary Key (Year, SeasonName)
);

CREATE TABLE Club (
ClubName            nvarchar(100)
, ContactName       nvarchar(100) null
, Primary Key (ClubName)
);

CREATE TABLE TeamEntry (
AgeGroup                nvarchar(3)
, TeamNumber            int
, Year                  int 
, SeasonName            nvarchar(6) 
, ClubName              nvarchar(100) 
, Primary Key (AgeGroup, TeamNumber, Year, SeasonName, ClubName)
, Foreign Key (Year, SeasonName) REFERENCES Season
, Foreign Key (ClubName) REFERENCES Club
);

CREATE TABLE PlayerRegistration (
DateRegistered          Date not null
, PlayerID              int 
, ClubName              nvarchar(100) 
, Year                  int 
, SeasonName            nvarchar(6) 
, AgeGroup              nvarchar(3)
, TeamNumber            int
, PRIMARY KEY (PlayerID, Clubname, Year, SeasonName, AgeGroup, TeamNumber)
, Foreign Key (PlayerID) REFERENCES Player
, Foreign Key (AgeGroup, TeamNumber, Year, SeasonName, ClubName) REFERENCES TeamEntry
);