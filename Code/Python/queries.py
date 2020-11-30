import pymysql

#This file will hold all the SQL queries we want to execute

def execute_query(query):
    '''Returns the result of a query'''
    con = pymysql.connect(host='localhost', user='root', password='password', db='votes')
    cur = con.cursor()
    cur.execute(query)
    data = cur.fetchall()
    cur.close()
    con.close()
    return data

def state_color(year):
    '''Returns what color each state was in a particular year'''
    query = '''
            SELECT s.Abbreviation, p.Color
            FROM state_votes s1, nominates n, political_party p, states s
            WHERE s1.Year='2016' AND s1.Count >= ALL (SELECT s2.Count
                                                    FROM state_votes s2
                                                    WHERE s1.year = s2.year AND s1.StateName = s2.StateName)
                    AND s1.CandidateName = n.CandidateName AND s1.Year = n.Year AND n.PartyName = p.PartyName AND s1.StateName = s.StateName
    '''.format(year)
    return execute_query(query)

def electoral_votes(year):
    query = '''
            SELECT s1.CandidateName, sum(s.ElectoralVotes)
            FROM state_votes s1, statistics s
            WHERE s1.Year='2016' AND s1.Count >= ALL (SELECT s2.Count
                                                    FROM state_votes s2
                                                    WHERE s1.year = s2.year AND s1.StateName = s2.StateName)
                    AND s1.StateName = s.StateName AND s1.Year = s.Year
            GROUP BY s1.CandidateName
    '''.format(year)
    return execute_query(query)

def states():
    return execute_query('SELECT StateName FROM states')

def counties(state):
    query = 'SELECT CountyName FROM county WHERE StateName = \'{}\' '.format(state)
    return execute_query(query)

def county_votes(state, county, year):
    if county == 'All':
        query = '''SELECT CandidateName, Count FROM state_votes WHERE StateName='{}' AND Year='{}' '''.format(state, year)
    else:
        query = '''SELECT CandidateName, Count FROM vote_count WHERE StateName='{}' AND CountyName='{}' AND Year='{}' '''.format(state, county, year)
    return execute_query(query)


def state_votes(year, candidate):
    #Return number of votes in states for given year and candidate
    return None

def state_electoral(year):
    #Return number of electoral votes states have in a given year
    return None