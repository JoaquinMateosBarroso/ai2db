import speech_recognition as sr

def recognize_voice(audio):
    r = sr.Recognizer() 
    
    try:
        text = r.recognize_google(audio, language="es-ES")
    except:
        text = 'Sorry could not hear'
    
    return text



if __name__ == "__main__":
    print(recognize_voice())