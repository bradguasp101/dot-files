#!/usr/bin/env fish

function short-branch
  if not type -q git
    return 1
  end

  if ! git rev-parse --is-inside-work-tree >/dev/null
    return 1
  end

  set branch_name (git rev-parse --abbrev-ref HEAD)
  switch $branch_name
    case "*/*"
      echo $branch_name | rev | cut -d '/' -f1 | rev
    case "*-*"
      set split_name (string split - $branch_name)
      echo $split_name[1]
    case "*"
      echo $branch_name
  end
end
