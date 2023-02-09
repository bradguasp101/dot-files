local global = require('kobra.core.global')
local vim = vim

local leader_map = function()
  vim.g.mapleader = ' '
  vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
end

local load_lazy = function()
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

local load_core = function()
  require('kobra.core.helper').init()

  leader_map()
  vim.cmd([[set shell=/usr/local/bin/fish]])

  load_lazy()
  require('kobra.core.options')
  require('kobra.core.mapping')

  require('lazy').setup('kobra.modules')
end

load_core()
