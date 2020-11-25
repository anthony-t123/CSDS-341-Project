CREATE TABLE votes.Political_Party(
    PartyName VARCHAR(50),
    Color     VARCHAR(50),
    PRIMARY KEY(PartyName)
);

CREATE TABLE votes.States(
    StateName    VARCHAR(50),
    Abbreviation VARCHAR(50),
    PRIMARY KEY(StateName)
);

CREATE TABLE votes.Candidate(
    CandidateName  VARCHAR(50),
    Year           INT,
    Age            INT,
    HomeState      VARCHAR(50),
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(HomeState) REFERENCES States(StateName)
);

CREATE TABLE votes.County(
    CountyName  VARCHAR(50),
    StateName   VARCHAR(50),
    PRIMARY KEY(CountyName, StateName),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);

CREATE TABLE votes.Statistics(
    StateName      VARCHAR(50),
    Year           VARCHAR(50),
    ElectoralVotes INT,
    StatePop       INT,
    PRIMARY KEY(StateName, Year),
    FOREIGN KEY(StateName) REFERENCES States(StateName)
);

CREATE TABLE votes.Vote_Count(
    CandidateName  VARCHAR(50),
    Year           INT,
    CountyName     VARCHAR(50),
    Count          INT,
    PRIMARY KEY(CandidateName, Year, CountyName),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(CountyName) REFERENCES County(CountyName)
);

CREATE TABLE votes.Nominates(
    CandidateName  VARCHAR(50),
    Year           INT,
    PartyName      VARCHAR(50),
    PRIMARY KEY(CandidateName, Year),
    FOREIGN KEY(CandidateName, Year) REFERENCES Candidate(CandidateName, Year),
    FOREIGN KEY(PartyName) REFERENCES Political_Party(PartyName)
);