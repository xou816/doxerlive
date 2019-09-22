#!/bin/sh
docker run --rm -e THEUID=`id -u $USER` -v $PWD:/var/doxerlive atrendel/doxerlive:9-basic
