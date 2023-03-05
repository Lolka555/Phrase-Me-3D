import sqlalchemy.exc
from flask import Blueprint, jsonify, render_template, request, Response
from data import db_session
from data.model import Model
from data.user import User
from flask import Flask, abort, send_from_directory
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash
import json
import datetime
import jwt
import uuid


Server = '192.168.1.3'  # api сервер
Port = 1221  # порт регистрации

db_session.global_init("db/data.db")  # подключение к базе данных

users_blueprint = Blueprint(
    'hahaprof_app_api',
    __name__
)
session = db_session.create_session()


@users_blueprint.route('/api/get_all_models', methods=['GET'])  # функция для получения словаря всех моделей
def get_all_models():
    models = session.query(Model).values(Model.name, Model.id)
    d = {}
    for name, id in models:
        d[name] = id
    return jsonify(d)


@users_blueprint.route('/api/get_model/<int:id>', methods=['GET'])  # получение модели по id
def get_model(id):
    try:
        filename = session.query(Model).filter(Model.id == id).one().file
    except sqlalchemy.exc.NoResultFound:
        return 'Model not found', 400

    print(filename)

    try:
        return send_from_directory(app.config['models_dir'], filename)
    except FileNotFoundError:
        abort(401)


@users_blueprint.route('/register/user', methods=['POST'])  # регистрация пользователя в базу данных
def register_user():
    try:
        username = request.form['username']
        password = request.form['password']
        hash = generate_password_hash(password)
        email = request.form['email']
        user_find = session.query(User).filter(User.name == username)
        user_find_2 = session.query(User).filter(User.mail == email)
        if session.query(user_find.exists()).scalar() or session.query(user_find_2.exists()).scalar():
            return json.dumps({'status': 'fail', 'message': 'User or Email already registered'}), 416
        public_ide = str(uuid.uuid4())  # создание уникального id пользователя для создания jwt токенов при авторизации
        user = User(public_id=public_ide, name=username, mail=email, password=hash)
        session.add(user)
        session.commit()
        return json.dumps({'status': 'success', 'message': 'Registered correctly'}), 200
    except Exception:
        return json.dumps({'status': 'fail', 'message': 'Authorization terminated due to unknown exception'}), 400


@users_blueprint.route('/login/user', methods=['GET'])  # авторизация пользователя в базу данных
def login_user():
    try:
        password = request.args.get('password')
        email = request.args.get('email')
        if session.query(User).filter(User.mail == email).count() == 0:
            return json.dumps({'status': 'fail', 'message': 'User Not Found'}), 404
        user = session.query(User).filter(User.mail == email).one()
        if not check_password_hash(user.password, password):
            return json.dumps({'status': 'fail', 'message': 'Incorrect Password '}), 412
        payload = {
            'user_id': user.public_id,
            'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=60*60)
        }
        token = jwt.encode(payload, 'secret_key', algorithm='HS256')
        return json.dumps({'token': token}), 200
    except Exception:
        return json.dumps({'status': 'fail', 'message': 'Authorization terminated due to unknown exception'}), 400


@users_blueprint.route('/username-by-token', methods=['POST'])  # возвращение username по токену
def username_by_token():
    try:
        token = request.form['token']
        data = jwt.decode(token, key='secret_key', algorithms=['HS256', ])
        if session.query(User).filter(User.public_id == data["user_id"]).count() == 0:
            return json.dumps({'status': 'fail', 'message': 'User not found'}), 404
        user = session.query(User).filter(User.public_id == data["user_id"]).one()
        return json.dumps({'email': user.mail}), 200
    except Exception:
        return json.dumps({'status': 'fail', 'message': 'Token not found'}), 400


app = Flask(__name__)  # создание flask приложения
app.config['SECRET_KEY'] = "secret_key"  # ключ для конфигурации
app.config['models_dir'] = '/Users/egor/Desktop/backend-main/models'  # путь для хранения моделей


if __name__ == '_main_':  # запуск api сервера
    app.register_blueprint(users_blueprint)
    app.run(Server, Port, debug=False)
