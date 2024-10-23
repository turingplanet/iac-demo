# Dockerfile
FROM --platform=linux/amd64 python:3.11-slim

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y gcc g++ make
RUN pip install poetry
RUN poetry install

ENV PYTHONPATH=/app/src

RUN poetry run python -m pytest

CMD ["sh", "-c", "poetry run hello && poetry run bye"]

EXPOSE 5001


