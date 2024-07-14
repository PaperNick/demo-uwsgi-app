#!/bin/sh

if [ ! -d venv ]; then
    echo 'Could not find venv (virtual environemnt) folder. Aborting.'
    exit 1
fi

. venv/bin/activate
MY_SPECIAL_ENV=42 uwsgi --http 0.0.0.0:9321 --disable-logging --master --workers 4 --wsgi demo_app.wsgi
