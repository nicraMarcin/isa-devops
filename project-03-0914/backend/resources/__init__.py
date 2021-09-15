"""
The app factory function.
"""
import os

from flask import Flask
from flask_cors import CORS

from .extensions import db
from .settings import ProdConfig, DevConfig
from .api import api_blueprint

if os.getenv("FLASK_ENV") == 'prod':
    DefaultConfig = ProdConfig
else:
    DefaultConfig = DevConfig


def create_app(config_object=DefaultConfig):
    app = Flask("FlaskPython")
    CORS(app)
    app.config.from_object(config_object)
    with app.app_context():
        register_extensions(app)
        register_blueprints(app)
    return app


def register_extensions(app: Flask):
    db.init_app(app)
    # db.create_all()


def register_blueprints(app: Flask):
    app.register_blueprint(api_blueprint)
