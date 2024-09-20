FROM nginx:alpine

COPY static/web /usr/share/nginx/html

RUN ls /usr/share/nginx/html
