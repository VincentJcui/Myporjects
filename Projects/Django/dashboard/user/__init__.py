#encoding:utf-8

from django.views.generic import TemplateView, View
from django.contrib.auth.models import User
from django.shortcuts import render
from django.http import JsonResponse
from django.core.paginator import Paginator, EmptyPage

class UserListView(TemplateView):
    template_name = 'user/userlist.html'

    def get_context_data(self, **kwargs):
        context = super(UserListView, self).get_context_data(**kwargs)
        # context['username'] = User.objects.all()
        # return context
        #分页
        userlist = User.objects.all()            #获取所有用户列表对象
        paginator = Paginator(userlist, 10)      #实例化paginatot
        page = self.request.GET.get('page', 1)   #获取当前第几页(页码)
        try:
            page_obj = paginator.page(page)      #获取当前页数据
        except EmptyPage:
            page_obj = paginator.page(1)
        context['page_obj'] = page_obj

        return context
        #


    def get(self, request, *args, **kwargs):
        self.request = request
        return super(UserListView, self).get(request, *args, **kwargs)

class ModifyUserStatusView(View):
    def post(self,request):
        ret = {'status': 0}
        user_id = request.POST.get('user_id', None)
        try:
            user = User.objects.get(pk=user_id)
            if user.is_active:
                user.is_active = False
            else:
                user.is_active = True
        except User.DoesNotExist:
            ret['status'] = 1
            ret['errmsg'] = '用户不存在'
        return JsonResponse(ret, safe=True)


