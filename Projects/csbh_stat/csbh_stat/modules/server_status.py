#encoding:utf-8
#by 2016-09-26


from dbutils import MySQLConnection as SQL

def server_status():
    collections = ('id','name','server','batt_t','match_t','enro_t','pvr_t','tran_t','ext_t','war_t','conf_t','start_batt','start_match',
                   'start_enro','start_pvr','start_state','start_trans','match_v','batt_v','pvr_v','state_v','trans_v','billingid')
    _sql = 'select * from info'
    sql_count, rt_list = SQL.excute_sql(_sql)
    rt = []
    for i in rt_list:
        rt.append(dict(zip(collections, i)))
    return rt if sql_count != 0 else None