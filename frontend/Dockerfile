FROM node:16.17-alpine as frontend
WORKDIR /usr/src/app 
COPY . . 
RUN npm install
RUN npm install -g http-server
RUN npm run build 

FROM nginxproxy/nginx-proxy
COPY --from=frontend /usr/src/app/dist/frontend /usr/share/nginx/html
#COPY ./nginx.tmpl /app/nginx.tmpl
WORKDIR /usr/share/nginx/html


EXPOSE 80 
#ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-backend:8080"]
