import json
import pathlib
import sys

from flask import Response
from flask.testing import FlaskClient

app_path = pathlib.Path(__file__).resolve().parents[1]
sys.path.append(str(app_path))

from resources import db, create_app, DevConfig, ProdConfig  # noqa


example_tasks = ["eggs", "ham", "milk"]


def add_task(client: FlaskClient, text: str):
    data = json.dumps(
        {
            "text": text,
        }
    )
    return client.post("/api/todos", data=data, content_type="application/json")


def create_all():
    app = create_app(DevConfig)
    with app.app_context():
        db.create_all()


def add_data():
    app = create_app(DevConfig)
    with app.test_client() as client:
        for text in example_tasks:
            response: Response = add_task(client=client, text=text)


if __name__ == '__main__':
    if not pathlib.Path("dev.db").is_file():
        create_all()
    add_data()
