#!/usr/bin/env fish

function mountdc -d "exec into the devclone pod"
  set name dev-(whoami | tr '.' '-')
  set pod (kubectl -n default get pods | grep -E $name | sed 1q | awk '{print $1;}')
  if test -z $pod
    echo -e "\e[1m\e[31mNo devclone pod found for $(whoami | tr '.' '-'), exiting\e[0m"
    return 1
  end

  set name_length (math (string length $name) + 2)
  set container (string sub -s $name_length -e -17 $pod)
  kubectl exec -n default $pod -c $container -t -- zsh
end
