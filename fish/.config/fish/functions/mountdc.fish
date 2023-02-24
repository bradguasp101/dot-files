#!/usr/bin/env fish

function mountdc -d "exec into the devclone pod"
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: mountdc service\e[0m"
    return 1
  end

  set name dev-(whoami | tr '.' '-')
  set pod (k -n default get pods | grep -E $name | sed 1q | awk '{print $1;}')
  if test -z $pod
    echo -e "\e[1m\e[31mNo devclone pod found for $(whoami | tr '.' '-'), exiting\e[0m"
    return 1
  end

  kubectl exec -n default $pod -c $argv[1] -it -- zsh
end
