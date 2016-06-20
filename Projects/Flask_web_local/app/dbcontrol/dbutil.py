#encoding:utf-8
import MySQLdb
from app.conf import config

def user_select(_sql,_args):
    return db_crontol(_sql,_args)

def user_update(_sql,_args):
    return db_crontol(_sql,_args,fetch=False)

def user_change(_sql,_args):
    return db_crontol(_sql,_args,fetch=False)

def user_delete(_sql,_args):
    return db_crontol(_sql,_args,fetch=False)

def idc_info_select_new_info(_sql,_args):
    return db_crontol(_sql,_args)

def idc_info_add_new_info(_sql,_args):
    return db_crontol(_sql, _args,fetch=False)

def idc_info_delete_info(_sql,_args):
    return db_crontol(_sql,_args,fetch=False)

def idc_info_update_info(_sql,_agrs):
    return db_crontol(_sql,_agrs,fetch=False)


def db_crontol(sql,args=(),fetch=True):
    conn = None
    curs = None
    sql_count = 0
    rt_list = []
    try:
        conn = MySQLdb.connect(host=config.mysql_host, user=config.mysql_user, passwd=config.mysql_passwd,
                               db=config.mysql_db, charset=config.mysql_charset)
        curs = conn.cursor()
        sql_count = curs.execute(sql, args)
        if fetch:
            rt_list = curs.fetchall()
        else:
            conn.commit()
    except BaseException as e:
        print e
    finally:
        if curs:
            curs.close()
        if conn:
            conn.close()
    return sql_count, rt_list