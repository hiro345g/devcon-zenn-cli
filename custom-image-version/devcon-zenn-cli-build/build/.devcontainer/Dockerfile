FROM hiro345g/devcon-node-dod-git:1.18

RUN apt-get update && apt-get -y upgrade \
    && export DEBIAN_FRONTEND=noninteractive \
    && npm install -g npm@10.2.5 \
    && npm install -g zenn-cli \
    && if [ ! -e /home/node/workspace ]; then mkdir /home/node/workspace; fi \
    && chown node:node /home/node/workspace \
    && chown -R node:npm /usr/local/share/npm-global/
