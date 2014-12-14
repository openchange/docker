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

Connection with Outlook
-----------------------

The communication between Outlook and OpenChange can be established by
modifying the *hosts* file in Windows, making openchange.zentyal.lan look at
the `oc-openchange` container's IP address. This address can be obtained by
running:

	$ docker inspect oc-openchange | grep IPAddress

For instance, if our container's address is
`172.17.0.2`, we will have to add to the *hosts* file the following line:

    172.17.0.2                openchange.zentyal.lan


Apply changes
-------------

Changes in the OpenChange code (in `../openchange` can be applied in the
`oc-openchange` container by simply killing the Samba process and running:

    $ make install
    $ make run

Reprovision
-----------

Although the provision of the REST API backend is carried out when making the
`oc-openchange` container, one might one to deprovision and reprovision it
again.

The first thing to do is cleaning the *temp* directory in `oc-restserver`:

    $ rm openchange/python/mock/rest/temp/*
    $ make restserver

The REST API backend can be deprovisioned and reprovisioned by killing the
Samba process in `oc-openchange` and running:

    $ /usr/lib/python2.7/dist-packages/openchange/backends/rest.py --deprovision --username=openchange
    $ make run

Note
----

To run these commands without `sudo` it is required to have your user
in *docker* group, restart docker service and restart user session.
