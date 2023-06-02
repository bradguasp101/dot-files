#!/usr/bin/env fish

function zta -d "attach to current zellij session"
  set ZJ_SESSIONS (zt list-sessions)
  set NO_SESSIONS (echo $ZJ_SESSIONS | wc -l)

  if test $NO_SESSIONS -gt 2
    zt attach (echo $ZJ_SESSIONS | sk)
  else
    zt attach -c
  end
end
