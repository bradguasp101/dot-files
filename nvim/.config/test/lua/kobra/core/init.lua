local global = require('kobra.core.global')
local vim = vim

local leader_map = function()
  vim.g.mapleader = ' '
  vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
end

local load_core = function()
  require('kobra.core.helper').init()

  leader_map()
  vim.cmd([[set shell=/usr/local/bin/fish]])

  require('kobra.core.plugins').load_lazy()
  require('kobra.core.options')
  require('kobra.core.mapping')
  require('kobra.core.events').setup()

  require('lazy').setup('kobra.modules')
end

load_core()
