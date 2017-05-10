#encoding:utf-8
import json
import sys
import random
import string

import datetime
from flask import render_template,request,redirect,session, flash ,jsonify
from . import app         #user模块下的变量,在__init__.py  中定义
from modules import gconfig
from modules import stat
from modules.server_status import server_status
from modules.user import User
from modules import idcs

#
reload(sys)
sys.setdefaultencoding('utf8')
#解决字符串默认为ASCII编码的问题,导致输出中文为乱码

'''
加载主页
'''
@app.route('/')
def index():
    return redirect('/server/manager/')

'''
加载进入游戏统计页面
'''
@app.route('/enter_game/',methods=['POST','GET'])
def enter():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname', '4399')
    collections = (
    'id', 'ptname', 'date', 'success', 'battle_res_load', 'army_success', 'room_success', 'lobby_success',
    'frist_root_success', 'frist_lobby_success', 'frist_battle_success', 'fighting_drop' \
        , 'frist_fighting_drop', 'ladder_drop', 'frist_ladder_drop', 'trans_drop', 'browser', 'ladder_match')
    rt_dict = stat.stat_export(collections,'enter_game_stat',ptname,'2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    return render_template('stat/enter_game.html',enter_list=rt_dict[::-1])

'''
加载卡顿统计页面
'''
@app.route('/caton/',methods=['POST','GET'])
def caton():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname', '4399')
    collections = (
        'id', 'ptname', 'date', 'caton_5', 'caton_15', 'caton_30', 'caton_50', 'caton_70',
        'caton_95', 'caton_100', 'caton_5_new', 'caton_15_new' \
            , 'caton_30_new', 'caton_50_new', 'caton_70_new', 'caton_95_new', 'caton_100_new')
    rt_dict = stat.stat_export(collections, 'caton_stat', ptname, '2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    return render_template('stat/caton.html', caton_list=rt_dict[::-1])

'''
加载帧率统计页面
'''
@app.route('/frame/',methods=['POST','GET'])
def frame():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname','4399')
    collections = ('id', 'ptname', 'date','frame_49','frame_55','frame_60','frame_49_new','frame_55_new','frame_60_new')
    rt_dict = stat.stat_export(collections,'frame_stat', ptname, '2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    new_dict = stat.stat_day_up_down('frame',rt_dict)
    new_dict = stat.stat_week_up_down('frame',new_dict)
    new_dict = stat.stat_month_up_down('frame',new_dict)
    return render_template('stat/frame.html',frame_list=new_dict[::-1])

'''
加载鼠标统计页面
'''
@app.route('/mouse/',methods=['POST','GET'])
def mouse():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname', '4399')
    collections = ('id', 'ptname', 'date', 'mouse_20', 'mouse_30', 'mouse_50', 'mouse_75', 'mouse_20_new', 'mouse_30_new', 'mouse_50_new', 'mouse_75_new')
    rt_dict = stat.stat_export(collections, 'mouse_stat', ptname, '2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    new_dict = stat.stat_day_up_down('mouse', rt_dict)
    new_dict = stat.stat_week_up_down('mouse', new_dict)
    new_dict = stat.stat_month_up_down('mouse', new_dict)
    return render_template('stat/mouse.html', mouse_list=new_dict[::-1])

'''
加载登陆统计页面
'''
@app.route('/load/',methods=['POST','GET'])
def load():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname', '4399')
    collections = (
        'id', 'ptname', 'date', 'load_config', 'load_res')
    rt_dict = stat.stat_export(collections, 'load_stat', ptname, '2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    new_dict = stat.stat_day_up_down('load', rt_dict)
    new_dict = stat.stat_week_up_down('load', new_dict)
    new_dict = stat.stat_month_up_down('load', new_dict)
    return render_template('stat/load.html', load_list=new_dict[::-1])

'''
加载内存统计页面
'''
@app.route('/memory/',methods=['POST','GET'])
def memory():
    params = request.args if request.method == 'GET' else request.form
    ptname = params.get('ptname', '4399')
    collections = (
        'id', 'ptname', 'date', 'memory_500', 'memory_700', 'memory_900', 'memory_1100')
    rt_dict = stat.stat_export(collections, 'memory_stat', ptname, '2016-09')
    for x in rt_dict:
        new_date = x['date'].strftime('%Y-%m-%d')
        x['date'] = new_date
    return render_template('stat/memory.html', memory_list=rt_dict[::-1])

'''
接收统计数据API接口
'''
@app.route('/performs/',methods=['POST'])
def performs():
    app_key = request.headers.get('App-Key')
    app_secret = request.headers.get('App-Secret')
    if app_key != gconfig.app_key and app_secret != gconfig.app_secret:
        return json.dumps({'code':400,'text':'error app_key'})
    params =  request.get_json()
    # print params
    stat.stat_import(params)
    return json.dumps({'code':200,'text':'success'})

'''
跳转登陆页面
'''
@app.route('/entry/')
def loginning():
    return render_template('user/login.html')

'''
加载登陆页面
'''
@app.route('/login/',methods=['POST','GET'])
def login():
    params = request.args if request.method == 'GET' else request.form
    username = params.get('username', '')
    password = params.get('password', '')
    # 类调用--------
    get_session = User.validate_login(username, password)
    if get_session:
        session['username'] = get_session
        return redirect('/user/')
    else:
        return render_template('user/login.html', username=username, error='用户认证失败')

'''
加载用户列表
'''
@app.route('/user/',methods=['POST','GET'])
@User.login_check
def user():
    return render_template('user/user.html',user_list=User.get_list())

'''
新建用户
'''
@app.route('/user/newuser/',methods=['POST'])
@User.login_check
def newuser():
    params = request.args if request.method == 'GET' else request.form
    _is_ok,_error = User.user_add(params)
    return jsonify({'is_ok':_is_ok,'error':_error})

'''
用户删除
'''
@app.route('/user/userdel/',methods=['POST','GET'])
@User.login_check
def user_del():
    params = request.args if request.method == 'GET' else request.form
    id = params.get('id')
    username = params.get('username')
    if username == 'admin':
        return jsonify({'is_ok': False, 'error': '管理员不允许删除'})
    _is_ok, _error = User.user_del(int(id), username)
    return jsonify({'is_ok': _is_ok, 'error': _error})

'''
用户更新
'''
@app.route('/user/userupdate/',methods=['POST','GET'])
@User.login_check
def user_update():
    params = request.args if request.method == 'GET' else request.form
    _is_ok, _error = User.user_update(params)
    print _is_ok
    print _error
    return jsonify({'is_ok': _is_ok, 'error': _error})


'''
修改密码
'''
@app.route('/user/passwd-change/',methods=['POST'])
@User.login_check
def change_passwd():
    params = request.args if request.method == 'GET' else request.form
    uid = params.get('userid')
    upass = params.get('user-password')
    muser = session['username']['username']
    mpass = params.get('manager-password')
    _is_ok,_error = User.valid_change_passwd(uid, upass, muser, mpass)
    if _is_ok:
        _is_ok,_error = User.change_passwd(uid, upass)
    return jsonify({'is_ok':_is_ok,'error':_error})

'''
用户登出
'''
@app.route('/logout/')
def logout():
    session.clear()
    return redirect('/server/operating/')

'''
服务状态监测,运维使用
'''
@app.route('/server/manager/',methods=['POST','GET'])
def server_manager():
    current_page = request.args.get('page', 1)
    server_list, page_list = server_status('/server/manager/', current_page, 12)
    return render_template('info/manager.html', server_list=server_list, page_list=page_list)

'''
服务状态监测,运营使用
'''
@app.route('/server/operating/',methods=['POST','GET'])
def server_operating():
    current_page = request.args.get('page', 1)
    # server_status(参数1, 参数2)
    # 参数1代表打开第几页,参数2代表每页显示的条数
    server_list, page_list = server_status('/server/operating/', current_page, 20)
    return render_template('info/operating.html', server_list=server_list, page_list=page_list)

'''
IDC1
'''
@app.route('/idc/current/',methods=['POST','GET'])
def idc_1():
    all_data = idcs.get_idc_info_date()
    return render_template('idcs/idc1.html')
    # return jsonify(all_data=all_data)

'''
IDC1_data
'''
@app.route('/idc/current/data/',methods=['POST','GET'])
def idc_1_data():
    all_data = idcs.get_idc_info_date()
    return jsonify(all_data=all_data)

'''
IDC2
'''
@app.route('/idc/detail/',methods=['POST','GET'])
def idc_2():
    params = request.args if request.method == 'GET' else request.form
    date = params.get('dates')
    if not date:
        dates, access_list = idcs.get_new_idcinfo()
    else:
        dates, access_list = idcs.get_new_idcinfo(_local_date=date)
    all_combined = 0
    for i in access_list:
        all_combined += i.get('combined')
    return render_template('idcs/idc2.html', idc_list=access_list, all_combined=all_combined, dates=dates)

'''
IDC2添加信息
'''
@app.route('/idc/detail/add/',methods=['POST','GET'])
def idc_add():
    params = request.args if request.method == 'GET' else request.form
    _is_ok, _error = idcs.add_new_before_select(params)
    if not _is_ok:
        return jsonify({'is_ok': _is_ok, 'error': _error})
    _is_ok, _error = idcs.add_new_idcinfo(params)
    return jsonify({'is_ok': _is_ok, 'error': _error})

'''
IDC2删除信息
'''
@app.route('/idc/detail/delete/',methods=['POST','GET'])
def idc_modify():
    params = request.args if request.method == 'GET' else request.form
    _is_ok, _error = idcs.delete_idcinfo(params)
    return jsonify({'is_ok': _is_ok, 'error': _error})

'''
IDC2修改修改信息
'''
@app.route('/idc/detail/update/',methods=['POST','GET'])
def idc_update():
    params = request.args if request.method == 'GET' else request.form
    _is_ok, _error = idcs.update_idcinfo(params)
    return jsonify({'is_ok': _is_ok, 'error': _error})