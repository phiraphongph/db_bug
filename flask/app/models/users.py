from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()
print('import success')
class Users(db.Model):
    __tablename__ = 'users'
    
    id = db.Column(db.BigInteger, primary_key=True)
    name = db.Column(db.String, nullable=False)
    email = db.Column(db.String, unique=True, nullable=False)
    password = db.Column(db.String, nullable=False)
    # created_at = db.Column(db.DateTime, default=datetime.utcnow, nullable=False)
    def __init__(self, name, email, password):
        self.name = name
        self.email = email
        self.password = password

