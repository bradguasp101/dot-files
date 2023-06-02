#!/usr/bin/env fish

function klogs -d "print logs for a pod given the container name, assuming the pod and container share the same name"
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: klogs pod-name [-c]\e[0m"
    return 1
  end

  if test -z "$argv[2]"
    set pods (k get pods | grep $argv[1] | awk '{print $1;}')
  else if test "$argv[2]" = "-c"
    set pods (k get pods | grep $argv[1] | awk '$3 == "CrashLoopBackOff" {print $1;}')
  else
    echo -e "\e[31mUsage: klogs pod-name [-c]\e[0m"
    return 1
  end

  if set -q "$pods"
    echo -e "\e[31mNo pods found for that name\e[0m"
    return 1
  end

  k logs $pods[1] $argv[1]
end
