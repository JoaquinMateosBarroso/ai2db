import psycopg2
from config import config


def connect():
    conn = None
    try:
        params = config()

        print('Conectando con PostgreSQL...')
        conn = psycopg2.connect(**params)

        cur = conn.cursor()

        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        db_version = cur.fetchone()
        print(db_version)

        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')


def query(query: str):
    sql = """{query}"""
    conn = None
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        cur.execute(sql)

        result = []
        row = cur.fetchone()
        while row is not None:
            result.append(row)
            row = cur.fetchone()
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
    return result

if __name__ == '__main__':
    connect()