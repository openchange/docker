#!/bin/bash

docker build -t openchange/mysql mysql/.
docker build -t openchange/mta mta/.
docker build -t openchange/sogo sogo/.
