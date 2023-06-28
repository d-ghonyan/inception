#!/bin/bash

docker run -v wordpress:/data --name helper busybox true
docker cp $1 helper:/data
docker rm helper
