#!/usr/bin/env fish

set fzf_preview_dir_cmd ll
set fzf_fd_opts --hidden --exclude=.git --exclude=node_modules --exclude=plz-out --exclude=.idea
set fzf_directory_opts --bind "ctrl-o:execute($EDITOR {} &> /dev/tty),ctrl-n:down,ctrl-e:up"
set fzf_git_log_opts --bind "ctrl-n:down,ctrl-e:up"
set fzf_git_status_opts --bind "ctrl-n:down,ctrl-e:up"
set fzf_history_opts --bind "ctrl-n:down,ctrl-e:up"
set fzf_processes_opts --bind "ctrl-n:down,ctrl-e:up"
set fzf_variables_opts --bind "ctrl-n:down,ctrl-e:up"
