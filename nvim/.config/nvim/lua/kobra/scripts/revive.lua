local revive = {}

-- this assumes that you're in a git repository, and that you have a revive
-- config.toml file in the root directory
function revive.lint()
  local files = require('kobra.scripts.files')
  local cmd = 'belowright split | resize 20 | term revive '
  local root = files.getRoot()
  vim.api.nvim_command(cmd .. ' --config ' .. root .. '/config.toml --formatter stylish ' .. files.getRelativeFile())
end

return revive
