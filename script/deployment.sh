#!/usr/bin/env bash
set -e
echo $DOCKER_PASSWORD | docker login --username "$DOCKER_USERNAME" --password-stdin
./gradlew -p ./monolithic/ui packageToContainer
docker tag zutherb/ci_theapp:latest $DOCKER_USERNAME/ci_theapp:latest
docker push $DOCKER_USERNAME/ci_theapp:latest

