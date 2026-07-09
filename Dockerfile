FROM python:3.13-alpine as builder

WORKDIR /app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.13-alpine

CMD ["python3","-m","app.main"]

EXPOSE 8000

WORKDIR /app

RUN useradd game-picks
USER game-picks

COPY --from=builder /app /app

