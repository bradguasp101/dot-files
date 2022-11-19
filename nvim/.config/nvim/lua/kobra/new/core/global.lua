local global = {}
local home = os.getenv('HOME')

function global:load_variables()
  self.data_path = vim.fn.stdpath('data')
  self.config_path = vim.fn.stdpath('config')
  self.cache_dir = vim.fn.stdpath('cache')
  self.home = home
end

global:load_variables()

return global
