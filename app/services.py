from app.bd import query

def get_table_from_prompt(prompt: str, traslator: object) -> list:
    ## 1. Use the traslator for get the sql query
    sql: str = prompt ## <- This is wrong... The correct way is: traslator.convert_to_sql(prompt)

    sql = "SELECT * FROM ciudad"
    ## 2. Use the query function to return the table
    return query(sql)