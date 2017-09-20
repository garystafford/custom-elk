#!/bin/sh

# disconect from AIP Docker dameon
unset DOCKER_TLS_VERIFY DOCKER_CERT_PATH DOCKER_HOST

# delete old image, login to DTR, build new image, and push to DTR
# source ~/Documents/Notes/dockerhub_login.env
docker login -u ${DOCKER_HUB_USERNAME} -p ${DOCKER_HUB_PASSWORD}
docker build --no-cache -t garystafford/custom-elk:latest .
docker build --no-cache -t garystafford/custom-elk:latest .
docker push garystafford/hello-logging:latest
