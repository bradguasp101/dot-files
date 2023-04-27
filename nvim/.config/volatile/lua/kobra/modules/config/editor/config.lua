local config = {}

function config.oil()
  require('oil').setup({
    view_options = {
      show_hidden = true,
    },
  })
end

function config.autotag()
  require('nvim-ts-autotag').setup()
end

function config.comment()
  require('Comment').setup()
end

function config.commentstring()
  require('nvim-treesitter.configs').setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })

  require('Comment').setup({
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  })
end

function config.editorconfig()
  vim.g.EditorConfig_exclude_patterns = {
    'fugitive://.*',
    'scp://.*',
    'dbui',
    'NvimTree',
    'lspinfo',
    'Mundo',
    'MundoDiff',
    'packer',
    'fugitive',
    'fugitiveblame',
    'NeogitStatus',
    'DiffViewFiles',
  }
  vim.g.EditorConfig_disable_rules = {'max_line_length'}
end

function config.leap()
  require('leap').add_default_mappings()
end

function config.cinnamon()
  require('cinnamon').setup()
end

function config.focus()
  require('focus').setup()
end

function config.winshift()
  local setup = {}
  if COLEMAK then
    setup.keymaps = {
      win_move_mode = {
        n = 'down',
        e = 'up',
        i = 'right',
        N = 'far_down',
        E = 'far_up',
        I = 'far_right',
      },
    }
  end

  require('winshift').setup(setup)
end

function config.trailblazer()
  require('trailblazer').setup({})
end

function config.hlchunk()
  require('hlchunk').setup({
    chunk = {
      chars = {
        horizontal_line = "─",
        vertical_line = "│",
        left_top = "┌",
        left_bottom = "└",
        right_arrow = "─",
      },
    },
  })
end

function config.prettyfold()
  require('pretty-fold').setup({
    keep_indentation = false,
    fill_char = '━',
    sections = {
      left = {
        '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
      },
      right = {
        '┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
    },
    key = false,
  })
end

function config.foldpreview()
  local fp = require('fold-preview')
  local map = require('fold-preview').mapping
  local keymap = vim.keymap
  keymap.amend = require('keymap-amend')

  fp.setup({
    default_keybindings = false
  })

  keymap.amend('n', 'K', function(original)
    if not fp.toggle_preview() then original() end
  end)
  keymap.amend('n', 'zo', map.close_preview)
  keymap.amend('n', 'zO', map.close_preview)
  keymap.amend('n', 'zc', map.close_preview_without_defer)
  keymap.amend('n', 'zR', map.close_preview)
  keymap.amend('n', 'zM', map.close_preview_without_defer)
end

return config
