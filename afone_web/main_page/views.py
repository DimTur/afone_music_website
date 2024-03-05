from django.http import HttpResponse
from django.shortcuts import render


def index(request) -> HttpResponse:
    context: dict[str, str] = {
        "title": "Home",
        "content": "Main page - HOME"
    }

    return render(request, "main_page/index.html", context)


def about(request) -> HttpResponse:
    return HttpResponse("About page")
