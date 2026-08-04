#!/bin/sh

STARSHIP_CMD=starship
STARSHIP_CMD_FILE_DIR=/home/node/workspace/Download
STARSHIP_CMD_FILE=${STARSHIP_CMD_FILE_DIR}/${STARSHIP_CMD}

if [ ! -e ${STARSHIP_CMD_FILE} ]; then
  if [ ! -e ${STARSHIP_CMD_FILE_DIR} ]; then
    mkdir ${STARSHIP_CMD_FILE_DIR}
  fi
  cd "${STARSHIP_CMD_FILE_DIR}" || exit 1
  # wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-musl.tar.gz
  wget https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz
  # wget https://github.com/starship/starship/releases/download/v1.26.0/starship-x86_64-unknown-linux-gnu.tar.gz
  tar xf starship-x86_64-unknown-linux-gnu.tar.gz
  if [ "$(id -u)" = "0" ]; then
    chown node:node ${STARSHIP_CMD_FILE_DIR}/starship-x86_64-unknown-linux-gnu.tar.gz ${STARSHIP_CMD_FILE_DIR}/${STARSHIP_CMD}
  fi
fi
