import sqlalchemy
from .db_session import SqlAlchemyBase


class User(SqlAlchemyBase):  # таблица пользователей базы данных
    __tablename__ = 'user'  # название таблицы
    id = sqlalchemy.Column(sqlalchemy.Integer,
                           primary_key=True, autoincrement=True, unique=True)  # id пользователя
    name = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=False)  # имя пользователя
    mail = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=True)  # почта пользователя
    password = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=False)  # пароль пользователя
