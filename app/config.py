from configparser import ConfigParser


def config(filename='database.ini', section='postgresql'):
    return {"host":"db", "database":"ai2sql", "user":"ai2sql", "password":"ai2sql"}