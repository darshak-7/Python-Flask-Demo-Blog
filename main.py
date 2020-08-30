from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
import json
import math
import os
from werkzeug.utils import secure_filename
from flask_mail import Mail

with open('P:\\Python\\Flask - Copy\\config.json','r') as c:
    params =  json.load(c)['params']

local_server = True

app = Flask(__name__)
app.secret_key='all well'
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail_user'],
    MAIL_PASSWORD = params['gmail_pass']
)
mail = Mail(app)

if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80))
    email = db.Column(db.String(120))
    msg = db.Column(db.String(120))
    mobno = db.Column(db.String(12))
    date = db.Column(db.String(12))

class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80))
    slug = db.Column(db.String(50))
    content = db.Column(db.String(200))
    date = db.Column(db.String(12))
    img_file = db.Column(db.String(50))
    
@app.route('/next')
def next():
    if params['end'] < len(Post.query.filter_by().all()):
        params['start'] += params['num_of_post']
        params['end'] += params['num_of_post']
        print(params['end'])
    return redirect('/')

@app.route('/previous')
def previous():
    if params['start'] > 0:
        params['start'] -= params['num_of_post']
        params['end'] -= params['num_of_post']
        print(params['end'])
    else:
        params['start'] = 0
        params['end'] = params['num_of_post']
    return redirect('/')

@app.route('/')
def home():
    post = Post.query.filter_by().all()[params['start']:params['end']]
    return render_template('index.html', params=params, post= post)

@app.route('/dashboard', methods=['GET','POST'])
def dashboard():

    if 'user' in session and session['user']==params['admin_user']:
        posts = Post.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('admin_user')
        userpass = request.form.get('admin_password')

        if params['admin_user']==username and params['admin_pass']==userpass:
            session['user'] = username
            posts = Post.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
    
    return render_template('login.html', params=params)

@app.route('/about')
def about():
    return render_template('about.html', params=params)

@app.route('/delete/<string:id>', methods = ['GET','POST'])
def delete(id):
    if 'user' in session and session['user']==params['admin_user']:
        post = Post.query.filter_by(id = id).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')

@app.route('/edit/<string:id>', methods = ['GET','POST'])
def edit(id):
    if 'user' in session and session['user']==params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
            if id == '0':
                post = Post(title = box_title , slug = slug , content = content, img_file = img_file, date = date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(id = id).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/'+id)
        post = Post.query.filter_by(id = id).first()
        return render_template('edit.html', params = params, post = post ,id=id)


@app.route('/uploader', methods = ['GET','POST'])
def uploader():
    if 'user' in session and session['user']==params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return 'uploaded successfully'

@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route('/contact', methods = ['GET','POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        msg = request.form.get('message')
        mobno = request.form.get('phone')
        date = datetime.now()

        entry = Contact(name = name, mobno = mobno, email = email, msg = msg, date = date)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('new message from blog', sender = email, recipients = [params['gmail_user']], body = 'name: '+name+' \nMessage: '+msg + '\nMobile no: ' + mobno + '\nEmail: '+email)

    return render_template('contact.html', params=params)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Post.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params, post=post)

app.run(debug=True)