FROM node:16.17-alpine as frontend
WORKDIR /usr/src/app 
COPY . . 
RUN npm install && RUN npm run build 

FROM nginx:latest
COPY --from=frontend /usr/src/app/dist/frontend /usr/share/nginx/html
WORKDIR /app
EXPOSE 8080
