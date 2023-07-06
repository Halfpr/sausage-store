FROM node:16.17-alpine 
WORKDIR /usr/src/app 
COPY . . 
RUN apt update
RUN npm install -g npm@9.8.0 -y
RUN npm install -g http-server
RUN npm run build 
EXPOSE 80 
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-backend:8080"]
