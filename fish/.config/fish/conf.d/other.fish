#!/usr/bin/env fish

set fzf_preview_dir_cmd ll
set fzf_fd_opts --hidden --exclude=.git --no-ignore
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty)"
