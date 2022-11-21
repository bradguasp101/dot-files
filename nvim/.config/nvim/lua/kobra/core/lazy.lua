local loader = require('packer').loader

local function load_colorscheme(theme)
  require('packer').loader(theme)
end

load_colorscheme('nightfox.nvim')

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

  loader('plenary.nvim')
  loader('nvim-treesitter')
  loader('which-key.nvim')

  if vim.bo.filetype == 'lua' then
    loader('neodev.nvim')
  end

  if vim.bo.filetype == 'go' then
    loader('go.nvim')
  end

  if vim.bo.filetype == 'conf' then
    loader('vim-kitty')
  end

  if vim.bo.filetype == 'http' then
    loader('rest.nvim')
  end

  if vim.bo.filetype == 'markdown' then
    loader('markdown-preview.nvim')
  end

  vim.g.vimsyn_embed = 'lPr'

  loader('nvim-lspconfig')
  loader('lsp_signature.nvim')
  loader('guihua.lua')
  loader('navigator.lua')

  loader('nvim-treesitter-context')
  loader('nvim-ts-autotag')
  loader('nvim-ts-context-commentstring')
  loader('neogen')
  loader('refactoring.nvim')
  loader('hlargs.nvim')
  loader('vim-matchup')
  loader('nvim-treesitter-endwise')
  loader('symbols-outline.nvim')

  loader('null-ls.nvim')
  loader('barbar.nvim')
end

local lazy_timer = 20
if packer_plugins == nil or packer_plugins['packer.nvim'] == nil then
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
  load_colorscheme('nightfox.nvim')
  loader('lualine.nvim')
end, lazy_timer + 30)

vim.defer_fn(function()
  loader('telescope.nvim')
  loader('nvim-notify')
  vim.notify = require('notify')

  local gitrepo = vim.fn.isdirectory('.git/index')
  if gitrepo then
    loader('vim-rhubarb')
    loader('gitsigns.nvim')
    loader('git-conflict.nvim')
    loader('fugitive-gitlab.vim')
    loader('git-blame.nvim')
    loader('lazygit.nvim')
  end
end, lazy_timer + 80)

load_colorscheme('nightfox.nvim')
