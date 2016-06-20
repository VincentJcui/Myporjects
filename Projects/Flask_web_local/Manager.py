#encoding:utf-8

import os
from app import init_app
from flask.ext.script import Manager
from flask.ext.script import Manager,Shell
from flask.ext.migrate import Migrate,MigrateCommand

app = init_app()
manager = Manager(app)



if __name__ == '__main__':
    app.run()