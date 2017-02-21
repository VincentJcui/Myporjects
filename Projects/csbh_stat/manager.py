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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8
'''