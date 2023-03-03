import psycopg2
from app.config import config


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
    sql = query
    conn = None
    result = []
    try:
        params = config()
        conn = psycopg2.connect(**params)
        cur = conn.cursor()

        cur.execute(sql)

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


def create_table(creacion: str):
    """ create tables in the PostgreSQL database"""
    
    conn = None
    try:
        # read the connection parameters
        params = config()
        # connect to the PostgreSQL server
        conn = psycopg2.connect(**params)
        cur = conn.cursor()
        # create table 
        cur.execute(creacion)
        # close communication with the PostgreSQL database server
        cur.close()
        # commit the changes
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    
    
    
def insert_vendor(sql: str):
    conn = None
    vendor_id = None
    try:
        # read database configuration
        params = config()
        # connect to the PostgreSQL database
        conn = psycopg2.connect(**params)
        # create a new cursor
        cur = conn.cursor()
        # execute the INSERT statement
        cur.execute(sql, "ai2sql")
        # get the generated id back
        vendor_id = cur.fetchone()[0]
        # commit the changes to the database
        conn.commit()
        # close communication with the database
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()

    return vendor_id



if __name__ == '__main__':
    connect()