#!/bin/sh
REPO_DIR=$(cd $(dirname $0)/..;pwd)

docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm -u "0:0" dc-zenn-cli bash
docker compose -p dc-zenn-cli down
