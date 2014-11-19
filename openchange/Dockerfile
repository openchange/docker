# Openchange development container
FROM ubuntu:14.04

RUN echo "deb http://archive.zentyal.org/zentyal 4.0 main" >> /etc/apt/sources.list
RUN apt-get update

#RUN wget -q http://keys.zentyal.org/zentyal-4.0-archive.asc -O- | apt-key add -
#RUN apt-get update

VOLUME ["/openchange"]

RUN apt-get install -y --force-yes samba openchangeserver
RUN apt-get build-dep -y --force-yes openchange

# TODO fix openchange build deps
RUN apt-get install -y --force-yes libmysqlclient-dev python-mysqldb

# Samba conf file enabling OpenChange
ADD smb.conf /etc/samba/smb.conf


# MAPI needed ports
EXPOSE 135 389 1024

ENTRYPOINT /bin/bash
