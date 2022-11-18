#!/bin/bash

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_SHORT_BRANCH_SHOW="${SPACESHIP_SHORT_BRANCH_SHOW=true}"
SPACESHIP_SHORT_BRANCH_ASYNC="${SPACESHIP_SHORT_BRANCH_ASYNC=true}"
SPACESHIP_SHORT_BRANCH_PREFIX="${SPACESHIP_SHORT_BRANCH_PREFIX="$SPACESHIP_GIT_SYMBOL"}"
SPACESHIP_SHORT_BRANCH_SUFFIX="${SPACESHIP_SHORT_BRANCH_SUFFIX="$SPACESHIP_GIT_BRANCH_SUFFIX"}"
SPACESHIP_SHORT_BRANCH_COLOR="${SPACESHIP_SHORT_BRANCH_COLOR="$SPACESHIP_GIT_BRANCH_COLOR"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_short_branch() {
  [[ $SPACESHIP_SHORT_BRANCH_SHOW == false ]] && return

  spaceship::is_git || return
  spaceship::exists git || return

  local branch_name="$(git rev-parse --abbrev-ref HEAD)"
  local short_name=""
  case $branch_name in
    *"-"*)
      short_name="$(cut -d'-' -f1 <<<"$branch_name")"
      ;;
    *)
      short_name="$branch_name"
      ;;
  esac

  spaceship::section \
    --color "$SPACESHIP_SHORT_BRANCH_COLOR" \
    "$SPACESHIP_SHORT_BRANCH_PREFIX $short_name$SPACESHIP_GIT_BRANCH_SUFFIX "
}
