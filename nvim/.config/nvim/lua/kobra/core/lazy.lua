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
  loader('guihua.lua')
  loader('nvim-treesitter')
  loader('which-key.nvim')

  vim.g.vimsyn_embed = 'lPr'

  loader('nvim-lspconfig')
  loader('lsp_signature.nvim')
  loader('navigator.lua')
  loader('null-ls.nvim')
  loader('refactoring.nvim')

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
