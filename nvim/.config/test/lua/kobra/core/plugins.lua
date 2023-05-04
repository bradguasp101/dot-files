local plugins = {}

local global = require('kobra.core.global')

plugins.load_lazy = function()
  local lazypath = global.data_path .. '/lazy/lazy.nvim'
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

plugins.update_lazy = function()
  local lazypath = global.data_path .. '/lazy/lazy.nvim'
  if vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      'git',
      '-C',
      lazypath,
      'pull',
      '--ff-only',
    })
  end
end

return plugins
