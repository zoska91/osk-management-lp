FROM nginx:1.29-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html landing.css favicon.svg /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY engine /usr/share/nginx/html/engine
