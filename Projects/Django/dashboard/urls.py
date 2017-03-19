#encoding:utf-8
from django.conf.urls import url
from . import views
from . import user


urlpatterns = [
    url(r'^hello/$', views.hello),
    url(r'^login/$', views.login),
    url(r'^test/$', views.test_form),
    url(r'^$', views.IndexView.as_view()),
    url(r'^user/userlist/$', user.UserListView.as_view()),
]