#!/usr/bin/env bash
set -e
docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
./gradlew -p ./monolithic/ui packageToContainer
docker tag zutherb/monolithic-shop:latest $DOCKER_USERNAME/ci_theapp:latest
docker push $DOCKER_USERNAME/ci_theapp:latest

