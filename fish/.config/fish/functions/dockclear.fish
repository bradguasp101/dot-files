#!/usr/bin/env fish

function dockclear
  docker rm (docker ps -f "status=created" -f "status=paused" -f "status=exited" -f "status=dead" | awk 'NR>1{print $1;}')
end
