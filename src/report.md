## Part 1. Готовый докер

1.1 Берем официальный докер образ с nginx и качаем его при помощи `docker pull`
![./screenshots/part1.0.png](./screenshots/part1.0.png)
1.2 Проверяем наличие докер образа через команду `docker images`
![./screenshots/part1.1.png](./screenshots/part1.1.png)
1.3 Запуск докер образа через `docker run -d [image_id|repository]` и проверка, что он запустился `docker ps`
![./screenshots/part1.2.png](./screenshots/part1.2.png)
1.4 Просмотр информации о контейнере через `docker inspect [container_id|container_name]`
![./screenshots/part1.3.png](./screenshots/part1.3.png)
1.4.1 Размер контейнера
![./screenshots/part1.4.png](./screenshots/part1.4.png)
1.4.2 Список замапленных портов
![./screenshots/part1.5.png](./screenshots/part1.5.png)
1.4.3 IP контейнера
![./screenshots/part1.6.png](./screenshots/part1.6.png)
1.5 Остановка докер образа через `docker stop` и проверка, что он остановился через `docker ps`
![./screenshots/part1.7.png](./screenshots/part1.7.png)
1.6 Запуск докера с замапленными портами 80 и 443 на локальную машину через команду `docker run`
![./screenshots/part1.8.png](./screenshots/part1.8.png)
1.7 Проверка по адресу localhost:80 доступности стартовой страницы nginx через `curl localhost:80`
![./screenshots/part1.9.png](./screenshots/part1.9.png)
1.8 Перезапуск докер контейнера через `docker restart [container_id|container_name]` и проверка, что запущен
![./screenshots/part1.10.png](./screenshots/part1.10.png)

## Part 2. Операции с контейнером

2.1 Выводим на экран конфигурационный файл nginx.conf внутри докер контейнера через команду `exec`
![./screenshots/part2.0.png](./screenshots/part2.0.png)
2.2 Создаем на машине файл `nginx.conf` с настройкой отдачи страницы со статусом сервера nginx
![./screenshots/part2.1.png](./screenshots/part2.1.png)
2.3 Копируем созданный файл `nginx.conf` в докер образ и перезапускаем nginx внутри докер образа
![./screenshots/part2.2.png](./screenshots/part2.2.png)
2.4 Проверка по адресу localhost:80 доступности стартовой страницы nginx через `curl localhost:80/status`
![./screenshots/part2.3.png](./screenshots/part2.3.png)
2.5 Экспорт контейнера в файл container.tar через команду `export` и остановка контейнера
![./screenshots/part2.4.png](./screenshots/part2.4.png)
2.6 Удаление образа через `docker rmi [image_id|repository]`, далее удаление остановленного контейнера
![./screenshots/part2.5.png](./screenshots/part2.5.png)
2.7 Импорт контейнера обратно в образ докера
![./screenshots/part2.6.png](./screenshots/part2.6.png)
2.7 Запуск контейнера и проверка отдачи страницы со статусом сервера nginx через `curl localhost:80/status`
![./screenshots/part2.7.png](./screenshots/part2.7.png)

## Part 3. Мини веб-сервер

3.1 Мини сервер, который возвращает простейшую страничку с надписью Hello World!
![./screenshots/part3.0.png](./screenshots/part3.0.png)
3.2 Свой `nginx.conf`, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080
![./screenshots/part3.1.png](./screenshots/part3.1.png)
3.3 Качаем docker nginx через команду `sudo docker pull nginx`
![./screenshots/part3.2.png](./screenshots/part3.2.png)
3.4 Далее, сверяемся, что образ скачан командой `sudo docker images` установлен корректно
![./screenshots/part3.3.png](./screenshots/part3.3.png)
3.5 Производим запуск Docker образа с указанаием порта
![./screenshots/part3.4.png](./screenshots/part3.4.png)
3.6 Проверяем, что контейнер запущен командой `sudo docker ps`
![./screenshots/part3.5.png](./screenshots/part3.5.png)
3.7 Копируем конфиг и минисервер в контейнер
![./screenshots/part3.6.png](./screenshots/part3.6.png)
3.8 Заходим в контейнер и проверяем, что установились скопированные файлы
![./screenshots/part3.7.png](./screenshots/part3.7.png)
3.9 Проверяем, что минисервер установлен
![./screenshots/part3.8.png](./screenshots/part3.8.png)
3.10 Обновляем систему и устанавливаем утилиты `gcc, spawn-fcgi, libfcgi-dev`
![./screenshots/part3.9.png](./screenshots/part3.9.png)
3.11 Компилируем и запускаем наш мини сервер
![./screenshots/part3.10.png](./screenshots/part3.10.png)
3.12 Перезагружаем nginx и смотрим привествие мини сервера командой `curl localhost:81`
![./screenshots/part3.11.png](./screenshots/part3.11.png)

## Part 4. Свой докер

4.1 Пишем скрипт для запуска мини сервера на порту 8080
![./screenshots/part4.0.png](./screenshots/part4.0.png)
4.2 Собираем Dockerfile
![./screenshots/part4.1.png](./screenshots/part4.1.png)
4.3 Запускаем Dockerfile командой `sudo docker build -t navigato:new .`
![./screenshots/part4.2.png](./screenshots/part4.2.png)
4.4 Окончание сборки Docker образа посредством докерфайла
![./screenshots/part4.3.png](./screenshots/part4.3.png)
4.5 Запуск докер образа маппингом папки `./nginx` внутрь контейнера. Проверка доступа страницы `localhost:80`
![./screenshots/part4.4.png](./screenshots/part4.4.png)
4.6 Добавим в `./nginx/nginx.conf` проксирование странички `/status`, по которой надо отдавать статус сервера `nginx`
![./screenshots/part4.5.png](./screenshots/part4.5.png)
4.7 Смотрим, что образ запущен корректно
![./screenshots/part4.6.png](./screenshots/part4.6.png)
4.8 Перезапускаем докер командой `sudo docker restart pontorez`
![./screenshots/part4.7.png](./screenshots/part4.7.png)
4.9 Фиксируем удачную отдачу странички командной `curl localhost:80/status`
![./screenshots/part4.8.png](./screenshots/part4.8.png)

## Part 5. Dockle

5.1 Сканируем образ и смотрим на ошибки (fatal) и предупреждения (warning)
![./screenshots/part5.0.png](./screenshots/part5.0.png)
5.2 Вносим правки в Dockerfile
![./screenshots/part5.1.png](./screenshots/part5.1.png)
5.3 Запускаем снова docker build Для сборки образа
![./screenshots/part5.1.1.png](./screenshots/part5.1.1.png)
5.4 Исправленный образ без ошибок и предупреждений
![./screenshots/part5.2.png](./screenshots/part5.2.png)

## Part 6. Базовый Docker Compose

6.1 Собираем `docker-compose.yml`, в нем поднимаем 2 контейнера и мапим 8080 порт 2-го контейнера на 80 порт локальной машины
![./screenshots/part6.2.png](./screenshots/part6.2.png)
6.2 Собираем и запускаем проект с помощью команд `docker-compose build` и `docker-compose up`
![./screenshots/part6.0.png](./screenshots/part6.0.png)
6.3 Фиксируем, что в браузере по `localhost:80` отдается написанная страничка, как и ранее
![./screenshots/part6.1.png](./screenshots/part6.1.png)