
#Загрузить базовый образ Ubuntu 18.04
FROM ubuntu:20.04

#Обновить программный репозиторий Ubuntu
RUN apt-get update

RUN apt-get install -y nginx
RUN rm /var/www/html/index.nginx-debian.html
#ENV index /var/lib/jenkins/workspace/Webh00k/index.html
ENV index /var/www/html/index.html

#Копирование index.html
COPY index.html ${index}

EXPOSE 80
