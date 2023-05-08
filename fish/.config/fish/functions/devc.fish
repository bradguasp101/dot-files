#!/usr/bin/env fish

function devc -d "run devcontainer command in current folder"
    devcontainer $argv[1] --workspace-folder . $argv[2..-1]
end
