CREATE DATABASE IF NOT EXISTS votes;
USE votes;
SET GLOBAL local_infile = true;

#This directory will need to be modified for where your repo is
#IMPORTANT back slashes are not recognized and will cause errors, use forward slashes
LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/Political_Party.csv'
INTO TABLE Political_Party
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;
CREATE TABLE IF NOT EXISTS votes.Political_Party(
    PartyName VARCHAR(50),
    Color     VARCHAR(50),
    PRIMARY KEY(PartyName)
);

LOAD DATA LOCAL INFILE 'C:/Users/antho/Desktop/School/Case Western/Fall 2020/Intro to Database Systems/Term Project/CSDS-341-Project/Data/Raw/States.csv'
INTO TABLE States
FIELDS TERMINATED BY ","
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 rows;
CREATE TABLE IF NOT EXISTS votes.States(
    StateName    VARCHAR(50),
    Abbreviation VARCHAR(50),
    PRIMARY KEY(StateName)
);

CREATE TABLE IF NOT EXISTS votes.Candidate(
    CandidateName  VARCHAR(50),
    Year           INT,
    Age            INT,
    HomeState      VARCHAR(50),
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(HomeState) REFERENCES States(StateName)
);

CREATE TABLE IF NOT EXISTS votes.County(
    CountyName  VARCHAR(50),
    StateName   VARCHAR(50),
    PRIMARY KEY(CountyName, StateName),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);

CREATE TABLE IF NOT EXISTS votes.Statistics(
    StateName      VARCHAR(50),
    Year           VARCHAR(50),
    ElectoralVotes INT,
    StatePop       INT,
    PRIMARY KEY(StateName, Year),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);

CREATE TABLE IF NOT EXISTS votes.Vote_Count(
    CandidateName  VARCHAR(50),
    Year           INT,
    CountyName     VARCHAR(50),
    Count          INT,
    PRIMARY KEY(CandidateName, Year, CountyName),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(CountyName) REFERENCES County(CountyName)
);

CREATE TABLE IF NOT EXISTS votes.Nominates(
    CandidateName  VARCHAR(50),
    Year           INT,
    PartyName      VARCHAR(50),
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(PartyName) REFERENCES Political_Party(PartyName)
);