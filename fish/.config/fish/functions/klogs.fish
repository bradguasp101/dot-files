#!/usr/bin/env fish

function klogs
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: klogs pod-name\e[0m"
    return 1
  end

  set pods (k get pods | grep $argv[1] | awk '$3 == "CrashLoopBackOff" {print $1;}')
  if set -q "$pods"
    echo -e "\e[31mNo pods found for that name\e[0m"
    return 1
  end

  k logs $pods[1] $argv[1]
end
