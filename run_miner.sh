#!/bin/bash
set -e

gpu=${1}  # Index of GPU
config=global.config.json
log_level=3
wallet=EQDwU11kWyEmT2SfA9w4wstTBGj-bIXi9rgoaHa7C31ZLSGb
bestGgiver=$(curl -s -L https://functions.yandexcloud.net/d4et4hcnpf60ldusbkbl)
# For every GPU boost factor should be set
boost_factors=(
    256
    256
    256
    256
    128
    256
    128
    128
)
cmd="pminer start ${bestGgiver} $wallet $gpu ${boost_factors[gpu]}"
echo "START ${cmd}"
/opt/ton-miner/tonlib-cuda-cli -v $log_level -C $config -e "${cmd}"
echo "FINISH #$gpu boost-factor: ${boost_factors[gpu]} wallet: $wallet giver: ${bestGgiver}"
exit 0
