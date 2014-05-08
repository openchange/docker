# Sogo container for openchange development
FROM ubuntu:precise

RUN echo "deb http://inverse.ca/ubuntu-nightly precise precise" >> /etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu precise main universe" >> /etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu precise-updates main universe" >> /etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu precise-security main universe" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --force-yes sogo
ADD sogo.conf /etc/sogo/sogo.conf
