import openai

class SQL_Traslator:
    _context: str
    def __init__(self, api_key) -> None:
        openai.api_key = api_key
        prompt = "Ya se que tu trabajo es responderme, pero no quiero que lo hagas. Mi siguiente mensaje inmediato va a ser un script de creación de una base de datos. Quiero que la leas, la comprendas y me respondas unicamente \"Ok\". A partir de ese momento, mis mensajes serán preguntas en lenguaje natural sobre los datos de esa base de datos, quiero que tu respuesta a esos mensajes contenga unicamente codigo SQL, ningun otro tipo de palabra, caracter, etc. Solo respondeme la consulta sql que resuelva la pregunta que te he realizado en la base de datos que te he enseñado. Si lo has entendido responde únicamente con un \"Ok\"."
        openai.Completion.create(engine="text-davinci-002",
                                            prompt=prompt,
                                            max_tokens=100)
        
        file = open("create.sql")
        creation_db_script = file.read()
        response = openai.Completion.create(engine="text-davinci-002",
                                            prompt=creation_db_script,
                                            max_tokens=100)
        
        # He comentado esto porque el modelo que usamos no es exactamente el mismo que chatgpt, y puede haber algún momento en el que la respuesta no sea exactamente "OK"
        
        # if response.choises[0].text != "Ok":
        #     raise Exception()

    def convert_to_sql(text_for_query: str):    
        completion = openai.Completion.create(engine="text-davinci-002",
                                            prompt=text_for_query,
                                            max_tokens=100)
        return completion.choices[0].text

