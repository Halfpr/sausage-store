#! /bin/bash
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker network create -d bridge sausage_network || true

if [[ $(docker inspect -f '{{.State.Running}}' backend-blue) = true ]]; then
  docker stop backend-green || true
  docker rm backend-green || true
  docker-compose pull backend-green || true
  docker-compose up -d backend-green || true
  while [[ $(docker inspect -f '{{.State.Health.Status}}' backend-green) != "healthy" ]]; do
    echo "bayubay"
    sleep 10
  done
  docker stop backend-blue || true
  docker rm -f backend-blue || true

elif [[ $(docker inspect -f '{{.State.Running}}' backend-green) = true ]]; then
  docker stop backend-blue || true
  docker rm backend-blue || true
  docker-compose pull backend-blue || true
  docker-compose up -d backend-blue || true
  while [[ $(docker inspect -f '{{.State.Health.Status}}' backend-blue) != "healthy" ]]; do
    echo "bayubay"
    sleep 10
  done
  docker stop backend-green || true
  docker rm -f backend-green || true
fi






#docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
#docker network create -d bridge sausage_network || true
#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-frontend:latest
#docker rm -f sausage-frontend || true
#docker-compose pull sausage-frontend
#docker-compose up -d frontend

#docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
#docker network create -d bridge sausage_network || true
#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend:latest
#docker rm -f backend-blue || true
#docker stop sausage-backend || true && docker rm sausage-backend || true
#docker-compose pull backend-blue
#docker-compose up -d backend-blue


#docker rm -f backend-blue-proverka || true
#docker stop sausage-backend || true && docker rm sausage-backend || true
#docker-compose pull backend-blue-proverka
#docker-compose up -d backend-blue-proverka

#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend:latest
#docker rm -f backend-green || true
#docker stop sausage-backend || true && docker rm sausage-backend || true
#docker-compose pull backend-green
#docker-compose up -d backend-green


#docker pull gitlab.praktikum-services.ru:5050/std-015-31/sausage-store/sausage-backend-report:latest
#docker rm -f sausage-backend-report || true
#docker-compose pull sausage-backend-report
#docker-compose up -d backend-report

