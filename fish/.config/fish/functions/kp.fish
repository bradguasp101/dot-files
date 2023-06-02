#!/usr/bin/env fish

function kp -d "get pod by name"
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: klogs pod-name [-c]\e[0m"
    return 1
  end

  k get pods | grep $argv[1] | awk '{print $1;}'
end
