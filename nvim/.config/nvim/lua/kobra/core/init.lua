local global = require('kobra.core.global')
local vim = vim

-- Create cache dir and sub dirs
local create_dirs = function()
  local data_dir = {
    global.cache_dir .. 'backup',
    global.cache_dir .. 'session',
    global.cache_dir .. 'swap',
    global.cache_dir .. 'tags',
    global.cache_dir .. 'undo',
  }

  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute('mkdir -p ' .. global.cache_dir)
    for _, v in ipairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute('mkdir -p ' .. global.cache_dir)
      end
    end
  end
end

local leader_map = function()
  vim.g.mapleader = ' '
  vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', { noremap = true, silent = true })
end

local load_core = function()
  require('kobra.core.helper').init()

  local pack = require('kobra.core.pack')

  create_dirs()
  leader_map()
  vim.cmd([[set shell=/usr/local/bin/fish]])

  if pcall(require, 'impatient') then
    require('impatient')
  end

  if pack.ensure_plugins() == 'installed' then
    require('kobra.core.options')
    require('kobra.core.mapping')
    require('kobra.core.event')

    pack.load_compile()
    require('kobra.core.lazy')
  else
    print('installing plugins, please wait and restart nvim when finish')
  end
end

load_core()
