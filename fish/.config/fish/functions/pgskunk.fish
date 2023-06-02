#!/usr/bin/env fish

function pgskunk
  kpg $DEV_SKUNK_DB_POD $DEV_SKUNK_DB_NAME $DEV_SKUNK_DB_USER
end
