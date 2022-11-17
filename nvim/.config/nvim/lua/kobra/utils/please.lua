local export = {}

local files = require("kobra.utils.files")

-- plzBuild: runs please build on the current buffer's directory
function export.plzBuild()
  local file = files.getRelativePath()
  export.runCmd('plz build ' .. file .. '...')
end

-- plzTest: runs please test on the current buffer's directory
function export.plzTest()
  local file = files.getRelativePath()
  export.runCmd('plz test ' .. file .. '...')
end

function export.runCmd(cmd)
  vim.cmd('9TermExec direction=float cmd="' .. cmd .. ' && read -n 1 -s -p \"[Press key to continue]\" && exec true"')
end

export.plzBuild()
return export
