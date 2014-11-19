# Openchange REST backend development container
FROM ubuntu:14.04

VOLUME ["/openchange"]

RUN apt-get update
RUN apt-get install -y --force-yes python-flask python-tz python-requests

EXPOSE 5001

ENTRYPOINT /bin/bash
