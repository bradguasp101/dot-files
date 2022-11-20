local config = {}

function config.vim_dadbod_ui()
  if packer_plugins['vim-dadbod'] and not packer_plugins['vim-dadbod'].loaded then
    require('packer').loader('vim-dadbod')
  end

  vim.g.db_ui_show_help = 0
  vim.g.db_ui_win_position = 'left'
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_winwidth = 35
  vim.g.db_ui_save_location = require('core.global').home .. '/.cache/vim/db_ui_queries'
end

function config.mkdp()
  vim.g.mkdp_command_for_global = 1
  vim.cmd(
    [[let g:mkdp_preview_options = { 'mkit': {}, 'katex': {}, 'uml': {}, 'maid': {}, 'disable_sync_scroll': 0, 'sync_scroll_type': 'middle', 'hide_yaml_meta': 1, 'sequence_diagrams': {}, 'flowchart_diagrams': {}, 'content_editable': v:true, 'disable_filename': 0 }]]
  )
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
    persist_size = true,
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
end

function config.rest()
  require('rest-nvim').setup({})
end

function config.clap()
  vim.g.clap_preview_size = 10
  vim.g.airline_powerline_fonts = 1
  vim.g.clap_layout = { width = '80%', row = '8%', col = '10%', height = '34%' }

  vim.g.clap_selected_sign = { text = '', texthl = 'ClapSelectedSign', linehl = 'ClapSelected' }
  vim.g.clap_current_selection_sign = {
    text = '',
    texthl = 'ClapCurrentSelectionSign',
    linehl = 'ClapCurrentSelection',
  }

  vim.g.clap_preview_direction = 'UD'

  vim.g.clap_theme = 'material_design_dark'
  vim.api.nvim_command(
    'autocmd FileType clap_input lua require"cmp".setup.buffer { completion = {autocomplete = false} }'
  )
end

function config.clap_after()
  if not packer_plugins['nvim-cmp'].loaded then
    require('packer').loader('nvim-cmp')
  end
end

function config.git_conflict()
  require('git-conflict').setup()
end

function config.bqf()
  require('bqf').setup({
    auto_enable = true,
    preview = {
      win_height = 12,
      win_vheight = 12,
      delay_syntax = 80,
      border_chars = { '┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█' },
    },
    func_map = { vsplit = '', ptogglemode = 'z,', stoggleup = '' },
    filter = {
      fzf = {
        action_for = { ['ctrl-s'] = 'split' },
        extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
      },
    },
  })
end

function config.project()
  require('project_nvim').setup({
    datapath = vim.fn.stdpath("data"),
    exclude_dirs = { "**/plz-out/**" },
    silent_chdir = true,
  })
  require('kobra.utils.telescope')
  require('telescope').load_extension('projects')
end

return config
