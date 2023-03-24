local config = {}

function config.nvim_cmp()
  require('kobra.modules.config.completion.completion').nvim_cmp()
end

function config.autopairs()
  require('nvim-autopairs').setup({})
end

function config.matchup()
  vim.g.matchup_matchparen_offscreen = {method = 'popup'}
end

function config.endwise()
  require('nvim-treesitter.configs').setup({
    endwise = {
      enable = true,
    },
  })
end

function config.luasnip()
  require('luasnip')
end

function config.copilot()
  require('copilot').setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
  })
end

function config.copilot_cmp()
  require('copilot_cmp').setup()
end

return config
