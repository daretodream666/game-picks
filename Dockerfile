FROM python:3.13-alpine AS builder

WORKDIR /app

RUN python3 -m venv /venv

COPY requirements.txt ./
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

FROM python:3.13-alpine

RUN apk --no-cache add curl && adduser -D game-picks

WORKDIR /app

COPY --from=builder --chown=game-picks:game-picks /venv /venv
COPY --chown=game-picks:game-picks --from=builder /app /app 

USER game-picks

ENV PATH="/venv/bin:$PATH"

CMD ["python3","-m","app.main"]

EXPOSE 8000

HEALTHCHECK --interval=5m --timeout=5s --start-period=5s \
    CMD curl -f http://localhost:8000/ || exit 1

LABEL maintainer="daretodream666"
LABEL project="game-picks"
LABEL version="0.1"