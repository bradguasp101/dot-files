#!/usr/bin/env fish

function pstat -d "Check pods for specific statuses"
  if set -q "$argv"; or test -z "$argv[1]"
    set pods (kubectl get pods -n default | grep "CrashLoopBackOff")
    set s "CrashLoopBackOff"
  else
    set pods (kubectl get pods -n default | grep $argv[1])
    set s $argv[1]
  end

  set c (count $pods)
  if test $c -gt 0
    printf '%s\n' $pods
  end
end
