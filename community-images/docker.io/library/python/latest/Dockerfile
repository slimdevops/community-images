FROM python:latest

ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000
CMD [ "python","app.py" ]
