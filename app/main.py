import json

import uvicorn
from fastapi import FastAPI

app = FastAPI()
service_name = "Game Picks"

@app.get("/")
async def default_endpoint():
    response = json.dumps({"service":service_name, "status":"ok"})
    return response

@app.get("/health")
async def health_endpoint():
    response = json.dumps({"status":"healthy"})
    return response

if __name__ == "__main__":
    uvicorn.run("main:app", host="127.0.0.1", port=8000)