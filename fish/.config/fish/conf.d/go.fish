#!/usr/bin/env fish

set -gx GOPATH $HOME/go
set -gx GOROOT /usr/local/opt/go/libexec
set -gx GOBIN $GOPATH/bin

fish_add_path $GOBIN
fish_add_path $GOROOT/bin
