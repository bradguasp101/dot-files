local revive = {}

-- this assumes that you're in a git repository, and that you have a revive
-- config.toml file in the root directory
function revive.lint()
  local files = require('kobra.scripts.files')
  local root = files.getRoot()
  local cmd = 'revive --config ' .. root .. '/config.toml --formatter stylish ' .. files.getRelativeFile()
  vim.api.nvim_command('TermExec cmd="' .. cmd .. '"')
end

return revive
