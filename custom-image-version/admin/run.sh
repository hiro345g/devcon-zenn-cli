#!/bin/sh
REPO_DIR=$(cd $(dirname $0)/..;pwd)

docker compose \
  -f ${REPO_DIR}/docker-compose.yml \
  -f ${REPO_DIR}/admin/docker-compose.yml \
  run --rm devcon-zenn-cli bash
docker compose -p dc-zenn-cli down
