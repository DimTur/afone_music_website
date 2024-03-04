FROM python:3.11-alpine3.19

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Install system dependencies
RUN apk update && \
    apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    linux-headers \
    postgresql-dev

WORKDIR /app
COPY . /app/

RUN pip install poetry && poetry config virtualenvs.create false

COPY ./pyproject.toml .
RUN poetry install --no-dev

CMD python manage.py collectstatic --no-input \
    && gunicorn afone_web.wsgi:application --bind 0.0.0.0:8000
