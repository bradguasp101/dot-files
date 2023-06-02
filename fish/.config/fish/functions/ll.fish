#!/usr/bin/env fish

function ll
  exa -l -a --git --no-permissions --no-user $argv
end
