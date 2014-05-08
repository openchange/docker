#!/bin/bash

docker run -u="sogo" --name="sogo-oc" openchange/sogo /usr/sbin/sogod -WOUseWatchDog NO -WOLogFile - -WONoDetach YES

