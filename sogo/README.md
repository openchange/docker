openchange-sogo
======================

This is the source to build a Docker image that will let you run a sogo server sandboxed on your local machine, in a way compatible with Openchange.

Usage
-----

To create the image `openchange/sogo`, execute the following command on the sogo folder:

	docker build -t openchange/sogo .

Run the image:

    docker run -u="sogo" --name="sogo-oc" openchange/sogo /usr/sbin/sogod -WOUseWatchDog NO -WOLogFile - -WONoDetach YES

or use the up.sh script.

Warning!: this image hasn't been tested to run properly in daemon mode.

Find the IP address of the running image:

    sudo docker inspect sogo-oc | grep IPAddress | cut -d: -f2- | tr -d ' ",'

When you're done testing, stop the running image:

    sudo docker stop sogo-oc

or use the down.sh script.
