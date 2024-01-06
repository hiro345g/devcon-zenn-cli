#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0);pwd)

echo start init_dot_npm-global.sh
if [ "x$(id -u)" = "x0" ]; then
  echo root
  sh -u node -c "sh ${SCRIPT_DIR}/init_dot_npm-global.sh"
  exit 0
fi

echo copy /usr/local/share/npm-global
if [ ! -e /home/node/workspace/.npm-global/ ]; then
  mkdir -p /home/node/workspace/.npm-global/
fi
cp -r /usr/local/share/npm-global/lib /home/node/workspace/.npm-global/
cp -r /usr/local/share/npm-global/bin /home/node/workspace/.npm-global/
