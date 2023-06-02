#!/usr/bin/env fish

function glogin -d "Login to gcloud without using gcloud auth"
  gcloud projects list >/dev/null
end
