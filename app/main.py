from fastapi import FastAPI

app = FastAPI(title="Ai2SQL")


@app.get("/")
def read_root():
    return {"hello": "world"}