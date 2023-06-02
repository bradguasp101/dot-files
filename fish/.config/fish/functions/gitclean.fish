#!/usr/bin/env fish

function gitclean -d "clean up all non master branches"
  git branch -D (git branch | grep -wv master | sed 's/*//' | awk '{print $1;}')
end
