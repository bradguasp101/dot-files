#!/usr/bin/env fish

function devbuild -d "run buf build in devcontainer"
    devcontainer exec --workspace-folder . buf build
end
