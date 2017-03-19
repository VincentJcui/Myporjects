#encoding:utf-8
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse, QueryDict
from django.template import Context, loader
from django.contrib.auth import authenticate, login, logout
from django.views.generic import View
from django.template import Context, loader, RequestContext, Template
import json


def hello(request):
    param = request.GET
    print param
    print param.get('aa',0)
    print param.get('bb',1)
    data = {
        'name': 'jcui',
        'age': 34,
    }
    # return HttpResponse(json.dumps(data), content_type="application/json")
    return JsonResponse(data, safe=True)
    # return HttpResponse('hello world, 你好 中国')

def login(request):
    # template = loader.get_template('login.html')
    # context = Context({'title': "reboot运维平台"})
    # return HttpResponse(template.render(context))
    title = {'title': "reboot运维平台"}
    return render(request, 'login.html', title)

def test_form(request):
    if request.method == 'GET':
        return render(request, 'test_form.html')
    elif request.method == 'POST':
        username = request.POST.get('username')
        fav = request.POST.getlist('fav')
        fav1 = request.POST.lists()
        fav2 = request.POST.dict()
        print username
        print fav
        print fav1
        print fav2
        return HttpResponse("")
    elif request.method == 'PUT':
        username = ''
        return HttpResponse("")
    pass

def login_view(request):
    if request.method == 'GET':
        title = {'title': "reboot运维平台"}
        return render(request, 'login.html', title)
    elif request.method == 'POST':
        ret = {'status': 0}
        username = request.POST.get('username',None)
        password = request.POST.get('password',None)
        #验证用户名和密码
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
            else:
                ret['status'] = 1
                ret['errmsg'] = '用户被禁用'
        else:
            ret['status'] = 2
            ret['errmsg'] = '用户名或密码错误'

        return JsonResponse(ret, safe=True)



def logout_view(request):
    logout(request)
    return HttpResponse('退出成功')

class IndexView(View):
    def get(self, requet):
        return render(requet, "login.html")

    pass