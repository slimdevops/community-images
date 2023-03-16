FROM python:3.10.0

ENV PYTHONUNBUFFERED 1
WORKDIR /app
COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 8000
CMD [ "python","slim/manage.py","runserver" ,"0.0.0.0:8000" ]
