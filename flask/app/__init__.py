from flask import Flask
<<<<<<< HEAD
app = Flask(__name__)
=======
from flask_sqlalchemy import SQLAlchemy
from app.models.users import Users
import os
>>>>>>> Initial commit
app = Flask(__name__, static_folder='static')
app.config['DEBUG'] = True


<<<<<<< HEAD


from app import views # noqa
=======
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("DATABASE_URL", "sqlite:///test.db")
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

from app import views # noqa
>>>>>>> Initial commit
