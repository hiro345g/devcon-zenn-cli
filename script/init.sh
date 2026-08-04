#!/bin/sh
REPO_DIRNAME=$(dirname "$0")
REPO_DIR=$(cd "${REPO_DIRNAME}/.." || exit 1; pwd)

# docker pull hiro345g/devcon-node-dod-git:1.0

# if docker image ls | grep "^devcon-node-dod-git"; then
#   echo "docker tag hiro345g/devcon-node-dod-git:1.0 devcon-node-dod-git:1.0"
#   docker tag hiro345g/devcon-node-dod-git:1.0 devcon-node-dod-git:1.0
# fi
docker compose -f "${REPO_DIR}/dc/compose.yaml" run --rm -u "0:0" dc-zenn-cli chown -R node:node /home/node/workspace
docker compose -f "${REPO_DIR}/dc/compose.yaml" run --rm -u "0:0" dc-zenn-cli sh /script/download_starship.sh
docker compose -p dc-zenn-cli down
