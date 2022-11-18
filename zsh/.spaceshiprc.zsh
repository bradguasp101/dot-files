#!/bin/bash

for conf in "$HOME/.config/spaceship/"*.zsh; do
  source "${conf}"
done
unset conf

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true

SPACESHIP_PROMPT_ORDER=(
  dir
  short_branch
  git
  gcloud
  exec_time
  async
  line_sep
  jobs
  exit_code
  sudo
  char
)
