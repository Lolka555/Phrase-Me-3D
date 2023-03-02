# Phrase-Me-3D

## How it work:
---------------------------------------------------------------------------------------------------------------------------------------

![ezgif-2-9b3e03b7d7](https://user-images.githubusercontent.com/70414732/222425161-04c1ffc1-55d8-4288-88e3-f894fa387cc4.gif)





## How to start work like user:
---------------------------------------------------------------------------------------------------------------------------------------
1) Загрузить zip-архив данного репозитория
2) Открыть папку PhraseMe3D, открыть файл PhraseMe3D.xcodeproj в xcode
3) Заменить 3D модельки на модельки из PM3D_API из папки models // Нужно только для демонстрации работы пока не налажена работа с файлами
4) Подключить iPhone к Macbook через провод
5) Выбрать среди устройств ваш iPhone
6) Нажать кнопку "запустить" в xcode
7) Разрешить в настройках сторонних разработчиков
8) Ваше приложение станет доступно на рабочем столе iPhone
9) Запустить приложение

## How to start work like developer:
---------------------------------------------------------------------------------------------------------------------------------------
Требуемая версия Python 3.9
1) Открыть PM3D_API скачать requirements.txt
2) Прописать в терминале по местонахождению файла 'pip install -r requirements.txt'
3) Заменить в строках 13 и 14 PM3D_API/main.py сервер и порт (стандартные: localhost:8080)
4) Заменить путь до папки моделей /Users/egorurov/PycharmProjects/Phrase-Me-3D/PM3D_API/models на путь до папки models на вашем компьюторе
5) Запустить main.py
