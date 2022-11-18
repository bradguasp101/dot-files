#!/bin/bash

# Load config files
for conf in "$HOME/.config/zsh/"*.zsh; do
  source "${conf}"
done
unset conf

source /usr/local/opt/spaceship/spaceship.zsh
