#encoding:utf-8
import json

from . import main
from flask import redirect, jsonify
from flask import render_template
from scipts import idc_info
from flask import request
from flask import flash
from app.auth import scripts

@main.route('/idc/info/',methods=['POST','GET'])
@scripts.users.login_required
def idc_infos():
    params = request.args if request.method == 'GET' else request.form
    date = params.get('dates')
    if not date:
        dates,access_list = idc_info.get_new_idcinfo()
    else:
        dates,access_list = idc_info.get_new_idcinfo(_local_date=date)
    all_combined = 0
    for i in access_list:
        all_combined += i.get('combined')
    return render_template('idc_info.html',list=access_list,all_combined=all_combined,dates=dates)


@main.route('/idc/info/addpage/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_addpage():
    return render_template('idc_info_add.html')


@main.route('/idc/info/add/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_add():
    params = request.args if request.method == 'GET' else request.form
    if idc_info.add_new_idcinfo(params):
        return redirect('/idc/info/')
    return render_template('idc_info_add.html')

@main.route('/idc/info/modify/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_modify():
    params = request.args if request.method == 'GET' else request.form
    access_list = idc_info.modify_idcinfo(params.get('id'))
    return render_template('idc_info_update.html',list=access_list)

@main.route('/idc/info/update/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_update():
    params = request.args if request.method == 'GET' else request.form
    if idc_info.update_idcinfo(params):
        return redirect('/idc/info/')

@main.route('/idc/info/delete/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_delete():
    params = request.args if request.method == 'GET' else request.form
    idc_info.delete_idcinfo(params.get('id'))
    return redirect('/idc/info/')

@main.route('/idc/info/data/',methods=['POST','GET'])
@scripts.users.login_required
def idc_info_data():
    params = request.args if request.method == 'GET' else request.form
    all_data = idc_info.get_idc_info_date()
    return jsonify(all_data=all_data)