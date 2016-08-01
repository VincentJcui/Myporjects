#encoding:utf-8

import os
from app import init_app
from flask.ext.script import Manager
from flask.ext.script import Manager,Shell
from flask.ext.migrate import Migrate,MigrateCommand

app = init_app()
# manager = Manager(app)



if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000, debug=True)
    # uwsgi --http 0.0.0.0:9000 --wsgi-file manage.py --callable app --processes 4 --threads 4