local enable = false
local langtree = false

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

  local lines = vim.fn.line('$')
  if lines > 30000 then -- skip some settings for large file
    vim.cmd([[syntax manual]])
    print('skip treesitter')
    return
  end

  if lines > 7000 then
    enable = false
    langtree = false
    vim.cmd([[syntax on]])
  else
    enable = true
    langtree = true
    lprint('ts enable')
  end

  require('nvim-treesitter.configs').setup({
    highlight = {
      enable = enable,
      additional_vim_regex_highlighting = false,
      use_languagetree = langtree,
      custom_captures = { todod: 'Todo' },
    },
  })
end

local textobjects = function()
  local lines = vim.fn.line('$')
  if lines > 30000 then -- skip some settings for large file
    print('skip treesitter obj')
    return
  end

  require('nvim-treesitter.configs').setup({
    indent = { enable = true },
    incremental_selection = {
      enable = enable,
      keymaps = {
        init_selection = 'gnn', -- maps in normal mode to init the node/scope selection
        scope_incremental = 'gnn', -- increment to the upper scope (as defined in locals.scm)
        node_incremental = '<TAB>', -- increment to the upper named parent
        node_decremental = '<S-TAB>', -- decrement to the previous node
      },
    },
    textobjects = {
      lsp_interop = {
        enable = enable,
        peek_definition_code = { ['DF'] = '@function.outer', ['CF'] = '@class.outer' },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = { [']m'] = '@function.outer', [']]'] = '@class.outer' },
        goto_next_end = { [']M'] = '@function.outer', [']['] = '@class.outer' },
        goto_previous_start = { ['[m'] = '@function.outer', ['[['] = '@class.outer' },
        goto_previous_end = { ['[M'] = '@function.outer', ['[]'] = '@class.outer' },
      },
      select = {
        enable = enable,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      swap = {
        enable = enable,
        swap_next = { ['<leader>a'] = '@parameter.inner' },
        swap_previous = { ['<leader>A'] = '@parameter.inner' },
      },
    },
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
  if vim.fn.line('$') > 7000 then -- skip for large file
    lprint('skip treesitter')
    enable = false
  end

  require('nvim-treesitter.configs').setup({
    refactor = {
      highlight_definitions = { enable = enable },
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
