#!/usr/bin/env fish

function zts -d "list zellij sessions"
  zt list-sessions $argv
end
