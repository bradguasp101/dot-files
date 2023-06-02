#!/usr/bin/env fish

function grpcd -d "makes a request with grpcurl to describe a service, method, etc."
  if test -z "$argv[1]"
    echo -e "\e[31mUsage: grpcd object [port]\e[0m"
    return 1
  end

  if test -z "$argv[2]"
    set port "50051"
  else
    set port "$argv[2]"
  end

  grpcurl -plaintext localhost:$port describe $argv[1]
end
