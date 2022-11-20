local loader = require('packer').loader

local fsize = vim.fn.getfsize(vim.fn.expand('%:p:f'))
if fsize == nil or fsize < 0 then
  fsize = 1
end

local load_ts_plugins = true
local load_lsp = true

if fsize > 1024 * 1024 then
  load_ts_plugins = false
  load_lsp = false
end

local function load_colorscheme(theme)
  require('packer').loader(theme)
end

load_colorscheme('moonlight.nvim')

if vim.wo.diff then
  if load_ts_plugins then
    vim.cmd([[packadd nvim-treesitter]])
    require('nvim-treesitter.configs').setup({ highlight = { enable = true, use_languagetree = false } })
  else
    vim.cmd([[syntax on]])
  end
  return
end

-- load module but not init/config
vim.cmd([[packadd nvim-treesitter]])
function LazyLoad()
  local disable_ft = {
    'NvimTree',
    'guihua',
    'packer',
    'guihua_rust',
    'clap_input',
    'clap_spinner',
    'TelescopePrompt',
    'csv',
    'text',
    'defx',
  }

  local syn_on = not vim.tbl_contains(disable_ft, vim.bo.filetype)
  if not syn_on then
    vim.cmd([[syntax manual]])
  end

  if fsize > 6 * 1024 * 1024 then
    load_lsp = false
    load_ts_plugins = false
    vim.cmd([[syntax off]])
  end

  if load_ts_plugins then
    loader('nvim-treesitter')
  end

  local plugins = 'plenary.nvim'
  loader('plenary.nvim')

  if vim.bo.filetype == 'lua' then
    loader('neodev.nvim')
  end

  vim.g.vimsyn_embed = 'lPr'

  if load_lsp then
    loader('nvim-lspconfig')
    loader('lsp_signature.nvim')
  end

  loader('guihua.lua')
  if load_lsp or load_ts_plugins then
    loader('navigator.lua')
  end

  if load_ts_plugins then
    plugins = 'nvim-treesitter-textobjects nvim-ts-autotag nvim-ts-context-commentstring nvim-treesitter-textsubjects'
    loader(plugins)
    loader('neogen')
    loader('refactoring.nvim')
    -- loader('indent-blankline.nvim')
    loader('hlargs.nvim')
  end

  vim.cmd([[autocmd FileType vista,guihua,guihua_rust setlocal syntax=on]])
  vim.cmd(
    [[autocmd FileType * silent! lua if vim.fn.wordcount()['bytes'] > 2048000 then vim.notify('syntax off', 'warn') vim.cmd('setlocal syntax=off') end]]
  )

  if load_lsp then
    loader('null-ls.nvim')
  end

  loader('barbar.nvim')
end

local lazy_timer = 20
if _G.packer_plugins == nil or _G.packer_plugins['packer.nvim'] == nil then
  print('recompile')
  vim.cmd([[PackerRecompile]])
  vim.defer_fn(function()
    print('Packer recompiled, please run `:PackerCompile` and restart nvim')
  end, 400)
  return
end

vim.defer_fn(function()
  LazyLoad()
  vim.cmd([[doautocmd User LoadLazyPlugin]])
end, lazy_timer)

vim.defer_fn(function()
  load_colorscheme('moonlight.nvim')
  loader('lualine.nvim')
  vim.cmd('command! Gram lua require"kobra.modules.tools.config".grammcheck()')
  vim.cmd('command! Spell call spelunker#check()')
end, lazy_timer + 30)

vim.defer_fn(function()
  loader('telescope.nvim')
  loader('nvim-notify')
  vim.notify = require('notify')

  local gitrepo = vim.fn.isdirectory('.git/index')
  if gitrepo then
    loader('gitsigns.nvim')
    loader('git-conflict.nvim')
    loader('fugitive-gitlab.vim')
  end
end, lazy_timer + 80)

load_colorscheme('moonlight.nvim')
