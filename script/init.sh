#!/bin/sh
REPO_DIR=$(cd $(dirname $0)/..;pwd)

docker pull hiro345g/devcon-node-dod-git:1.18

docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm -u "0:0" dc-zenn-cli chown -R node:node /home/node/workspace
docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm -u "0:0" dc-zenn-cli sh /script/download_starship.sh
docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm dc-zenn-cli sh /script/init_dot_npm-global.sh
docker compose down
