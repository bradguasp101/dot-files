#!/usr/bin/env fish

function zkn
  if set -q "$argv"; or test -z "$argv[1]"
    zk new --working-dir ~/notebook/
  else
    zk new --working-dir ~/notebook/ --title $argv[1]
  end
end
