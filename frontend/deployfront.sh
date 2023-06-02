#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf frontend.service /etc/systemd/system/frontend.service
sudo rm -f /home/student/sausage-frontend.tar.gz||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.tar.gz ${NEXUS_REPO_URL_FRONTEND}/sausage-store-front/sausage-store/"${VERSION}"/sausage-store-"${VERSION}".tar.gz
sudo systemctl stop frontend.service||true
sudo mkdir extract
sudo tar -xzvf sausage-store.tar.gz -C extract/
sudo cp -rf extract/frontend/* /var/www-data/||true
sudo rm -rf extract/
#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload
#Перезапускаем сервис фронтенд
sudo systemctl restart frontend.service
