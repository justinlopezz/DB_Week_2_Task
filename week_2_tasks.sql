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

Insert into Player (PlayerID, Fname, Lname, Phone) Values 
(10002, 'John', 'Howard', 5552345)
, (10003, 'Julia', 'Gillard', 5553456)
, (102589705, 'Justin', 'Lopez', 1234567)
, (10004, 'Jordan', 'Michael', 7654321)

insert into Season (Year, SeasonName) values 
(2018,'Winter')
, (2018, 'Summer')
, (2019, 'Winter')
, (2019, 'Summer');

insert into Club (ClubName, ContactName) values 
('Mt Martha Basketball Club', 'Bob Jane')
, ('Space Jammers', 'Michael Jordan')
, ('Diamond Valley Eagles', 'John Smith')
, ('Whittelsea Pacers', 'Jane Smith');

insert into TeamEntry (AgeGroup, TeamNumber, Year, SeasonName, ClubName) values 
('U14', 1, 2018, 'Summer', 'Mt Martha Basketball Club')
, ('U14' ,2 ,2018, 'Summer', 'Mt Martha Basketball Club')
, ('U19', 3, 2018, 'Winter', 'Diamond Valley Eagles')
, ('U21', 4, 2018, 'Summer', 'Whittelsea Pacers');


insert into PlayerRegistration (DateRegistered, PlayerID, ClubName, Year, SeasonName, AgeGroup, TeamNumber) values 
('23/JUL/2017', 10003, 'Mt Martha Basketball Club', 2018, 'Summer', 'U14', 2)
, ('13/JAN/2018', 10002, 'Mt Martha Basketball Club', 2018, 'Summer', 'U14', 1)
, ('19/FEB/2019', 102589705, 'Diamond Valley Eagles', 2018, 'Winter', 'U19', 3)
, ('15/MAR/2018', 10004, 'Whittelsea Pacers', 2018, 'Summer', 'U21', 4);