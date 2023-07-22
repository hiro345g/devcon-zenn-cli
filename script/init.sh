#!/bin/sh
REPO_DIR=$(cd $(dirname $0)/..;pwd)

docker pull hiro345g/devcon-node-dod-git:1.0
docker image ls | grep "^devcon-node-dod-git"
if [ $? -ne 0 ]; then
  echo "docker tag hiro345g/devcon-node-dod-git:1.0 devcon-node-dod-git:1.0"
  docker tag hiro345g/devcon-node-dod-git:1.0 devcon-node-dod-git:1.0
fi
docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm -u "0:0" dc-zenn-cli chown -R node:node /home/node/workspace
docker compose -f ${REPO_DIR}/dc/docker-compose.yml run --rm -u "0:0" dc-zenn-cli sh /script/download_starship.sh
docker compose down
