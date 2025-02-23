from flask.cli import FlaskGroup
from app import app, db
from app.models.users import Users
from werkzeug.security import generate_password_hash
cli = FlaskGroup(app)


@cli.command("create_db")
def create_db():
    with app.app_context():  # ✅ ใช้ context ของ Flask
        db.drop_all()
        db.create_all()
        db.session.commit()
    print("✅ Database created successfully!")





@cli.command("seed_db")
def seed_db():

    db.session.add(Users(name="เด็กชายทดสอบ", email='test@gmail.com',
                            password=generate_password_hash('1234',
                                                            method='sha256'),))
    db.session.commit()

    # db.session.add(
    #    PrivateContact(firstname='ส้มโอ', lastname='โอเค',
    #                   phone='081-111-1112', owner_id=1))
    

    # test_user = Hw10_users(email="sudlol@gmail.com", name='พีท หล่อเท่',
    #                         password=generate_password_hash('1234',
    #                                                         method='sha256'),
    #                         avatar_url='https://ui-avatars.com/api/?name=\พีท หล่อเท่&background=83ee03&color=fff')
    # db.session.add(test_user)
    # db.session.commit()

    # test_user2 = Hw10_users(email="sudsuay@gmail.com", name='สุดสวย',
    #                         password=generate_password_hash('1234',
    #                                                         method='sha256'),
    #                         avatar_url='https://ui-avatars.com/api/?name=\สุดสวย&background=83ee03&color=fff')
    # db.session.add(test_user2)
    # db.session.commit()

    # db.session.add(PrivateBlog_entries(message="อยากกินข้าวมันไก่", owner_id=test_user.id))
    # db.session.add(PrivateBlog_entries(message="ไลค์ทัก", owner_id=test_user2.id))
    # db.session.commit()


if __name__ == "__main__":
    cli()