import sqlalchemy
from .db_session import SqlAlchemyBase
from werkzeug.security import generate_password_hash, check_password_hash


class User(SqlAlchemyBase):  # таблица пользователей базы данных
    __tablename__ = 'user'  # название таблицы
    id = sqlalchemy.Column(sqlalchemy.Integer,
                           primary_key=True, autoincrement=True, unique=True)  # id пользователя
    name = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=False)  # имя пользователя
    mail = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=True)  # почта пользователя
    password = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=False)  # пароль пользователя

    def set_password(self, password):  # функция для хеширования пароля
        self.hashed_password = generate_password_hash(password)

    def check_password(self, password):  # функция для проверки пароля
        return check_password_hash(self.hashed_password, password)
