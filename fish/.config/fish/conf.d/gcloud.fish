#!/usr/local/env fish

# linkerd
fish_add_path $HOME/.linkerd2/bin/

if test -f "$HOME/google-cloud-sdk/path.fish.inc"
  source "$HOME/google-cloud-sdk/path.fish.inc"
end
