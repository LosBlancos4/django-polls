import sqlite3
import os

# Creates db.sqlite

if os.path.exists('db.sqlite3'):
	print('db.sqlite3 already exists')
else:
    conn = sqlite3.connect('db.sqlite3')
    cur = conn.cursor()
    with open('db.sql') as fp:
        cur.executescript(fp.read()) 
    conn.commit()
