local completion = {}
local conf = require('kobra.modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  config = conf.nvim_lsp,
  opt = true,
}

completion['hrsh7th/nvim-cmp'] = {
  after = { 'LuaSnip' },
  requires = {
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-calc', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-emoji', after = 'nvim-cmp', opt = true },
    { 'ray-x/cmp-treesitter', after = 'nvim-cmp', opt = true },
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', opt = true },
    { 'f3fora/cmp-spell', after = 'nvim-cmp', opt = true },
    { 'octaltree/cmp-look', after = 'nvim-cmp', opt = true },
    { 'saadparwaiz1/cmp_luasnip', after = { 'nvim-cmp', 'LuaSnip' } },
  },
  config = conf.nvim_cmp,
}

-- can not lazy load, also slow
completion['L3MON4D3/LuaSnip'] = { -- needs to be the first to load
  event = 'InsertEnter',
  requires = { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
  config = function() require('kobra.modules.completion.luasnip') end,
}

completion['kristijanhusak/vim-dadbod-completion'] = {
  event = 'InsertEnter',
  ft = { 'sql' },
  setup = function()
    vim.cmd([[autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni]])
  end,
}

completion['nvim-telescope/telescope.nvim'] = {
  config = conf.telescope,
  setup = conf.telescope_preload,
  requires = {
    { 'nvim-lua/plenary.nvim', opt = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
    { 'nvim-telescope/telescope-live-grep-args.nvim', opt = true },
    { 'nvim-telescope/telescope-file-browser.nvim', opt = true },
  },
  opt = true,
}

-- part of this is used in navigator
completion['ray-x/lsp_signature.nvim'] = {
  opt = true,
  config = function()
    require('lsp_signature').setup({
      bind = true,
      floating_window = true,
      floating_window_above_cur_line = true,
      hint_enable = true,
      fix_pos = false,
      zindex = 1002,
      timer_interval = 100,
      extra_trigger_chars = {},
      handler_opts = {
        border = 'rounded',
      },
      max_height = 4,
    })
  end,
}

return completion
