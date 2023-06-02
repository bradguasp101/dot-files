#!/usr/bin/env fish

function mountdc -d "exec into the devclone pod"
  k exec (kp dev-(whoami | tr '.' '-')) -it -- /bin/bash
end
