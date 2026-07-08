FROM python:3.13-slim

WORKDIR /usr/local/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app

RUN useradd game-picks
USER game-picks

CMD ["python3","-m","app.main"]


