FROM pypy:latest

WORKDIR /usr/src/app

COPY fast-api-app/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY fast-api-app .
CMD ["pypy", "-m", "uvicorn", "--host", "0.0.0.0", "--port", "8000", "main:app"]