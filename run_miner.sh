#!/bin/bash
set -e  # needed for restarting by systemctl
wallet=${1}
giver=${2}
gpu=${3}
config=${4-global.config.json}
boost_factor=${5-512}
cli=${6}
log_level=${7-3}

echo "Started GPU $gpu with boost-factor $boost_factor for wallet $wallet with giver $giver"
/opt/ton-miner/$cli -v $log_level -C $config \
-e "pminer start $giver $wallet $gpu $boost_factor"
