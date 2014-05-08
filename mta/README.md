openchange-dovecot-postfix
======================

This is the source to build a Docker image that will let you run temporary IMAP
and SMTP servers sandboxed on your local machine, in a way compatible with
Openchange.

Usage
-----

To create the image `openchange/mta`, execute the following command on the mta folder:

	docker build -t openchange/mta .

Run the image:

    docker run -d --name "mta-oc" openchange/mta

or use the up.sh script.

Find the IP address of the running image:

    sudo docker inspect mta-oc | grep IPAddress | cut -d: -f2- | tr -d ' ",'

The image's root password is root, and there's also a normal user named test,
password test.  You can ssh in if you need to examine things.

The SMTP server will accept mail to <test@example.com>.

When you're done testing, stop the running image:

    sudo docker stop mta-oc

or use the down.sh script.
