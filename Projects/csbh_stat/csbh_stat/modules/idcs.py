#encoding:utf-8
import time
import datetime
from dbutils import MySQLConnection as SQL


def get_idc_info_date():
    now_year = datetime.datetime.now().strftime('%Y')
    _sql_all = 'select sum(combined) from idc_data where date like %s group by date order by date;'
    _sql_alone = 'select date,idcname,combined from idc_data where date like %s order by date'
    _args = (now_year+'%',)
    _sql_count_all, rt_list_all = SQL.excute_sql(_sql_all,_args)
    _sql_count, rt_list = SQL.excute_sql(_sql_alone,_args)
    '''
    计算每月总收入-------------
    '''
    rt = []
    # print rt_list_all,_sql_count
    for x in rt_list_all:
        rt.append(float(x[0]))
    all_date = []
    all_date.append({'data': rt ,'name': '总支出'})
    '''
    计算每个机房每个月的收入
    '''
    rs = []
    for x in rt_list:
        if len(rs) != 0:
            for y in rs:
                if y['name'] == x[1]:
                    y['data'].append(float(x[2]))
                    status = 0
                    break
                else:
                    status = 1
        else:
            status = 1
        if status == 1:
            rs.append({'name': x[1], 'data': [float(x[2])]})

    # 返回总支出和单机房月支持的列表
    return all_date + rs

def month_get():
    d = datetime.datetime.now()
    dayscount = datetime.timedelta(days=d.day)
    dayto = d - dayscount
    date_from = datetime.datetime(dayto.year, dayto.month, 1)
    # date_to = datetime.datetime(dayto.year, dayto.month, dayto.day, 23, 59, 59)
    return '-'.join(str(date_from).split('-')[:2])

def get_new_idcinfo(_local_date=month_get()):
    colloens = ('id', 'date', 'idcname', 'cabinet', 'cabinet_price','host_amount','bandwidth','bandwidth_price','bandwidth_amount','combined','status','info')
    _sql  = 'select * from idc_data where date = %s'
    _args = (_local_date,)
    rt = []
    _sql_count, rt_list = SQL.excute_sql(_sql,_args)
    for i in rt_list:
        rt.append(dict(zip(colloens,i)))
    return _local_date,rt

def add_new_before_select(params):
    idcname = params.get('idcname')
    date = params.get('date')
    _sql = 'select * from idc_data where idcname = %s and date = %s'
    _args = (idcname,date)
    _sql_count, rt_list = SQL.excute_sql(_sql, _args)
    if _sql_count != 0 :
        return False,idcname+' '+date+'已存在'
    return True,'进行入库操作'

def add_new_idcinfo(params):
    idcname =  params.get('idcname')
    date = params.get('date')
    cabinet = params.get('cabinet')
    cabinet_price = params.get('cabinet_price')
    host_amount = params.get('host_amount')
    bandwidth = params.get('bandwidth')
    bandwidth_price = params.get('bandwidth_price')
    bandwidth_amount = float(bandwidth) * float(bandwidth_price)
    combined = float(host_amount) + float(bandwidth_amount)
    status = params.get('status')
    info = params.get('info')
    # print date,idcname,cabinet,cabinet_price,host_amount,bandwidth,bandwidth_price,bandwidth_amount,combined,status,info
    _sql = 'insert into idc_data(date,idcname,cabinet,cabinet_price,host_amount,bandwidth,bandwidth_price,bandwidth_amount,combined,status,info) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
    _args = (date,idcname,cabinet,cabinet_price,host_amount,bandwidth,bandwidth_price,bandwidth_amount,combined,status,info)
    _sql_count,rt_list = SQL.excute_sql(_sql,_args,fetch=False)
    if _sql_count != 0:
        return True ,'添加成功'
    return False ,'添加失败'

def update_idcinfo(params):
    id = params.get('id')
    idcname = params.get('idcname')
    date = params.get('date')
    cabinet = params.get('cabinet')
    cabinet_price = params.get('cabinet_price')
    host_amount = params.get('host_amount')
    bandwidth = params.get('bandwidth')
    bandwidth_price = params.get('bandwidth_price')
    bandwidth_amount = float(bandwidth) * float(bandwidth_price)
    combined = float(host_amount) + float(bandwidth_amount)
    status = params.get('status')
    info = params.get('info')
    _sql = 'update idc_data set date = %s, idcname = %s , cabinet = %s , cabinet_price = %s, host_amount = %s, ' \
           'bandwidth = %s, bandwidth_price = %s, bandwidth_amount = %s,combined = %s,status = %s,info = %s where id = %s'
    _args = (date,idcname,cabinet,cabinet_price,host_amount,bandwidth,bandwidth_price,bandwidth_amount,combined,status,info,id)
    _sql_count, rt_list = SQL.excute_sql(_sql, _args, fetch=False)
    if _sql_count != 0:
        return True ,'更新成功'
    return False ,'更新失败'

def delete_idcinfo(params):
    id = params.get('id')
    idcname = params.get('idcname')
    date = params.get('date')
    _sql = 'delete from idc_data where id = %s and date = %s and idcname = %s'
    _args = (id,date,idcname)
    _sql_count, rt_list = SQL.excute_sql(_sql,_args, fetch=False)
    if _sql_count != 0:
        return True, '删除成功'
    return False, '删除失败'