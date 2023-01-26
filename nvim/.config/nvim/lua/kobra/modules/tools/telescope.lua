local loader = require('packer').loader
if not packer_plugins['telescope.nvim'].loaded then
  loader('telescope.nvim')
end

local telescope = require('telescope')
local actions = require('telescope.actions')

local M = {}

local colemak_mappings
local qwerty_mappings

M.setup = function()
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
    },
  })

  vim.defer_fn(function()
    loader('telescope-live-grep-args.nvim')
    loader('telescope-fzf-native.nvim')
    loader('telescope-project.nvim')
    loader('telescope-repo.nvim')
    loader('telescope-file-browser.nvim')
    loader('project.nvim')

    local ext = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    }

    telescope.setup({ extensions = ext })
    telescope.load_extension('fzf')
    telescope.load_extension('project')
    telescope.load_extension('repo')
    telescope.load_extension('file_browser')
    telescope.load_extension('projects')
  end, 200)
end

function colemak_mappings()
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
