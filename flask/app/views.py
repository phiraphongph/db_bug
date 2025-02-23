import os
from flask import Flask, render_template
from app import app

<<<<<<< HEAD

=======
>>>>>>> Initial commit
@app.route('/')
def home():
    return 'Hello, World!23455'


@app.route('/login')
def login():
    return render_template('login.html')


@app.route('/signup')
def sign_up():
    return render_template('sign_up.html')
