from django.contrib import admin
from django.urls import path, URLResolver

from main_page import views


urlpatterns: list[URLResolver] = [
    path("admin/", admin.site.urls),
    path("", views.index, name="index"),
    path("about/", views.about, name="about"),
]
