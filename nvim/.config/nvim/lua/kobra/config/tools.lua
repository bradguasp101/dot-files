local config = {}

function config.telescope_setup()
end

function config.telescope()
  require('kobra.config.telescope').setup()
end

function config.project()
  require('project_nvim').setup()
end

function config.neodev() end

function config.neogen()
  require('neogen').setup({
    enabled = true,
  })
end

function config.refactor()
  require('refactoring').setup({})
end

function config.hlargs()
  require('hlargs').setup()
end

function config.gitsigns()
  require('gitsigns').setup()
end

function config.git_conflict()
  require('git-conflict').setup()
end

function config.fugitive_gitlab()
  vim.g.fugitive_gitlab_domains = {'http://git', 'http://git.tcncloud.net'}
end

function config.toggleterm()
  require('toggleterm').setup({
    size = 20,
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = 'curved',
      winblend = 0,
      highlights = {
        border = 'Normal',
        background = 'Normal',
      },
    },
  })

  function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

function config.dadbod()
  require('vim-dadbod')
  vim.g.db_ui_show_help = 0
  vim.g.db_ui_win_position = 'left'
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_winwidth = 35
  vim.g.db_ui_save_location = require('kobra.core.global').home .. '/.cache/vim/db_ui_queries'
end

function config.abbrevman()
  local status_ok, abbrev = pcall(require, 'abbrev-man')
  if not status_ok then
    return
  end

  abbrev.setup()
end

function config.chatgpt()
  require('chatgpt').setup()
end

return config
