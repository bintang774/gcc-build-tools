#!/bin/bash

BASEDIR=$(dirname "$0")

docker build --build-arg USE_TAR="-t" -f "$BASEDIR"/dockerfile_debian10 --rm=true .
IMAGE_ID=$(docker build --build-arg USE_TAR="-t" -f "$BASEDIR"/dockerfile_debian10 --rm=true . | awk '/Successfully built/{print $NF}')

docker rmi "$IMAGE_ID"