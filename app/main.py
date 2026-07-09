import json
import os

import uvicorn
from fastapi import FastAPI

app = FastAPI()
service_name = "Game Picks"
version = "0.1"

@app.get("/")
async def default_endpoint():
    response = json.dumps({"service":service_name, "status":"ok"})
    return response

@app.get("/health")
async def health_endpoint():
    response = json.dumps({"status":"healthy"})
    return response

@app.get("/env")
async def env_endoipnt():
    app_name = os.getenv("APP_NAME")
    app_env = os.getenv("APP_ENV")
    response = json.dumps({"APP_NAME":app_name, "APP_ENV":app_env})
    return response

@app.get("/version")
async def version_endpoint():
    response = json.dumps({"Version:":version})
    return response

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)