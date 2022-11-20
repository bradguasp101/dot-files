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
    return
  end

  if lines > 7000 then
    enable = false
    langtree = false
  else
    enable = true
    langtree = true
  end

  require('nvim-treesitter.configs').setup({
    highlight = {
      enable = enable,
      additional_vim_regex_highlighting = false,
      use_languagetree = langtree,
      custom_captures = { todo = 'Todo' },
    },
  })
end

local treesitter_obj = function()
  local lines = vim.fn.line('$')
  if lines > 30000 then -- skip some settings for large file
    return
  end

  require('nvim-treesitter.configs').setup({
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    incremental_selection = {
      enable = enable,
      keymaps = {
        -- mappings for incremental selection (visual mappings)
        init_selection = 'gnn', -- maps in normal mode to init the node/scope selection
        scope_incremental = 'gnn', -- increment to the upper scope (as defined in locals.scm)
        node_incremental = '<TAB>', -- increment to the upper named parent
        node_decremental = '<S-TAB>', -- decrement to the previous node
      },
    },
    textobjects = {
      -- syntax-aware textobjects
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
          -- You can use the capture groups defined in textobjects.scm
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

local treesitter_ref = function()
  if vim.fn.line('$') > 7000 then -- skip for large file
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
      disable = { 'ruby' },
    },
    autopairs = { enable = true },
    autotag = { enable = true },
  })

  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.sql = {
    install_info = {
      url = vim.fn.expand('$HOME') .. '/github/nvim-treesitter/tree-sitter-sql', -- local path or git repo
      files = { 'src/parser.c' },
    },
    filetype = 'sql', -- if filetype does not agrees with parser name
    used_by = { 'psql', 'pgsql' }, -- additional filetypes that use this parser
  }
  parser_config.proto = {
    install_info = {
      url = vim.fn.expand('$HOME') .. '/github/nvim-treesitter/tree-sitter-proto', -- local path or git repo
      files = { 'src/parser.c' },
    },
    filetype = 'proto', -- if filetype does not agrees with parser name
    used_by = { 'proto' }, -- additional filetypes that use this parser
  }
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

local ts_context = function()
  require('treesitter-context').setup({
    enable = true,
    max_lines = 2,
    trim_scope = 'outer',
    mode = 'topline',
    patterns = {
      default = {
        'class',
        'function',
        'method',
        'for',
        'while',
        'if',
        'switch',
        'case',
        'select',
      },
    },
  })
end

local treesitter_context = function(width)
  if not packer_plugins['nvim-treesitter'] or packer_plugins['nvim-treesitter'].loaded == false then
    return ' '
  end
  local type_patterns = {
    'class',
    'function',
    'method',
    'interface',
    'type_spec',
    'table',
    'if_statement',
    'for_statement',
    'for_in_statement',
    'call_expression',
    'comment',
  }

  if vim.o.ft == 'json' then
    type_patterns = { 'object', 'pair' }
  end

  local f = require('nvim-treesitter').statusline({
    indicator_size = width,
    type_patterns = type_patterns,
  })
  local context = string.format('%s', f) -- convert to string, it may be a empty ts node

  if context == 'vim.NIL' then
    return ' '
  end

  return ' ' .. context
end

local definitions = {
  ft = {
    { 'FileType', '*', 'lua require("kobra.new.core.pack").auto_compile()' },
  },
}

vim.api.nvim_create_autocmd({'FileType'}, {
  group = vim.api.nvim_create_augroup('SyntaxFtAuGroup', {}),
  callback = function()
    local ft = vim.o.ft
    if vim.tbl_contains(ts_ensure_installed, ft) then
      return
    end

    local fsize = vim.fn.getfsize(vim.fn.expand('%:p:f')) or 1
    if fsize < 100000 then
     vim.cmd('syntax on')
    end
  end,
})

return {
  treesitter = treesitter,
  treesitter_obj = treesitter_obj,
  treesitter_ref = treesitter_ref,
  textsubjects = textsubjects,
  treesitter_context = ts_context,
  context = treesitter_context,
  installed = ts_ensure_installed,
}
