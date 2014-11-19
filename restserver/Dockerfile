# Openchange REST backend development container
FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes wget

RUN echo "deb http://archive.zentyal.org/zentyal 4.0 main" >> /etc/apt/sources.list
RUN echo "deb-src http://archive.zentyal.org/zentyal 4.0 main" >> /etc/apt/sources.list
RUN wget -q http://keys.zentyal.org/zentyal-4.0-archive.asc -O- | apt-key add -
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get build-dep -y --force-yes openchange

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes python-flask python-tz python-requests

VOLUME ["/openchange"]

EXPOSE 5001

ENTRYPOINT /bin/bash
