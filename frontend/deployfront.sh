#!/bin/bash
set +e
cat > .env <<EOF
CI_REGISTRY_USER=${CI_REGISTRY_USER}
CI_REGISTRY_PASSWORD=${CI_REGISTRY_PASSWORD}
CI_REGISTRY=${CI_REGISTRY}

EOF
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker network create -d bridge sausage_network || true
docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store-2/sausage-frontend:latest
docker stop sausage-frontend || true
docker rm sausage-frontend || true
set -e
docker run -d --name sausage-frontend \
    --network=sausage_network \
    --restart always \
    --pull always \
    --env-file .env \
    gitlab.praktikum-services.ru:5050/std-015-31/sausage-store-2/sausage-frontend:latest
