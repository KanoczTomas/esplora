#!/bin/bash
set -xeo pipefail

source dao_config.env
mkdir --parent $DATA_DIR
docker run -p ${PORT}:80 \
           --volume ${DATA_DIR}:/data \
           --rm -i -t esplora \
           bash -c "/srv/explorer/run.sh bitcoin-regtest explorer"
