local global = {}

function global:load_variables()
  self.data_path = vim.fn.stdpath('data')
  self.config_path = vim.fn.stdpath('config')
  self.cache_dir = vim.fn.stdpath('cache')
end

global:load_variables()

return global
