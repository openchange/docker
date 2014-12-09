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

To build from source and launch the REST server:

    * make restserver

To build from source, provision and launch OpenChange server:

    * make openchange


That should leave your system ready to connect to the OpenChange instance on
the `oc-openchange` container

Note
----

To run these commands without `sudo` it is required to have your user
in *docker* group, restart docker service and restart user session.
