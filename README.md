# Demo uWSGI app

Simple project demonstrating how to run a Python app with uWSGI both locally and with Docker


## Installation

The project was created with Python 3.12


### Virtual environment

Create a virtualenv:

```
python -m venv venv
```

Activate the virtualenv:

```
source venv/bin/activate
```


### Install app dependencies

```
pip install -r requirements.txt
```


## Running

Run in master mode on localhost:9321 (0.0.0.0 binds all interfaces) with 4 workers and disabled logging

```
MY_SPECIAL_ENV=42 uwsgi --http 0.0.0.0:9321 --disable-logging --master --workers 4 --wsgi demo_app.wsgi
```

Source multiple env variables:

1. Create `.env` in the root directory of the project and populate with env variables like: `MY_SPECIAL_ENV=42`
2. Run the app

```
source .env
uwsgi --http 0.0.0.0:9321 --disable-logging --master --workers 4 --wsgi demo_app.wsgi
```


### Running with Docker


Build the image:

```
docker build -t demo-app .
```

Populate env variables in `.env` file

```
[ ! -f .env ] && echo 'MY_SPECIAL_ENV=42' >> .env && echo 'Env file created'
```

Run the image with the following command:

```
docker run --env-file .env --pid=host -it --rm -p 9321:9321 demo-app
```

Run on port `7000` on the host machine:

```
docker run --pid=host --env-file .env -it --rm -p 7000:9321 demo-app
```
