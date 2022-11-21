local ts_ensure_installed = {
  'go',
  'css',
  'html',
  'javascript',
  'typescript',
  'jsdoc',
  'json',
  'c',
  'java',
  'toml',
  'tsx',
  'lua',
  'cpp',
  'python',
  'rust',
  'jsonc',
  'yaml',
  'sql',
  'vue',
  'vim',
}

local treesitter = function()
  local has_ts = pcall(require, 'nvim-treesitter.configs')
  if not has_ts then
    vim.notify('ts not installed')
    return
  end

  require('nvim-treesitter.configs').setup({
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
      custom_captures = { todo = 'Todo' },
    },
  })
end

local textobjects = function()
  require('nvim-treesitter.configs').setup({
    indent = { enable = true },
    ensure_installed = ts_ensure_installed,
  })
end

local textsubjects = function()
  require('nvim-treesitter.configs').setup({
    textsubjects = {
      enable = true,
      prev_selection = ',',
      keymaps = {
        ['>'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
  })
end

local refactor = function()
  require('nvim-treesitter.configs').setup({
    refactor = {
      highlight_definitions = { enable = true },
      highlight_current_scope = { enable = false },
      smart_rename = {
        enable = false,
      },
      navigation = {
        enable = false,
      },
    },
    matchup = {
      enable = true,
    },
    autopairs = { enable = true },
    autotag = { enable = true },
  })

  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.sql = {
    install_info = {
      url = vim.fn.expand('$HOME') .. '/github/nvim-treesitter/tree-sitter-sql',
      files = { 'src/parser.c' },
    },
    filetype = 'sql',
    used_by = { 'psql', 'pgsql' },
  }

  parser_config.proto = {
    install_info = {
      url = vim.fn.expand('$HOME') .. '/github/nvim-treesitter/tree-sitter-proto',
      files = { 'src/parser.c' },
    },
    filetype = 'proto',
    used_by = { 'proto' },
  }
end

local playground = function()
  require('nvim-treesitter.configs').setup({
    playground = {
      enable = true,
      disable = {},
      updatetime = 50,
      persist_queries = true,
    },
  })
end

return {
  treesitter = treesitter,
  textobjects = textobjects,
  textsubjects = textsubjects,
  refactor = refactor,
  playground = playground,
}
