USE votes;

CREATE VIEW state_votes AS (SELECT StateName, CandidateName, Year, sum(Count)
                            FROM vote_count
                            GROUP BY StateName, CandidateName, Year)