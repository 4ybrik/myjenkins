
#Загрузить базовый образ Ubuntu 18.04
FROM ubuntu:20.04

ENV nginx_vhost /etc/nginx/sites-available/default

#Обновить программный репозиторий Ubuntu
RUN apt-get update && \
    apt-get install -y nginx && \
    rm /var/www/html/index.nginx-debian.html
#ENV index /var/lib/jenkins/workspace/Webh00k/index.html
ENV index /var/www/html/index.html
ENV usr_share_index /usr/share/nginx/html/index.html

#Копирование index.html
COPY index.html ${index}
COPY default ${nginx_vhost}
COPY index.html ${usr_share_index}

EXPOSE 80
