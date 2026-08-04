#!/bin/sh
SCRIPT_DIRNAME=$(dirname "$0")
SCRIPT_DIR=$(cd "${SCRIPT_DIRNAME}" || exit 1; pwd)
if [ "$(id -u)" = "0" ]; then
  echo root
  sh -u node -c "sh ${SCRIPT_DIR}/install_zenn-cli.sh"
  exit 0
fi

echo install zenn-cli

# zenn-cli のインストール
if [ ! -e /home/node/workspace/.npm-global/bin/zenn ]; then
  # /home/node/workspace/zenn へインストールされていないときに必要
  npm install -g zenn-cli
fi

# PATH の設定を追加
cat << EOS >> ~/.bashrc;

# /home/node/workspace/.npm-global/bin が PATH にない場合は追加
echo \$PATH|grep "/home/node/workspace/.npm-global/bin" > /dev/null
if [ \$? -ne 0 ]; then
  if [ -e /home/node/workspace/.npm-global/bin ]; then
    export PATH=\$PATH:/home/node/workspace/.npm-global/bin
  fi
fi
EOS
