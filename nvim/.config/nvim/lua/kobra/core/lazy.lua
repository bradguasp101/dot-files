local loader = require('packer').loader

local function load_colorscheme(theme)
  require('packer').loader(theme)
end

load_colorscheme('moonlight.nvim')

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
  loader('better-escape.vim')
  loader('which-key.nvim')

  if vim.bo.filetype == 'lua' then
    loader('neodev.nvim')
  end
  
  if vim.bo.filetype == 'go' then
    loader('go.nvim')
  end

  vim.g.vimsyn_embed = 'lPr'

  loader('nvim-lspconfig')
  loader('lsp_signature.nvim')
  loader('guihua.lua')
  loader('navigator.lua')

  loader('nvim-ts-autotag')
  loader('nvim-ts-context-commentstring')
  loader('neogen')
  loader('refactoring.nvim')
  loader('hlargs.nvim')

  vim.cmd([[autocmd FileType vista,guihua,guihua_rust setlocal syntax=on]])
  vim.cmd(
    [[autocmd FileType * silent! lua if vim.fn.wordcount()['bytes'] > 2048000 then vim.notify('syntax off', 'warn') vim.cmd('setlocal syntax=off') end]]
  )

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
  load_colorscheme('moonlight.nvim')
  loader('lualine.nvim')
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
