import openai

def setupfor_sql():
    openai.api_key = input("Introduce tu key de GPT, que se obtiene en la página de OpenAI\n")
    prompt = "Tengo una base de datos SQL en la que hay una tabla \"usuarios\" con los atributos \"nombre\" y \"dni\", y hay una tabla \"datos\" con los atributos \"dni\"(clave foránea de usuarios) y \"direccion\". De ahora en adelante respóndeme únicamente con las sentencias que resuelven las consultas que te voy a pedir."
    completion = openai.Completion.create(engine="text-davinci-002",
                                          prompt=prompt,
                                          max_tokens=100)
    return completion

def pediryresponder_sql(text_for_query: str):
    setupfor_sql()
    prompt = text_for_query
    completion = openai.Completion.create(engine="text-davinci-002",
                                          prompt=prompt,
                                          max_tokens=100)
    return completion

