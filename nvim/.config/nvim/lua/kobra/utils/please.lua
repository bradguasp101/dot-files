local export = {}

local files = require("kobra.utils.files")

-- plzBuild: runs please build on the current buffer's directory
function export.plzBuild()
  local file = files.getRelativePath()
  vim.api.nvim_command("belowright split | resize 20 | term plz build " .. file .. "...")
end

-- plzTest: runs please test on the current buffer's directory
function export.plzTest()
  local file = files.getRelativePath()
  vim.api.nvim_command("belowright split | resize 20 | term plz test " .. file .. "...")
end

return export
