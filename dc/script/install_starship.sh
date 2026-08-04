#!/bin/sh
STARSHIP_CMD=starship
STARSHIP_CMD_FILE=/home/node/workspace/Download/${STARSHIP_CMD}
SCRIPT_DIRNAME=$(dirname "$0")
SCRIPT_DIR=$(cd "${SCRIPT_DIRNAME}" || exit 1; pwd)

sh "${SCRIPT_DIR}/download_starship.sh"

if [ ! -e /home/node/.local/bin ]; then
  mkdir -p /home/node/.local/bin
  if [ "$(id -u)" = "0" ]; then
    chown node:node /home/node/.local/bin
  fi
fi

if [ ! -e /home/node/.local/bin/${STARSHIP_CMD} ]; then
  cp ${STARSHIP_CMD_FILE} /home/node/.local/bin/
  if [ "$(id -u)" = "0" ]; then
    chown node:node /home/node/.local/bin/${STARSHIP_CMD}
  fi
  echo "eval \"\$(\${HOME}/.local/bin/starship init bash)\"" >> /home/node/.bashrc
fi

if [ ! -e /home/node/.config ]; then
  mkdir /home/node/.config
  if [ "$(id -u)" = "0" ]; then
    chown node:node /home/node/.config
  fi
fi

if [ ! -e /home/node/.config/starship.toml ]; then
  /home/node/.local/bin/${STARSHIP_CMD} preset plain-text-symbols \
    | sed 's/success_symbol = "/success_symbol = "🐳/' \
    | sed 's/error_symbol = "/error_symbol = "🐳/' \
    | sed 's/vimcmd_symbol = "/vimcmd_symbol = "🐳/' \
    > /home/node/.config/starship.toml
  if [ "$(id -u)" = "0" ]; then
    chown node:node /home/node/.config/starship.toml
  fi
fi
