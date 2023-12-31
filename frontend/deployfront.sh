#!/bin/bash
#set +e
#cat > .env <<EOF
#CI_REGISTRY_USER=${CI_REGISTRY_USER}
#CI_REGISTRY_PASSWORD=${CI_REGISTRY_PASSWORD}
#CI_REGISTRY=${CI_REGISTRY}

#EOF
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker network create -d bridge sausage_network || true
docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-frontend:latest
docker rm -f sausage-frontend || true
docker-compose pull sausage-frontend
docker-compose up -d frontend
#set -e
#docker run -d --name sausage-frontend \
#    --network=sausage_network  \
#    --restart always \
#    --pull always \
#    --env-file .env \
#    -p 80:80 \
#    gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-frontend:latest
