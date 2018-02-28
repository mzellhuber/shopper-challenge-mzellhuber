#!/usr/bin/env python
import sqlite3
import sys
from sqlite3 import Error
from datetime import datetime, timedelta


def create_connection(db_file):
    """ create a database connection to the SQLite database
        specified by the db_file
    :param db_file: database file
    :return: Connection object or None
    """
    try:
        conn = sqlite3.connect(db_file)
        return conn
    except Error as e:
        print(e)
 
    return None


def sql(start_date, end_date):

	dt = datetime.strptime(start_date, '%Y-%m-%d')
	start = dt - timedelta(days=dt.weekday())

	dt2 = datetime.strptime(end_date, '%Y-%m-%d')
	end = dt2 - timedelta(days=dt2.weekday()+6)

	return "SELECT COUNT(*) AS count, DATE(created_at,'localtime','weekday 0','-6 days') as week, workflow_state from applicants where created_at BETWEEN '"+str(start)+"' and '"+str(end)+"' group by DATE(created_at,'localtime','weekday 0','-6 days'), workflow_state"



def sql_to_csv(sql, conn):
	print "count, week, workflow_state"
	for row in conn.execute(sql):
		print str(row[0])+", "+row[1]+", "+row[2]

def main():
	#run example
	#./get_applicants.py "2014-07-01" "2014-09-01"

	
    database = "applicants.sqlite3"

    # create a database connection
    conn = create_connection(database)

    sql_to_csv(sql(sys.argv[1], sys.argv[2]), conn)


if __name__ == '__main__':
    main()