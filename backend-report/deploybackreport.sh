#!/bin/bash -x
#cat > .env <<EOF
#spring.cloud.vault.enabled=false
#SPRING_DATASOURCE_URL=${SPRING_DATASOURCE_URL}
#SPRING_DATASOURCE_USERNAME=${SPRING_DATASOURCE_USERNAME}
#SPRING_DATASOURCE_PASSWORD=${SPRING_DATASOURCE_PASSWORD}
#SPRING_DATA_MONGODB_URI=${SPRING_DATA_MONGODB_URI}
#CI_REGISTRY_USER=${CI_REGISTRY_USER}
#CI_REGISTRY_PASSWORD=${CI_REGISTRY_PASSWORD}
#CI_REGISTRY=${CI_REGISTRY}
#DB=${SPRING_DATA_MONGODB_URI}
#EOF
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker network create -d bridge sausage_network || true
docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend-report:latest
docker rm -f sausage-backend-report || true
docker-compose pull sausage-backend-report
docker-compose up -d backend-report
# docker run -d --name sausage-backend-report \
#     --publish 8081:8081/tcp \
#     --network=sausage_network \
#     --restart always \
#     --pull always \
#     --env-file .env \
#     gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend-report:latest
