# Bisq DAO testnet explorer

This is a documentation for the http://bisq.info `DAO testnet` explorer.

## Background story

As `Bisq` switched to its own `DAO testnet` network (using bitcoin's regtest) there was no block explorer that runs on it. There was a need to create a block explorer that can be used to view transactions on the `DAO testnet`. Note this is a plain `bitcoin explorer`, not a `BSQ explorer`. For a `BSQ explorer` running on the same `DAO testnet` network go to: https://explorer.bisq.network/testnet/.

The `DAO testnet` explorer was branded with `Bisq`'s green color and logo to make sure users do not confuse it with `Bitcoin` testnet or mainnet network. This was possible thanks to the wonderful modular and easily editable setup made by blockstream's `esplora` project. A huge thanks for them!

The branding does not mean `Bisq` is the author of this wonderful explorer!

## Seting things up



### Building the docker image
 1. install docker if not installed already
 2. run bellow command to bild the image, it will take some time and download about 800MBi of data.
 ```
 docker build -t esplora .
 ```

### Edit dao_config.env
Edit the 2 variables in the env file or leave them as they are to use defaults:
 - **PORT** - the port used on the host side to reach the container, defaults to **80**
 - **DATA_DIR** - the directory where bitcoind, electrs (the backend esplora uses) and log files will be held. This direcotory is mounted to /data on the container. Defaults to **$HOME/dao_testnet_data**

### run the container
Run the command below to start up the container:
```
./run_dao.sh
```
Note you will see errors with spawning, that is ok. If you press `ctrl+c` the container will stop.

### Check daemon logs
Note `$DATA_DIR` is whatever you entered in the dao_config.env file.
 - bitcoind: `sudo tail -f $DATA_DIR/bitcoin/regtest/debug.log`
 - electrs: `tail -f $DATA_DIR/logs/electrs-bitcoin.log`

Electrs logging was raised to `DEBUG` level to be more verbose.
