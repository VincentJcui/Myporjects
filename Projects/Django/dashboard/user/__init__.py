#encoding:utf-8

from django.views.generic import TemplateView
from django.contrib.auth.models import User
from django.shortcuts import render

class UserListView(TemplateView):
    template_name = 'user/userlist.html'

    def get_context_data(self, **kwargs):
        context = super(UserListView, self).get_context_data(**kwargs)
        context['username'] = User.objects.all()
        return context

    def get(self, request, *args, **kwargs):
        return super(UserListView, self).get(request, *args, **kwargs)
