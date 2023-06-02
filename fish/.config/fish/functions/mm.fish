#!/usr/bin/env fish

function mm
    set nprocs (sysctl hw.ncpu | grep -o '[0-9]\+')
    make -j$nprocs $argv
end
