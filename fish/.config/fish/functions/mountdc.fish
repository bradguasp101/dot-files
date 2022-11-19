#!/usr/local/env fish

function mountdc -d "exec into the devclone pod"
  set name "dev-$(whoami | tr '.' '-')"
  set pod (kubectl -n default get pods | grep -E $name | sed 1q | awk '{print $1;}')
  if set -q pod
    echo -e "\e[1m\e[31mNo devclone pod found for $(whoami | tr '.' '-'), exiting\e[0m"
  else
    set length (math (string length $name) + 1)
    set container "$pod:$length:-17"
    kubectl exec -n default $pod -c $container -it -- zsh
  end
end
