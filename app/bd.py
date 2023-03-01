import psycopg2
from config import config


def connect():
    conn = None
    try:
        # Leemos los parámetros de conexión
        params = config()

        # Conectamos con el servidor PostgreSQL
        print('Conectando con PostgreSQL...')
        conn = psycopg2.connect(**params)

        # creamos un cursor
        cur = conn.cursor()

        # Ejecutamos una sentencia SQL
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # Mostramos la versión de PostgreSQL que hemos solicitado con la sentencia anterior
        db_version = cur.fetchone()
        print(db_version)

        # Cerramos la comunicación con PostgreSQL
        cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if conn is not None:
            conn.close()
            print('Database connection closed.')


if __name__ == '__main__':
    connect()