#!/bin/bash

# Добавляем обработку ошибок
set -e

cd /opt

# Проверяем, существует ли уже репозиторий
if [ -d "shvirtd-example-python" ]; then
    echo "Директория уже существует. Удаляю старую версию..."
    rm -rf shvirtd-example-python
fi

# Клонируем репозиторий
git clone https://github.com/VeselijDrozd/shvirtd-example-python.git
cd ./shvirtd-example-python

# Запускаем контейнеры
docker compose up -d

# Даем контейнерам время на запуск
sleep 2

# Перезапускаем web сервис (а то не работает:(()
docker compose restart web

echo "Готово!"
