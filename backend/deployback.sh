#! /bin/bash
#Если свалится одна из команд, рухнет и весь скрипт
set -xe
wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" -O YandexInternalRootCA.crt
sudo keytool -importcert \
             -file YandexInternalRootCA.crt \
             -alias yandex \
             -cacerts \
             -storepass changeit \
             -noprompt
#Перезаливаем дескриптор сервиса на ВМ для деплоя
sudo cp -rf sausage-store-backend.service /etc/systemd/system/sausage-store-backend.service
sudo rm -f /home/student/sausage-store.jar||true
#Переносим артефакт в нужную папку
curl -u ${NEXUS_REPO_USER}:${NEXUS_REPO_PASS} -o sausage-store.jar ${NEXUS_REPO_URL}com/yandex/practicum/devops/sausage-store/${VERSION}/sausage-store-${VERSION}.jar
sudo cp ./sausage-store.jar /home/student/sausage-store.jar||true #"<...>||true" говорит, если команда обвалится — продолжай
#Обновляем конфиг systemd с помощью рестарта
sudo systemctl daemon-reload
#Перезапускаем сервис сосисочной
sudo systemctl restart sausage-store-backend
