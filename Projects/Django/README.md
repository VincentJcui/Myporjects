安装python2.7.13
    ./configure --prefix=/usr/local/python27
安装setuptools
    /usr/local/python27/bin/python setup.py install
安装pip
    /usr/local/python27/bin/easy_install pip
安装virtualenv
    /usr/local/python27/bin/pip install virtualenv
初始化pythonenv
    /usr/local/python27/bin/virtualenv /data/python27env
    source /data/python27env/bin/activate     #进入env环境
    deactivate                                #退出env环境
安装django
    pip install "diango>=1.8,<1.9"
创建django项目
    django_admin startproject opsweb          #opsweb 为项目名字
启动django
    python manage.py runserver 0.0.0.0:5000
创建django应用app
    1.startapp
        python manage.py startapp dashboard
    2.配置install_apps
    3.配置django项目url

编写view
配置应用的url


编辑settings.py,修改如下几个内容:


# 默认值为空,只允许本机访问,改为*,代表允许任意访问,注意使用引号引起来
ALLOWED_HOSTS = ["*"]          


#默认连接sqlite3数据,这里设置成连接mysql,需要指定用户名,密码,访问地址,端口,数据库名字
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'opweb',
        'USER': 'root',
        'PASSWORD': '6522123',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}

#程序启动,默认端口为8000
mangage.py  runserver 0.0.0.0:8000 

#新建app,需要修改settings,添加应用
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'dashboard',
]

#配置url,配置urls.py
url(r'^dashboard/', include("dashboard/urls")),



request对象:
    request.schema
    request.body
    request.path
    request.path_info
    request.method
    request.encoding
    request.GET
    request.POST
    request.META
    request.user
    request.get_host()
    request.get_full_path()
    request.build_absolute_uri(location)
    request.get_signed_cookie()
    request.is_secure()
    request.is_ajax()
    
HttpResponse对象:
    HttpResponse.__init__(content="", content_type=None, status=200, reason=None, charset=None)
    
JsonResponse对象: (注意)
    safe=True    对应解析字典
    safe=False   对应解析列表
    
    
