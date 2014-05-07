#!/bin/bash


docker build -t mysql .

docker run -d --name="mysql-oc" -p 3306:3306 mysql
