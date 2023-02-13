local M = {}

local colemak_mappings
local qwerty_mappings

M.setup = function()
  local telescope = require('telescope')

  local mappings
  if COLEMAK then
    mappings = colemak_mappings()
  else
    mappings = qwerty_mappings()
  end

  local config = {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      path_display = { 'smart' },
      vimgrep_arguments = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
      },
      mappings = mappings,
    },
  }

  local extensions = {}

  extensions.fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = 'smart_case',
  }

  extensions.file_browser = {
    hijack_netrw = true,
  }

  config.extensions = extensions
  telescope.setup(config)

  telescope.load_extension('fzf')
  telescope.load_extension('z')
  telescope.load_extension('file_browser')
  telescope.load_extension('project')
  telescope.load_extension('projects')
  telescope.load_extension('repo')
end

function colemak_mappings()
  local actions = require('telescope.actions')

  return {
    i = {
      ['<C-j>'] = actions.cycle_history_next,
      ['<C-k>'] = actions.cycle_history_prev,
      ['<C-n>'] = actions.move_selection_next,
      ['<C-e>'] = actions.move_selection_previous,
    },
  }
end

function qwerty_mappings()
  local actions = require('telescope.actions')

  return {
    i = {
      ['<C-n>'] = actions.cycle_history_next,
      ['<C-p>'] = actions.cycle_history_prev,
      ['<C-j>'] = actions.move_selection_next,
      ['<C-k>'] = actions.move_selection_previous,
    },
  }
end

return M
