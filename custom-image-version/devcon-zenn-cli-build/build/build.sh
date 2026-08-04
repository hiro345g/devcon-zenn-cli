#! /bin/sh
IMAGE_NAME=devcon-zenn-cli:1.18
BUILD_DEVCON_DIR=$(cd $(dirname $0);pwd)

cd ${BUILD_DEVCON_DIR}
if [ ! -e /usr/local/share/npm-global/bin/devcontainer ]; then
  npm install --no-interactive -g @devcontainers/cli
fi
/usr/local/share/npm-global/bin/devcontainer build --workspace-folder ./ --image-name ${IMAGE_NAME} --no-cache
