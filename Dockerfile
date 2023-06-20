FROM nginx:latest
RUN sed -i 's/nginx/onja/g' /usr/share/nginx/html/index.html
EXPOSE 80
