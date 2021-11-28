#Загрузить базовый образ Ubuntu 18.04
FROM ubuntu:20.04

#Обновить программный репозиторий Ubuntu
RUN apt-get update
#ENV index /var/lib/jenkins/workspace/Webh00k/index.html
ENV index /var/www/html/newrepo/myjenkins/index.html

#Копирование index.html
COPY index.html ${index}
