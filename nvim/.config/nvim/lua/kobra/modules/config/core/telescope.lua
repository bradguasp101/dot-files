local M = {}

local colemak_mappings
local qwerty_mappings

local pickers = function()
  return {
    commands = {
      theme = 'cursor',
      previewer = false,
    },
  }
end

local fzf = function()
  return {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = 'smart_case',
  }
end

local live_grep_args = function()
  local lga_actions = require('telescope-live-grep-args.actions')
  return {
    mappings = {
      i = {
        ['<C-k>'] = lga_actions.quote_prompt(),
        ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
      },
    },
  }
end

local file_browser = function()
  local res = {
    hijack_netrw = true,
    grouped = true,
    display_stat = false,
    hidden = true,
  }

  if COLEMAK then
    local actions = require('telescope').extensions.file_browser.actions
    res.mappings = {
      i = {
        ['<C-a>'] = actions.create,
        ['<C-r>'] = actions.rename,
        ['<C-y>'] = actions.copy,
        ['<C-x>'] = actions.remove,
        ['<C-h>'] = actions.toggle_hidden,
      },
    }
  end

  return res
end

local project = function()
  return {
    base_dirs = {
      '~/Projects',
    },
  }
end

M.setup = function()
  local telescope = require('telescope')

  local mappings
  if COLEMAK then
    mappings = colemak_mappings()
  else
    mappings = qwerty_mappings()
  end

  telescope.setup({
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
      file_ignore_patterns = {
        '.git/',
        'node_modules',
        'plz-out',
      },
    },
    pickers = pickers(),
    extensions = {
      fzf = fzf(),
      live_grep_args = live_grep_args(),
      file_browser = file_browser(),
      project = project(),
    }
  })

  telescope.load_extension('fzf')
  telescope.load_extension('z')
  telescope.load_extension('file_browser')
  telescope.load_extension('possession')
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
      ['<C-b>'] = actions.file_split,
      ['<C-x>'] = actions.delete_buffer,
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
      ['<C-b>'] = actions.file_split,
      ['<C-x>'] = actions.delete_buffer,
    },
  }
end

return M
