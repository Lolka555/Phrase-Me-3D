import sqlalchemy
from .db_session import SqlAlchemyBase


class Model(SqlAlchemyBase):  # таблица моделей
    __tablename__ = 'model'  # название таблицы
    id = sqlalchemy.Column(sqlalchemy.Integer,
                           primary_key=True, autoincrement=True, unique=True)  # id пользователя
    name = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="", unique=True)  # название фразового глагола
    file = sqlalchemy.Column(sqlalchemy.String, nullable=False, default="")  # путь файла
