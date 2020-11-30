CREATE DATABASE IF NOT EXISTS votes;
USE votes;
SET GLOBAL local_infile = true;

CREATE TABLE IF NOT EXISTS votes.Political_Party(
    PartyName VARCHAR(50) NOT NULL,
    Color     VARCHAR(50) NOT NULL,
    PRIMARY KEY(PartyName)
);
#This directory will need to be modified for where your repo is
#IMPORTANT back slashes are not recognized and will cause errors, use forward slashes
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Political_Party.csv'
INTO TABLE Political_Party
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;

CREATE TABLE IF NOT EXISTS votes.States(
    StateName    VARCHAR(50) NOT NULL,
    Abbreviation VARCHAR(50) NOT NULL,
    PRIMARY KEY(StateName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/States.csv'
INTO TABLE States
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;

CREATE TABLE IF NOT EXISTS votes.Candidate(
    CandidateName  VARCHAR(50) NOT NULL,
    Year           INT NOT NULL,
    Age            INT NOT NULL,
    HomeState      VARCHAR(50) NOT NULL,
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(HomeState) REFERENCES States(StateName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Candidate.csv'
INTO TABLE Candidate
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;

CREATE TABLE IF NOT EXISTS votes.County(
    CountyName  VARCHAR(50) NOT NULL,
    StateName   VARCHAR(50) NOT NULL,
    PRIMARY KEY(CountyName, StateName),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/County.csv'
INTO TABLE County
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;

CREATE TABLE IF NOT EXISTS votes.Statistics(
    StateName      VARCHAR(50) NOT NULL,
    Year           VARCHAR(50) NOT NULL,
    ElectoralVotes INT NOT NULL,
    StatePop       INT NOT NULL,
    PRIMARY KEY(StateName, Year),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Statistics.csv'
INTO TABLE Statistics
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;


CREATE TABLE IF NOT EXISTS votes.Vote_Count(
    CandidateName  VARCHAR(50) NOT NULL,
    Year           INT NOT NULL,
	StateName		VARCHAR(50) NOT NULL,
    CountyName     VARCHAR(50) NOT NULL,
    Count          INT NOT NULL,
    PRIMARY KEY(CandidateName, Year, StateName, CountyName),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(StateName, CountyName) REFERENCES County(StateName, CountyName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Vote_Count.csv'
INTO TABLE Vote_Count
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;

CREATE TABLE IF NOT EXISTS votes.Nominates(
    CandidateName  VARCHAR(50) NOT NULL,
    Year           INT NOT NULL,
    PartyName      VARCHAR(50) NOT NULL,
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(PartyName) REFERENCES Political_Party(PartyName)
);
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Nominates.csv'
INTO TABLE Nominates
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;