#!/bin/bash

mysql/up.sh

mta/up.sh

MTA_IP=`docker inspect mta-oc | grep IPAddress | cut -d: -f2- | tr -d ' ",'`
echo "mta container ip  $MTA_IP"

#Give some time to the mysql container to start
sleep 5

sogo/up.sh

