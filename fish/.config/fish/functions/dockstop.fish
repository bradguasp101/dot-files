#!/usr/bin/env/fish

function dockstop
  docker stop (docker ps | awk 'NR>1{print $1;}')
end
