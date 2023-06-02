#!/usr/bin/env fish

function pf -d "Port forward a service, `pf service` will port-forward service at localhost:port where port defaults to 50051"
  if set -q "$argv"; or test -z "$argv[1]"
    echo -e "\e[31mUsage: pf service [port]\e[0m"
    return 1
  end

  set pod (kubectl -n default get pods | grep $argv[1] | awk '{print $1;}')
  if test -z $argv[2]
    echo -e "\e[33mNo port specified, defaulting to 50051...\e[0m"
    set port "50051:50051"
  else
    set port "$argv[2]:$argv[2]"
  end

  echo -e "\e[36mk -n default port-forward $pod $port\e[0m"
  k -n default port-forward "$pod" "$port"
end
