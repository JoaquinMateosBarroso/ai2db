import openai

def setupfor_sql(key: str):
    openai.api_key = key
    prompt = "PONER BIEN ESTO"
    completion = openai.Completion.create(engine="text-davinci-002",
                                          prompt=prompt,
                                          max_tokens=100)
    return completion


def pediryresponder_sql(text_for_query: str, key: str):
    setupfor_sql(key)
    
    completion = openai.Completion.create(engine="text-davinci-002",
                                          prompt=text_for_query,
                                          max_tokens=100)
    
    return completion.choices[0].text