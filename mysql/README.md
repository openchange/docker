openchange-mysql
==================

Base docker image to run a MySQL database server for Openchange development


Usage
-----

To create the image `openchange/mysql`, execute the following command on the mysql folder:

	docker build -t openchange/mysql .

To run the image and bind to port 3306:

	docker run -d -p 3306:3306 openchange/mysql

or use the up.sh script.

The first time that you run your container, a new user `admin` with all privileges
will be created in MySQL To see the password, check the logs
of the container by running:

	docker logs mysql-oc

You will see an output like the following:

	========================================================================
	You can now connect to this MySQL Server using:

	    mysql -uadmin -proot -h<host> -P<port>

	MySQL user 'root' has no password but only allows local connections
	========================================================================

You can now test your deployment:

	mysql -uadmin -p

Done!


Solution based in the [tutum/mysql](https://github.com/tutumcloud/tutum-docker-mysql) docker image for mysql


Databases pre-created
---------------------

* Openchange
  * Name: openchange
  * User: openchange
  * Pass: openchange

* Sogo
  * Name: sogo
  * User: sogo
  * Pass: sogo

