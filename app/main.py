from fastapi import FastAPI
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

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
