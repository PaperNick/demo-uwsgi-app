import os

from django.http import HttpResponse


def home(request):
    return HttpResponse(f'<h1>It works!</h1><p>Env variable: {os.environ.get("MY_SPECIAL_ENV", "ENV_NOT_SET")}</p><p><a href="subpage">Go to subpage</a></p>')

def subpage(request):
    return HttpResponse(f'<h1>It works from subpage!</h1><p>Env variable: {os.environ.get("MY_SPECIAL_ENV", "ENV_NOT_SET")}</p><p><a href="/">Go home</a></p>')
