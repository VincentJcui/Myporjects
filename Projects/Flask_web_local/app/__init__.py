#encoding:utf-8
import os

from flask import Flask
from flask import render_template
from flask import redirect
from flask.ext.bootstrap import Bootstrap
from flask.ext.script import Manager
from flask import Blueprint
from flask.ext.mail import Mail
from flask.ext.moment import Moment
from flask.ext.sqlalchemy import SQLAlchemy
import sys

reload(sys)
sys.setdefaultencoding('utf8')

bootstrap = Bootstrap()

from . import auth
from . import main


def init_app():
    app = Flask(__name__)

    # app.secret_key = os.urandom(32)
    app.secret_key = 'asd1232354kjashfdp asd//asda.sdn/asrm23pr423ujr4e23po'

    bootstrap.init_app(app)

    from auth import auth as auth_blueprint
    app.register_blueprint(auth_blueprint)

    from main import main as main_blueprint
    app.register_blueprint(main_blueprint)

    # manager = Manager(app)

    return app