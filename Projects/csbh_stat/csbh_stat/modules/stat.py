#encoding:utf-8
#by 2016-09-26

from dbutils import MySQLConnection as SQL

'''
    result['4399frame'] = frame_4399_list
    result['7k7kframe'] = frame_7k7k_list
    result['4399caton'] = caton_4399_list
    result['7k7kcaton'] = caton_7k7k_list
    result['4399mouse'] = mouse_4399_list
    result['7k7kmouse'] = mouse_7k7k_list
    result['4399memory'] = memory_4399_list
    result['7k7kmemory'] = memory_7k7k_list
    result['4399load'] = load_4399_list
    result['7k7kload'] = load_7k7k_list
    result['4399enter'] = enter_game_4399_list
    result['7k7kenter'] = enter_game_7k7k_list
'''

def stat_import(params):

    _sql = 'insert into frame_stat(ptname,date,frame_49,frame_55,frame_60,frame_49_new,frame_55_new,frame_60_new) values (%s,%s,%s,%s,%s,%s,%s,%s)'
    _args_4399 = params['4399frame']
    _args_7k7k = params['7k7kframe']
    for _args in _args_4399,_args_7k7k:
        SQL.excute_sql(_sql,_args,fetch=False)

    _sql = 'insert into caton_stat(ptname,date,caton_5,caton_15,caton_30,caton_50,caton_70,caton_95,caton_100,caton_5_new,caton_15_new,caton_30_new,caton_50_new,caton_70_new,caton_95_new,caton_100_new) values ( \
%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
    _args_4399 = params['4399caton']
    _args_7k7k = params['7k7kcaton']
    for _args in _args_4399,_args_7k7k:
        SQL.excute_sql(_sql, _args, fetch=False)

    _sql = 'insert into load_stat(ptname,date,load_config,load_res) values (%s,%s,%s,%s)'
    _args_4399 = params['4399load']
    _args_7k7k = params['7k7kload']
    for _args in _args_4399, _args_7k7k:
        SQL.excute_sql(_sql, _args, fetch=False)

    _sql = 'insert into memory_stat(ptname,date,memory_500,memory_700,memory_900,memory_1100) values (%s,%s,%s,%s,%s,%s)'
    _args_4399 = params['4399memory']
    _args_7k7k = params['7k7kmemory']
    for _args in _args_4399, _args_7k7k:
        SQL.excute_sql(_sql, _args, fetch=False)

    _sql = 'insert into mouse_stat(ptname,date,mouse_20,mouse_30,mouse_50,mouse_75,mouse_20_new,mouse_30_new,mouse_50_new,mouse_75_new) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
    _args_4399 = params['4399mouse']
    _args_7k7k = params['7k7kmouse']
    for _args in _args_4399, _args_7k7k:
        SQL.excute_sql(_sql, _args, fetch=False)

    _sql = 'insert into enter_game_stat(ptname,date,success,battle_res_load,army_success,room_success,lobby_success,frist_root_success,frist_lobby_success,frist_battle_success,fighting_drop, \
    frist_fighting_drop,ladder_drop,frist_ladder_drop,trans_drop,browser,ladder_match) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)'
    _args_4399 = params['4399enter']
    _args_7k7k = params['7k7kenter']
    for _args in _args_4399, _args_7k7k:
        SQL.excute_sql(_sql, _args, fetch=False)

def stat_export(collections,tablename,ptname,date):
    _sql = 'select * from {tablename} where ptname = %s order by date'.format(tablename=tablename)
    _args = (ptname,)
    sql_count, rt_list = SQL.excute_sql(_sql,_args)
    rt = []
    for i in rt_list:
        rt.append(dict(zip(collections,i)))
    return rt if sql_count != 0 else None

def stat_day_up_down(info,rt_dict):
    a = 0
    b = 0
    for x in range(len(rt_dict)):
        if info == 'frame':
            frame_60_day_tmp = rt_dict[x]['frame_60'] - a
            frame_60_day_new_tmp = rt_dict[x]['frame_60_new'] - b
            if x == 0:
                rt_dict[x]['frame_60_day'] = 0
                rt_dict[x]['frame_60_new_day'] = 0
            else:
                rt_dict[x]['frame_60_day'] = str(round(frame_60_day_tmp,2))+'%'+' <span class="jiantou_up">↑</span>' if round(frame_60_day_tmp,2) > 0 else str(round(frame_60_day_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['frame_60_new_day'] = str(round(frame_60_day_new_tmp,2))+'%'+' <span class="jiantou_up">↑</span>' if round(frame_60_day_new_tmp,2) > 0 else str(round(frame_60_day_new_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
            a = rt_dict[x]['frame_60']
            b = rt_dict[x]['frame_60_new']
        elif info == 'mouse':
            mouse_20_day_tmp = rt_dict[x]['mouse_20'] - a
            mouse_20_day_new_tmp = rt_dict[x]['mouse_20_new'] - b
            if x == 0 :
                rt_dict[x]['mouse_20_day'] = 0
                rt_dict[x]['mouse_20_new_day'] = 0
            else:
                rt_dict[x]['mouse_20_day'] = str(round(mouse_20_day_tmp,2))+'%'+' <span class="jiantou_up">↑</span>' if round(mouse_20_day_tmp,2) > 0 else str(round(mouse_20_day_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['mouse_20_new_day'] = str(round(mouse_20_day_new_tmp,2))+'% '+' <span class="jiantou_up">↑</span>' if round(mouse_20_day_new_tmp,2) > 0 else str(round(mouse_20_day_new_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
            a = rt_dict[x]['mouse_20']
            b = rt_dict[x]['mouse_20_new']
        elif info == 'load':
            load_config_day_tmp = rt_dict[x]['load_config'] - a
            load_res_day_tmp = rt_dict[x]['load_res'] - b
            if x == 0:
                rt_dict[x]['load_config_day'] = 0
                rt_dict[x]['load_res_day'] = 0
            else:
                rt_dict[x]['load_config_day'] = str(round(load_config_day_tmp,2))+'%'+' <span class="jiantou_up">↑</span>' if round(load_config_day_tmp,2) > 0 else str(round(load_config_day_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['load_res_day'] = str(round(load_res_day_tmp,2))+'%'+' <span class="jiantou_up">↑</span>' if round(load_res_day_tmp,2) > 0 else str(round(load_res_day_tmp,2))+'%'+' <span class="jiantou_down">↓</span>'
            a = rt_dict[x]['load_config']
            b = rt_dict[x]['load_res']
    return rt_dict

def stat_month_up_down(info,rt_dict):
    tmp_list = []
    for x in range(len(rt_dict)):
        if info == 'frame':
            tmp_list.append((rt_dict[x]['frame_60'],rt_dict[x]['frame_60_new']))
            if x > 30:
                a = round(rt_dict[x]['frame_60'] - tmp_list[x-30][0],2)
                b = round(rt_dict[x]['frame_60_new'] - tmp_list[x-30][1],2)
                rt_dict[x]['frame_60_month'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['frame_60_new_month'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
        elif info == 'mouse':
            tmp_list.append((rt_dict[x]['mouse_20'], rt_dict[x]['mouse_20_new']))
            if x > 30:
                a = round(rt_dict[x]['mouse_20'] - tmp_list[x - 30][0],2)
                b = round(rt_dict[x]['mouse_20_new'] - tmp_list[x - 30][1],2)
                rt_dict[x]['mouse_20_month'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['mouse_20_new_month'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
        elif info == 'load':
            tmp_list.append((rt_dict[x]['load_config'], rt_dict[x]['load_res']))
            if x > 30:
                a = round(rt_dict[x]['load_config'] - tmp_list[x - 30][0],2)
                b = round(rt_dict[x]['load_res'] - tmp_list[x - 30][1],2)
                rt_dict[x]['load_config_month'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['load_res_month'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
    return rt_dict

def stat_week_up_down(info,rt_dict):
    tmp_list = []
    for x in range(len(rt_dict)):
        if info == 'frame':
            tmp_list.append((rt_dict[x]['frame_60'], rt_dict[x]['frame_60_new']))
            if x > 6 :
                a = round(rt_dict[x]['frame_60'] - tmp_list[x - 7][0],2)
                b = round(rt_dict[x]['frame_60_new'] - tmp_list[x - 7][1],2)
                rt_dict[x]['frame_60_week'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['frame_60_new_week'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
        elif info == 'mouse':
            tmp_list.append((rt_dict[x]['mouse_20'], rt_dict[x]['mouse_20_new']))
            if x > 6:
                a = round(rt_dict[x]['mouse_20'] - tmp_list[x - 7][0],2)
                b = round(rt_dict[x]['mouse_20_new'] - tmp_list[x - 7][1],2)
                rt_dict[x]['mouse_20_week'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['mouse_20_new_week'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
        elif info == 'load':
            tmp_list.append((rt_dict[x]['load_config'], rt_dict[x]['load_res']))
            if x > 6:
                a = round(rt_dict[x]['load_config'] - tmp_list[x - 7][0],2)
                b = round(rt_dict[x]['load_res'] - tmp_list[x - 7][1],2)
                rt_dict[x]['load_config_week'] = str(a)+'%'+' <span class="jiantou_up">↑</span>' if a > 0 else str(a)+'%'+' <span class="jiantou_down">↓</span>'
                rt_dict[x]['load_res_week'] = str(b)+'%'+' <span class="jiantou_up">↑</span>' if b > 0 else str(b)+'%'+' <span class="jiantou_down">↓</span>'
    return rt_dict