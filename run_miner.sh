#!/bin/bash
set -e
gpu=${1}  # Index of GPU
giver=${2}  # Index of giver in givers list below

config=global.config.json
log_level=3

declare -a givers
givers=(
    kf-kkdY_B7p-77TLn2hUhM6QidWrrsl8FYWCIvBMpZKprBtN
    kf-P_TOdwcCh0AXHhBpICDMxStxHenWdLCDLNH5QcNpwMHJ8
    kf_NSzfDJI1A3rOM0GQm7xsoUXHTgmdhN5-OrGD8uwL2JMvQ
    kf8gf1PQy4u2kURl-Gz4LbS29eaN4sVdrVQkPO-JL80VhOe6
    kf-FV4QTxLl-7Ct3E6MqOtMt-RGXMxi27g4I645lw6MTWraV
    kf8SYc83pm5JkGt0p3TQRkuiM58O9Cr3waUtR9OoFq716lN-
    kf8JfFUEJhhpRW80_jqD7zzQteH6EBHOzxiOhygRhBdt4z2N
    kf8kO6K6Qh6YM4ddjRYYlvVAK7IgyW8Zet-4ZvNrVsmQ4EOF
    kf91o4NNTryJ-Cw3sDGt9OTiafmETdVFUMvylQdFPoOxIsLm
    kf9iWhwk9GwAXjtwKG-vN7rmXT3hLIT23RBY6KhVaynRrIK7
)

declare -a cards
# For every GPU boost factor should be set
boost_factors=(
    256
    256
    256
    256
    256
)

echo "START #$gpu boost-factor: ${boost_factors[gpu]} wallet: $TON_WALET giver: ${givers[giver]}"
$TON_MINER_PATH -v $log_level -C $config \
-e "pminer start $giver $TON_WALET $gpu $boost_factors"
echo "FINISH #$gpu boost-factor: ${boost_factors[gpu]} wallet: $TON_WALET giver: ${givers[giver]}"
exit 0
