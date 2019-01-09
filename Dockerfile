#############################
# Dockerfile to build Nginx Installed containers
# Based on Ubuntu 18.04
#############################

#set the base image to ubuntu
FROM ubuntu:18.04

# File Author / Maintainer
MAINTAINER Mahesh Vangala <vangalamaheshh@gmail.com>

#install nginx

#add application repository URL to the default sources
#RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list

#update the repository
RUN apt-get update -y
#RUN apt-get -y upgrade
#install necessary tools
RUN apt-get -y install software-properties-common vim curl dialog net-tools nginx

RUN add-apt-repository ppa:certbot/certbot

RUN apt-get update -y

RUN apt-get install -y python-certbot-nginx

COPY nginx.conf /etc/nginx/nginx.conf

COPY html /var/www/html

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

EXPOSE 80

EXPOSE 443

CMD service nginx start
