local global = {}
local home = os.getenv('HOME')

function global:load_variables()
  self.data_path = string.format('%s/site', vim.fn.stdpath('data'))
  self.config_path = vim.fn.stdpath('config')
  self.cache_dir = vim.fn.stdpath('cache')
  self.home = home

  package.path = self.data_path .. '/?.lua;' .. package.path
end

global:load_variables()

return global
