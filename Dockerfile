FROM python:3.11-alpine3.19

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# install updates and necessary modules
RUN apk update && apk add libpq
RUN apk add --virtual .build-deps gcc python3-dev musl-dev postgresql-dev

# upgrade pip python
RUN pip install --upgrade pip

# install poetry
RUN pip install poetry && poetry config virtualenvs.create false

# move to workdir
WORKDIR /afone_music_website

# remove build dependencies
RUN apk del .build-deps

COPY . .

RUN chmod -R 777 ./