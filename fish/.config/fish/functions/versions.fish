#!/usr/bin/env fish

# this requires https://git.tcncloud.net/k8s/replicas

function versions
  $REPLICAS_PATH/replicas.sh -v $argv
end
