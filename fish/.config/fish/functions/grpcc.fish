#!/usr/bin/env fish

function grpcc -d "makes a request to the selected method from grpclist, or lists available services/methods"
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: grpcc port [service-num] [method-num] [d] [options]\e[0m"
    return 1
  end

  if test -z "$argv[2]"
    grpcurl -plaintext localhost:$argv[1] list | awk '{print NR,$0}'
    return 0
  end

  set services (grpcurl -plaintext localhost:$argv[1] list)
  if test "$argv[2]" -gt (count $services); or test "$argv[2]" -le 0
    echo -e "\e[31mInvalid service number\e[0m"
    return 1
  end

  if test -z "$argv[3]"
    grpcurl -plaintext localhost:$argv[1] list $services[$argv[2]] | awk '{print NR,$0}'
    return 0
  end

  set service $services[$argv[2]]
  set methods (grpcurl -plaintext localhost:$argv[1] list $service)
  if test "$argv[3]" -gt (count $methods); or test "$argv[3]" -le 0
    echo -e "\e[31mInvalid method number\e[0m"
    return 1
  end

  if test "$argv[4]" = "d"
    set loc localhost:$argv[1] describe $methods[$argv[3]]
    set opts $argv[5..-1]
  else
    set methods (string split . $methods[$argv[3]])
    set loc localhost:$argv[1] $service/$methods[-1]
    set opts $argv[4..-1]
  end

  if test (count $opts) -gt 0
    set cmd $opts $loc
  else
    set cmd $loc
  end

  grpcurl -plaintext $cmd
end
