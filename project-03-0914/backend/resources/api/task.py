import logging

from flask import abort, make_response
from flask_restful import Resource, reqparse
from flask_restful.representations import json

from database.task import Task
from resources.api import api
from resources.extensions import db

# source: https://flask-restful.readthedocs.io/en/latest/quickstart.html#endpoints


def abort_or_return_item(todo_id: int) -> Task:
    item = Task.query.filter(Task.id == todo_id).first()
    if not item:
        abort(404, message=f"Todo {todo_id} doesn't exist")
    return item


parser = reqparse.RequestParser()
parser.add_argument('text')


class Todo(Resource):
    """
    Shows a single todo item and lets you delete a todo item
    """
    @staticmethod
    def get(todo_id: int):
        item = abort_or_return_item(todo_id)
        return item

    @staticmethod
    def delete(todo_id):
        item = abort_or_return_item(todo_id)
        item.is_archived = True
        db.session.commit()
        return '', 204


class TodoList(Resource):
    """
    Shows a list of all todos, and lets you POST to add new tasks
    """
    @staticmethod
    def get():
        tasks = Task.query.all()
        return make_response(
            json.dumps(
                {
                    "tasks": [
                        {"id": t.id, "text": t.text} for t in tasks
                    ]
                }
            ),
            201
        )

    @staticmethod
    def post():
        args = parser.parse_args()
        new_task = Task(text=args["text"], is_archived=False)
        db.session.add(new_task)
        db.session.commit()
        return make_response(
            json.dumps(
                {
                    "id": new_task.id
                }
            ),
            201
        )


api.add_resource(TodoList, '/todos')
api.add_resource(Todo, '/todos/<todo_id>')
