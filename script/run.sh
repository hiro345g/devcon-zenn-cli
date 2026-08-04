#!/bin/sh
REPO_DIRNAME=$(dirname "$0")
REPO_DIR=$(cd "${REPO_DIRNAME}/.." || exit 1; pwd)

docker compose -f "${REPO_DIR}/dc/compose.yaml" run --rm -u "0:0" dc-zenn-cli bash
docker compose -p dc-zenn-cli down
