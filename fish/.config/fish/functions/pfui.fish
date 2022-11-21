#!/usr/bin/env fish

function pfui -d "port forward a service and grpcui connect to it"
  if set -q "$argv"; or test -z "$argv[1]"
    echo -e "\e[31mNo service specified, exiting...\e[0m"
    return 1
  end

  set pod (kubectl -n default get pods | grep -E "^$argv[1]-\S{10}-\S{5}\s+(.*?)\$" | sed 1q | awk '{print $1;}')
  if test -z $argv[2]
    echo -e "\e[33mNo port specified, defaulting to 50051...\e[0m"
    set port "50051"
  else
    set port "$argv[2]"
  end

  echo -e "\e[36m\e[1mForwarding $pod\e[0m"
  kubectl -n default port-forward $pod "$port:$port" &

  set pid (jobs -l | awk '{print $2}')
  echo -e "\e[32m\e[1mForwarded $pod on process $pid\e[0m"

  # TODO: auto kill process
  sleep 1
  grpcui --plaintext "localhost:$port"
end
