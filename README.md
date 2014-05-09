openchange-docker
======================

This is the source to build a Docker image that will let you run temporary IMAP
and SMTP servers sandboxed on your local machine, in a way compatible with
Openchange.

Usage
-----

To create the all the images needed at once use the script  `build-images.sh`

Run the images:

    run.sh

Warning!: Sometimes the sogo image doesn't run properly from this script, you need to stop it and run it again only to that one so it works and connects well to the mysql database.

When you're done testing, stop the images running:

    stop.sh

