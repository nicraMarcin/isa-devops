from resources.extensions import db


class Task(db.Model):
    __tablename__ = "task"

    id = db.Column(db.Integer, db.Sequence("task_id_seq"), primary_key=True)
    text = db.Column(db.String(255))
    is_archived = db.Column(db.Boolean)

    @property
    def serialize(self):
        """Return object data in easily serializable format"""
        return {
            "id": self.id,
            "text": self.text,
            "is_archived": self.is_archived
        }

    def __repr__(self):
        return (
            f"<Task(id='{self.id}', text='{self.text}', is_archived='{self.is_archived}')>"
        )
