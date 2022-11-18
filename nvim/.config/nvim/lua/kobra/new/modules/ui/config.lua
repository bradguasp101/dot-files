local config = {}

function config.sonokai()
  vim.g.sonokai_style = 'atlantis'
  vim.g.sonokai_better_performance = 1
  vim.cmd([[colorscheme sonokai]])
end

function config.moonlight()
  require('moonlight').set()
end

return config
