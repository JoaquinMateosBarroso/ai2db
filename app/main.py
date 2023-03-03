from fastapi import FastAPI, File, UploadFile
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from app.bd import create_table, insert_vendor, query

app = FastAPI(title="Ai2SQL")
app.mount("/frontend", StaticFiles(directory="frontend"), name="frontend")
templates = Jinja2Templates(directory="frontend")


@app.get("/", response_class=HTMLResponse)
async def main( request: Request, prompt: str = ""):
    response: HTMLResponse
    if prompt == "":
        response = templates.TemplateResponse("index.html", {"request": request})
    else:
        response = templates.TemplateResponse("index.html",{
            "request": request,
            "table": [prompt]
        })
    return response


@app.post("/uploadfile/")
async def create_upload_file(file: UploadFile = File(...)):
    
    contents = await file.read()
    rows = contents.decode("utf-8").split("\n")
    
    input_para_chatgpt = rows[0].split(",")
    rows[0] = [row + " VARCHAR2(255)" for row in input_para_chatgpt]
    
    nombre_tabla = file.filename.split(".")[0]
    creacion = "CREATE TABLE " + nombre_tabla + " (" + ", ".join(rows[0]) + ");"
    
    
    try:
        create_table(creacion)
    except Exception as error:
        raise error

    for row in rows[1:]:
        sentencia = "INSERT INTO " + nombre_tabla + " VALUES (" + ", ".join(["'" + r + "'" for r in row.split(",")]) + ");"
        try:
            insert_vendor(sentencia)
        except Exception as error:
            raise error
    
    return {"tablename": nombre_tabla}


@app.get("/table/{tablename}", response_class=HTMLResponse)
async def read_table(tablename: str):
    
    try:
        tabla = query("SELECT * FROM " + tablename)
    except Exception as error:
        raise error
    
    return {"table": tabla}
