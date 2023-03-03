from app.bd import query

def get_table_from_prompt(prompt: str) -> list:
    return query(prompt)