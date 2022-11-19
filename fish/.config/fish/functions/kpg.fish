#!/usr/bin/env fish

function kpg -d "exec into pod and run psql"
  if set -q "$argv"
    echo -e "\e[31mUsage: requires a pod name, database name, and user name\e[0m"
    return 1
  end

  if test -z "$argv[1]"; or test -z "$argv[2]"; or test -z "$argv[3]"
    echo -e "\e[31mCommand requires all arguments\e[0m"
    return 1
  end

  kubectl exec $argv[1] -it -- psql -h $argv[2] -U $argv[3]
end
