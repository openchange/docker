openchange-docker
=================

This is the source to build an scenario to run OpenChange with REST
API backend with the following containers:

    * `oc-mysql`: MySQL server
    * `oc-restserver`: RESTful API Server
    * `oc-openchange`: Samba and OpenChange Server

Make sure to have OpenChange source in `jkerihuel/mapistore-python`
branch in the `../openchange` directory and get the latest docker
software installed.

Usage
-----

To create mysql docker container:

    * make mysql

To create the images and run the containers for REST server and
OpenChange server:

    * make restserver
    * make openchange

To provision samba and openchange

    * make openchange-provision

To compile in openchange container (`oc-openchange`):

    * make openchange-build

To run samba daemon, go to `oc-openchange` container:

    > samba -d5 -i

To compile the OpenChange Python bindings in `oc-restserver`
container:

    * make restserver-build

To run the REST server, go to `oc-restserver` container:

    > python /openchange/python/mock/rest/api_server.py
