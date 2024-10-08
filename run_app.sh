#!/bin/bash

ACTIVE_PROFILE="native"
CONFIG_SERVER_PASSWORD="my-password"
CONFIG_SERVER_USERNAME="my-username"
GIT_PASSWORD="my-git-password"
GIT_URI="https://my-git-repo-url"
GIT_USERNAME="my-git-username"
CONFIG_SERV_SERVER_PORT=8002
EUREKA_URL="http://my-username:my-password@localhost:8001/eureka/"

IMAGE_NAME="config_serv"

EXTERNAL_IP=$(hostname -I | awk '{print $1}')


docker run -d -p ${CONFIG_SERV_SERVER_PORT}:${CONFIG_SERV_SERVER_PORT} \
  -e ACTIVE_PROFILE=${ACTIVE_PROFILE} \
  -e CONFIG_SERVER_PASSWORD=${CONFIG_SERVER_PASSWORD} \
  -e CONFIG_SERVER_USERNAME=${CONFIG_SERVER_USERNAME} \
  -e GIT_PASSWORD=${GIT_PASSWORD} \
  -e GIT_URI=${GIT_URI} \
  -e GIT_USERNAME=${GIT_USERNAME} \
  -e EUREKA_URL=${EUREKA_URL} \
  -e SERVER_PORT=${CONFIG_SERV_SERVER_PORT} \
  -e EXTERNAL_IP=${EXTERNAL_IP} \
  ${IMAGE_NAME}