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
    return None

def states():
    return execute_query('SELECT StateName FROM States')