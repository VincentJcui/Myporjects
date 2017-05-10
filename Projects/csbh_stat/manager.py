#encoding:utf-8
#by 2017-02-15


from csbh_stat import views
app = views.app

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9999, debug=True)
    # uwsgi --http 0.0.0.0:9000 --wsgi-file Manager.py --callable app --processes 4 --threads 4

'''
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `cname` varchar(32) NOT NULL,
  `telphone` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `permission` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8


CREATE TABLE `idc_data` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `date` varchar(128) DEFAULT NULL,
  `idcname` varchar(128) DEFAULT NULL,
  `cabinet` int(6) DEFAULT NULL,
  `cabinet_price` decimal(32,2) DEFAULT NULL,
  `host_amount` decimal(32,2) DEFAULT NULL,
  `bandwidth` decimal(32,2) DEFAULT NULL,
  `bandwidth_price` decimal(32,2) DEFAULT NULL,
  `bandwidth_amount` decimal(32,2) DEFAULT NULL,
  `combined` decimal(10,2) DEFAULT NULL,
  `status` varchar(256) DEFAULT NULL,
  `info` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;


CREATE TABLE `info` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(48) NOT NULL COMMENT '平台',
  `server` varchar(48) NOT NULL COMMENT '服务器',
  `batt_t` varchar(48) NOT NULL COMMENT 'Battle更新时间',
  `match_t` varchar(48) NOT NULL COMMENT 'Match更新时间',
  `enro_t` varchar(48) NOT NULL COMMENT 'Enroll更新时间',
  `pvr_t` varchar(48) NOT NULL COMMENT 'PVR更新时间',
  `tran_t` varchar(48) NOT NULL COMMENT 'transe更新时间',
  `ext_t` varchar(48) NOT NULL COMMENT 'Ext更新时间',
  `war_t` varchar(48) NOT NULL COMMENT 'War更新时间',
  `conf_t` varchar(48) NOT NULL COMMENT 'Config更新时间',
  `start_batt` varchar(48) NOT NULL COMMENT 'Battle启动时间',
  `start_match` varchar(48) NOT NULL COMMENT 'Match启动时间',
  `start_enro` varchar(48) NOT NULL COMMENT 'Enroll启动时间',
  `start_pvr` varchar(48) NOT NULL COMMENT 'PVR启动时间',
  `start_state` varchar(48) NOT NULL COMMENT 'StateServer启动时间',
  `start_trans` varchar(48) NOT NULL COMMENT 'transe启动时间',
  `match_v` varchar(48) NOT NULL COMMENT 'Match版本号',
  `batt_v` varchar(48) NOT NULL COMMENT 'Battle版本号',
  `pvr_v` varchar(48) NOT NULL COMMENT 'PVR版本号',
  `state_v` varchar(48) NOT NULL COMMENT 'StateServer版本号',
  `trans_v` varchar(48) NOT NULL COMMENT 'transe版本号',
  `billingid` varchar(10) NOT NULL COMMENT '充值ID(ServerID)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='运维监测'
'''
