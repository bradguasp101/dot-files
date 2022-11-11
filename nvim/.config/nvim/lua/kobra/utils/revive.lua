local export = {}

local files = require("kobra.utils.files")

function export.lint()
  local cmd = "belowright split | resize 20 | term revive "
  local root = files.getRoot()

  if files.exists(root .. "/config.toml") then
    cmd = cmd .. " --config " .. root .. "/config.toml "
  end

  vim.api.nvim_command(cmd .. "--formatter stylish " .. files.getRelativeFile())
end

return export
