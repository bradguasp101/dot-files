local lang = {}
local conf = require('kobra.modules.lang.config')
local ts = require('kobra.modules.lang.treesitter')

lang['nvim-treesitter/nvim-treesitter'] = {
  opt = true,
  config = ts.treesitter,
}

lang['nvim-treesitter/nvim-treesitter-textobjects'] = {
  config = ts.treesitter_obj,
  opt = true,
}

lang['RRethy/nvim-treesitter-textsubjects'] = {
  opt = true,
  config = ts.textsubjects,
}

lang['bennypowers/nvim-regexplainer'] = {
  opt = true,
  cmd = { 'RegexplainerToggle', 'RegexplainerShow' },
  config = conf.regexplainer,
}

lang['danymat/neogen'] = {
  opt = true,
  config = conf.neogen,
}

lang['ThePrimeagen/refactoring.nvim'] = {
  opt = true,
  config = conf.refactor,
}

lang['nvim-treesitter/nvim-treesitter-refactor'] = {
  after = 'nvim-treesitter-textobjects',
  config = ts.treesitter_ref,
  opt = true,
}

lang['yardnsm/vim-import-cost'] = {
  cmd = 'ImportCost',
  opt = true,
}

lang['ray-x/go.nvim'] = {
  ft = { 'go', 'gomod' },
  module = { 'go' },
  config = conf.go,
}

lang['ray-x/navigator.lua'] = {
  requires = { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  config = conf.navigator,
  opt = true,
}

lang['glepnir/lspsaga.nvim'] = {
  opt = true,
  cmd = { 'Lspsaga' },
  config = conf.lspsaga,
}

lang['nvim-treesitter/playground'] = {
  opt = true,
  cmd = 'TSPlaygroundToggle',
  config = conf.playground,
}

lang['simrat39/symbols-outline.nvim'] = {
  opt = true,
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen' },
  config = conf.outline,
}

lang['bfredl/nvim-luadev'] = {
  opt = true,
  ft = 'lua',
  cmd = 'Luadev',
  setup = conf.luadev,
}

lang['mfussenegger/nvim-dap'] = {
  opt = true,
  config = conf.dap,
}

lang['JoosepAlviste/nvim-ts-context-commentstring'] = {
  opt = true,
}

lang['rcarriga/nvim-dap-ui'] = {
  config = conf.dapui,
  cmd = 'Luadev',
  opt = true,
}

lang['theHamsta/nvim-dap-virtual-text'] = {
  opt = true,
  cmd = 'Luadev',
}

lang['nvim-telescope/telescope-dap.nvim'] = {
  config = conf.dap,
  opt = true,
}

lang['mfussenegger/nvim-dap-python'] = {
  ft = { 'python' },
}

lang['mtdl9/vim-log-highlighting'] = {
  ft = { 'text', 'txt', 'log' },
}

lang['windwp/nvim-ts-autotag'] = {
  opt = true,
}

lang['m-demare/hlargs.nvim'] = {
  opt = true,
  config = conf.hlargs,
}

lang['folke/neodev.nvim'] = {
  opt = true,
  config = conf.neodev,
}

lang['nvim-treesitter/nvim-treesitter-context'] = {
  opt = true,
  event = { 'CursorHold', 'WinScrolled' },
  config = ts.treesitter_context,
}

lang['folke/trouble.nvim'] = {
  cmd = { 'Trouble', 'TroubleToggle' },
  config = conf.trouble,
}

lang['jose-elias-alvarez/null-ls.nvim'] = {
  opt = true,
  config = require('kobra.modules.lang.null').config,
}

lang['j-hui/fidget.nvim'] = {
  opt = true,
  config = conf.fidget,
  module = 'lspconfig',
}

lang['cshuaimin/ssr.nvim'] = {
  module = 'ssr',
  config = conf.ssr,
}

return lang
