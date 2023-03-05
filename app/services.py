from app.bd import query
from app.sql_traslator import SQL_Traslator
def get_table_from_prompt(prompt: str, traslator: SQL_Traslator) -> list:
    ## 1. Use the traslator for get the sql query
    print(prompt)
    sql: str = traslator.convert_to_sql(text_for_query=prompt)

    ## 2. Use the query function to return the table
    return query(sql)