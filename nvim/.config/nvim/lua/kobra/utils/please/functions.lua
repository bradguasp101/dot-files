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
  local result = os.execute(cmd)
  if not result[1] then
    vim.notify('Failed to execute command: \'' .. cmd .. '\'', 'error')
  end
end

export.plzBuild()

return export
