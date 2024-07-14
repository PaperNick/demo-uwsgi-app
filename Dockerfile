FROM python:3.12

WORKDIR /app

# Dependencies
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# App
COPY . .
CMD [ "uwsgi", "--http", "0.0.0.0:9321", "--disable-logging", "--master", "--workers", "4", "--wsgi", "demo_app.wsgi" ]
