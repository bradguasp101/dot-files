#!/usr/bin/env fish

function dockclear
  docker rm (docker ps -a | awk 'NR>1{print $1;}')
end
