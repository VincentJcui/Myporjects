#encoding:utf-8
from . import auth
from flask import render_template
from flask import redirect
from flask import request
from scripts import users
from flask import session


@auth.route('/')
def index():
    return render_template('login.html')

'''
登陆用户
'''
@auth.route('/login/',methods = ['POST','GET'])
def login():
    params = request.args if request.method == 'GET' else request.form
    username = params.get('username', '')
    password = params.get('password', '')
    _sql_count,_rt_list = users.login_user_check(username,password)
    if _sql_count != 0:
        id = _rt_list[0].get('permission')
        permission = _rt_list[0].get('permission')
        session['username'] = {'username': username ,'uid':id ,'permission':permission}
        print id
        return redirect('/idc/info/')
    return render_template('login.html',error='用户名认证失败')
'''
登出用户
'''
@auth.route('/logout/',methods = ['POST','GET'])
def logout():
    session.clear()
    return redirect('/')