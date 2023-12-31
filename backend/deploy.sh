#! /bin/bash
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker network create -d bridge sausage_network || true

docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-frontend:latest
docker rm -f sausage-frontend || true
docker-compose pull sausage-frontend
docker-compose up -d frontend

#docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
#docker network create -d bridge sausage_network || true
#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend:latest
#docker rm -f backend-blue || true
#docker stop sausage-backend || true && docker rm sausage-backend || true
#docker-compose pull backend-blue
#docker-compose up -d backend-blue

#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend:latest
#docker rm -f backend-green || true
#docker stop sausage-backend || true && docker rm sausage-backend || true
#docker-compose pull backend-green
#docker-compose up -d backend-green


#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend-report:latest
#docker rm -f sausage-backend-report || true
#docker-compose pull sausage-backend-report
#docker-compose up -d backend-report

